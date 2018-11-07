# Linux
博客http://www.isdevil.com/2018/11/07/%E4%BD%BF%E7%94%A8tar%E5%91%BD%E4%BB%A4%E8%BF%9B%E8%A1%8C%E6%95%B4%E6%9C%BA%E5%A4%87%E4%BB%BD%E4%B8%8E%E8%A3%B8%E6%9C%BA%E6%81%A2%E5%A4%8D/
backup.sh用于系统的完整备份；
reback.sh用于裸机恢复，需要借助U盘Linux。
note:
本代码只适用于有两个分区的系统即主分区和交换分区，裸机恢复时 会创建一个19G的主分区，其余空间会生成交换分区。可以通过修改reback.sh中的“+19G”来改变主分区的大小
