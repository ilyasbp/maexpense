//
//  ExpenseViewController.swift
//  Maexpense
//
//  Created by Ilyas Bintang Prayogi on 17/03/24.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import DGCharts
import Toast_Swift

final class ExpenseViewController: UIViewController {

    @IBOutlet weak var pcv_monthly: PieChartView!
    @IBOutlet weak var lcv_annually: LineChartView!
    // MARK: - Public properties -

    var presenter: ExpensePresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.presentPortofolio()
        pcv_monthly.delegate = self
    }

}

// MARK: - Extensions -

extension ExpenseViewController: ExpenseViewInterface, ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        let entryIndex = Int(highlight.x)
        presenter.handleChartSelection(index: entryIndex)
    }
    
    func displayDonutChart(data: [MonthPortoDatum]) {
        var entries: [PieChartDataEntry] = []
        for entry in data {
            if let value = Double(entry.percentage ?? "0") {
                let pieChartDataEntry = PieChartDataEntry(value: value, label: entry.label)
                entries.append(pieChartDataEntry)
            }
        }

        let dataSet = PieChartDataSet(entries: entries, label: "")
        dataSet.colors = ChartColorTemplates.pastel()
        dataSet.selectionShift = 8
        
        let chartData = PieChartData(dataSet: dataSet)
        
        pcv_monthly.data = chartData
        pcv_monthly.holeRadiusPercent = 0.3
        pcv_monthly.transparentCircleRadiusPercent = 0.4
        pcv_monthly.drawEntryLabelsEnabled = false

        let format = NumberFormatter()
        format.maximumFractionDigits = 1
        format.numberStyle = .percent
        format.multiplier = 1.0
        let formatter = DefaultValueFormatter(formatter: format)
        chartData.setValueFormatter(formatter)
        chartData.setValueFont(UIFont(name: "Roboto-Regular", size: 10)!)
    }
    
    func displayLineChart(data: [Int]) {
        var entries: [ChartDataEntry] = []
        for (index, value) in data.enumerated() {
            let chartDataEntry = ChartDataEntry(x: Double(index), y: Double(value))
            entries.append(chartDataEntry)
        }

        let dataSet = LineChartDataSet(entries: entries)
        dataSet.mode = .linear
        
        dataSet.drawCircleHoleEnabled = false
        dataSet.circleRadius = 4
        dataSet.circleColors = [UIColor.darkblue]
        dataSet.colors = [UIColor.darkblue]
        dataSet.drawValuesEnabled = false
        let chartData = LineChartData(dataSet: dataSet)
        
        // X AXIS
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        lcv_annually.xAxis.valueFormatter = IndexAxisValueFormatter(values: months)
        lcv_annually.xAxis.granularity = 1
        lcv_annually.xAxis.labelCount = months.count
        lcv_annually.xAxis.labelPosition = .bottom
        lcv_annually.xAxis.drawGridLinesEnabled = false
        lcv_annually.xAxis.avoidFirstLastClippingEnabled = false
        lcv_annually.xAxis.axisMinimum = -0.4 // Adjust the value to set the desired spacing for the first label
        lcv_annually.xAxis.axisMaximum = Double(data.count - 1) + 0.4
        
        
        // LEFT AXIS
        lcv_annually.leftAxis.valueFormatter = DefaultAxisValueFormatter(decimals: 0)
        
        // RIGHT AXIS
        lcv_annually.rightAxis.valueFormatter = DefaultAxisValueFormatter(decimals: 0)
        lcv_annually.rightAxis.drawAxisLineEnabled = false
        lcv_annually.rightAxis.drawLabelsEnabled = false
        
        lcv_annually.legend.enabled = false

        lcv_annually.data = chartData
    }
    
    func displayError(errorMsg: String) {
        self.view.makeToast(errorMsg)
    }
}
