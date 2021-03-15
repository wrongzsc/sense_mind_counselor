class CounselInfo {
  // 姓名
  final String name;
  // id
  final int id;
  // 头像名称
  final String image;
  // 个人资质
  final String qa;
  // 从业经验
  final String exp;
  // 擅长领域
  final String prof1;
  // 擅长领域2
  final String prof2;
  // 联系方式
  final int dial;

  const CounselInfo(
      {this.name,
      this.id,
      this.image,
      this.qa,
      this.exp,
      this.prof1,
      this.prof2,
      this.dial});
}

final List<CounselInfo> infos = [
  CounselInfo(
      name: "姜知佑",
      id: 100101,
      image: "image100101.png",
      qa: "中国心理学会注册心理咨询师X-20-011",
      exp: "3000+小时咨询经验",
      prof1: "压力管理",
      prof2: "情绪管理",
      dial: 13261539323),
  CounselInfo(
      name: "郑山",
      id: 0539001,
      image: "image0539001.jpg",
      qa: "中国心理学会注册心理咨询师X-20-011",
      exp: "3000+小时咨询经验",
      prof1: "压力管理",
      prof2: "睡眠管理",
      dial: 13261539323),
  CounselInfo(
      name: "张欣",
      id: 0539002,
      image: "image0539002.jpg",
      qa: "中国心理学会注册心理咨询师X-20-011",
      exp: "3000+小时咨询经验",
      prof1: "亲密关系",
      prof2: "情绪管理",
      dial: 13261539323),
  CounselInfo(
    name: "唐建辉",
    id: 0539003,
    image: "image0539003.jpg",
    qa: "中国心理学会注册心理咨询师X-20-011",
    exp: "3000+小时咨询经验",
    prof1: "压力管理",
    prof2: "吃饱不饿",
    dial: 13261539323,
  ),
];
