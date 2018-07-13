<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>ECharts</title>
    <!-- 引入 echarts.js -->
    <script src="/js/echarts.js"></script>
</head>
<body>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="width: 2000px;height:800px;"></div>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/echarts.min.js"></script>
<script type="text/javascript" src="/js/echarts-gl.min.js"></script>
<script type="text/javascript" src="/js/ecStat.min.js"></script>
<script type="text/javascript" src="/js/dataTool.min.js"></script>
<script type="text/javascript" src="/js/china.js"></script>
<script type="text/javascript" src="/js/world.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>
<script type="text/javascript" src="/js/bmap.min.js"></script>
<script type="text/javascript" src="/js/simplex.js"></script>
<script type="text/javascript">


    function returnData1(str) {
        var datas = 0;
        $.ajax({
            url:"/count/select",
            type:"GET",
            dataType : 'json',
            async: false,
            contentType: "application/json; charset=utf-8",
            success:function (res){
                datas = eval(res);
            }
        })
        return datas[str];
    }

    function returnData2(str) {
        var datas1 = 0;
        $.ajax({
            url:"/count/select1",
            type:"GET",
            dataType : 'json',
            async: false,
            contentType: "application/json; charset=utf-8",
            success:function (res){
                datas1 = eval(res);
            }
        })
        return datas1[str];
    }
    function randomData() {
        return Math.round(Math.random()*20);
    }
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '网站用户访问数据',
            subtext: '纯属虚构',
            left: 'center'
        },
        tooltip: {
            trigger: 'item'
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data:['新用户访问','会员访问']
        },
        visualMap: {
            min: 0,
            max: 800,
            left: 'left',
            top: 'bottom',
            text: ['高','低'],           // 文本，默认为数值文本
            calculable: true
        },
        toolbox: {
            show: true,
            orient: 'vertical',
            left: 'right',
            top: 'center',
            feature: {
                dataView: {readOnly: false},
                restore: {},
                saveAsImage: {}
            }
        },
        series: [
            {
                name: '新用户访问',
                type: 'map',
                mapType: 'china',
                roam: false,
                label: {
                    normal: {
                        show: true
                    },
                    emphasis: {
                        show: true
                    }
                },
                data:[
                    {name: '北京',value: returnData1("北京市") },
                    {name: '天津',value: returnData1("天津市")  },
                    {name: '上海',value: returnData1("上海市") },
                    {name: '重庆',value: returnData1("重庆市") },
                    {name: '河北',value: returnData1("河北省") },
                    {name: '河南',value: returnData1("河南省") },
                    {name: '云南',value: returnData1("云南省") },
                    {name: '辽宁',value: returnData1("辽宁省") },
                    {name: '黑龙江',value: returnData1("黑龙江省") },
                    {name: '湖南',value: returnData1("湖南省") },
                    {name: '安徽',value: returnData1("安徽省") },
                    {name: '山东',value: returnData1("山东省") },
                    {name: '新疆',value: returnData1("新疆") },
                    {name: '江苏',value: returnData1("江苏省") },
                    {name: '浙江',value: returnData1("浙江省") },
                    {name: '江西',value: returnData1("江西省") },
                    {name: '湖北',value: returnData1("湖北省") },
                    {name: '广西',value: returnData1("广西") },
                    {name: '甘肃',value: returnData1("甘肃省") },
                    {name: '山西',value: returnData1("山西省") },
                    {name: '内蒙古',value: returnData1("内蒙古自治区") },
                    {name: '陕西',value: returnData1("陕西省") },
                    {name: '吉林',value: returnData1("吉林省") },
                    {name: '福建',value: returnData1("福建省") },
                    {name: '贵州',value: returnData1("贵州省") },
                    {name: '广东',value: returnData1("广东省") },
                    {name: '青海',value: returnData1("unknown") },
                    {name: '西藏',value: randomData() },
                    {name: '四川',value: returnData1("四川省") },
                    {name: '宁夏',value: returnData1("宁夏") },
                    {name: '海南',value: returnData1("海南省") },
                    {name: '台湾',value: returnData1("台湾省") },
                    {name: '香港',value: returnData1("香港特别行政区") },
                    {name: '澳门',value: returnData1("澳门特别行政区") }
                ]
            },
            {
                name: '会员访问',
                type: 'map',
                mapType: 'china',
                label: {
                    normal: {
                        show: true
                    },
                    emphasis: {
                        show: true
                    }
                },
                data:[
                    {name: '北京',value: returnData2("北京市") },
                    {name: '天津',value: returnData2("天津市")  },
                    {name: '上海',value: returnData2("上海市") },
                    {name: '重庆',value: returnData2("重庆市") },
                    {name: '河北',value: returnData2("河北省") },
                    {name: '河南',value: returnData2("河南省") },
                    {name: '云南',value: returnData2("云南省") },
                    {name: '辽宁',value: returnData2("辽宁省") },
                    {name: '黑龙江',value: returnData2("黑龙江省") },
                    {name: '湖南',value: returnData2("湖南省") },
                    {name: '安徽',value: returnData2("安徽省") },
                    {name: '山东',value: returnData2("山东省") },
                    {name: '新疆',value: returnData2("新疆") },
                    {name: '江苏',value: returnData2("江苏省") },
                    {name: '浙江',value: returnData2("浙江省") },
                    {name: '江西',value: returnData2("江西省") },
                    {name: '湖北',value: returnData2("湖北省") },
                    {name: '广西',value: returnData2("广西") },
                    {name: '甘肃',value: returnData2("甘肃省") },
                    {name: '山西',value: returnData2("山西省") },
                    {name: '内蒙古',value: returnData2("内蒙古自治区") },
                    {name: '陕西',value: returnData2("陕西省") },
                    {name: '吉林',value: returnData2("吉林省") },
                    {name: '福建',value: returnData2("福建省") },
                    {name: '贵州',value: returnData2("贵州省") },
                    {name: '广东',value: returnData2("广东省") },
                    {name: '青海',value: returnData2("unknown") },
                    {name: '西藏',value: randomData() },
                    {name: '四川',value: returnData2("四川省") },
                    {name: '宁夏',value: returnData2("宁夏") },
                    {name: '海南',value: returnData2("海南省") },
                    {name: '台湾',value: returnData2("台湾省") },
                    {name: '香港',value: returnData2("香港特别行政区") },
                    {name: '澳门',value: returnData2("澳门特别行政区") }
                ]
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表
    myChart.setOption(option);

</script>
</body>
</html>