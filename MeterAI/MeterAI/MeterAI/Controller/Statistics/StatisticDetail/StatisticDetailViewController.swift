//
//  StatisticDetailViewController.swift
//  MeterAI
//
//  Created by Burak Emre gündeş on 9.05.2023.
//

import UIKit
import Charts

struct ChartDataEntrys {
    let day: String
    let value: Double

}



class DayAxisValueFormatter: NSObject, AxisValueFormatter {
    
    var days: [String] = []
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        guard let axis = axis, axis is XAxis else { return "" }
        let index = Int(value)
        return days.indices.contains(index) ? days[index] : ""
    }
    
}


class StatisticDetailViewController: UIViewController {
    

    let dataEntries = [
        ChartDataEntrys(day: "Pazartesi", value: 10),
        ChartDataEntrys(day: "Salı", value: 5),
        ChartDataEntrys(day: "Çarşamba", value: 8),
        ChartDataEntrys(day: "Perşembe", value: 12),
        ChartDataEntrys(day: "Cuma", value: 6),
        ChartDataEntrys(day: "Cumartesi", value: 9),
        ChartDataEntrys(day: "Pazar", value: 4)
    ]
    
    func getDataEntries() -> [BarChartDataEntry] {
        let chartDataEntries = dataEntries.enumerated().map { (index, dataEntry) -> BarChartDataEntry in
            return BarChartDataEntry(x: Double(index), y: dataEntry.value, data: dataEntry.day)
        }
        return chartDataEntries
    }


 
    
    private lazy var containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var scrollView : UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.isDirectionalLockEnabled = true
        sv.showsVerticalScrollIndicator = false
        sv.showsHorizontalScrollIndicator = false
        sv.isUserInteractionEnabled = true
        return sv
    }()
    
    private lazy var mainView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 20, weight: .semibold)
        lbl.numberOfLines = 0
        lbl.textColor = .white
        lbl.text = "Haftalık İstatistik"
        return lbl
    }()
    

    
    private lazy var barChartView : BarChartView = {
        let chartView = BarChartView()
        chartView.delegate = self
       
        chartView.translatesAutoresizingMaskIntoConstraints = false
        chartView.rightAxis.enabled = false
        
        let yAxis = chartView.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 12)
        yAxis.setLabelCount(6, force: false)
        yAxis.labelTextColor = .white
        yAxis.labelPosition = .outsideChart
        
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelFont = .boldSystemFont(ofSize: 12)
        chartView.xAxis.setLabelCount(6, force: false)
        chartView.xAxis.labelTextColor = .white
        chartView.xAxis.axisLineColor = .systemBlue
        chartView.xAxis.labelRotationAngle = -25
        
        chartView.legendRenderer.legend?.enabled = false
        
        chartView.tintColor = .white
        
        
        chartView.animate(xAxisDuration: 0.5)
        return chartView
    }()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureLayout()
        
    }
    
    private func configure(){
        configureNavigationBar()
        //setChartData()
    }
    

    
    func setupData() {
        
        barChartView.translatesAutoresizingMaskIntoConstraints = false
        barChartView.xAxis.valueFormatter = DayAxisValueFormatter()
        (barChartView.xAxis.valueFormatter as? DayAxisValueFormatter)?.days = dataEntries.map { $0.day }
        barChartView.xAxis.labelPosition = .bottom
        barChartView.rightAxis.enabled = false
        let chartData = BarChartData(dataSet: BarChartDataSet(entries: getDataEntries(), label: " "))
        chartData.setValueTextColor(.white)
        barChartView.data = chartData
        
        barChartView.isUserInteractionEnabled = false
        
        
        mainView.addSubview(barChartView)
        
        NSLayoutConstraint.activate([
            barChartView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            barChartView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
            barChartView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16),
            barChartView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
           
            barChartView.heightAnchor.constraint(equalToConstant: 300)
        ])

        
        
  }
    
    
    private func configureLayout(){
        view.backgroundColor = .baseColor
        
        view.addSubview(containerView)
        containerView.addSubview(scrollView)
        scrollView.addSubview(mainView)
        mainView.addSubview(titleLabel)
       
        
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view .leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scrollView.topAnchor.constraint(equalTo: containerView.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            mainView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            mainView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            
            titleLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16),
           
        
         
    
        ])
        
        setupData()
    
    }
    
    private func configureNavigationBar(){
        title = "Rapor Detayları"
        navigationController?.configureNavigationForBase()
    }
    
}

extension StatisticDetailViewController : ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    

    
    
}

