Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEE8606A31B
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 06:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EStJO+qu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD8E10E535;
	Wed,  4 Nov 2026 06:37:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4391210E74A
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 06:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793774072; x=1825310072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t/ZnIYXIDxtlsHJLnZweEDYw84nWMHqVc7z1hUd4Xa8=;
 b=EStJO+quL0SjSu0fzjbDLvAs7vlB5IXJzsoPkFQWqJyg66I6vxQsncNy
 4si6LBntU28xbbR00wtWvRfdOC6Paay0zGlE2JOEQ++uC1BAxVkV5IMyG
 q/BlRrKfQFU+IdM94kOneS+a/xip1fm6za0HqnSpU+pjclA5d7fHFU6yu
 lkIpigH80RqDmdSfAlgH935Ct+f/ajByb8f9m7iQFPfNM2y+kDc4NO3Xe
 vCAa9r0kckAUTei5yLwkV1TsljHwQxhu/iIiyNV4eNEP+g30aLMhtH43B
 WANwFfBcGn5soKlOaf05KxW6ltdI+QgIDsw8edwvwnYmJKcAtTtwUGvFP w==;
X-CSE-ConnectionGUID: /ZGlzf/sTqeYF4qPwzkn7w==
X-CSE-MsgGUID: bfElAW1zTguFzCn3uow9CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2403892"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2403892"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 22:34:31 -0800
X-CSE-ConnectionGUID: ba6GozDnTPKTkjp9Gnn3Fg==
X-CSE-MsgGUID: vACeO7yyTEuh88KwfXa8Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6956459"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.190.238.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 22:34:31 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/2] tests/kms_setmode: Drop
 invalid-clone-single-crtc-stealing subtest
Date: Wed,  4 Nov 2026 12:04:40 +0530
Message-ID: <20261104063442.2208555-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104063442.2208555-1-jeevan.b@intel.com>
References: <20261104063442.2208555-1-jeevan.b@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
index a65ea8b23..6398e7224 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -72,10 +72,6 @@
  * SUBTEST: invalid-clone-single-crtc
  * Description: Tests the mode by cloning the single crtc by iterating through all
  *              invalid crtc/connector combinations
- *
- * SUBTEST: invalid-clone-single-crtc-stealing
- * Description: Tests the stealing mode by cloning the single crtc by iterating
- *              through all invalid crtc/connector combinations
  */
 
 #define MAX_CONNECTORS  10
@@ -120,7 +116,6 @@ enum test_flags {
 	TEST_CLONE			= 0x02,
 	TEST_SINGLE_CRTC_CLONE		= 0x04,
 	TEST_EXCLUSIVE_CRTC_CLONE	= 0x08,
-	TEST_STEALING			= 0x10,
 	TEST_TIMINGS			= 0x20,
 };
 
@@ -479,47 +474,6 @@ static void cleanup_crtcs(struct crtc_config *crtcs, int crtc_count)
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
 
@@ -697,13 +651,14 @@ retry:
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
@@ -980,9 +935,6 @@ static void test_combinations(const struct test_config *tconf,
 	int i;
 	int crtc_count = get_crtc_count(tconf->resources->count_crtcs, extended);
 
-	if (connector_count > 2 && (tconf->flags & TEST_STEALING))
-		return;
-
 	igt_assert(tconf->resources);
 
 	connector_combs.capacity = pow(tconf->resources->count_connectors,
@@ -1087,8 +1039,6 @@ int igt_main_args("det:", NULL, help_str, opt_handler, NULL)
 					"invalid-clone-exclusive-crtc" },
 		{ TEST_CLONE | TEST_EXCLUSIVE_CRTC_CLONE,
 					"clone-exclusive-crtc" },
-		{ TEST_INVALID | TEST_CLONE | TEST_SINGLE_CRTC_CLONE | TEST_STEALING,
-					"invalid-clone-single-crtc-stealing" }
 	};
 	int i;
 
-- 
2.43.0

