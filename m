Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA89EEA7941
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 18:31:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C49E10E369;
	Wed,  4 Feb 2026 18:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="STgHTJH6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58BFA10E369
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 18:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770229898; x=1801765898;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w9UOjYmavlkwZvzKN91YmpY0cqmHSj6QwWq3v6UUQNM=;
 b=STgHTJH6VqfZdDeWPTkTfeuvcWZA2S+4AMoKKVIsz3CFKtk2380NIesm
 6a60jLnZpWz8Jn47JJ+rxbZTPIiEFEloszUj0ITGIa2iRQMTj3IHc0lSy
 L1qMIntZtqraRZ87vC5fB4GDmePQFb6fcrWoo8AcyYDsylQT4YDlbDqR2
 oQcWMzAHxGy/vEOQajV5DnW3A78Zikh0fL6VyR6nz2FlP5mV9JTLl7YVk
 ieYcA5PLcKQcFu3gKQErK4s0ipf6hxane2uIpFyIrfCaxZpodphd7ueUh
 pe2Yskj9c+mcUd6ZWwyEGSqfpPTCd0rJ7hwivI3cm8aSho3r5oY+H7cZy w==;
X-CSE-ConnectionGUID: EbK43guQTlmDjcqBzoLrmQ==
X-CSE-MsgGUID: JftzX+LHR4uaoMtijd6IMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="74028379"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="74028379"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 10:31:38 -0800
X-CSE-ConnectionGUID: F08v3BKzTmevvQi7WiJmeQ==
X-CSE-MsgGUID: Ryq9knI+QvSUK4CsVz/1Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="214409374"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 10:31:36 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, kamil.konieczny@linux.intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v11 0/2] tests/intel/xe_pm_residency: Add ASPM Link
 residency test
Date: Thu,  5 Feb 2026 00:07:45 +0530
Message-Id: <20260204183747.1960879-1-karthik.poosa@intel.com>
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

Add subtest aspm_link_residency to xe_pm_residency test to check ASPM Link
state residency.
This uses the debugfs /sys/kernel/debug/dri/0/dgfx_pcie_link_residencies
to read the residency counters.
Add an API igt_device_get_pci_usp() to get pcie device's upstream port.

v2:
 - Avoid using igt_require() in igt_device_get_pci_device. (Kamil)
 - Add description about PCIe ASPM in commit message and code. (Kamil)
 - Resolve couple of compilation warnings about using variable as format
   string to sscanf.

v3:
 - Rename igt_device_get_pci_usp() to igt_device_get_pci_upstream_port().
  (Kamil)

v4:
 - Refactor and enhance readability. (Badal)
 - Move save and restore of link states to separate functions. (Badal)

v5:
 - Use device type from pci express capability of pci config space to
   identify upstream port. (Badal)

v6:
 - Search for upstream port only two levels up of the endpoint as we want
   to verify ASPM only on PCIe link on which GPU card is present.
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

v10:
 - Address below review comments. (Kamil)
 - Improve save_and_disable_link_states() to restore link states on any
   failure.
 - Avoid igt_assert in aspm exit handler.
 - Make subtest non-dynamic.
 - Add a comment explaining the purpose of the spinner.
 - Update conditions and messages of couple of igt_asserts.

Karthik Poosa (2):
  lib/igt_device: Add API to get pci device upstream port
  tests/intel/xe_pm_residency: Add subtest for ASPM Link state residency

 lib/igt_device.c              |  43 +++++++
 lib/igt_device.h              |   1 +
 lib/igt_pci.h                 |   2 +
 tests/intel/xe_pm_residency.c | 215 ++++++++++++++++++++++++++++++++++
 4 files changed, 261 insertions(+)

-- 
2.25.1

