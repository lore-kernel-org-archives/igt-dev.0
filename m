Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F922C02182
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 09:52:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B789210E7B4;
	Thu, 23 Jan 2025 09:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XvZA1J+R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B92010E7B4
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2025 09:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737625942; x=1769161942;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y+lKzcQ0mEm5LkRq5/AxteGAxtBNO6uq6sH996+XbPE=;
 b=XvZA1J+RcyWgA9ZUS2j/SWmpZohl3uOgkfdbwqTb7AokhS2P+IgLigaz
 JZs6Zz+rNi+zOcGGG3fI3boft84bgWULdxMtfASDaK8uPe5Stii+U9UYp
 f0BAr1vQph9Ij3KMho1Gvv2jeQJPa1B/77pTvJGmtGftdWZIcL/LJCO+v
 L23KYQYKwyA5mu9WvTEKzBsQA/EQnVcebL4xkErwcmGg65P0yT2aWApu9
 GUM6PiBGZIajA/A7yXNbn0yqcWzPVPcKrpdsYowm3/KiRSt6qvcSUcGdy
 ywv4vkdgOuBPws96KO5Rg0Z4sSF1RWXnskIQ/DziJqUmluFom94BJ84ir g==;
X-CSE-ConnectionGUID: t2pzM+sDT2WGDzo09VPeew==
X-CSE-MsgGUID: qQT7RbDIQ0imk98blVmgbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37814764"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="37814764"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 01:52:15 -0800
X-CSE-ConnectionGUID: DxlUIOcAS8+P2IqCi15wGA==
X-CSE-MsgGUID: x5h1HRXwTFadEPJ+H7YGAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="107407497"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.85])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 01:52:13 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 0/3] Drop device scan cache logic
Date: Thu, 23 Jan 2025 10:52:05 +0100
Message-Id: <20250123095208.72984-1-zbigniew.kempczynski@intel.com>
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

v2: retrieve missing scanning state variable (used for freeing
    on multiple scans)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Zbigniew Kempczyński (3):
  lib/igt_device_scan: drop device scan cache logic
  lib/igt_device_scan: change device list variable visibility
  tests/xe_intel_bb: check multithreading rescans won't segfault

 benchmarks/gem_wsim.c                    |  2 +-
 lib/drmtest.c                            |  2 +-
 lib/igt_device_scan.c                    | 16 +++-----
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
 13 files changed, 64 insertions(+), 22 deletions(-)

-- 
2.34.1

