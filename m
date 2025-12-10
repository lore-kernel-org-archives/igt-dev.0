Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0E7D3B9A9
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 10:44:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8D010E6D2;
	Wed, 10 Dec 2025 10:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O4bTKe9s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB1810E6D2
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 10:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765363457; x=1796899457;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ieN2xKf9asacjheRKJFksTGN/rn7UY3jKvI3WNn94Qs=;
 b=O4bTKe9sBnfpfH1x0gbXFfPu4ejur8OuOu2UPmih9Dwm3O8AOPMq36J2
 cIeRQZn9sbCTLK+EkuXozWI8jATu1SC+hhtEDvsPqy07kW8g+XGEpmwKB
 WCz4Xy3+xQ0I1QC4mlttCsjvyjpXz6sOeWpz1uWfDy9A40iJ+jlfEvLIL
 PvHWCkgG1X/lk0N0YNqoUBlbMtrahd1xASqjDAry6I9u1jlX+Nubcsqdn
 g7uUrCxWR7bOPbKy1PnfV2UcnQDp3pRfmC5AxWPlY2LRIq5twf7STE4/l
 OQnUlz61AMnsiMSpWuegh8mMaTWNbYJAb/Sj4IHHFha0QAVsRPrVK/8m0 w==;
X-CSE-ConnectionGUID: wwNDdOLFRVWWRya+o2RFhA==
X-CSE-MsgGUID: QkOY5U/CR6CV7rBXuN+jkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="84742812"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="84742812"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 02:44:16 -0800
X-CSE-ConnectionGUID: ni0PmFlPRtWl5JTY3IZ4bQ==
X-CSE-MsgGUID: kActei91SCaE50Xf2zHugA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="201598225"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 02:44:13 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, raag.jadav@intel.com, sk.anirban@intel.com,
 kamil.konieczny@linux.intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v6 0/2] tests/intel/xe_pm_residency: Add ASPM Link
 residency test
Date: Wed, 10 Dec 2025 16:13:58 +0530
Message-Id: <20251210104400.4141969-1-karthik.poosa@intel.com>
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

Karthik Poosa (2):
  lib/igt_device: Add API to get pci device upstream port
  tests/intel/xe_pm_residency: Add subtest for ASPM Link state residency

 lib/igt_device.c              |  30 ++++++
 lib/igt_device.h              |   1 +
 tests/intel/xe_pm_residency.c | 178 ++++++++++++++++++++++++++++++++++
 3 files changed, 209 insertions(+)
 mode change 100644 => 100755 tests/intel/xe_pm_residency.c

-- 
2.25.1

