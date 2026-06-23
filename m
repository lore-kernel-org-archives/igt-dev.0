Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52231CDB470
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 08:10:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F243010E9E7;
	Tue, 23 Jun 2026 08:10:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j1nFvFg8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CCF010E9E3
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 08:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782202177; x=1813738177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hriF8DgFyy+cH/5UB8P2jIEs5k6379bQE+eCERoP3H4=;
 b=j1nFvFg8TpzehVHsg6L6fGZSNVk/oW/VtmSa5bhvnRgWYCmbyXw4RpnI
 7Lk3bO+Od5gGKUM0wuWw6UNTvxumNEa8MCi0Ksxf4mg989KzaiuYi+SSx
 Ual1HcDhV/r5nAzCdH9dKtpNiS9v7F9ciCMMswIWn5iMEOND6WW9QDai+
 XYdrPHZKk27afiIHChcN/ANCKzoWx5pw3g3wljyK4V1EzNtoDrug1qnQx
 f1hfg4A2vVdvbpeb2uUDG5yH82Wl4M3x5rtC30+CKW8z9zxFYmFdSYH1Y
 UBOk2ugjmlD5kkF10qLft3KnAo609w58GkEWkPLSildHVWYpjbcwZstPR Q==;
X-CSE-ConnectionGUID: J5ppmTFkR3KybSHETviaeQ==
X-CSE-MsgGUID: BcnT0bXJTL+mLa1rXV6G3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82944734"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="82944734"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 01:09:37 -0700
X-CSE-ConnectionGUID: GcmXkvjMQN+hT5hGQqK10w==
X-CSE-MsgGUID: bnKLuVLtQmamoZch+anISQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="253794147"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 01:09:36 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v2 1/3] tests/kms_setmode: Drop
 invalid-clone-single-crtc-stealing subtest
Date: Tue, 23 Jun 2026 13:39:24 +0530
Message-ID: <20260623080927.3216500-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623080927.3216500-1-jeevan.b@intel.com>
References: <20260623080927.3216500-1-jeevan.b@intel.com>
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

Remove the TEST_STEALING subtest and all related code, as it relies on legacy
drmModeSetCrtc() “CRTC stealing” behavior that is not compatible with the
atomic display API, where all modeset changes are applied atomically and
explicitly. This cleanup removes the enum, helper functions, documentation,
related logic, and test registration, aligning the test suite with the atomic
model and isolating the removal from ongoing conversion work.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_setmode.c | 66 ++++++---------------------------------------
 1 file changed, 8 insertions(+), 58 deletions(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 3adc4534c..5236078e0 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -64,10 +64,6 @@
  * SUBTEST: invalid-clone-single-crtc
  * Description: Tests the mode by cloning the single crtc by iterating through all
  *              invalid crtc/connector combinations
- *
- * SUBTEST: invalid-clone-single-crtc-stealing
- * Description: Tests the stealing mode by cloning the single crtc by iterating
- *              through all invalid crtc/connector combinations
  */
 
 #define MAX_CONNECTORS  10
@@ -112,7 +108,6 @@ enum test_flags {
 	TEST_CLONE			= 0x02,
 	TEST_SINGLE_CRTC_CLONE		= 0x04,
 	TEST_EXCLUSIVE_CRTC_CLONE	= 0x08,
-	TEST_STEALING			= 0x10,
 	TEST_TIMINGS			= 0x20,
 };
 
@@ -471,47 +466,6 @@ static void cleanup_crtcs(struct crtc_config *crtcs, int crtc_count)
 	}
 }
 
-static uint32_t *get_connector_ids(struct crtc_config *crtc)
-{
-	uint32_t *ids;
-	int i;
-
-	ids = malloc(sizeof(*ids) * crtc->connector_count);
-	igt_assert(ids);
-	for (i = 0; i < crtc->connector_count; i++)
-		ids[i] = crtc->cconfs[i].connector->connector_id;
-
-	return ids;
-}
-
-static int test_stealing(int fd, struct crtc_config *crtc, uint32_t *ids)
-{
-	int i, ret = 0;
-
-	if (!crtc->connector_count)
-		return drmModeSetCrtc(fd, crtc->crtc_id,
-				     crtc->fb_info.fb_id, 0, 0,
-				     ids, crtc->connector_count, &crtc->mode);
-
-	for (i = 0; i < crtc->connector_count; ++i) {
-		ret = drmModeSetCrtc(fd, crtc->crtc_id,
-				     crtc->fb_info.fb_id, 0, 0,
-				     &ids[i], 1, &crtc->mode);
-
-		igt_assert_eq(ret, 0);
-
-		ret = drmModeSetCrtc(fd, crtc->crtc_id,
-				     crtc->fb_info.fb_id, 0, 0,
-				     ids, crtc->connector_count, &crtc->mode);
-
-		/* This should fail with -EINVAL */
-		if (!ret)
-			return 0;
-	}
-
-	return ret;
-}
-
 #define frame_time(km) (1000.0 * (km)->htotal * (km)->vtotal / (km)->clock)
 #define line_time(km) (1000.0 * (km)->htotal / (km)->clock)
 
@@ -689,13 +643,14 @@ retry:
 		create_fb_for_crtc(crtc, &crtc->fb_info);
 		paint_fb(&crtc->fb_info, tconf->name, crtc_strs, crtc_count, i);
 
-		ids = get_connector_ids(crtc);
-		if (tconf->flags & TEST_STEALING)
-			ret = test_stealing(drm_fd, crtc, ids);
-		else
-			ret = drmModeSetCrtc(drm_fd, crtc->crtc_id,
-					     crtc->fb_info.fb_id, 0, 0, ids,
-					     crtc->connector_count, &crtc->mode);
+		ids = malloc(sizeof(*ids) * crtc->connector_count);
+		igt_assert(ids);
+		for (int j = 0; j < crtc->connector_count; j++)
+			ids[j] = crtc->cconfs[j].connector->connector_id;
+
+		ret = drmModeSetCrtc(drm_fd, crtc->crtc_id,
+				     crtc->fb_info.fb_id, 0, 0, ids,
+				     crtc->connector_count, &crtc->mode);
 
 		if (is_intel_device(drm_fd))
 			intel_drrs_disable_crtc_index(drm_fd, crtc->crtc_idx);
@@ -973,9 +928,6 @@ static void test_combinations(const struct test_config *tconf,
 	int i;
 	int crtc_count = get_crtc_count(tconf->resources->count_crtcs, extended);
 
-	if (connector_count > 2 && (tconf->flags & TEST_STEALING))
-		return;
-
 	igt_assert(tconf->resources);
 
 	connector_combs.capacity = pow(tconf->resources->count_connectors,
@@ -1075,8 +1027,6 @@ int igt_main_args("det:", NULL, help_str, opt_handler, NULL)
 					"invalid-clone-exclusive-crtc" },
 		{ TEST_CLONE | TEST_EXCLUSIVE_CRTC_CLONE,
 					"clone-exclusive-crtc" },
-		{ TEST_INVALID | TEST_CLONE | TEST_SINGLE_CRTC_CLONE | TEST_STEALING,
-					"invalid-clone-single-crtc-stealing" }
 	};
 	int i;
 
-- 
2.43.0

