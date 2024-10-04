Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391F1CFA765
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 10:41:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF3210E289;
	Fri,  4 Oct 2024 10:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l71dCwON";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9361810E27D
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Oct 2024 10:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728038490; x=1759574490;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vm5oDx3L3GW9a9hihc3Vf7u/tlI8nLgld9YEnBderl8=;
 b=l71dCwONg8OWbDlHp7RV1ceMOUoRdP098bl/PUpci1x6T+Sa9OfpW9Wn
 VGYpvNa6Rfu1XB/wVkoxHCO+v3R2UFY6QB8YF2wF2wzMeYqHWg4BdisIJ
 r+/6fbgr/60dw1jaKiIM2B6loUl+doelAoAUdzQvnfSWO+nOt/u52iUe+
 pe8D3AZQmZisxPk2mtSLz7E43hOOaP+bbkoVlMsyxD8WWzpgWCcrYCTyt
 /p3EMHAwxfQETI1cRh1KkLzqNrgZ1rkyRlfHJO3WxbkTTnftaPvo4FHmH
 2mNefqVAdv7ITfJ4awO5TKxHAmnRLcn30P65hcGWh15yxR+pz2A2arHan g==;
X-CSE-ConnectionGUID: xhwTFRyQSGSN3CEDLfm4/A==
X-CSE-MsgGUID: B3r22Z5JQiGQCGr4enf2qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="31140462"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="31140462"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 03:41:25 -0700
X-CSE-ConnectionGUID: kJkol/83Rl6JAS51FInqeQ==
X-CSE-MsgGUID: Uh75xnKaShWGTUhnet36UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="74778245"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 04 Oct 2024 03:41:22 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Oct 2024 13:41:21 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 00/14] intel: igt_draw and intel_bufops improvements
Date: Fri,  4 Oct 2024 13:41:07 +0300
Message-ID: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
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

Bunch of improvements to igt_draw and intel_bufops:
- full 8bpp and 64bpp support
- hook in all gen2/gen3 tile layouts
- pread/pwrite fallback in intel_bufops for !WC systems
- new gem_draw test to validate igt_draw mmap cpu/wc and pwrite
  support w/o display limitations getting in the way

Ville Syrjälä (14):
  lib/igt_draw: Use void* where appopriate
  lib/igt_draw: Extend the API to support 64bpp colors
  lib/igt_draw: Support 64bpp int the mmap/pwrite paths
  lib/igt_draw: Support 8bpp int the mmap/pwrite paths
  lib/igt_draw: Use function pointers for the linear<->tiled conversion
  lib/igt_draw: Add support for gen2 and i915 tiling layouts
  lib/igt_draw: Add 64bpp support to the XY_FAST_COLOR_BLT path
  lib/igt_draw: Add 64bpp support for the non-XY_FAST_COLOR_BLT path
  lib/intel_bufops: Add support for gen2 and i915 tiling layouts
  lib/intel_bufops: Provide pread/pwrite based fallback when we don't
    have WC
  lib/rendercopy: Use igt_require() to validate gen2/3 surface size
  tests/kms_draw_crc: Test 64bpp
  lib/igt_aux: Add igt_ror() and igt_rol()
  tests/gem_draw: Test igt_draw without kms

 lib/igt_aux.h              |   7 +
 lib/igt_draw.c             | 266 ++++++++++++++++++++++++++-----------
 lib/igt_draw.h             |   6 +-
 lib/intel_bufops.c         | 151 +++++++++++++++------
 lib/intel_reg.h            |   2 +
 lib/rendercopy_i830.c      |   8 +-
 lib/rendercopy_i915.c      |   8 +-
 tests/intel/gem_draw.c     | 235 ++++++++++++++++++++++++++++++++
 tests/intel/kms_draw_crc.c |  19 ++-
 tests/meson.build          |   1 +
 10 files changed, 574 insertions(+), 129 deletions(-)
 create mode 100644 tests/intel/gem_draw.c

-- 
2.45.2

