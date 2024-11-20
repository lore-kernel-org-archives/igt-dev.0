Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7EDD6392B
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 11:00:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDFDB10E701;
	Wed, 20 Nov 2024 11:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Se6PyMv4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E7110E701
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 11:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732100433; x=1763636433;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/hP6UKqgUUEBsFaIzifmzKRqOkIEc0b/AvMBDotn50A=;
 b=Se6PyMv4ijjMtnPid2RaBd3hSHLKLsG4DEqlpAO2s6sR5qZi8l75TYUD
 os+MPexFGkLpumzGnlb37bKLBfMMWJohgnVdhZdie8OqmdTK8+mW6kMog
 uKvVo0JqyFLjx/4blCUtHaUwsRxG66gZFXVV5NRtrA15KbAYfrFVOYmS2
 xE0+qCsADCG8O/SH8ZsM2q2h9QWJ7KCYCMwmxX1QqqkOCCJ+jOTxuJ/D0
 90ey8y9arMEMcyEQKBE4JRc9/JxCtJ7nv29u2XUTPdxwyM8ld3BLv1ar9
 rCYQOfG8OOonh4rlNQgXXuPiho3LH/mx372DR3kfD+KUPSdn8BnjY0+Fe g==;
X-CSE-ConnectionGUID: /1Y4JecST9yPbz+ZLLG7Zg==
X-CSE-MsgGUID: 0YPdzg2GSDm/nu2IdHf3Lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="32081907"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="32081907"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 03:00:33 -0800
X-CSE-ConnectionGUID: ypr4JfhzQ9ufUA2g4K4BiQ==
X-CSE-MsgGUID: NXU/iMVNRGmU0L/Qd4Ywyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="94334610"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 03:00:31 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t 1/3] tests/intel/kms_fbt: Drop invalid tests
Date: Wed, 20 Nov 2024 16:19:38 +0530
Message-ID: <20241120104940.2147075-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241120104940.2147075-1-bhanuprakash.modem@intel.com>
References: <20241120104940.2147075-1-bhanuprakash.modem@intel.com>
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

As we can't test PSR & DRRS together, drop the tests those
are with this invalid combo. Also, no need to maintain
blocklists to keep the CI smooth.

This patch will simply drops below tests:
 - igt@kms_frontbuffer_tracking@(fbcpsrdrrs|psrdrrs).*

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 255 +------------------------
 1 file changed, 7 insertions(+), 248 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index f149be3da..e41ee0a80 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -81,14 +81,6 @@
  * Description: Sanity test to enable FBC & PSR with %arg[1] panels.
  * Functionality: fbc, fbt, psr1
  *
- * SUBTEST: psrdrrs-%dp-rte
- * Description: Sanity test to enable PSR & DRRS with %arg[1] panels.
- * Functionality: fbt, drrs, psr1
- *
- * SUBTEST: fbcpsrdrrs-%dp-rte
- * Description: Sanity test to enable FBC, PSR & DRRS with %arg[1] panels.
- * Functionality: fbc, fbt, drrs, psr1
- *
  * arg[1].values:   1, 2
  */
 
@@ -113,14 +105,6 @@
  * Description: Draw a set of rectangles on the screen using the provided method
  * Functionality: fbc, fbt, kms_core, psr1
  *
- * SUBTEST: psrdrrs-1p-offscren-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Functionality: drrs, fbt, kms_core, psr1
- *
- * SUBTEST: fbcpsrdrrs-1p-offscren-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Functionality: drrs, fbc, fbt, kms_core, psr1
- *
  * arg[1]:
  *
  * @indfb:          Individual fb
@@ -159,16 +143,6 @@
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core, psr1
  *
- * SUBTEST: psrdrrs-1p-offscren-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: drrs, fbt, kms_core, psr1
- *
- * SUBTEST: fbcpsrdrrs-1p-offscren-pri-%s-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: drrs, fbc, fbt, kms_core, psr1
- *
  * arg[1]:
  *
  * @indfb:          Individual fb
@@ -207,16 +181,6 @@
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core, psr1
  *
- * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: drrs, fbt, kms_core, psr1
- *
- * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: drrs, fbc, fbt, kms_core, psr1
- *
  * arg[1].values:   1, 2
  *
  * arg[2]:
@@ -253,14 +217,6 @@
  * Description: Draw a set of rectangles on the screen using the provided method
  * Functionality: fbc, fbt, kms_core, psr1
  *
- * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Functionality: drrs, fbt, kms_core, psr1
- *
- * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Functionality: drrs, fbc, fbt, kms_core, psr1
- *
  * arg[1].values:   1, 2
  *
  * arg[2]:
@@ -297,14 +253,6 @@
  * Description: Draw a set of rectangles on the screen using the provided method
  * Functionality: fbc, fbt, kms_core, psr1
  *
- * SUBTEST: psrdrrs-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Functionality: drrs, fbt, kms_core, psr1
- *
- * SUBTEST: fbcpsrdrrs-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Functionality: drrs, fbc, fbt, kms_core, psr1
- *
  * arg[1].values:   1, 2
  *
  * arg[2]:
@@ -340,16 +288,6 @@
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core, psr1
  *
- * SUBTEST: psrdrrs-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: drrs, fbt, kms_core, psr1
- *
- * SUBTEST: fbcpsrdrrs-%dp-primscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: drrs, fbc, fbt, kms_core, psr1
- *
  * arg[1].values:   1, 2
  *
  * arg[2]:
@@ -380,14 +318,6 @@
  * Description: Draw a set of rectangles on the screen using the provided method
  * Functionality: fbc, fbt, kms_core, psr1
  *
- * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Functionality: drrs, fbt, kms_core, psr1
- *
- * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Functionality: drrs, fbc, fbt, kms_core, psr1
- *
  * arg[1]:
  *
  * @cur:            Cursor plane
@@ -427,16 +357,6 @@
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core, psr1
  *
- * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: drrs, fbt, kms_core, psr1
- *
- * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: drrs, fbc, fbt, kms_core, psr1
- *
  * arg[1]:
  *
  * @cur:            Cursor plane
@@ -471,14 +391,6 @@
  * Description: Draw a set of rectangles on the screen using the provided method
  * Functionality: fbc, fbt, kms_core, psr1
  *
- * SUBTEST: psrdrrs-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Functionality: drrs, fbt, kms_core, psr1
- *
- * SUBTEST: fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Functionality: drrs, fbc, fbt, kms_core, psr1
- *
  * arg[1]:
  *
  * @blt:            Blitter
@@ -512,16 +424,6 @@
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core, psr1
  *
- * SUBTEST: psrdrrs-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: drrs, fbt, kms_core, psr1
- *
- * SUBTEST: fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-%s
- * Description: Draw a set of rectangles on the screen using the provided method
- * Driver requirement: i915
- * Functionality: drrs, fbc, fbt, kms_core, psr1
- *
  * arg[1]:
  *
  * @mmap-cpu:       MMAP-CPU
@@ -550,14 +452,6 @@
  * Description: Draw a set of rectangles on the screen using alternated drawing methods
  * Functionality: fbc, fbt, kms_core, psr1
  *
- * SUBTEST: psrdrrs-%dp-pri-indfb-multidraw
- * Description: Draw a set of rectangles on the screen using alternated drawing methods
- * Functionality: drrs, fbt, kms_core, psr1
- *
- * SUBTEST: fbcpsrdrrs-%dp-pri-indfb-multidraw
- * Description: Draw a set of rectangles on the screen using alternated drawing methods
- * Functionality: drrs, fbc, fbt, kms_core, psr1
- *
  * arg[1].values:   1, 2
  */
 
@@ -582,14 +476,6 @@
  * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
  * Functionality: fbc, fbt, kms_core, psr1
  *
- * SUBTEST: psrdrrs-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Functionality: drrs, fbt, kms_core, psr1
- *
- * SUBTEST: fbcpsrdrrs-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Functionality: drrs, fbc, fbt, kms_core, psr1
- *
  * arg[1]:
  *
  * @rgb101010:      FORMAT_RGB101010
@@ -628,16 +514,6 @@
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core, psr1
  *
- * SUBTEST: psrdrrs-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915
- * Functionality: drrs, fbt, kms_core, psr1
- *
- * SUBTEST: fbcpsrdrrs-%s-draw-%s
- * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
- * Driver requirement: i915
- * Functionality: drrs, fbc, fbt, kms_core, psr1
- *
  * arg[1]:
  *
  * @rgb101010:      FORMAT_RGB101010
@@ -666,14 +542,6 @@
  * SUBTEST: fbcpsr-slowdraw
  * Description: Sleep a little bit between drawing operations with FBC & PSR
  * Functionality: fbc, fbt, kms_core, psr1
- *
- * SUBTEST: psrdrrs-slowdraw
- * Description: Sleep a little bit between drawing operations with PSR & DRRS
- * Functionality: drrs, fbt, kms_core, psr1
- *
- * SUBTEST: fbcpsrdrrs-slowdraw
- * Description: Sleep a little bit between drawing operations with FBC, PSR & DRRS
- * Functionality: drrs, fbc, fbt, kms_core, psr1
  */
 
 /**
@@ -697,14 +565,6 @@
  * Description: Just exercise page flips with the patterns we have
  * Functionality: fbc, fbt, kms_core, psr1
  *
- * SUBTEST: psrdrrs-%dp-primscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- * Functionality: drrs, fbt, kms_core, psr1
- *
- * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- * Functionality: drrs, fbc, fbt, kms_core, psr1
- *
  * arg[1].values:   1, 2
  *
  * arg[2]:
@@ -740,14 +600,6 @@
  * Description: Just exercise page flips with the patterns we have
  * Functionality: fbc, fbt, kms_core, psr1
  *
- * SUBTEST: psrdrrs-2p-scndscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- * Functionality: drrs, fbt, kms_core, psr1
- *
- * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-%sflip-blt
- * Description: Just exercise page flips with the patterns we have
- * Functionality: drrs, fbc, fbt, kms_core, psr1
- *
  * arg[1]:
  *
  * @indfb:          Individual fb
@@ -776,11 +628,6 @@
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core, psr1
  *
- * SUBTEST: fbcpsrdrrs-%dp-%s-fliptrack-mmap-gtt
- * Description: Check if the hardware tracking works after page flips
- * Driver requirement: i915
- * Functionality: drrs, fbc, fbt, kms_core, psr1
- *
  * arg[1].values:   1, 2
  *
  * arg[2]:
@@ -810,14 +657,6 @@
  * Description: Just move the %arg[2] around
  * Functionality: fbc, fbt, psr1
  *
- * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-move
- * Description: Just move the %arg[2] around
- * Functionality: drrs, fbt, psr1
- *
- * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-move
- * Description: Just move the %arg[2] around
- * Functionality: drrs, fbc, fbt, psr1
- *
  * arg[1].values:   1, 2
  *
  * arg[2]:
@@ -847,14 +686,6 @@
  * Description: Just move the %arg[1] around
  * Functionality: fbc, fbt, psr1
  *
- * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-move
- * Description: Just move the %arg[1] around
- * Functionality: drrs, fbt, psr1
- *
- * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-move
- * Description: Just move the %arg[1] around
- * Functionality: drrs, fbc, fbt, psr1
- *
  * arg[1]:
  *
  * @spr:            Sprite plane
@@ -882,14 +713,6 @@
  * Description: Just enable and disable the %arg[2] a few times
  * Functionality: fbc, fbt, psr1
  *
- * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[2] a few times
- * Functionality: drrs, fbt, psr1
- *
- * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[2] a few times
- * Functionality: drrs, fbc, fbt, psr1
- *
  * arg[1].values:   1, 2
  *
  * arg[2]:
@@ -919,14 +742,6 @@
  * Description: Just enable and disable the %arg[1] a few times
  * Functionality: fbc, fbt, psr1
  *
- * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[1] a few times
- * Functionality: drrs, fbt, psr1
- *
- * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-onoff
- * Description: Just enable and disable the %arg[1] a few times
- * Functionality: drrs, fbc, fbt, psr1
- *
  * arg[1]:
  *
  * @spr:            Sprite plane
@@ -954,14 +769,6 @@
  * Description: Put a fullscreen plane covering the whole screen
  * Functionality: fbc, fbt, psr1
  *
- * SUBTEST: psrdrrs-%dp-primscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- * Functionality: drrs, fbt, psr1
- *
- * SUBTEST: fbcpsrdrrs-%dp-primscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- * Functionality: drrs, fbc, fbt, psr1
- *
  * SUBTEST: drrs-2p-scndscrn-spr-indfb-fullscreen
  * Description: Put a fullscreen plane covering the whole screen
  * Functionality: drrs, fbt
@@ -982,14 +789,6 @@
  * Description: Put a fullscreen plane covering the whole screen
  * Functionality: fbc, fbt, psr1
  *
- * SUBTEST: psrdrrs-2p-scndscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- * Functionality: drrs, fbt, psr1
- *
- * SUBTEST: fbcpsrdrrs-2p-scndscrn-spr-indfb-fullscreen
- * Description: Put a fullscreen plane covering the whole screen
- * Functionality: drrs, fbc, fbt, psr1
- *
  * arg[1].values:   1, 2
  */
 
@@ -1014,14 +813,6 @@
  * Description: Try different primary plane scaling strategies
  * Functionality: fbc, fbt, psr1, scaling
  *
- * SUBTEST: psrdrrs-%s-scaledprimary
- * Description: Try different primary plane scaling strategies
- * Functionality: drrs, fbt, psr1, scaling
- *
- * SUBTEST: fbcpsrdrrs-%s-scaledprimary
- * Description: Try different primary plane scaling strategies
- * Functionality: drrs, fbc, fbt, psr1, scaling
- *
  * arg[1]:
  *
  * @indfb:          Individual fb
@@ -1048,14 +839,6 @@
  * SUBTEST: fbcpsr-modesetfrombusy
  * Description: Modeset from a busy buffer to a non-busy buffer with FBC & PSR
  * Functionality: fbc, fbt, psr1, scaling
- *
- * SUBTEST: psrdrrs-modesetfrombusy
- * Description: Modeset from a busy buffer to a non-busy buffer with PSR & DRRS
- * Functionality: drrs, fbt, psr1, scaling
- *
- * SUBTEST: fbcpsrdrrs-modesetfrombusy
- * Description: Modeset from a busy buffer to a non-busy buffer with FBC, PSR & DRRS
- * Functionality: drrs, fbc, fbt, psr1, scaling
  */
 
 /**
@@ -1078,14 +861,6 @@
  * SUBTEST: fbcpsr-suspend
  * Description: Make sure suspend/resume keeps us on the same state of FBC & PSR
  * Functionality: fbc, fbt, psr1, suspend
- *
- * SUBTEST: psrdrrs-suspend
- * Description: Make sure suspend/resume keeps us on the same state of PSR & DRRS
- * Functionality: drrs, fbt, psr1, suspend
- *
- * SUBTEST: fbcpsrdrrs-suspend
- * Description: Make sure suspend/resume keeps us on the same state of FBC, PSR & DRRS
- * Functionality: drrs, fbc, fbt, psr1, suspend
  */
 
 /**
@@ -1113,16 +888,6 @@
  * Description: Test drawing as far from the fence start as possible
  * Driver requirement: i915
  * Functionality: fbc, fbt, kms_core, psr1
- *
- * SUBTEST: psrdrrs-farfromfence-mmap-gtt
- * Description: Test drawing as far from the fence start as possible
- * Driver requirement: i915
- * Functionality: drrs, fbt, kms_core, psr1
- *
- * SUBTEST: fbcpsrdrrs-farfromfence-mmap-gtt
- * Description: Test drawing as far from the fence start as possible
- * Driver requirement: i915
- * Functionality: drrs, fbc, fbt, kms_core, psr1
  */
 
 /**
@@ -1137,10 +902,6 @@
  * SUBTEST: fbcpsr-stridechange
  * Description: Change the frontbuffer stride by doing a modeset
  * Functionality: fbc, fbt, psr1
- *
- * SUBTEST: fbcpsrdrrs-stridechange
- * Description: Change the frontbuffer stride by doing a modeset
- * Functionality: drrs, fbc, fbt, psr1
  */
 
 /**
@@ -1159,11 +920,6 @@
  *              basic drawing test, else set the mode & test if FBC is disabled
  * Functionality: fbc, fbt, psr1, tiling
  *
- * SUBTEST: fbcpsrdrrs-tiling-%s
- * Description: Test %arg[1] formats, if the tiling format supports FBC do the
- *              basic drawing test, else set the mode & test if FBC is disabled
- * Functionality: drrs, fbc, fbt, psr1, tiling
- *
  * arg[1]:
  *
  * @4:              4 tiling
@@ -4369,10 +4125,6 @@ static const char *feature_str(int feature)
 		return "drrs";
 	case FEATURE_FBC | FEATURE_DRRS:
 		return "fbcdrrs";
-	case FEATURE_PSR | FEATURE_DRRS:
-		return "psrdrrs";
-	case FEATURE_FBC | FEATURE_PSR | FEATURE_DRRS:
-		return "fbcpsrdrrs";
 	default:
 		igt_assert(false);
 	}
@@ -4441,6 +4193,8 @@ static const char *tiling_str(enum tiling_type tiling)
 			continue;					   \
 		if (!opt.show_hidden && t.feature == FEATURE_NONE)	   \
 			continue;					   \
+		if ((t.feature & FEATURE_PSR) && (t.feature & FEATURE_DRRS))\
+			continue;					   \
 		if (!opt.show_hidden && t.fbs == FBS_SHARED &&		   \
 		    (t.plane == PLANE_CUR || t.plane == PLANE_SPR))	   \
 			continue;
@@ -4480,6 +4234,11 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	for (t.feature = 0; t.feature < FEATURE_COUNT; t.feature++) {
 		if (!opt.show_hidden && t.feature == FEATURE_NONE)
 			continue;
+
+		/* PSR + DRRS is not a valid combo. */
+		if ((t.feature & FEATURE_PSR) && (t.feature & FEATURE_DRRS))
+			continue;
+
 		for (t.pipes = 0; t.pipes < PIPE_COUNT; t.pipes++) {
 			t.screen = SCREEN_PRIM;
 			t.plane = PLANE_PRI;
-- 
2.43.0

