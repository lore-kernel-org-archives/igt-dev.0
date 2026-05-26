Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86ADCD5BCF
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 05:56:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E6710E46E;
	Tue, 26 May 2026 05:56:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NK+9J6cH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726A810E46E
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 05:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779774955; x=1811310955;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jt+331vxBxwFgVuEQlUhYms8BHR5ddMNDZ4mvx2zA8U=;
 b=NK+9J6cH/HI3iADDl/x1FvasBwS82OuKsNM6ORW3NoejtbAI7MldA6hV
 fZZtcYbkz+DJqXcEwMF8ekGW/Iim6EBxNvKLcdUBLIzoWr4YQ+9pZY4S7
 ELvlfcNkbyh+KXrUmeL1LSGgligUHqLvm4qjGFgnWBP17W0UOdDmLtgC/
 2hPhH5FAb/PbEpo85nhPNBl8MuqwqU5ceMqcQjY6TbFnNmVSu8khyho3S
 BPiCNZaH3GXxsNDJ7yjxYOhmbtj0cjILrmYtflpQt5Q7Gu2AVgNCKBoV6
 ZEZdqfH+LQTj9dWfGYmaXJch9EGREQyM7N78m/r1mSc5WbD/QdQa0kvXS A==;
X-CSE-ConnectionGUID: tU7SIwgHRIeKWil1fBsCCw==
X-CSE-MsgGUID: fK7/BnipT9aOh10XNvCr3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91688054"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="91688054"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 22:55:54 -0700
X-CSE-ConnectionGUID: bCV0fNj7S3KGUu8U9ZKUBw==
X-CSE-MsgGUID: SeLQmhe6QPq5BoG1WyAeww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="246903954"
Received: from nakshtra-system-product-name.iind.intel.com ([10.190.238.69])
 by fmviesa005.fm.intel.com with ESMTP; 25 May 2026 22:55:52 -0700
From: nakshtra.goyal@intel.com
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, andrzej.hajda@intel.com,
 zbigniew.kempczynski@intel.com
Subject: [PATCH i-g-t 0/1] lib: s/GEN_VER/GFX_VER/ for Intel platform
Date: Tue, 26 May 2026 11:25:50 +0530
Message-Id: <20260526055551.207137-1-nakshtra.goyal@intel.com>
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
 lib/gpgpu_fill.c.gen.iga64_codes.c            |  14 +-
 lib/gpgpu_shader.c                            |  30 +--
 lib/gpgpu_shader.c.gen.iga64_codes.c          | 184 +++++++++---------
 lib/gpgpu_shader.h                            |   4 +-
 lib/iga64_macros.h                            |  10 +-
 scripts/generate_iga64_codes                  |  16 +-
 tests/intel/xe_eudebug_online.c               |   6 +-
 .../xe_eudebug_online.c.gen.iga64_codes.c     |  14 +-
 tests/intel/xe_prefetch_fault.c               |   2 +-
 .../xe_prefetch_fault.c.gen.iga64_codes.c     |   4 +-
 11 files changed, 144 insertions(+), 144 deletions(-)

-- 
2.34.1

