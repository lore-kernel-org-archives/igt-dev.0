Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12C0C48286
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 20:03:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D7210EC15;
	Thu,  1 Feb 2024 20:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G47idU6C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8AB010EC2E
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 20:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706817801; x=1738353801;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yDHJjNVeMvQ7dM70mSIWNp3JZlUDzvIUX1KvYIva964=;
 b=G47idU6C/TncPahk7s4ccwvBZjhiVRh1icyHu1Cyp0EyIbUHGcs06CMh
 BNLh/RGSdSZ5O0om6OX8HyJ43L1svMZP+iQJn+fvRTyucAMG/RTZQ/pZB
 USNKJ+/w1oSI8NL5cKdww/3sTjvNMJX8jzxTuY5JLSb1IQlVzhZKU5wg9
 +AgSHGxxP0Q6G4WIDCQIHsOnnLvKkt0jCwez0cfqmDwEXPqjg4ehKRTOv
 k0GtRdXjfSdMLNrzmwX6JvHKJpmYpVmhLQUx63/qxhj7iRAtU3MUd3PTX
 keMZiFZMtp6rwqxen/WSUBjqAYdscHvyQ64HIXZH0WrncB4/+SgVF8XPP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="3855400"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="3855400"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 12:03:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="30690591"
Received: from unknown (HELO localhost) ([10.245.85.128])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 12:03:19 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v5 0/5] Fill block-copy test gap for unaligned sizes
Date: Thu,  1 Feb 2024 21:03:07 +0100
Message-Id: <20240201200312.428474-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
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

Using 512x512 resolution for testing is too optimistic and hides intel_blt
limitation for using different (smaller) resolutions which also might
not be aligned to expected stride and height.

Address this by adding few helpers, change blt buffer creation size
calculation and add "increment" version of the test in xe_ccs.

v2: fix handling Tile64 what also requires bpp in dumping to
    png as helper for aligned height depend on it
v3: fix xmajor stride + make helpers public
v4: use original width/height on filename write to png,
    extend fast-copy with different sizes test
v5: address review comments (Karolina)

Zbigniew Kempczyński (5):
  lib/intel_blt: Add helpers for calculating stride and aligned height
  lib/intel_blt: Change surface size calculation
  lib/intel_blt: Use object pitch and aligned height on png write
  tests/xe-ccs: Add tests which exercise small to large blit sizes
  tests/xe_exercise_blt: Exercise small to large fast-copy blits

 lib/intel_blt.c                |  90 +++++++++++++++++-
 lib/intel_blt.h                |   6 +-
 tests/intel/gem_ccs.c          |  23 ++---
 tests/intel/gem_exercise_blt.c |  16 ++--
 tests/intel/xe_ccs.c           | 166 ++++++++++++++++++++++++---------
 tests/intel/xe_exercise_blt.c  |  78 ++++++++++++----
 6 files changed, 292 insertions(+), 87 deletions(-)

-- 
2.34.1

