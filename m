Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E78CC02182
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 09:22:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4AE410E164;
	Thu, 23 Jan 2025 09:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KwEcuZ43";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA86E10E164
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2025 09:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737624136; x=1769160136;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0nyttgDDPjzY0k3ezHFFJ5gYrvy+iObhUX11vz09LpM=;
 b=KwEcuZ43R4ElVOcUl7ty3jBFbKghOa1AFdwZ0ZGBh1lRWE8j9NnLWjul
 0LihWJbskkeiH7zS4kXggi+j4HwgXEUvnN3TdCfRXZHI21608DyxvFahO
 xlrQK4YErYl+yMPKr6zq8+qlzTBWxYQkTI4C1XYnnY6ndd8i7nII+t70s
 uTAFKKtSZeIGKj3Y9fovt6Ohz6vVvAzZBVMa3520BdkaXTKGXek6FRNmZ
 6mhAG+/9IPDtQaZ56Pz4EO5uDC29VSbquDEQxGP0D0cP4ArC90aOn1I0G
 f9u6w+B6mPW4xfnpy4uuUXz4wQWdaLWcXNiMa+0WWnDyd6gHX+SkDEfst w==;
X-CSE-ConnectionGUID: cgV0QAgaTu2fnjG6FSi8Tg==
X-CSE-MsgGUID: 2Y68250kS2SaBzO1fNEwDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="40938347"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="40938347"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 01:22:16 -0800
X-CSE-ConnectionGUID: R5CsdbYIQxye5Lfr6EUarw==
X-CSE-MsgGUID: vbUEamJyQjO5e+LPHyV9+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="130694482"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.85])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 01:22:14 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 0/3] Drop device scan cache logic
Date: Thu, 23 Jan 2025 10:22:07 +0100
Message-Id: <20250123092210.48249-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

In this series I haven't added limiting fetching attributes - after
reading udevadm-info.c I'm not sure it makes sense to limit it. Udevadm
in general does same things current igt_device_scan does, especially
it also skips some attributes. Additionally it skips attributes which
are binaries but I've some resistence to do this similar as strlen()
on blob is imo risky and it may result in segfault. I may send attrs
limiting in separate patch after this series will be reviewed (and
hopefully merged).

Series addresses main concern - stale device cache. Now rescans are
unconditional what prevents from opening old device after operations
on module.

Test added which checks device scanning in multithreading code likely
is not needed for merge. Adding to BAT should reveal early potential
problems with the series.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Zbigniew Kempczyński (3):
  lib/igt_device_scan: drop device scan cache logic
  lib/igt_device_scan: change device list variable visibility
  tests/xe_intel_bb: check multithreading rescans won't segfault

 benchmarks/gem_wsim.c                    |  2 +-
 lib/drmtest.c                            |  2 +-
 lib/igt_device_scan.c                    | 20 +++-------
 lib/igt_device_scan.h                    |  2 +-
 lib/igt_multigpu.c                       |  2 +-
 tests/core_hotunplug.c                   |  2 +-
 tests/device_reset.c                     |  2 +-
 tests/intel-ci/xe-fast-feedback.testlist |  1 +
 tests/intel/i915_suspend.c               |  4 +-
 tests/intel/xe_intel_bb.c                | 47 ++++++++++++++++++++++++
 tools/intel_gpu_top.c                    |  2 +-
 tools/intel_pm_rpm.c                     |  2 +-
 tools/lsgpu.c                            |  2 +-
 13 files changed, 64 insertions(+), 26 deletions(-)

-- 
2.34.1

