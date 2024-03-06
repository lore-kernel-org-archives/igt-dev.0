Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3F5C54E41
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 13:32:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9505C1131B2;
	Wed,  6 Mar 2024 13:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="II2h8E7h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B8F1131B2
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 13:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709731924; x=1741267924;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G8PRC/qU8fb0agN68LFXeVdx10qRpYbLwxfSjlzrfmU=;
 b=II2h8E7hHbVG+Zw/30OdqTKrIGuiLfsVrsNOXdNXVxqlM70KaAKhkhQQ
 MIozMQuwF8z7itmv6nyKlxHh3igbhcQ8zlEgwG06iuliB09ygb8XZ9xmJ
 5f+OXEP2LZLV5qkfCLtfoXM1mKsYzw1Eb+04v3o/DRgegpbgQ8gM4GhUo
 7n8cPWr7+ZHZuNI2EP7s1rwA4FoExjVZmYtsaPRa3vtY7X5rnEIBDoq7V
 FZ8yvLXHCQ1rP4rvvPUX56snlaeXBTQWXldFJQO1QGxeUwKsDEIDujjvU
 FgulNFNsiZY3cASWK2l0eh+0zCuIZTEj2s5052HNZJ6ctJjFVQ4FKwm6E w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4524294"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="4524294"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 05:32:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="14317321"
Received: from unknown (HELO localhost) ([10.245.244.145])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 05:32:02 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v11 0/6] introduce Xe multigpu and other multi-GPU
 helpers
Date: Wed,  6 Mar 2024 14:31:52 +0100
Message-ID: <20240306133158.45187-1-kamil.konieczny@linux.intel.com>
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
 renamed macro from xe_multi_fork_foreach_gpu to multi_fork_foreach_gpu_chip
 and also adding chipset parameter to it, so it is more flexible (Zbigniew)
 fix xe test to use new macro (Kamil)
 squashed patches 3 and 4 into one (Janusz)
v11: moved descriptions for new functions into patch where they are
 introduced (Janusz)
 corrected description in cover letter for v10 (Kamil)

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

