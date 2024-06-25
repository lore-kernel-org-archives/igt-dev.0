Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825CAC2BBCA
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 17:40:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA64510E002;
	Tue, 25 Jun 2024 17:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CNRAit3T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B6A10E002
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 17:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719337236; x=1750873236;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QS8/4nxdJ231f6Rt06pxROgMcaI4D75sTi0FEw9VTbU=;
 b=CNRAit3TrA5pNE//fisojnGb8YcIDNPFhzP2OBoyuCpxa80wg5Q+WljA
 KyVtBy9SBYpRbFMTuVLevuxDXcoW2/A1j+iTDiObxfcaJBOyn1Kw8nVxF
 wrm0ACbsh1JKnYrHZuu2l5eN2lRMQxY4dHLbPNMSwRUAha9hoiB6mKV0j
 ztkLO1V/oCeiPMwV0Xni0ZD9YGymtaO070Q1lt0l/oOMJgKX0YO0fRJ1A
 4s6Fb96IpuZy5o+oghCjqtq+WxJ/x7FVbwhHNLpfuk06AJVEGgAJmYFOW
 d65GnC7J/VeMb9VxdOxG/WRk3bTS+k0uMB4QecPYGI4gtc9chtbIn98uv g==;
X-CSE-ConnectionGUID: b9zXmeGNQXGzpOFpZmTK3Q==
X-CSE-MsgGUID: JkX5U6eYSyGBQR8MuJFbzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="20184353"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="20184353"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 10:40:35 -0700
X-CSE-ConnectionGUID: /ecy2gGjSJKqyotjn/UVTQ==
X-CSE-MsgGUID: izvSX3YASxa/P7rES52QEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="43701206"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 25 Jun 2024 10:40:33 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 25 Jun 2024 20:40:32 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/6] lib: igt_fb/rendercopy fixes/cleanups
Date: Tue, 25 Jun 2024 20:40:26 +0300
Message-ID: <20240625174032.10398-1-ville.syrjala@linux.intel.com>
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

A few fixes and cleanups to igt_fb and rendercopy. Carved out
from my larger "make kms_big_fb test planar/ccs formats" set
(which I'll need to revisit at some point).

Ville Syrjälä (6):
  lib/rendercopy: Add deltas to all surface relocs
  tests/kms_big_fb: Use igt_fb_create_intel_buf()
  tests/kms_frontbuffer_tracking: Use igt_create_fb()
  lib/igt_fb: Make igt_calc_fb_size() somewhat usable
  lib/rendercopy: Always setup clear color for TGL
  lib/rendercopy: Enable clear color consistently

 lib/igt_fb.c                           | 74 +++++++++++++-------------
 lib/igt_fb.h                           |  3 +-
 lib/intel_bufops.h                     |  1 +
 lib/rendercopy_gen4.c                  | 11 ++--
 lib/rendercopy_gen6.c                  | 11 ++--
 lib/rendercopy_gen7.c                  | 11 ++--
 lib/rendercopy_gen8.c                  | 13 ++---
 lib/rendercopy_gen9.c                  | 37 +++++++++----
 lib/rendercopy_i830.c                  | 10 ++--
 lib/rendercopy_i915.c                  |  6 ++-
 tests/intel/gem_pxp.c                  |  4 +-
 tests/intel/kms_big_fb.c               | 64 +++++++---------------
 tests/intel/kms_frontbuffer_tracking.c | 11 +---
 tests/kms_addfb_basic.c                | 14 ++---
 tests/kms_prime.c                      | 12 ++++-
 tests/kms_rotation_crc.c               | 10 ++--
 16 files changed, 147 insertions(+), 145 deletions(-)

-- 
2.44.2

