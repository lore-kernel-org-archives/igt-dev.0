Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96470C48BC4
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 16:10:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239DD10E9B9;
	Thu, 15 Feb 2024 16:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VN6bhHAv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B16A10E9AE
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 16:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708013427; x=1739549427;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+dLCn3CWdVpyn8BYO6vxAP9YfVO67s61ULHZUHl6/9U=;
 b=VN6bhHAvsiES0IsQjmB4SBmJRWAOTBV9BaoE3KkswToReFj5lBUpRjDx
 0Uv5CfGrIfgdDGl3P3CCAXKJyZ99VHELL3cG0zB6waSwPHSuF7TqExVY0
 I5IVVJVKYQsiUiYKUaouYmP9lGPoBSzPl35k05skiRcPRg5e7unnL57NW
 M0n3siz+0xtit0tfoOnpk+LIED1OxJeQDu8Vd0bDbZ6JZ68bvjH7P7PmY
 GJfHHerSvKaMzc6HeKIubwxtSW4AO8lIceJNaVga8JOubJK9Ich43aWMO
 uDFrYxw2FM9coF+CQN0DVqt3kmhvOzCHpaT6AuWLQU51VwxueVJ9rD8Aa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="1982318"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="1982318"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 08:10:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="3930240"
Received: from unknown (HELO localhost) ([10.246.30.107])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 08:10:20 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v9 0/7] introduce Xe multigpu and other multi-GPU helpers
Date: Thu, 15 Feb 2024 17:10:07 +0100
Message-ID: <20240215161014.60304-1-kamil.konieczny@linux.intel.com>
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

Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Dominik Karol Piątkowski (4):
  lib/igt_device_scan: Introduce filtering out non-PCI devices
  lib/drmtest: Introduced drm_open_driver_another
  lib/intel_multigpu: Introduce library for multi-GPU scenarios
  lib/intel_multigpu: Introduced gem_multigpu_count_class and
    igt_multi_fork_foreach_gpu

Kamil Konieczny (3):
  lib/intel_multigpu: Add xe_multi_fork_foreach_gpu
  tests/intel/xe_exec_basic: add multigpu subtests
  tests/intel/gem_exec_gttfill: simplify multiGPU subtest

 lib/drmtest.c                  |  19 +++++
 lib/drmtest.h                  |   1 +
 lib/igt_device_scan.c          |  23 ++++++
 lib/igt_device_scan.h          |   2 +
 lib/intel_multigpu.c           | 135 +++++++++++++++++++++++++++++++++
 lib/intel_multigpu.h           |  36 +++++++++
 lib/meson.build                |   1 +
 tests/intel/gem_exec_gttfill.c |  14 +---
 tests/intel/xe_exec_basic.c    |  36 +++++++++
 9 files changed, 257 insertions(+), 10 deletions(-)
 create mode 100644 lib/intel_multigpu.c
 create mode 100644 lib/intel_multigpu.h

-- 
2.42.0

