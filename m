Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B757CE65D34
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 08:48:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F6610EAF5;
	Fri, 22 Nov 2024 08:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="efLqkPxV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7AB110EAF5
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 08:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732265287; x=1763801287;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=omOiS2vhThFwxbq7NebsKboic6EHQ+PWtIqLSTlTrY8=;
 b=efLqkPxV7MP0ykoCT2V+Exo7XrOqx98iBWRm7UC8MA1hX1dGvWmEot3w
 WYXixABSOTxx6JSyRNofFW6687Vpee4drHmqVt/S1Mla0xE88wv/ONTWb
 taPbNozTINgALofE4K2Rvf6zviascnnmxHy5A0rGeXyCWWmmO1XuCR2a3
 nePzXjnVCFNW03zioUOvT55yBWOPxhTpxGvQ2i8fA24DFXygawMHIoUZB
 uhunbsnnAh9dHUn4lgnz0mPUDn96FlKnUp7QJhd5rTkYVlavCYfF+BPyk
 Q6zHyR18vDkBV2fERyeEbuAHheghJXvFbdd+Urowpgm/ZQx445t27gbz+ Q==;
X-CSE-ConnectionGUID: hoNITb9/TqWlbTB8FGqTfA==
X-CSE-MsgGUID: YbC7XH8LRNmMAQ7JnRua0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="20004051"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="20004051"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 00:48:07 -0800
X-CSE-ConnectionGUID: 08pgbUWPSZOa9D5Lz95ZVQ==
X-CSE-MsgGUID: ELlH47j5TQ6sv6HwlVNefQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="90679372"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 22 Nov 2024 00:48:05 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Nov 2024 10:48:04 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 0/4] intel: igt_draw and intel_bufops improvements
Date: Fri, 22 Nov 2024 10:48:00 +0200
Message-ID: <20241122084804.29669-1-ville.syrjala@linux.intel.com>
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

Remainder of the earlier bigger igt_draw/bufops stuff:
- hook in all gen2/gen3 tile layouts
- pread/pwrite fallback in intel_bufops for !WC systems
- new gem_draw test to validate igt_draw mmap cpu/wc and pwrite
  support w/o display limitations getting in the way

Ville Syrjälä (4):
  lib/intel_bufops: Add support for gen2 and i915 tiling layouts
  lib/intel_bufops: Provide pread/pwrite based fallback when we don't
    have WC
  tests/kms_draw_crc: Test 64bpp
  tests/intel/gem_draw: Test igt_draw without kms

 lib/intel_bufops.c         | 151 +++++++++++++++++-------
 tests/intel/gem_draw.c     | 233 +++++++++++++++++++++++++++++++++++++
 tests/intel/kms_draw_crc.c |  19 ++-
 tests/meson.build          |   1 +
 4 files changed, 363 insertions(+), 41 deletions(-)
 create mode 100644 tests/intel/gem_draw.c

-- 
2.45.2

