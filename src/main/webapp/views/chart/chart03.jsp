<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
  #c1,#c2,#c3{
    height:400px;
    width:60%;
    border:10px solid blueviolet;
    margin:0px 10px 0px 10px;
  }
</style>
<script>
  let chart03={
    init:()=>{
      chart03.getData1();
      setInterval(chart03.getData1, 5000);
      chart03.getData2();
      setInterval(chart03.getData2, 5000);
      chart03.getData3();
      setInterval(chart03.getData3, 5000);
    },//chart03 -init
    getData1:()=>{
      $.ajax({
        url:'/chart0301'
      })
              .done((data)=>{chart03.display1(data)})
              .fail(console.log("failed to load"));//getData1- ajax
    }, // chart03 - getData1
    getData2:()=>{
      $.ajax({
        url:'/chart0302'
      })
              .done((data)=>{chart03.display2(data)})
              .fail(console.log("failed to load"));//getData1- ajax
    }, // chart03 - getData2
    getData3:()=>{
      $.ajax({
        url:'/chart0303'
      })
              .done((data)=>{chart03.display3(data)})
              .fail(console.log("failed to load"));
    }, // chart03 - getData3
    display1:(data)=>{
      console.log(data);
      Highcharts.chart('c1', {
        chart: {
          type: 'pie',
          options3d: {
            enabled: true,
            alpha: 45
          }
        },
        title: {
          text: 'Beijing 2022 gold medals by country',
          align: 'left'
        },
        subtitle: {
          text: '3D donut in Highcharts',
          align: 'left'
        },
        plotOptions: {
          pie: {
            innerSize: 100,
            depth: 45
          }
        },
        series: [{
          name: 'Medals',
          data:data
        }]
      });

    },//chart03 - display1
    display2:(data)=>{
      console.log(data);
      Highcharts.chart('c2', {
        title: {
          text: 'Bell curve'
        },

        xAxis: [{
          title: {
            text: 'Data'
          },
          alignTicks: false
        }, {
          title: {
            text: 'Bell curve'
          },
          alignTicks: false,
          opposite: true
        }],

        yAxis: [{
          title: { text: 'Data' }
        }, {
          title: { text: 'Bell curve' },
          opposite: true
        }],

        series: [{
          name: 'Bell curve',
          type: 'bellcurve',
          xAxis: 1,
          yAxis: 1,
          baseSeries: 1,
          zIndex: -1
        }, {
          name: 'Data',
          type: 'scatter',
          data: data,
          accessibility: {
            exposeAsGroupOnly: true
          },
          marker: {
            radius: 1.5
          }
        }]
      });



    },//chart03 - display2
    display3:(data)=>{
      console.log(data);
          let detailChart;
          function createDetail(masterChart) {
            // prepare the detail chart
            var detailData = [],
                    detailStart = data[0][0];
            masterChart.series[0].data.forEach(point => {
              if (point.x >= detailStart) {
                detailData.push(point.y);
              }
            });

            // create a detail chart referenced by a global variable
            detailChart = Highcharts.chart('c3', {
              chart: {
                marginBottom: 120,
                reflow: false,
                marginLeft: 50,
                marginRight: 20,
                style: {
                  position: 'absolute'
                }
              },
              credits: {
                enabled: false
              },
              title: {
                text: 'Historical USD to EUR Exchange Rate',
                align: 'left'
              },
              subtitle: {
                text: 'Select an area by dragging across the lower chart',
                align: 'left'
              },
              xAxis: {
                type: 'datetime'
              },
              yAxis: {
                title: {
                  text: null
                },
                maxZoom: 0.1
              },
              tooltip: {
                formatter: function () {
                  var point = this.points[0];
                  return '<b>' + point.series.name + '</b><br/>' + Highcharts.dateFormat('%A %B %e %Y', this.x) + ':<br/>' +
                          '1 USD = ' + Highcharts.numberFormat(point.y, 2) + ' EUR';
                },
                shared: true
              },
              legend: {
                enabled: false
              },
              plotOptions: {
                series: {
                  marker: {
                    enabled: false,
                    states: {
                      hover: {
                        enabled: true,
                        radius: 3
                      }
                    }
                  }
                }
              },
              series: [{
                name: 'USD to EUR',
                pointStart: detailStart,
                pointInterval: 24 * 3600 * 1000,
                data: detailData
              }],

              exporting: {
                enabled: false
              }

            }); // return chart
          }

          // create the master chart
          function createMaster() {
            Highcharts.chart('master-container', {
              chart: {
                reflow: false,
                borderWidth: 0,
                backgroundColor: null,
                marginLeft: 50,
                marginRight: 20,
                zoomType: 'x',
                events: {

                  // listen to the selection event on the master chart to update the
                  // extremes of the detail chart
                  selection: function (event) {
                    var extremesObject = event.xAxis[0],
                            min = extremesObject.min,
                            max = extremesObject.max,
                            detailData = [],
                            xAxis = this.xAxis[0];

                    // reverse engineer the last part of the data
                    this.series[0].data.forEach(point => {
                      if (point.x > min && point.x < max) {
                        detailData.push([point.x, point.y]);
                      }
                    });

                    // move the plot bands to reflect the new detail span
                    xAxis.removePlotBand('mask-before');
                    xAxis.addPlotBand({
                      id: 'mask-before',
                      from: data[0][0],
                      to: min,
                      color: 'rgba(0, 0, 0, 0.2)'
                    });

                    xAxis.removePlotBand('mask-after');
                    xAxis.addPlotBand({
                      id: 'mask-after',
                      from: max,
                      to: data[data.length - 1][0],
                      color: 'rgba(0, 0, 0, 0.2)'
                    });


                    detailChart.series[0].setData(detailData);

                    return false;
                  }
                }
              },
              title: {
                text: null
              },
              accessibility: {
                enabled: false
              },
              xAxis: {
                type: 'datetime',
                showLastTickLabel: true,
                maxZoom: 14 * 24 * 3600000, // fourteen days
                plotBands: [{
                  id: 'mask-before',
                  from: data[0][0],
                  to: data[data.length - 1][0],
                  color: 'rgba(0, 0, 0, 0.2)'
                }],
                title: {
                  text: null
                }
              },
              yAxis: {
                gridLineWidth: 0,
                labels: {
                  enabled: false
                },
                title: {
                  text: null
                },
                min: 0.6,
                showFirstLabel: false
              },
              tooltip: {
                formatter: function () {
                  return false;
                }
              },
              legend: {
                enabled: false
              },
              credits: {
                enabled: false
              },
              plotOptions: {
                series: {
                  fillColor: {
                    linearGradient: [0, 0, 0, 70],
                    stops: [
                      [0, Highcharts.getOptions().colors[0]],
                      [1, 'rgba(255,255,255,0)']
                    ]
                  },
                  lineWidth: 1,
                  marker: {
                    enabled: false
                  },
                  shadow: false,
                  states: {
                    hover: {
                      lineWidth: 1
                    }
                  },
                  enableMouseTracking: false
                }
              },

              series: [{
                type: 'area',
                name: 'USD to EUR',
                pointInterval: 24 * 3600 * 1000,
                pointStart: data[0][0],
                data: data
              }],

              exporting: {
                enabled: false
              }

            }, masterChart => {
              createDetail(masterChart);
            }); // return chart instance
          }

          // make the container smaller and add a second container for the master chart
          const container = document.getElementById('c3');
          container.style.position = 'relative';
          container.innerHTML += '<div id="detail-container"></div><div id="master-container"></div>';

          // create master and in its callback, create the detail chart
          createMaster();


    }//chart03 - display3

  };// chart 03
  $(()=>{
    chart03.init();

  })// onLoad


</script>

<div class="col-sm-8 text-left">
  <div class="container" id="chart02">
    <h1>Chart 03</h1>
    <div class="row">
      <div  id="c1">        </div>
      <div id="c2">        </div>
      <div id="c3">        </div>
    </div>
  </div>
</div>

