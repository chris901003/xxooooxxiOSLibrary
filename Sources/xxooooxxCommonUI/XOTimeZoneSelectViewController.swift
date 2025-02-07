// Created for  in 2025
// Using Swift 5.0
//
//
// Created by HongYan on 2025/2/7.
// Copyright © 2025 HongYan. All rights reserved.


import Foundation
import UIKit

public protocol XOTimeZoneSelectViewControllerDelegate: AnyObject {
    func selectedTimeZone(gmtOffsetHours: Int)
}

public class XOTimeZoneSelectViewController: UIViewController {
    let cellId = "CellId"

    let searchBar = UISearchBar()
    let tableView = UITableView()

    var timeZoneNames: [String] = []
    var timeZones: [String: String] = [:]

    var showTimeZoneNames: [String] = []

    public weak var delegate: XOTimeZoneSelectViewControllerDelegate?

    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
        registerCell()
    }

    private func setup() {
        view.backgroundColor = .white

        let allTimeZones = TimeZone.knownTimeZoneIdentifiers
        let locale = Locale(identifier: "zh-TW")

        for timeZoneIdentifier in allTimeZones {
            if let timeZone = TimeZone(identifier: timeZoneIdentifier),
               let localizedName = timeZone.localizedName(for: .shortGeneric, locale: locale),
               !timeZones.keys.contains(localizedName) {
                timeZones[localizedName] = timeZoneIdentifier
                timeZoneNames.append(localizedName)
            }
        }
        showTimeZoneNames = timeZoneNames

        searchBar.delegate = self

        tableView.delegate = self
        tableView.dataSource = self
        tableView.keyboardDismissMode = .onDrag
    }

    private func layout() {
        view.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func registerCell() {
        tableView.register(XOLeadingTrailingLabelCell.self, forCellReuseIdentifier: cellId)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension XOTimeZoneSelectViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        showTimeZoneNames.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? XOLeadingTrailingLabelCell,
              let timeZoneId = timeZones[showTimeZoneNames[indexPath.row]],
              let timeZone = TimeZone(identifier: timeZoneId)else {
            return UITableViewCell()
        }
        let gmtOffsetInSeconds = timeZone.secondsFromGMT()
        let gmtOffsetHours = gmtOffsetInSeconds / 3600
        cell.config(title: showTimeZoneNames[indexPath.row], info: "GMT \(gmtOffsetHours > 0 ? "+" : "")\(gmtOffsetHours)")
        return cell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let timeZoneId = timeZones[showTimeZoneNames[indexPath.row]],
              let timeZone = TimeZone(identifier: timeZoneId) else { return }
        let gmtOffsetInSeconds = timeZone.secondsFromGMT()
        let gmtOffsetHours = gmtOffsetInSeconds / 3600
        delegate?.selectedTimeZone(gmtOffsetHours: gmtOffsetHours)
    }
}

// MARK: - UISearchBarDelegate
extension XOTimeZoneSelectViewController: UISearchBarDelegate {
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            showTimeZoneNames = timeZoneNames
        } else {
            showTimeZoneNames = timeZoneNames.filter({ $0.range(of: searchText) != nil })
        }
        tableView.reloadData()
    }

    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
