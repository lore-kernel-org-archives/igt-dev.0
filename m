Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEC9CD6E57
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jun 2026 09:03:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B13113DF9;
	Thu,  4 Jun 2026 09:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PCwytLDP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B59F113DF9
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jun 2026 09:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780563803; x=1812099803;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Dnw9cxyEwG68JTzMOWizQxIiFKeysq9ogBs2tosJ3xc=;
 b=PCwytLDPl5cDFj0yXvnYvoKAs7Sh7GwoQK1hifdjsITI0YtSzOY/EXoq
 2adbal2wf+zOQajzOSidH7dGJGTWMkszo4WFuLRijjIhXXdP9GkwKqjOF
 oMawGa0UqrGkThmFkQwSH6Wi+1mzSG3GMD1wMdNCGP9dD5XBu/KYJ6XG+
 dcJFEakG96IsAYs+pGgtJ926kT9USOY1m1CPLx7w7stv+vf3E330rWZJn
 Km251kTKcjKr2J6ROlqhU3+x1D5dJfCZrgtITBuf3NNIRD5MesEFJbp2P
 23C5MfLD4dmkvfHsf5+tRWjQEnFhejUzqfH/av1d47V4JkvfUG6HjDcxg A==;
X-CSE-ConnectionGUID: zreR/x+JRC6G6d/2ScpISg==
X-CSE-MsgGUID: 3Fma29TeQmml/jMVjTFfjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="68925954"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="68925954"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 02:03:23 -0700
X-CSE-ConnectionGUID: 7LGuIVj7THiLJx62LFEKHA==
X-CSE-MsgGUID: wJ9NkpHOQ0CoMQFGU7TJ3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="244611834"
Received: from nakshtra-system-product-name.iind.intel.com ([10.190.238.69])
 by orviesa007.jf.intel.com with ESMTP; 04 Jun 2026 02:03:21 -0700
From: nakshtra.goyal@intel.com
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, andrzej.hajda@intel.com,
 zbigniew.kempczynski@intel.com
Subject: [PATCH i-g-t v2 0/1] lib: s/GEN_VER/GFX_VER/ for Intel platform
Date: Thu,  4 Jun 2026 14:33:18 +0530
Message-Id: <20260604090319.332019-1-nakshtra.goyal@intel.com>
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
 lib/gpgpu_fill.c.gen.iga64_codes.c            |  18 +-
 lib/gpgpu_shader.c                            |  30 +--
 lib/gpgpu_shader.c.gen.iga64_codes.c          | 188 +++++++++---------
 lib/gpgpu_shader.h                            |   4 +-
 lib/iga64_macros.h                            |  10 +-
 scripts/generate_iga64_codes                  |  16 +-
 tests/intel/xe_eudebug_online.c               |   6 +-
 .../xe_eudebug_online.c.gen.iga64_codes.c     |  18 +-
 tests/intel/xe_prefetch_fault.c               |   2 +-
 .../xe_prefetch_fault.c.gen.iga64_codes.c     |   8 +-
 11 files changed, 152 insertions(+), 152 deletions(-)

-- 
2.34.1

