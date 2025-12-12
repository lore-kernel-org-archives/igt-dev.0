Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3699ED59D79
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 16:58:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B9910E08F;
	Fri, 12 Dec 2025 16:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hk+MseYH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1701D10E08F
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 16:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765558723; x=1797094723;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H2wIwi0KAj+7rx0pZw3itlY0hcAoDviK8r2EFstwLvw=;
 b=hk+MseYHgw8PuT9jWR9083aUluW3l6Pet5ZXc7X3a/NPGOtBx/YkZBq2
 2IvumNCb/PlZ4TgpVLOpfDoJeWQqVvYn18yTACrOWc7ZgiMi9O1v9duYU
 m3PwBBk2KAQzy1Nt8nZkoGTcT2M9HVtGn2EB3oxqiafCaR9hM/BoK1A+c
 JCpiS3JpVXHfOTdL3TsyqTokUjYw4YjBArayzMUmmMt/ZnTRsO+GF0sdC
 9fNSFNPEIq5vMR4owY6IE04TvSexxKNReJC98ajk2Bs3DA30Wjzyg45sH
 i14p0KFJkNMiG3KHJj2nSaxQO+lUEmAkKhYu26gyz1yWRWRTJPEfOjBMW g==;
X-CSE-ConnectionGUID: cjusBjW9Rqi8o+uH8Ni4Rg==
X-CSE-MsgGUID: PdgOQAG4SimpvbRlJWuQWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67314752"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="67314752"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 08:58:42 -0800
X-CSE-ConnectionGUID: K8/6r/O1T2uukZHXAF0GHA==
X-CSE-MsgGUID: PWbbyf26S1KmN5O3U92Uaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="228192797"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 08:58:39 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, kamil.konieczny@linux.intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v7 0/2] tests/intel/xe_pm_residency: Add ASPM Link
 residency test
Date: Fri, 12 Dec 2025 22:28:28 +0530
Message-Id: <20251212165830.28286-1-karthik.poosa@intel.com>
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

Karthik Poosa (2):
  lib/igt_device: Add API to get pci device upstream port
  tests/intel/xe_pm_residency: Add subtest for ASPM Link state residency

 lib/igt_device.c              |  42 ++++++++
 lib/igt_device.h              |   1 +
 lib/igt_pci.h                 |   2 +
 tests/intel/xe_pm_residency.c | 178 ++++++++++++++++++++++++++++++++++
 4 files changed, 223 insertions(+)
 mode change 100644 => 100755 tests/intel/xe_pm_residency.c

-- 
2.25.1

