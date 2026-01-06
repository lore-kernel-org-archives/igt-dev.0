Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848CBCDC19C
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 13:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081F810E505;
	Tue,  6 Jan 2026 13:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WR0yGEgI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07B010E505
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 13:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767707149; x=1799243149;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=10WaIPiexa0M7IBQlGYc9Ignq4Suw7w9KCado/+nz44=;
 b=WR0yGEgIpDKD1ZZVu+tPqAs03V66ryxYZXb7KQNQjloY/87ISBgz1zmg
 9ACnWqi4A2jdAb2d+IyHwtNtZyxme207ndzGoSo+ZE08BZ17KaEOKi0dG
 o3pT4BU3nYgVxMfR5Cs03CnrzfuhSgafi+gi2xXGWHs2Z/xsCfqHNbGT+
 ZfeUSG/YLog/F5vq3NNF02CViVH2R6kLSyYeE+p11cfCTsrEmJlAYfHa1
 bPwhYUerqYW+yfaOEyey4ToSnGsWbLBfAQVbRdWORKGUA3AOzUmroswW5
 /ih/d0UNAzI4fDdkhyAPg8ZN//J60Av3AXNRF1VgecvIRnkogUZC/OtmZ A==;
X-CSE-ConnectionGUID: jyiO0WQtTVam7YquSv88LA==
X-CSE-MsgGUID: lu2tMII7R0OxkEOqYyAG0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="72916797"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="72916797"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 05:45:48 -0800
X-CSE-ConnectionGUID: 2iZYeTB9Sryj2zLVReDWeg==
X-CSE-MsgGUID: DuDz6bK+TA+n8BQtWGsh7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="202277933"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 05:45:46 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, kamil.konieczny@linux.intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v10 0/2] tests/intel/xe_pm_residency: Add ASPM Link
 residency test
Date: Tue,  6 Jan 2026 19:21:52 +0530
Message-Id: <20260106135154.33722-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Add subtest aspm_link_residency to xe_pm_residency test to check ASPM Link state residency.
This uses the debugfs /sys/kernel/debug/dri/0/dgfx_pcie_link_residencies to read the
residency counters.
Add an API igt_device_get_pci_usp() to get pcie device's upstream port.

v2:
 - Avoid using igt_require() in igt_device_get_pci_device. (Kamil)
 - Add description about PCIe ASPM in commit message and code. (Kamil)
 - Resolve couple of compilation warnings about using variable as format string to sscanf.

v3:
 - Rename igt_device_get_pci_usp() to igt_device_get_pci_upstream_port(). (Kamil)

v4:
 - Refactor and enhance readability. (Badal)
 - Move save and restore of link states to separate functions. (Badal)

v5:
 - Use device type from pci express capability of pci config space to
   identify upstream port. (Badal)

v6:
 - Search for upstream port only two levels up of the endpoint as we want to
   verify ASPM only on PCIe link on which GPU card is present.
 - Skip test for integrated platforms.

v7:
 - Address below review comments from Riana.
 - Use igt_sysfs_has_attr() instead of faccess().
 - Remove unnecessary spaces, debug logs, if checks.
 - Wrap line length to 100 chars.
 - Use spinner instead of mmap as workload.

v8:
 - Address minor review comments from Kamil.

Karthik Poosa (2):
  lib/igt_device: Add API to get pci device upstream port
  tests/intel/xe_pm_residency: Add subtest for ASPM Link state residency

 lib/igt_device.c              |  43 +++++++++
 lib/igt_device.h              |   1 +
 lib/igt_pci.h                 |   2 +
 tests/intel/xe_pm_residency.c | 176 ++++++++++++++++++++++++++++++++++
 4 files changed, 222 insertions(+)

-- 
2.25.1

