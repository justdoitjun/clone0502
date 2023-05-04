<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
  #container{
    width:800px;
    height:400px;
    border : 4px solid red;
  }
</style>
<script>
  let chart02 = {
    init:()=>{
      $('#chart02 > button').on('click',()=>{
          chart02.getData();
      });
      setInterval(chart02.getData, 5000);// chart 02 - init - setInterval
    },// chart02 - init
    getData:()=>{
      $.ajax({
        url:'/chart02',
      }).done((data)=>{
        console.log(data);
        chart02.display(data);
      }).fail(()=>{

      })
    },// chart02 - getData
    display:(data)=>{
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
          categories: data.category,
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
          data: data.data
        }]
      });
    } //chart02 -display
  }
  $(()=>{
    chart02.init();
  })

</script>

<div class="col-sm-8 text-left">
  <div class="container" id="chart02">
    <h1>Chart 02</h1>
    <button type="button" class="btn btn-success">Show up chart</button>
    <div id="container"></div>
  </div>
</div>

