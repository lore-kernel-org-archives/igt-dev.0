Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11A2CCD1A3
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 12:05:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F6F10E59F;
	Wed, 18 Sep 2024 12:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T4FrYraL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65D010E58E
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 12:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726661122; x=1758197122;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hwyiimtdwDz7ED3l7cqNB5xk+Gj6WzYSrljBsOYAqSI=;
 b=T4FrYraLqOVGVkLWtXa7auXk+yi4+aLaOBXx1EoFf0rhULacIvM38HmC
 oOda0BQgPu4hgBMPj9nnFPG7kadT6QO0cY41rmRW9HZ7GZqMeRW8koBQ8
 TRzfkRA/JWDHLAYNietgakmAHbkEuGuh91kNFRkr6fYJW3nUyXXqY0/qZ
 y5G2WYhs0ReD9pU/MqA2nThVuWbZ5P1xUAW2MXC/0atWMjvtTu4jdhv+F
 RaILW/wXUcwNLpyGKvQHl3wLJ/JmtvBwKLEJjTUFR53QYJl2syroUcZkA
 fnldb0GCkom3ENB1I5OoF7YVVUzzlrG8Q8s/cV7CcAVOQ95JdWthK6qR1 g==;
X-CSE-ConnectionGUID: faxqLHpYSlWcBd/GxSFT0A==
X-CSE-MsgGUID: tfGhwHP+TE6e09QmVpQhQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25687501"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="25687501"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 05:05:21 -0700
X-CSE-ConnectionGUID: W6ehUwY7QaCeOJPoLmMj1A==
X-CSE-MsgGUID: UfcFwUJ1TCOoLdWoB55ymA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="69634431"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 18 Sep 2024 05:05:19 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Sep 2024 15:05:18 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 00/18] Intel CCS + 10bpc/fp16 stuff
Date: Wed, 18 Sep 2024 15:05:00 +0300
Message-ID: <20240918120518.30258-1-ville.syrjala@linux.intel.com>
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

Mostly a repost of the reamining patches from the earlier series,
with a bit more detail in some commit messages/etc.

Couple of real changes:
- try to semi-fix the xe2 ccs blit code in kms_ccs
  (hopefully enough to get this past ci)
- skip the redundant AUX surface setup for TGL+ in rendercopy
- use a more optimal format for 10bpc in the aux page tables
- bail immediately if someone tries to use 10bpc with VEBOX
  since the hardware doesn't like it

Melanie Lobo (1):
  lib/intel_aux_pgtable: Library to add support for RGB16161616_64B
    format

Ville Syrjälä (17):
  lib/rendercopy: Add specific support for 2:10:10:10 formats
  lib/rendercopy: Use the proper compression format for 10bpc on
    dg2/lnl+
  lib/rendercopy: Use the proper compression format for 16bpc on
    dg2/lnl+
  lib/rendercopy: Skip AUX surface setup in TGL+
  lib/igt_fb: Add 10bpc compression format for the blitter
  lib/igt_fb: Add 16bpc compression format for the blitter
  lib/igt_fb: Try to fix block copy media compression handling
  tests/kms_plane: Skip 10bpc formats with media compression
  tests/kms_ccs: Skip 10bpc formats with media compression
  lib/igt_fb: Treat 2:10:10:10 properly
  lib/vebox: Add support for fp16 RGB formats
  lib/vebox: Document that 2:10:10:10 is unusable with VEBOX
  tests/kms_ccs: Correctly check clear color for 10bpc formats
  tests/kms_ccs: Correctly check clear color for fp16 formats
  tests/kms_ccs: Fix planar blits for xe2
  tests/kms_ccs: Try to fix the xe2 blitter compression format
  lib/intel_aux_pgtable: Pick a more optimal aux format for 10bpc

 lib/igt_fb.c            | 40 ++++++++++++++-----
 lib/intel_aux_pgtable.c | 11 +++++-
 lib/intel_bufops.h      |  2 +-
 lib/rendercopy_gen4.c   |  2 +-
 lib/rendercopy_gen6.c   |  2 +-
 lib/rendercopy_gen7.c   |  2 +-
 lib/rendercopy_gen8.c   |  2 +-
 lib/rendercopy_gen9.c   | 19 ++++++---
 lib/surfaceformat.h     |  8 +++-
 lib/veboxcopy_gen12.c   | 20 +++++++++-
 tests/intel/kms_ccs.c   | 87 +++++++++++++++++++++++++++++------------
 tests/kms_plane.c       |  5 +++
 12 files changed, 151 insertions(+), 49 deletions(-)

-- 
2.44.2

