Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79476CD98CE
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 05:13:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0196110E1A2;
	Mon, 15 Jun 2026 05:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZgiDxqfp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0BB710E1A2
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 05:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781500405; x=1813036405;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W5UkXiASFGqhw7TXux8IN5QCL8UbtpJ2gcoUN08VXvc=;
 b=ZgiDxqfpRaNhA3Nlh3YBJI7h23H7KQnySW7MJiBZYVNewF7GKLgKonqy
 aaNJi/1IX84ipV6raKwN6uav2Ft5Zb8L+9r2pwkozwQk8xxUNrv9ObJpf
 bl3tG8j0hvYtKi+pl3WPAybyTphUdS0pNtjP4MT9i25FdbFd8ZO1FpTX0
 2v7k69zkeY8NGTl4LlA5bR3EXWuIPUoASToldEKdn0MZmJpiQhaiHfOE2
 zBgmI0LHhgqxbw5/cM6NHhjbZDgei8ra6W1lVe2Hes0j9d/nIuO7J6Lus
 fyEc4TsWYDT+XpjFaG4+hTzPcHD2qu1f+Kz8qqYKV/s60V+omQpEfQ7w5 A==;
X-CSE-ConnectionGUID: qMRyXisGTR2//8W35zV4JQ==
X-CSE-MsgGUID: TyoPMq07TbeHBfM76FzXfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="81369476"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="81369476"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 22:13:24 -0700
X-CSE-ConnectionGUID: VYe3r74tRliLpatgUcILbA==
X-CSE-MsgGUID: KcxyyPqDQz2bUqS5hHSvjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="251299122"
Received: from nakshtra-system-product-name.iind.intel.com ([10.190.238.69])
 by orviesa003.jf.intel.com with ESMTP; 14 Jun 2026 22:13:22 -0700
From: nakshtra.goyal@intel.com
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, andrzej.hajda@intel.com,
 zbigniew.kempczynski@intel.com, priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t v3 0/1] lib: s/GEN_VER/GFX_VER/ for Intel platform
Date: Mon, 15 Jun 2026 10:43:20 +0530
Message-Id: <20260615051321.544506-1-nakshtra.goyal@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Nakshtra Goyal <nakshtra.goyal@intel.com>

Replace all occurrences of GEN_VER/gen_ver with GFX_VER/gfx_ver
across the IGA64 shader infrastructure and igt code bases

The GEN_VER preprocessor define is passed by the generate_iga64_codes
script during IGA64 GPU shader assembly compilation and used for
conditional compilation in iga64_macros.h. Rename it to GFX_VER to
align with the IGT naming convention.

Changes:
- scripts/generate_iga64_codes: Pass -DGFX_VER instead of -DGEN_VER
  to the cpp preprocessor and rename the shell variable gen_ver to
  gfx_ver. Update generated struct field from .gen_ver to .gfx_ver.
- lib/iga64_macros.h: Replace all GEN_VER references with GFX_VER.
- tests/intel/*.gen.iga64_codes.c: Update generated .gen_ver struct
  fields to .gfx_ver.

This series is a continuation of the series sent earlier with slightly
different subject https://patchwork.freedesktop.org/series/167076/

Nakshtra Goyal (1):
  lib: s/GEN_VER/GFX_VER/ for Intel platform

 lib/gpgpu_fill.c                              |   4 +-
 lib/gpgpu_fill.c.gen.iga64_codes.c            |  16 +-
 lib/gpgpu_shader.c                            |  30 +--
 lib/gpgpu_shader.c.gen.iga64_codes.c          | 186 +++++++++---------
 lib/gpgpu_shader.h                            |   4 +-
 lib/iga64_macros.h                            |  10 +-
 scripts/generate_iga64_codes                  |  16 +-
 tests/intel/xe_eudebug_online.c               |   6 +-
 .../xe_eudebug_online.c.gen.iga64_codes.c     |  16 +-
 tests/intel/xe_prefetch_fault.c               |   2 +-
 .../xe_prefetch_fault.c.gen.iga64_codes.c     |   6 +-
 11 files changed, 148 insertions(+), 148 deletions(-)

-- 
2.34.1

