Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E15D767CB
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 11:26:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D62510EF20;
	Fri, 19 Dec 2025 11:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GDn9MNst";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2393D10EF20
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 11:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766143592; x=1797679592;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8ZvA3A+2XyMczpO1GGK1xbJmWZ+baccz0eX3yBCpbcg=;
 b=GDn9MNstrjL5f4eeeWTmzBCCmaH8tIbMu56GzOBQDshdDNVHw8yG6Z4t
 r4jWXG62DrB4/8jQVnV/RTkm2zHAdAOqCSzlbW71N8IP0Q+ISPF5KGhdW
 HnPNTLoItbGpliMG+HQjM9Le20xoAD2ikdDdJvkBkRFneQXoDUgj5OhkC
 /lq1QME9wYC15w08vSGj82gtrsbRXk7IcEHC8hGkziyMunHJoQuuU56e1
 cZA5ul1Z/EfrbOoil06DiWbzLPqy/saoK5s1c2ADXFK+Jc0PpyWw3UH8J
 p622i6f3Vms1P22UIVrpsOysA2r2DjX4L1wmBzTYbVJejdqzhr1ka9YqJ Q==;
X-CSE-ConnectionGUID: 3NlvXVpcSqG2EE8i7sVc8g==
X-CSE-MsgGUID: fe8O318AQmiKNJb8jveJdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68144908"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="68144908"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:26:31 -0800
X-CSE-ConnectionGUID: oqb+7/SLSGqI1ABZhc0pHA==
X-CSE-MsgGUID: KcBmJUBYTza2c64ATtlfAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="198601665"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:26:29 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, kamil.konieczny@linux.intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v9 0/2] tests/intel/xe_pm_residency: Add ASPM Link
 residency test
Date: Fri, 19 Dec 2025 16:56:18 +0530
Message-Id: <20251219112620.273174-1-karthik.poosa@intel.com>
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

Karthik Poosa (2):
  lib/igt_device: Add API to get pci device upstream port
  tests/intel/xe_pm_residency: Add subtest for ASPM Link state residency

 lib/igt_device.c              |  41 ++++++++
 lib/igt_device.h              |   1 +
 lib/igt_pci.h                 |   2 +
 tests/intel/xe_pm_residency.c | 174 ++++++++++++++++++++++++++++++++++
 4 files changed, 218 insertions(+)
 mode change 100644 => 100755 tests/intel/xe_pm_residency.c

-- 
2.25.1

