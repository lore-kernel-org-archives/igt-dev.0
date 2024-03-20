Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31683C6FD1F
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 15:57:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F0C10FDA3;
	Wed, 20 Mar 2024 15:57:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Klw3pXTQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B20310FDA3
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 15:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710950225; x=1742486225;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9O5lShy0KDEB3h929v/eR79f3O0KCR+JfHeRPkZqt5o=;
 b=Klw3pXTQqcaMmSvqMJeN2oPXBkuGs0RtsWPsmsuUUIcyDhdOULnfa7Bu
 L6PoW6Nvjez07/ETS4uwVE1z2ml4zq3/IJuevba6kEyrj2U6M8+C6jZXf
 Hp37FtCHKYaSk90XBzD4yLFRojWdi+BSAX7PUgjE7A0yU1GiFjZ0fTmul
 5AwJ3qH99F87bkf4ezK7+eyJsKYh7PMZRwcBvy25nL7QpE697gbK/c4W4
 7JgT+21kHEnzLHbelqCm0j2ZFMAKs7TyQh/gQTXuai05uyZ5zcO0WBAcP
 gdJNv8IZJ7YutWCcCWXmjsvJyavnveNfG6AIqYqCbIpXR4XxeNSYXMeW5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="9676931"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="9676931"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 08:57:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="14597853"
Received: from unknown (HELO localhost) ([10.245.246.243])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 08:57:03 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v14 0/5] introduce Xe multigpu and other multi-GPU
 helpers
Date: Wed, 20 Mar 2024 16:56:54 +0100
Message-ID: <20240320155659.33518-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
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

      Introduce some multi-gpu function helpers and macros. This allows
quickly writing new multiGPU tests for i915 without requiring filters.
There is still drawback of not printing in children logs <g:gpu-number>
for first (for Xe) opened device or for all opened ones (for i915).
I renamed lib from lib/i915/igt_multigpu.* to lib/igt_multigu.* as they
should also work for other vendors.

v2: corrected two patches which introduced multigpu lib (Dominik)
  rebased patch intoducing Xe multigpu macro, corrected description
v3: corrected include in first multigpu patch (Dominik)
  fixed typo (Dominik), refactoring code with Xe and gem macro (Kamil)
v4: corrected typo in macro (Dominik)
v5: removed cached names and relaxing checks for filtered devices
  in 3/8 patch, added Janusz to cc in 1/8...5/8 (Kamil)
v6: extended description of patches 1 and 2, fixed bug in 3/8 (Janusz)
  improved usage of _is_already_opened() (Kamil)
v7: restored prohibition of opening the same card at other index (Janusz)
v8: limit checks for N-th card to 0...N-1 range (Janusz)
 simplify if-else in __search_and_open() (Kamil)
v9: dropped patch 3/8 ("lib/drmtest: allow opening cards in random order")
 as it can be added later, replaced 8/8 ("tests/intel/gem_mmap: add basic
 multi-GPU") with refactor in gem_exec_gttfill (Kamil)
v10: added new helper close function into drmtest.c (Kamil)
 use skip in drm_open_driver() in drmtest.c (Janusz)
 renamed macro from xe_multi_fork_foreach_gpu to multi_fork_foreach_gpu_chip
 and also adding chipset parameter to it, so it is more flexible (Zbigniew)
 fix xe test to use new macro (Kamil)
 squashed patches 3 and 4 into one (Janusz)
v11: moved descriptions for new functions into patch where they are
 introduced (Janusz)
 corrected description in cover letter for v10 (Kamil)
v12: many improvements suggested by Janusz
v13: dropped patch for Xe macro with filtered views as it will be better
 to send it in separate patchset (Janusz)
 other improvements suggested by Janusz
v14: drop multigpu_open_another and replace it with drm_open_driver_another
 in igt_multigpu, add missing igt_require_gem() in gem_exec_gttfill (Janusz)

Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>

Dominik Karol Piątkowski (3):
  lib/igt_device_scan: Introduce filtering out non-PCI devices
  lib/drmtest: Introduced drm_open_driver_another
  lib/igt_multigpu: Introduce library for multi-GPU scenarios

Kamil Konieczny (2):
  tests/intel/xe_exec_basic: add multigpu subtests
  tests/intel/gem_exec_gttfill: simplify multiGPU subtest

 lib/drmtest.c                  | 109 ++++++++++++++++++++++-----------
 lib/drmtest.h                  |   2 +
 lib/igt_device_scan.c          |  23 +++++++
 lib/igt_device_scan.h          |   2 +
 lib/igt_multigpu.c             |  88 ++++++++++++++++++++++++++
 lib/igt_multigpu.h             |  36 +++++++++++
 lib/meson.build                |   1 +
 tests/intel/gem_exec_gttfill.c |  14 ++---
 tests/intel/xe_exec_basic.c    |  36 +++++++++++
 9 files changed, 266 insertions(+), 45 deletions(-)
 create mode 100644 lib/igt_multigpu.c
 create mode 100644 lib/igt_multigpu.h

-- 
2.42.0

