Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF6CD5C0D1
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 08:10:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39D310E759;
	Tue, 16 Dec 2025 08:10:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ud6kaAe4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA59B10E726
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 08:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765872606; x=1797408606;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BcTBowFkU0v9k+WhCwixsxAbA0jkQ1IBXaFkpyIl/Jc=;
 b=Ud6kaAe4aS2h+xrY9Dii/Ce9gSqekyhc6X/TqQD5KS0ZMCoiVP4nx4xe
 qKg8z2mTSuPZF6Kms40yGG3Fm5EnQnjBucOK2lU9a9C4eZJQ7TaIGxbic
 zJlHAY8mHfc7/7hc46UK7RmrLdZ2InWtpL1yb/+8JJxF+rf6loaT9WlIr
 v5/9CsoO1PKIb8Ce/vxBrUcJpHrghWK20YSb5DCjy57wvJHHnSyyLbXR6
 vUQVyiT7u+R9E+lquc5JXom8uj4ruWXfP4BiDnJw49cnpBRUGI6w3iylt
 zpkuUe25kj/lRySq4R1xvqDcIjHsKfWBBKnY+BG5NbXLQiP1CW16NBGuL Q==;
X-CSE-ConnectionGUID: OoCnHh1RTRmGyJb7GksegA==
X-CSE-MsgGUID: TFQTF72BS+KRDf1u4FsyJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="66773060"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="66773060"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 00:10:00 -0800
X-CSE-ConnectionGUID: E+TNzDcjTAy1kIvSz5BwGQ==
X-CSE-MsgGUID: m33ipOl9RlawnoHX2mEtpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="198443630"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 00:09:58 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, kamil.konieczny@linux.intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v8 0/2] tests/intel/xe_pm_residency: Add ASPM Link
 residency test
Date: Tue, 16 Dec 2025 13:39:49 +0530
Message-Id: <20251216080951.199893-1-karthik.poosa@intel.com>
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


Karthik Poosa (2):
  lib/igt_device: Add API to get pci device upstream port
  tests/intel/xe_pm_residency: Add subtest for ASPM Link state residency

 lib/igt_device.c              |  41 ++++++++
 lib/igt_device.h              |   1 +
 lib/igt_pci.h                 |   2 +
 tests/intel/xe_pm_residency.c | 179 ++++++++++++++++++++++++++++++++++
 4 files changed, 223 insertions(+)
 mode change 100644 => 100755 tests/intel/xe_pm_residency.c

-- 
2.25.1

