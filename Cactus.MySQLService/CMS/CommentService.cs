﻿using System;
using Cactus.Common;
using Dapper.Common;
using Cactus.IService.CMS;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Cactus.MySQLService.CMS
{
    public class CommentService : ICommentService
    {
        public CommentService()
        {
        }

        public bool Insert(Model.CMS.Comment entity)
        {
            using (IDbConnection conn = SqlString.GetMySqlConnection())
            {
                int i = conn.Execute("INSERT INTO cms_comment(ArticleId,Content,CreateTime,Nickname,Email,VoteFavour,VoteOppose)" +
                    "VALUES(@ArticleId,@Content,@CreateTime,@Nickname,@Email,@VoteFavour,@VoteOppose)", entity);
                if (i > 0) { return true; } else { return false; }
            }
        }

        public bool InsertBatch(List<Model.CMS.Comment> datas)
        {
            throw new NotImplementedException();
        }

        public void Update(Model.CMS.Comment entity)
        {
            using (IDbConnection conn = SqlString.GetMySqlConnection())
            {
                conn.Execute("UPDATE cms_comment SET ArticleId=@ArticleId,Content=@Content,CreateTime=@CreateTime,Nickname=@Nickname,Email=@Email,VoteFavour=@VoteFavour,VoteOppose=@VoteOppose  WHERE Comment_Id =@Comment_Id", entity);
            }
        }

        public void Delete(string ids)
        {
            using (IDbConnection conn = SqlString.GetMySqlConnection())
            {
                conn.Execute(string.Format("DELETE FROM cms_comment WHERE Comment_Id in ({0})", ids));
            }
        }

        public List<Model.CMS.Comment> GetAll()
        {
            using (IDbConnection conn = SqlString.GetMySqlConnection())
            {
                return conn.Query<Model.CMS.Comment, Model.CMS.Article, Model.CMS.Comment>("select a.*,b.* from cms_comment as a left join cms_article as b on a.ArticleId=b.Article_Id ",
                    (comment, article) =>
                    {
                        if (comment != null)
                            comment.Article = article;
                        return comment;
                    }, null, null, "Article_Id", null, null).ToList();
            }
        }

        public List<Model.CMS.Comment> ToPagedList(int pageIndex, int pageSize, string keySelector, out int count)
        {
            using (IDbConnection conn = SqlString.GetMySqlConnection())
            {
                //mysql 出现Duplicate column name 的时候可以取别名，然后model映射的是取别名,Comment的CreateTime别名有_CreateTime的别名
                string sql01 = "select count(Comment_Id) from cms_comment";
                count = conn.Query<int>(sql01).SingleOrDefault();
                Model.CMS.Article articleTemp = new Model.CMS.Article();
                string sql = "select a.Comment_Id,a.ArticleId,a.Content ,a.CreateTime as _CreateTime,a.Email,a.Nickname,a.VoteFavour,a.VoteOppose,b.* from cms_comment as a left join cms_article as b on a.ArticleId=b.Article_Id";
                string query = "SELECT * from (" + sql + ")as c ORDER BY _CreateTime " +
                    " LIMIT " + (pageIndex - 1) * pageSize + "," + pageSize;

                return conn.Query<Model.CMS.Comment, Model.CMS.Article, Model.CMS.Comment>(query,
                    (comment, article) =>
                    {
                        if (comment != null)
                            comment.Article = article;
                        return comment;
                    }, null, null, "Article_Id", null, null).ToList();
            }
        }

        public Model.CMS.Comment Find(int id)
        {
            using (IDbConnection conn = SqlString.GetMySqlConnection())
            {
                string query = "select a.*,b.* from cms_comment as a left join cms_article as b on a.ArticleId=b.Article_Id WHERE a.Comment_Id = @id";
                return conn.Query<Model.CMS.Comment, Model.CMS.Article, Model.CMS.Comment>(query, (comment, article) =>
                {
                    if (comment != null)
                        comment.Article = article;
                    return comment;
                }, new { id = id }, null, "Article_Id", null, null).SingleOrDefault();
            }
        }

        public bool isVoteFavour(int Id)
        {
            using (IDbConnection conn = SqlString.GetMySqlConnection())
            {
                int i = conn.Execute("UPDATE cms_comment SET VoteFavour=VoteFavour+1 where Comment_Id=@Id", new { Id = Id });
                if (i > 0) { return true; } else { return false; }
            }
        }

        public bool isVoteOppose(int Id)
        {
            using (IDbConnection conn = SqlString.GetMySqlConnection())
            {
                int i = conn.Execute("UPDATE cms_comment SET VoteOppose=VoteOppose+1 where Comment_Id=@Id", new { Id = Id });
                if (i > 0) { return true; } else { return false; }
            }
        }
    }
}
