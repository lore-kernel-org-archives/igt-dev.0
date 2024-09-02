Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACA4CD13CF
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 14:38:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0CC110E320;
	Mon,  2 Sep 2024 14:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T8J1p17X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C02710E320
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 14:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725287881; x=1756823881;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=10hVoP3oTeceLPxo8SAeIf7Q+RrC7V+28yPI9HlBg00=;
 b=T8J1p17XHzb14EgI1neF37Khj7sLmeXLpbT2qgRntSaeW4w5nvq+Hujh
 00/cgC0GglcMcABbJwjlxDtSJo5oW2pCMINUuIuvFE3ZIURp6rtAtBFsb
 crRCRUUed4gCFVDp4zQVgIwS//eBcn7HhGdBh8hkZNlkHwCqpVA6ljS2U
 vPgsLw1FYAWxOhYxPYPIW+PiRwPMWJ3IArizcCnlkHaSaopkw+wtpCwIR
 Abgit40BHf/BBEVUskG5SRkNTAQWWMknOGzwzDr8HhWrNqz9dEv4b1cRK
 A7pHa7SeR47A+6igkhhQsazBPenyIuoDtZSydApBO+JPjgi2zjvWuFCGT Q==;
X-CSE-ConnectionGUID: Trn/j12wTquiTLZ/Qcr91A==
X-CSE-MsgGUID: INki+bqXT7qDnedhv2u3Sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24009409"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="24009409"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 07:38:01 -0700
X-CSE-ConnectionGUID: 6GDxhMpNSXyJYZW4FeK9tQ==
X-CSE-MsgGUID: ZoGt08ofSCi3bP/9km9Peg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64639359"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Sep 2024 07:37:59 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 02 Sep 2024 17:37:58 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 00/23] Intel format/modifier stuff
Date: Mon,  2 Sep 2024 17:37:35 +0300
Message-ID: <20240902143758.21036-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Bunch of refactoring/fixes/misc stuff extracted from the
earlier big series [1] whose main goal was proper 10bpc/fp16
CCS testing. I left out all the new 10bpc/fp16 stuff for
now, and just included all the prep work more or less.

Apart from the TGL magic fast clear stuff, some blitter
fixes, and a few tweaks to kms_ccs behaviour there should
no other functional changes here.

[1] https://patchwork.freedesktop.org/series/135670/

Ville Syrjälä (23):
  lib/rendercopy: Add deltas to all surface relocs
  tests/kms_big_fb: Use igt_fb_create_intel_buf()
  tests/kms_frontbuffer_tracking: Use igt_create_fb()
  lib/igt_fb: Make igt_calc_fb_size() somewhat usable
  lib/rendercopy: Always setup clear color for TGL
  lib/rendercopy: Don't skip clearcolor on flat CCS
  lib/rendercopy: Fix fastclear scaling
  lib/rendercopy: Extract gen4_surface_format()
  lib/rendercopy: Extract {dg2,lnl}_compression_format()
  lib/igt_fb: Extract is_gen12_rc_ccs_cc_modifier()
  lib/igt_fb: Extract ccs_needs_enginecopy()
  lib/igt_fb: Require enginecopy for clear color
  lib/igt_fb: Expose igt_fb_is_ccs_modifier()
  lib/igt_fb: Expose igt_fb_is_gen12_rc_ccs_cc_modifier()
  lib/igt_fb: Expose igt_fb_is_gen12_mc_ccs_modifier()
  lib/igt_fb: Adjust how we pick the blitter compression format
  lib/igt_fb: Fix planar block copy
  lib/igt_fb: Fix blitter compression format handling
  lib/igt_fb: Assert that we have no clear color when using the bltter
  tests/kms_plane: Extract skip_format_mod()
  tests/kms_ccs: Reuse igt_fb_is_gen12_rc_ccs_cc_modifier()
  tests/kms_ccs: Skip testing on identical plane types
  tests/kms_ccs: Provide a hint as to what we're testing

 lib/igt_fb.c                           | 234 ++++++++++++++-----------
 lib/igt_fb.h                           |   6 +-
 lib/intel_bufops.h                     |   1 +
 lib/rendercopy_gen4.c                  |  20 +--
 lib/rendercopy_gen6.c                  |  21 +--
 lib/rendercopy_gen7.c                  |  23 +--
 lib/rendercopy_gen8.c                  |  21 +--
 lib/rendercopy_gen9.c                  | 183 +++++++++++++++----
 lib/rendercopy_i830.c                  |  10 +-
 lib/rendercopy_i915.c                  |   6 +-
 lib/surfaceformat.h                    |  16 ++
 tests/intel/gem_pxp.c                  |   4 +-
 tests/intel/kms_big_fb.c               |  64 ++-----
 tests/intel/kms_ccs.c                  |  35 +++-
 tests/intel/kms_frontbuffer_tracking.c |  11 +-
 tests/kms_addfb_basic.c                |  14 +-
 tests/kms_plane.c                      |  56 +++---
 tests/kms_prime.c                      |  12 +-
 tests/kms_rotation_crc.c               |  10 +-
 19 files changed, 442 insertions(+), 305 deletions(-)

-- 
2.44.2

