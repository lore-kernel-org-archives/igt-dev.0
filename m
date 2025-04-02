Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDD6C28B20
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 15:23:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6402110E80E;
	Wed,  2 Apr 2025 15:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ezXim3fo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ADA610E80D
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 15:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743607399; x=1775143399;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PA3X3s9CpDi7PoimAJW+Br4AqD9HNH+zpLEJziG3rkw=;
 b=ezXim3foBM9C4XfZkjzutwLglvL+DrRqUPP8V6PyXWXcrP0+Ca7pL30g
 u0Xb/AS/WWPErKCUfq3KPUb+dkgUlES6AC2j8ukLslccZJSqqmTabHZww
 WDsQKFySvsjzaDt+1t72CDfpxbnwBF66RTGiN40dMGw4dabzGDIuOpTE7
 XVo1LXTde3oaTRFigDfv/FOfcLJ1vMt00R6Ka7jYA+gjEpo4r+LZAZmkj
 m2SiQYLbsWCvoaZD3XI/4pyU2C4vjDgKIuz4Mt6W/F5ou9BSy4RuE+LgR
 N6tWnn/NiVCTRu0I0/+w2rVBUdHJsA7XR3PnEXcP5lhCgS78idDy0prhR w==;
X-CSE-ConnectionGUID: wSx+ALmTT+2fm0L+r8wT1g==
X-CSE-MsgGUID: +umlelA7QpCqoNWsJPWlgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44885855"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="44885855"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 08:23:17 -0700
X-CSE-ConnectionGUID: rl3+znw1SJiSaI8/8x9Kmg==
X-CSE-MsgGUID: /xS6b5n0QKaRQjkOXtvvrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="131717714"
Received: from carterle-desk.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.81])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 08:23:15 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,
 v2 00/11] Prepare lib/intel_compute for SVM/system allocator, part 2
Date: Wed,  2 Apr 2025 17:19:58 +0200
Message-ID: <20250402152256.173562-1-francois.dugast@intel.com>
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

This series contains more cleanup and preparation work to make IGT
compute usable with the SVM/system allocator, which has been merged
into XeKMD. It is a follow-up of [1].

The first 6 patches should not introduce functional changes. Some small
changes are intentionally not squashed in order to make review easier.

v2: Rebase, rework patch 0009 to prevent introducing a bug for DG2,
    extend use of local size constants to all indirect data

[1] https://patchwork.freedesktop.org/series/144360/

Francois Dugast (11):
  lib/intel_compute: Use common constant for surface state size
  lib/intel_compute: Use common constant for dynamic state size
  lib/intel_compute: Use common constant for indirect object size
  lib/intel_compute: Use common constant for binding table size
  lib/intel_compute: Use common constant for general state size
  lib/intel_compute: Use constant for binding table address
  lib/intel_compute: Compact memory map
  lib/intel_compute: Relocate input and output objects
  lib/intel_compute: Fix enqueued local size starting with xelpg
  lib/intel_compute: Use constants for thread groups and local work size
  lib/intel_compute: Make array size a dynamic parameter

 lib/intel_compute.c | 318 +++++++++++++++++++++++++++-----------------
 lib/intel_compute.h |   2 +
 2 files changed, 201 insertions(+), 119 deletions(-)

-- 
2.43.0

