Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7167DC30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:28:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CA610E08E;
	Tue,  2 Jul 2024 23:28:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EN73WBPE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BF610E08E
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962902; x=1751498902;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xLacvAl1CciVLIMz845r0Gf3M9l4SKV9W/9vJQRgJ/M=;
 b=EN73WBPE583CjsCJo5+ZAo3v9mBIyqE7timTTt76VqaL0MuuKmF5TbGr
 2CI3no3WB0TIjYXwIh/t3vH5Es7zWX9N1Ba1X+a0M4zMgcNvHNZzZERtJ
 DBXw4TGDNT7rYLEDulT7j8+ttl/DwJgRiQgPgXrBKNhB0YvGDFxn7Sf7K
 GILKU5s34ZRjrNDdbbO2NuZ0o3rULNUC646KAn1vRvdnQQqezwJETQzSn
 12M1LcIRSqm9ny1XFk8mw46lzHiMqsPbhWnP1HGrkXlExRPDjZItTt0Yf
 agk1UgkxpvNXWetDP9YjFol03FqvDWEyqLTy3czlCalI4/CDhEtgc+8vn w==;
X-CSE-ConnectionGUID: xB85VUaXR9CTSGK2QrLAxg==
X-CSE-MsgGUID: tcnG0ca3RUeOHxDAdq9Y+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559467"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559467"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:28:21 -0700
X-CSE-ConnectionGUID: RQOHiBPOTjef4JqqbW63wg==
X-CSE-MsgGUID: Fuhi/4eGQuGR0dDeqxkc4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043755"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:28:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:28:17 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 00/37] Intel CCS + 10bpc/fp16 stuff
Date: Wed,  3 Jul 2024 02:27:40 +0300
Message-ID: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
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

Try to fix/implement pretty much everything related to
CCS with 10bpc and fp16 pixel formats.

Some caveats:
- 10bpc hangs the VEBOX
- block copy CCS is fairly dodgy

I have additional stuff on top to make kms_big_fb
also tests CCS, and planar formats as well. I've not
finished polishing it, so won't post it to the list
right now. Functionally it's pretty much done though,
so grab it here if you want to give it a try:
https://github.com/vsyrjala/intel-gpu-tools.git fb_ccs_fixes_3

Melanie Lobo (1):
  lib/intel_aux_pgtable: Library to add support for RGB16161616_64B
    format

Ville Syrjälä (36):
  lib/rendercopy: Add deltas to all surface relocs
  tests/kms_big_fb: Use igt_fb_create_intel_buf()
  tests/kms_frontbuffer_tracking: Use igt_create_fb()
  lib/igt_fb: Make igt_calc_fb_size() somewhat usable
  lib/rendercopy: Always setup clear color for TGL
  lib/rendercopy: Don't skip clearcolor on flat CCS
  lib/rendercopy: Fix fastclear scaling
  lib/rendercopy: Extract gen4_surface_format()
  lib/rendercopy: Extract {dg2,lnl}_compression_format()
  lib/rendercopy: Add specific support for 2:10:10:10 formats
  lib/rendercopy: Use the proper compression format for 10bpc on
    dg2/lnl+
  lib/rendercopy: Use the proper compression format for 16bpc on
    dg2/lnl+
  lib/igt_fb: Extract is_gen12_rc_ccs_cc_modifier()
  lib/igt_fb: Extract ccs_needs_enginecopy()
  lib/igt_fb: Require enginecopy for clear color
  lib/igt_fb: Expose igt_fb_is_ccs_modifier()
  lib/igt_fb: Expose igt_fb_is_gen12_rc_ccs_cc_modifier()
  lib/igt_fb: Expose igt_fb_is_gen12_mc_ccs_modifier()
  lib/igt_fb: Adjust how we pick the blitter compression format
  lib/igt_fb: Add DRM_FORMAT_XRGB2101010 compression format for the
  lib/igt_fb: Add 16bpc compression format for the blitter
  lib/igt_fb: Fix planar block copy
  lib/igt_fb: Fix blitter compression format handling
  lib/igt_fb: Try to fix block copy media compression handling
  lib/igt_fb: Assert that we have no clear color when using the bltter
  lib/vebox: Add support for fp16 RGB formats
  lib/vebox: Add 10bpc support
  lib/igt_fb: Treat 2:10:10:10 properly
  tests/kms_plane: Extract skip_format_mod()
  tests/kms_plane: Skip 10bpc formats with media compression
  tests/kms_ccs: Reuse igt_fb_is_gen12_rc_ccs_cc_modifier()
  tests/kms_ccs: Correctly check clear color for 10bpc formats
  tests/kms_ccs: Correctly check clear color for fp16 formats
  tests/kms_ccs: Skip 10bpc formats with media compression
  tests/kms_ccs: Skip testing on identical plane types
  tests/kms_ccs: Provide a hint as to what we're testing

 lib/igt_fb.c                           | 246 ++++++++++++++-----------
 lib/igt_fb.h                           |   6 +-
 lib/intel_aux_pgtable.c                |   5 +
 lib/intel_bufops.h                     |   3 +-
 lib/rendercopy_gen4.c                  |  21 +--
 lib/rendercopy_gen6.c                  |  21 +--
 lib/rendercopy_gen7.c                  |  23 +--
 lib/rendercopy_gen8.c                  |  21 +--
 lib/rendercopy_gen9.c                  | 193 +++++++++++++++----
 lib/rendercopy_i830.c                  |  10 +-
 lib/rendercopy_i915.c                  |   6 +-
 lib/surfaceformat.h                    |  20 ++
 lib/veboxcopy_gen12.c                  |  14 +-
 tests/intel/gem_pxp.c                  |   4 +-
 tests/intel/kms_big_fb.c               |  64 ++-----
 tests/intel/kms_ccs.c                  |  79 ++++++--
 tests/intel/kms_frontbuffer_tracking.c |  11 +-
 tests/kms_addfb_basic.c                |  14 +-
 tests/kms_plane.c                      |  61 +++---
 tests/kms_prime.c                      |  12 +-
 tests/kms_rotation_crc.c               |  10 +-
 21 files changed, 522 insertions(+), 322 deletions(-)

-- 
2.44.2

