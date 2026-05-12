Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92BBCD4851
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 12:22:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED6A10E0E5;
	Tue, 12 May 2026 12:22:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fzeEbumv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9645E10E0E5
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 12:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778588508; x=1810124508;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Qe5FJSMBN23QhFbsWkm6fP4amg1+VWipWGh/4V3MCh4=;
 b=fzeEbumv7GuE1hia+QpQFAX1Pe2yfBYpU7lIsB+OS8KQInmvbSPvORpE
 zXtoYkBiDFlqeWJa6Bo/W6LEygFMXlx3zuEgprYqDZqPJbcNq9OGFo+N7
 hjYWHcsYSWoTH0htY8TmYAyEkSEpLXHGjzZgenFOJyyPsO7UXNpZpSiwu
 B8Q/IN/EQvTFor5dgjEIUt/5TYRgPxxN0ziU8xIuAvem/r25sEOZQ10Iu
 Ib4ggZ/EEtA+Ey9CbdtH6WEy9DXZCv2pCDmDB0y0swC1N+CPrr2PkCnn1
 f6HG2+Lmf9pim1NPnJvSRyGPqiMSaMszUdIJjIc2xGa48fXO/RE3vp3uO w==;
X-CSE-ConnectionGUID: K6EYLGVuTYyaWryY/o30gQ==
X-CSE-MsgGUID: dX658AYpSvCyqRQZG+s01Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="96919201"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="96919201"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:21:48 -0700
X-CSE-ConnectionGUID: 9IYRPGy1RTyAA8btnseErw==
X-CSE-MsgGUID: ck79os1uTO2MuifNruybHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="233286203"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:21:47 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 00/25] lib/kms: Clean up format+mod stuff
Date: Tue, 12 May 2026 15:21:18 +0300
Message-ID: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Abstract the format+modifier lists a bit to make things less
mess and fragile.

Also try to get rid of more special cases in tests by always
populating the async flip format+mod lists, even if the driver
doesn't expose the actual IN_FORMATS_ASYNC blob.

Ville Syrjälä (25):
  tests/kms_async_flips: Use correct format_mod list
  test/kms: Introduce a few extra format/modifier variables
  lib/kms: Introduce struct igt_format_mods
  lib/kms: Pass struct igt_format_mods to igt_parse_format_mod_blob()
  lib/kms: Extract format_mods_alloc()
  lib/kms: Extract fill_plane_default_format_mods()
  lib/kms: Extract igt_format_mods_has_format_with_modifier()
  lib/kms: Pass target format_mods to igt_add_display_format_mod()
  lib/kms: Extract format_mods_union()
  lib/kms: Extract display_format_mods_union()
  lib/kms: Move and rename igt_count_display_format_mod()
  lib/kms: Make igt_fill_display_format_mod() more flexible
  lib/kms: Add display->format_mods_async
  lib/kms: Fill plane->format_mods_async for planes without IN_FORMATS
  lib/kms: Encourage drivers to expose IN_FORMATS_ASYNC
  lib/kms: Introduce igt_format_mods iterators
  lib/kms: Add helpers to query igt_format_mods
  tests/chamelium/kms_chamelium_frames: Use
    for_each_format_and_modifier()
  tests/kms_plane: Use igt_format_mods_has_modifier()
  tests/kms_plane: Use for_each_format_and_modifier()
  tests/kms_async_flips: Remove the IN_FORMAT_ASYNC check
  tests/kms_async_flips: Use igt_format_mods_has_modifier()
  tests/kms_async_flips: Use for_each_format_and_modifier() and 
    for_each_modifier_with_format()
  tests/intel/kms_flip_tiling: Use for_each_modifier_with_format()
  tests/chamelium/kms_chamelium_frames: Use
    for_each_format_with_modifier()

 lib/igt_kms.c                          | 248 ++++++++++++++++---------
 lib/igt_kms.h                          |  68 ++++++-
 tests/chamelium/kms_chamelium_frames.c |  54 +++---
 tests/intel/kms_flip_tiling.c          |  22 +--
 tests/kms_async_flips.c                |  52 ++----
 tests/kms_plane.c                      |  30 +--
 6 files changed, 280 insertions(+), 194 deletions(-)

-- 
2.52.0

