Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D350CCA470
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 09:25:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4ADC10E7B7;
	Wed,  8 Oct 2025 09:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J0Ci6/PY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429E210E7B7
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 09:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759915541; x=1791451541;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Qs4s3VHIpapJWrG167TJlbXfdItkf9mzMH1IOqlfToI=;
 b=J0Ci6/PYgvKLWIQt9X3inEKz2BHNilHEKqQ9drBi7Hnc0/4Zonk7lS56
 SCiyl2dXE1rqmK2Uh3tP1ngwO6qrIHRbj7uGKNKQsyv9raQVI17P/4Z5O
 fWlPvGYz5Ac5chO7A4Hwe0voShoanbyNjJIi2AfQWNOFY0FO5Xd2R1JxS
 z4Xv/q5Wy1z5oMZvtSTONdtwykEE7iVD1lG+Dgo5NKj/1aDba67/TkST2
 B4+McDKO/LjrKNhZoStd0vA050yAzFwUdioncG7jINDkrNARtiVwIPIOj
 Be2hfdk7yZj0wTZohShz1XtIau5vBsC1ZIezB2xu6D7m3xJdTSFu4gIiC g==;
X-CSE-ConnectionGUID: mpXARIB4Rx2ooB1jMivu1A==
X-CSE-MsgGUID: QeYB0JZDTZ6IvHQBfgJsCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="73207333"
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="73207333"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 02:25:41 -0700
X-CSE-ConnectionGUID: ePTJnK1HR0KA1lO5jstsIw==
X-CSE-MsgGUID: CRV2kdOARWueVuQoSvRB2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="180812617"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2025 02:25:39 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Fix typo
Date: Wed,  8 Oct 2025 14:55:30 +0530
Message-ID: <20251008092530.1537245-1-jeevan.b@intel.com>
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

fix typo : %s/offscren/offscreen

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index a29da1d43..03428b373 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -76,19 +76,19 @@
  */
 
 /**
- * SUBTEST: drrs-1p-offscren-pri-%s-draw-%s
+ * SUBTEST: drrs-1p-offscreen-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  *
- * SUBTEST: fbc-1p-offscren-pri-%s-draw-%s
+ * SUBTEST: fbc-1p-offscreen-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  *
- * SUBTEST: psr-1p-offscren-pri-%s-draw-%s
+ * SUBTEST: psr-1p-offscreen-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  *
- * SUBTEST: fbcdrrs-1p-offscren-pri-%s-draw-%s
+ * SUBTEST: fbcdrrs-1p-offscreen-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  *
- * SUBTEST: fbcpsr-1p-offscren-pri-%s-draw-%s
+ * SUBTEST: fbcpsr-1p-offscreen-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  *
  * arg[1]:
@@ -104,23 +104,23 @@
  */
 
 /**
- * SUBTEST: drrs-1p-offscren-pri-%s-draw-%s
+ * SUBTEST: drrs-1p-offscreen-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  *
- * SUBTEST: fbc-1p-offscren-pri-%s-draw-%s
+ * SUBTEST: fbc-1p-offscreen-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  *
- * SUBTEST: psr-1p-offscren-pri-%s-draw-%s
+ * SUBTEST: psr-1p-offscreen-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  *
- * SUBTEST: fbcdrrs-1p-offscren-pri-%s-draw-%s
+ * SUBTEST: fbcdrrs-1p-offscreen-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  *
- * SUBTEST: fbcpsr-1p-offscren-pri-%s-draw-%s
+ * SUBTEST: fbcpsr-1p-offscreen-pri-%s-draw-%s
  * Description: Draw a set of rectangles on the screen using the provided method
  * Driver requirement: i915
  *
@@ -3948,7 +3948,7 @@ static const char *screen_str(int screen)
 	case SCREEN_SCND:
 		return "scndscrn";
 	case SCREEN_OFFSCREEN:
-		return "offscren";
+		return "offscreen";
 	default:
 		igt_assert(false);
 	}
-- 
2.43.0

