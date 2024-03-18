Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C9DC54E5D
	for <igt-dev@archiver.kernel.org>; Mon, 18 Mar 2024 13:26:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F07B10F71C;
	Mon, 18 Mar 2024 13:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RhdjSZ+k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E8310F71C
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2024 13:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710768390; x=1742304390;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yWlJ66B07ZU6Cf97vtGApJOtlxBaYbV3a+ci6+bK/sE=;
 b=RhdjSZ+kHfdGJHpf0aM/TS0i2TCxeDOJF4ZJ9+2yDt47HS7aOdt7IW80
 XAEZS47nuREW3xGSe/ViKyCd+9SGUEwDJfXb3ThMlZUcVsT4aD6xz0u9y
 GvlFlNFcijzDzuNK1NlNCV8x8CUWTb3KRDUzPm5us9pGHBnpAI4I22Eim
 zBVh/qvAaPcv0fSdEvDiFhUBfggbjHigofW0YVRLrEfh7PHpCRKOmhZ4W
 pdevxUkR/u99nJhxvPzohHgsEVE65Kbjc3oABFrdZMV8jEFmWaz/lAcUA
 YsVReJqX7biMaFPb8X9sG1RluEQ7aKy0ct8V13LC4dqJZTlQRK7S2zW77 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="9386894"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="9386894"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 06:26:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="13501351"
Received: from unknown (HELO localhost) ([10.245.246.221])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 06:26:27 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v13 0/5] introduce Xe multigpu and other multi-GPU
 helpers
Date: Mon, 18 Mar 2024 14:26:18 +0100
Message-ID: <20240318132624.110746-1-kamil.konieczny@linux.intel.com>
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

Dominik Karol Piątkowski (3):
  lib/igt_device_scan: Introduce filtering out non-PCI devices
  lib/drmtest: Introduced drm_open_driver_another
  lib/igt_multigpu: Introduce library for multi-GPU scenarios

Kamil Konieczny (2):
  tests/intel/xe_exec_basic: add multigpu subtests
  tests/intel/gem_exec_gttfill: simplify multiGPU subtest

 lib/drmtest.c                  | 109 +++++++++++++++++++++-----------
 lib/drmtest.h                  |   2 +
 lib/igt_device_scan.c          |  23 +++++++
 lib/igt_device_scan.h          |   2 +
 lib/igt_multigpu.c             | 110 +++++++++++++++++++++++++++++++++
 lib/igt_multigpu.h             |  38 ++++++++++++
 lib/meson.build                |   1 +
 tests/intel/gem_exec_gttfill.c |  13 +---
 tests/intel/xe_exec_basic.c    |  36 +++++++++++
 9 files changed, 289 insertions(+), 45 deletions(-)
 create mode 100644 lib/igt_multigpu.c
 create mode 100644 lib/igt_multigpu.h

-- 
2.42.0

