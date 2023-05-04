<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
  #container{
    width:80%;
    height:50%;
    border : 4px solid blueviolet;
  }
</style>
<script>
  let chart05={
    init:()=>{
      $('#get_btn').click(()=>{
        let year = $('#sel1').val();
        //console.log(year);
        chart05.getData(year);
      });//버튼을 클릭했을 때
    },//chart05- init
    getData:(data)=>{
      $.ajax({
        url:'/chart0501',
        data:{'year':data}
      }).done((data)=>{
        console.log(data);
        chart05.display1(data);
        chart05.display2(data);
      }).fail(()=>{console.log("failed")})//ajax로 서버에 요청하겠음.
    },//chart05-getData
    display1:(data)=>{
      // Data retrieved https://en.wikipedia.org/wiki/List_of_cities_by_average_temperature
      Highcharts.chart('c1', {
        chart: {
          type: 'spline'
        },
        title: {
          text: 'Monthly Average Temperature'
        },
        subtitle: {
          text: 'Source: ' +
                  '<a href="https://en.wikipedia.org/wiki/List_of_cities_by_average_temperature" ' +
                  'target="_blank">Wikipedia.com</a>'
        },
        xAxis: {
          categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
            'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
          accessibility: {
            description: 'Months of the year'
          }
        },
        yAxis: {
          title: {
            text: 'Temperature'
          },
          labels: {
            formatter: function () {
              return this.value + '°';
            }
          }
        },
        tooltip: {
          crosshairs: true,
          shared: true
        },
        plotOptions: {
          spline: {
            marker: {
              radius: 4,
              lineColor: '#666666',
              lineWidth: 1
            }
          }
        },
        series: [{
          name: 'New York',
          marker: {
            symbol: 'square'
          },
          data: data
        }]
      });

    },//chart05-display1
    display2:(data)=>{
      Highcharts.chart('container', {
        chart: {
          type: 'column',
          options3d: {
            enabled: true,
            alpha: 10,
            beta: 25,
            depth: 70
          }
        },
        title: {
          text: 'External trade in goods by country, Norway 2021',
          align: 'left'
        },
        subtitle: {
          text: 'Source: ' +
                  '<a href="https://www.ssb.no/en/statbank/table/08804/"' +
                  'target="_blank">SSB</a>',
          align: 'left'
        },
        plotOptions: {
          column: {
            depth: 25
          }
        },
        xAxis: {
          categories: ['Belgium', 'China', 'Denmark', 'Fiji', 'Germany', 'Netherlands', 'Russia',
            'Sweden', 'Turkey', 'United States', 'Unspecified', 'Vietnam'],
          labels: {
            skew3d: true,
            style: {
              fontSize: '16px'
            }
          }
        },
        yAxis: {
          title: {
            text: 'NOK (million)',
            margin: 20
          }
        },
        tooltip: {
          valueSuffix: ' MNOK'
        },
        series: [{
          name: 'Total imports',
          data: data
        }]
      });
    }//chart05-display2
  }

  $(()=>{
    chart05.init();
  })

</script>

<div class="col-sm-8 text-left">
  <div class="container">
    <h3>Chart05</h3>
    <div class="row">
      <div class="form-group col-sm-4">
        <label for="sel1"> Year : </label>
        <select class="form-control" id="sel1">
          <c:forEach begin="2010" end="2023" var="year">
            <option value="${year}">${year}</option>
          </c:forEach>
        </select>
        <hr>
        <button id="get_btn" class="btn btn-danger">당신의 대학교 졸업연도를 선택하세요.</button>
      </div>
    </div>

    <div class="row">
      <div class="col-sm-5"  id="c1"> </div>
      <div class="col-sm-5"  id="c2"> </div>
    </div>

  </div>
</div>

