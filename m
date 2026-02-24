Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0253EFB801
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 08:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545B710E4E4;
	Tue, 24 Feb 2026 08:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A1f/08SI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6265B10E4E5
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 08:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771921684; x=1803457684;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B9X/QLsiSW1cUYuBB/M1de5q+XtydSkbkRGEtr2t2fY=;
 b=A1f/08SIL/NBnNU9/5zrinEuyK+e66SEnjFO76e9XiIJTRa68xsG5fOm
 BD2iVQj6TxuR82KOJehWihPpxwUgx5h3Fz06vIMEbz3ujNnbcF/3gvw5Q
 lZ/yJoEsUjQLMZCwwUrR8Lg018ZgjyvVMi//2E1+kuhUI5UnXIJsJLpI1
 T/owRSWKQJLD+CeUi9LBIYnIhsXsXWgR3tW5tfldzYUHN+xUd0eVqIOUY
 qPZqmapZo7LqXkBVnYFgcybJJk06fHvG3nc1akuTkMPtjU8XlOnSMhJzF
 YrALRtOxrCfEXpP2NU7eP8w0+MjtgyO0QKakCD7Lj/hLVtazKbmvGeDV5 g==;
X-CSE-ConnectionGUID: 2Tkwq4H6SKqav4Y0yYEM+Q==
X-CSE-MsgGUID: OglaN1B+QYC+1MIhujUTTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72904055"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="72904055"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:28:03 -0800
X-CSE-ConnectionGUID: QGt0K4bMRkKY+wuNkIjOCQ==
X-CSE-MsgGUID: EcLBoe1CRYePhSahT+vFPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="214088056"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa010.fm.intel.com with ESMTP; 24 Feb 2026 00:28:01 -0800
From: priyanka.dandamudi@intel.com
To: igt-dev@lists.freedesktop.org,
	priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 0/5] Add support for xe3p and prefetch fault test
Date: Tue, 24 Feb 2026 13:57:55 +0530
Message-ID: <20260224082800.1581935-1-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Patch series contain:
Introduce gpu execution commands for an efficient 64bit mode.
Add support for xe3p efficient 64bit addressing.
Add canonicalize helper for 57 bit.
Add support for xe3p and xe3 in generate_iga64_codes scripts.
Add prefetch fault test.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Andrzej Hajda (1):
  lib/gpgpu_shader: Add support for xe3p efficient 64bit addressing

Gwan-gyeong Mun (2):
  lib/[gpu_cmds|xehp_media]: Introduce gpu execution commands for an
    efficient 64bit mode.
  lib/allocator: add canonicalize helper for 57 bit

Priyanka Dandamudi (2):
  scripts/generate_iga64_codes: Add support for xe3p and xe3
  tests/intel/xe_prefetch_fault: Add test for prefetch fault

 lib/gpgpu_fill.c.gen.iga64_codes.c            |   2 +-
 lib/gpgpu_shader.c                            |  74 +++++-
 lib/gpgpu_shader.c.gen.iga64_codes.c          | 196 +++++++++++++++-
 lib/gpu_cmds.c                                | 210 +++++++++++++++++
 lib/gpu_cmds.h                                |  17 ++
 lib/iga64_macros.h                            |   5 +-
 lib/intel_allocator.h                         |   6 +
 lib/meson.build                               |   2 +-
 lib/xehp_media.h                              |  65 ++++++
 scripts/generate_iga64_codes                  |   2 +-
 .../xe_eudebug_online.c.gen.iga64_codes.c     |  45 +++-
 tests/intel/xe_prefetch_fault.c               | 217 ++++++++++++++++++
 .../xe_prefetch_fault.c.gen.iga64_codes.c     |  21 ++
 tests/meson.build                             |   1 +
 14 files changed, 850 insertions(+), 13 deletions(-)
 create mode 100644 tests/intel/xe_prefetch_fault.c
 create mode 100644 tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c

-- 
2.43.0

