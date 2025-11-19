Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94F6CF3186
	for <igt-dev@archiver.kernel.org>; Wed, 19 Nov 2025 09:52:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF3A10E5D5;
	Wed, 19 Nov 2025 09:52:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mKi722zp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5517410E038
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Nov 2025 09:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763545923; x=1795081923;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=13m79xu099dOk0A387Lpl2WJk3tW4evANf+rCNybsEc=;
 b=mKi722zp9VvMRrQfL1dnKffamhF+3H6Iq6es9DjAIKqOuILtA+nQF+A6
 vkebUt52LdKOncGatNUO7NVRvW1ZqWKpC8eDODD3L55AEcVRAiRnGdsD/
 X1WEhwqTlYzADqOq0JIKiP3L1YpTYenP4bEW2f/X1ZjkwvqCy2Zqoje1h
 om3M4jd9Y7tNHun7prXGwtMomJU6uEoyy5CnuQcuzME9go9R1t448oQZ9
 G58/f/yWj/m7btzwjxD53s3keRHWdLxV9dgHheRzgP/SKxDN8y6fLqN0Z
 70KNJ01i/Dd1Ph+tlD1AMDpU5LV7zHvBpe1XcpdLSGSeFi6+MHbopz9xS A==;
X-CSE-ConnectionGUID: givyBMdsQumO950VMHwGcw==
X-CSE-MsgGUID: NSHpHXq1TEOmPhr+AC2Kfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="83207057"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="83207057"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 01:52:03 -0800
X-CSE-ConnectionGUID: BAMMHPMdTCacHizV3Hhx/Q==
X-CSE-MsgGUID: 27QEatHRR7CJEioD/WWLHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="195954646"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 01:52:00 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, raag.jadav@intel.com, sk.anirban@intel.com,
 kamil.konieczny@linux.intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v4 0/2] tests/intel/xe_pm_residency: Add ASPM Link
 residency test
Date: Wed, 19 Nov 2025 15:21:52 +0530
Message-Id: <20251119095154.2501720-1-karthik.poosa@intel.com>
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

