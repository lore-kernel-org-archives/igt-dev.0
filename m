Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D45CD5BB0
	for <igt-dev@archiver.kernel.org>; Fri, 22 May 2026 10:17:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD9110F540;
	Fri, 22 May 2026 10:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VS4hELI2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA5110F540
 for <igt-dev@lists.freedesktop.org>; Fri, 22 May 2026 10:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779445000; x=1810981000;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0SaQpJPeeB+dNAX2QKtzwmlfcb0rlO9rRKNhVvawKxY=;
 b=VS4hELI2DAqtm42fSZKEznAEEr7KGR6OUDMRhU73uQSce9hPX58fsqam
 4ar/gXyixkWLHv5VK20LDq7jDuFTO9wC2wpMWV3rcmu99iQe+cCzAvL3f
 hl8LZldxGaXPcXYXsYTrM2PD9f/9j7aOMDHT5m/0Dq+WHszIdyrJAFttd
 gBAA2sLGst0hBLulzPStuT+hteflrHZ+MvCrhSBfQn4NSOyYqGr0e1YJn
 B7/C0XrYNW28vzdMmIPOxWw47Mll78lKbhqENZD9wSIx5GpLUvjnwn1no
 6xN+NoIdpBZ+CtmGF3WOWOhFM+L3Q6YP49H4zMPoE1qtfbU6ITtwRgqTu A==;
X-CSE-ConnectionGUID: EiNwEU0zRkKYynwJxHWJdg==
X-CSE-MsgGUID: g+hqMSKeRGKFF7T4J3elrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="91765747"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="91765747"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 03:16:40 -0700
X-CSE-ConnectionGUID: gAisVdDoS5+ZD6ijgYLMvw==
X-CSE-MsgGUID: SyXthF4TSjevdh1myBVFaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="240926434"
Received: from nakshtra-system-product-name.iind.intel.com ([10.190.238.69])
 by orviesa009.jf.intel.com with ESMTP; 22 May 2026 03:16:39 -0700
From: nakshtra.goyal@intel.com
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/1] Rename GEN_VER to GFX_VER
Date: Fri, 22 May 2026 15:46:37 +0530
Message-Id: <20260522101638.195739-1-nakshtra.goyal@intel.com>
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

New usages of GEN are not allowed in IGT. Replace all occurrences of
GEN_VER/gen_ver with GFX_VER/gfx_ver across the IGA64 shader
infrastructure and igt code bases

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

Nakshtra Goyal (1):
  Rename GEN_VER to GFX_VER

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

