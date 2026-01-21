Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57FEC44536
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 14:51:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9929010E84A;
	Wed, 21 Jan 2026 14:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lg95u7Gz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C7510E844
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 14:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769007106; x=1800543106;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a8eSNYGfGdJLu5gjQqhUS+PPOM0DleYp5nQkeKCQuy4=;
 b=lg95u7GzD6O1i2Kyyfjr+gMDmW5JEa4Sc6wpqOAYlICqFQUi96z1hSJ7
 LErpoIIJr0JRxuaVBhqYDY/WUhqggqqxl31NWsHCcm7SEhSwwxxAuVizh
 5JSTKx58xPqv1KG+n/H4+PLrM5OfPu1aBy1CxtyiDT+MZ4KECrcNPk59f
 0j3q9C4mxaaKb7VBXdTSXWAzqAN2mtCEn4bD9Is/K8hlR4qQrshr7xx0x
 HctfMIUPjjs1OZPZpujh3zqij7Mq99thkEqXC2APcMbUmmnZK6nM2PJUJ
 cp3Gdo6ce84mrGeu3A8rev1E6BIqZMgKF5rBY4OIXPn3JAsIQOebrRn7e g==;
X-CSE-ConnectionGUID: 7EUQ4+laQWazwF2RIzl/Rw==
X-CSE-MsgGUID: m6ZA1X8xQqqix5J5L//Mpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70146470"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="70146470"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 06:51:46 -0800
X-CSE-ConnectionGUID: mAk62JWNSWinYadJ2sMp6Q==
X-CSE-MsgGUID: OlLuSXrURd6rNTb8BW0LTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206534332"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 06:51:43 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, kamil.konieczny@linux.intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v10 0/2] tests/intel/xe_pm_residency: Add ASPM Link
 residency test
Date: Wed, 21 Jan 2026 20:27:45 +0530
Message-Id: <20260121145747.1378494-1-karthik.poosa@intel.com>
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

v9:
 - Add exit handler for aspm_link_residency test. (Riana)
 - Remove unused and unnecessary variables.

Karthik Poosa (2):
  lib/igt_device: Add API to get pci device upstream port
  tests/intel/xe_pm_residency: Add subtest for ASPM Link state residency

 lib/igt_device.c              |  43 ++++++++
 lib/igt_device.h              |   1 +
 lib/igt_pci.h                 |   2 +
 tests/intel/xe_pm_residency.c | 196 ++++++++++++++++++++++++++++++++++
 4 files changed, 242 insertions(+)

-- 
2.25.1

