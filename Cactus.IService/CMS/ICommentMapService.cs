﻿
namespace Cactus.IService.CMS
{
    /// <summary>
    /// 用于评论的圈叉
    /// </summary>
    public interface ICommentMapService
    {
        bool isFind(int id,string Ip, long begin_timestamp, long end_timestamp);

        bool InsertMap(int id,string Ip, long timestamp);
    }
}
