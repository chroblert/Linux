# Linux
博客https://blog.csdn.net/CJerrybird/article/details/83989541
backup.sh用于系统的完整备份；
reback.sh用于裸机恢复，需要借助U盘Linux。
note:
本代码只适用于有两个分区的系统即主分区和交换分区，裸机恢复时 会创建一个19G的主分区，其余空间会生成交换分区。可以通过修改reback.sh中的“+19G”来改变主分区的大小
