Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B5DC5478B
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 16:46:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE2310E10C;
	Wed, 21 Feb 2024 16:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GCtwRU7J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD72010E002
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 16:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708534004; x=1740070004;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LOpnxYrbd7mwrrwwr1fJWrjKCjOwjKnrghG7UF4g4Pw=;
 b=GCtwRU7Jei2GmNLzFNSMhKs4KanF8ArExmN4VxSWzPyp5jGQdG6RhOPr
 1h5AJD1dZHRszROqaF/TirjWhICwZIJ1IVPCDvVyGQDbV6SFZP3UkCw9i
 4xTb0JP2j6sayumyW7UC8aEzlMRM+RTSr46e3UVjY290ZirM0+TwxY6iY
 EbCWniKDom+05Uur8wWMwFrPycWENj8PChhENVUkgOWieX27ENgEnK2sG
 ypQw2qm/yLC5sV5Sl6NEb8hcTRDenFsSV2KGczBr0Lbl/ozZ7Ar4sUY7l
 Uftj9UCOdI+GppeVZzIkIhYYwI6ZH0m93BWS8CP9dbsQ3rWRtT5XurFdY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2851404"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="2851404"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 08:46:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; d="scan'208";a="42663202"
Received: from unknown (HELO localhost) ([10.246.5.230])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 08:46:42 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v10 0/6] introduce Xe multigpu and other multi-GPU
 helpers
Date: Wed, 21 Feb 2024 17:46:31 +0100
Message-ID: <20240221164637.116048-1-kamil.konieczny@linux.intel.com>
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
writing new multiGPU tests for i915 without requiring filters.
Solution for Xe is based on filtered views. Both allows to
quickly write tests. There is still drawback of not printing in
children logs <g:gpu-number> for first (for Xe) opened device or for
all opened ones (for i915). I renamed lib from lib/i915/igt_multigpu.*
to lib/intel_multigu.* as I do not know of any non Intel developer
using igt for such tests.

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
 renamed macro from xe_ to generic and also adding chipset parameter to it,
 so it is more flexible now (Zbigniew) fix xe test to use new macro (Kamil)

Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Dominik Karol Piątkowski (3):
  lib/igt_device_scan: Introduce filtering out non-PCI devices
  lib/drmtest: Introduced drm_open_driver_another
  lib/intel_multigpu: Introduce library for multi-GPU scenarios

Kamil Konieczny (3):
  lib/intel_multigpu: Add multi_fork_foreach_gpu_chip
  tests/intel/xe_exec_basic: add multigpu subtests
  tests/intel/gem_exec_gttfill: simplify multiGPU subtest

 lib/drmtest.c                  | 109 ++++++++++++++++++---------
 lib/drmtest.h                  |   2 +
 lib/igt_device_scan.c          |  23 ++++++
 lib/igt_device_scan.h          |   2 +
 lib/intel_multigpu.c           | 134 +++++++++++++++++++++++++++++++++
 lib/intel_multigpu.h           |  36 +++++++++
 lib/meson.build                |   1 +
 tests/intel/gem_exec_gttfill.c |  13 +---
 tests/intel/xe_exec_basic.c    |  36 +++++++++
 9 files changed, 311 insertions(+), 45 deletions(-)
 create mode 100644 lib/intel_multigpu.c
 create mode 100644 lib/intel_multigpu.h

-- 
2.42.0

