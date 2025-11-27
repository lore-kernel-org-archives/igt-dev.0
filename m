Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED380D116F5
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 15:48:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F2910E109;
	Thu, 27 Nov 2025 15:48:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZE8h64s2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C7710E81E
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 15:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764258498; x=1795794498;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sgDDHpdvkcfbrTBZlJUMNxYRQuf1+eQQzTo/pbM3BnA=;
 b=ZE8h64s2epK5VkHlc4nbwCcgM+eH/gJmcENlI57z4LPnBN2kkrMnX1a/
 Iq3LKlP3pVyRFPkbUGntrSyexdm1s4eOHqyMd+mxOWJGehNt0w4hvxSn1
 IzbxQhJsecKxO9GA42OrDekDkm5Wrx+7EaGe9BM5tl4Niuli1PKWYmxHc
 JD+9WGLUGW3YJUYf80rtBrBXcb56tMpUNAgu1U6MPnMMf+y5GPSgMaHk1
 F4nLEUL9eI/h4kZwqX41RCtc/yQ2Wt5KvBuM7v2Kn7QJWNIjr//cKV+cj
 WEdeardAckF9jngjhemRtU79VZdbpNn2b2lv7oTNWgClo1py6KVG3a8eD A==;
X-CSE-ConnectionGUID: FyTE2i8PRGWXjmLTgu//Pg==
X-CSE-MsgGUID: cIcvaVbBQje1NUyov5ygRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66345757"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="66345757"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 07:48:17 -0800
X-CSE-ConnectionGUID: 6FIGu5sKTTeygdJ3y7bu3Q==
X-CSE-MsgGUID: tGsv1QjNQY2r+ZXtr5PEQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="216618372"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 07:48:15 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, sk.anirban@intel.com,
 kamil.konieczny@linux.intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v5 0/2] tests/intel/xe_pm_residency: Add ASPM Link
 residency test
Date: Thu, 27 Nov 2025 21:18:05 +0530
Message-Id: <20251127154807.2899369-1-karthik.poosa@intel.com>
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

Previous patchwork link which is combined patch: https://patchwork.freedesktop.org/series/155053/

Karthik Poosa (2):
  lib/igt_device: Add API to get pci device upstream port
  tests/intel/xe_pm_residency: Add subtest for ASPM Link state residency

 lib/igt_device.c              |  30 +++++++
 lib/igt_device.h              |   1 +
 tests/intel/xe_pm_residency.c | 160 ++++++++++++++++++++++++++++++++++
 3 files changed, 191 insertions(+)
 mode change 100644 => 100755 tests/intel/xe_pm_residency.c

-- 
2.25.1

