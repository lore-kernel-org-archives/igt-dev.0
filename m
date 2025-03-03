Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016F9C282C6
	for <igt-dev@archiver.kernel.org>; Mon,  3 Mar 2025 09:57:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B244010E3B7;
	Mon,  3 Mar 2025 09:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dz/05JR5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB1810E3B5
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Mar 2025 09:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740995866; x=1772531866;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8v9Sxr0FUdAJch7cGnpZtcvguOlb5D9lzkyxEOqtn3w=;
 b=dz/05JR5d3bv2J4IaWfD+pVMYfJBcEcXTPg3sxPVaMQ7V/e7vU627HPH
 sIfAgqR1wOdMZlD6tDQu4o/hs8wo8qHLrelALz69mvFaTYCT5pNgQZX9Z
 LWulfFG4weIkJtOh0ThkpqUI71iHCIcH5oumW48beHMxhlZSkHvg2JG/V
 vmFkZzeZU1nQFzjLz1G5OeueTrzAn8NyNB+pVeLa4oHX6laOG9viXSg2q
 ICeQvGUj+w8+geV0HcqAp8hiOasQwxs/ppPxl0HtDEGXsVtf9bZIVPhA1
 4n1AP82R7oYCmoXBZUEDYDmLMbCcrYp2NZFiE+iP2Z40haNZeDAtK6s0X w==;
X-CSE-ConnectionGUID: hxVo6QJHQXu66uXPkQkHzg==
X-CSE-MsgGUID: HIx7WnasSz2dLWz8E8JHbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="44676161"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="44676161"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 01:57:45 -0800
X-CSE-ConnectionGUID: C60hGRkHTcOyck7I7ToE5g==
X-CSE-MsgGUID: fxcVruqhTYejgmWzsrD+fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="155133642"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 03 Mar 2025 01:57:43 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com, rodrigo.vivi@intel.com, matthew.d.roper@intel.com
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH i-g-t v1] tests/intel/xe_gt_freq: Use spinner for throttle test
Date: Mon,  3 Mar 2025 15:27:12 +0530
Message-Id: <20250303095712.274097-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
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

Since throttling requires running workload on GPU, make use of spinner
to get consistent results from throttle API test.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 tests/intel/xe_gt_freq.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index 1fb6d2b53..b501c62db 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -36,6 +36,12 @@
  */
 #define SLPC_FREQ_LATENCY_US 100000
 
+enum spin_test {
+	SPIN_THROTTLE,
+	SPIN_FIXED_FREQ,
+	SPIN_RANGE_FREQ,
+};
+
 static int set_freq(int fd, int gt_id, const char *freq_name, uint32_t freq)
 {
 	int ret = -EAGAIN;
@@ -352,7 +358,7 @@ static void test_reset(int fd, int gt_id, int cycles)
 	}
 }
 
-static void test_spin(int fd, struct drm_xe_engine_class_instance *eci, bool fixed)
+static void test_spin(int fd, struct drm_xe_engine_class_instance *eci, enum spin_test test)
 {
 	struct drm_xe_sync sync[2] = {
 		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
@@ -406,10 +412,17 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci, bool fix
 	igt_info("Running on GT %d Engine %s:%d\n", eci->gt_id,
 		 xe_engine_class_string(eci->engine_class), eci->engine_instance);
 
-	if (fixed)
+	switch (test) {
+	case SPIN_THROTTLE:
+		test_throttle_basic_api(fd, eci->gt_id);
+		break;
+	case SPIN_FIXED_FREQ:
 		test_freq_fixed(fd, eci->gt_id, false);
-	else
+		break;
+	case SPIN_RANGE_FREQ:
 		test_freq_range(fd, eci->gt_id, false);
+		break;
+	};
 
 	xe_spin_end(spin);
 
@@ -454,8 +467,13 @@ igt_main
 	}
 
 	igt_subtest("throttle_basic_api") {
-		xe_for_each_gt(fd, gt)
-			test_throttle_basic_api(fd, gt);
+		xe_for_each_gt(fd, gt) {
+			xe_for_each_engine(fd, hwe) {
+				if (hwe->gt_id != gt)
+					continue;
+				test_spin(fd, hwe, SPIN_THROTTLE);
+			}
+		}
 	}
 
 	igt_subtest("freq_basic_api") {
@@ -476,7 +494,7 @@ igt_main
 			xe_for_each_engine(fd, hwe) {
 				if (hwe->gt_id != gt)
 					continue;
-				test_spin(fd, hwe, true);
+				test_spin(fd, hwe, SPIN_FIXED_FREQ);
 			}
 		}
 	}
@@ -494,7 +512,7 @@ igt_main
 			xe_for_each_engine(fd, hwe) {
 				if (hwe->gt_id != gt)
 					continue;
-				test_spin(fd, hwe, false);
+				test_spin(fd, hwe, SPIN_RANGE_FREQ);
 			}
 		}
 	}
-- 
2.34.1

