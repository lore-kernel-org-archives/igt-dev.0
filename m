Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4A4C369AB
	for <igt-dev@archiver.kernel.org>; Thu, 24 Apr 2025 07:53:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D9410E767;
	Thu, 24 Apr 2025 07:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JB6ANsnH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7443B10E767
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Apr 2025 07:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745481188; x=1777017188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yEPLcNiilPCa9V7vBVGVidRBh2Sp3A+N5Atd/bBVoP0=;
 b=JB6ANsnHt2FVQgi8n58oJVOYaZTTSQZoTopywaSkxzE+K8x1zPx6JSjd
 sw94OWMWjSBK4nxjRGOLD69SijUK3j+JZvZlJ0DqqXWwiv63BZik9uP/x
 5FtRm1g6rnZ3Y5/LmR56rr+7me/hEjmUcn3dkHO1WdM2owh8Zt5y9leFq
 Nt+gGicJdPm4JMEvom0nsFUPaBsjbExrUBuna7xLhAu1TpTYVz6wWyuPJ
 WgvbMNo3J1LpEJWSPoQo9qf9vcdKzKQdOpybhGbgQuf4saAG4YzdS2bnS
 bN7O7J2m3LaKSiaVD6aw5eCvl+i1iPhIMgNmS3aNidcdhUTskHl8BExiN w==;
X-CSE-ConnectionGUID: UlerPZ0bSy2D6ljmVrZXWA==
X-CSE-MsgGUID: 1UfL5UssRpif61en+tkWeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="64512701"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="64512701"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 00:53:08 -0700
X-CSE-ConnectionGUID: lYPbjUV4Q/2ug9DUUWivbQ==
X-CSE-MsgGUID: ccer9NPfRDmebqli5Lqcjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="137712985"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 00:53:06 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v5 1/2] tests/kms_async_flips: Split subtest to handle
 linear buffers separately
Date: Thu, 24 Apr 2025 13:15:05 +0530
Message-Id: <20250424074506.2946884-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250424074506.2946884-1-santhosh.reddy.guddati@intel.com>
References: <20250424074506.2946884-1-santhosh.reddy.guddati@intel.com>
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

As linear buffers are considered corner cases, split the existing subtests
run_with_modifiers to handle as a separate subtest.

V2:
Rename existing subtest to tiled modifier and make the tiled subtest
intel specific, fix linear modifier subtest to avoid skip on non intel
platforms (Karthik).

V3:
Refactor run_test for linear modifier and update run_test_with_modifiers
to skip for linear modifier only (Karthik).

V4:
Set allow_fail based on linear modifier and intel device.

V5:
Fix build

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 65 +++++++++++++++++++++++++++++++----------
 1 file changed, 49 insertions(+), 16 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 031417ed8..d8708d803 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -45,7 +45,7 @@
  * Description: Verify the async flip functionality and the fps during async flips
  *              Alternate between sync and async flips
  *
- * SUBTEST: async-flip-with-page-flip-events
+ * SUBTEST: async-flip-with-page-flip-events-tiled
  * Description: Verify the async flip functionality and the fps during async flips
  *              Wait for page flip events in between successive asynchronous flips
  *
@@ -66,7 +66,7 @@
  * SUBTEST: alternate-sync-async-flip-atomic
  * Description: Verify the async flip functionality and the fps during async flips using atomic path
  *
- * SUBTEST: async-flip-with-page-flip-events-atomic
+ * SUBTEST: async-flip-with-page-flip-events-tiled-atomic
  * Description: Wait for page flip events in between successive asynchronous flips using atomic path
  *
  * SUBTEST: test-time-stamp-atomic
@@ -88,6 +88,14 @@
  *
  * SUBTEST: overlay-atomic
  * Description: Verify overlay planes with async flips in atomic API
+ *
+ * SUBTEST: async-flip-with-page-flip-events-linear
+ * Description: Verify the async flip functionality and the fps during async flips
+ *		with linear modifier
+ *
+ * SUBTEST: async-flip-with-page-flip-events-linear-atomic
+ * Description: Verify the async flip functionality and the fps during async flips
+ *		with linear modifier in Atomic API
  */
 
 #define CURSOR_POS 128
@@ -128,6 +136,7 @@ typedef struct {
 	struct buf_ops *bops;
 	bool atomic_path;
 	bool overlay_path;
+	bool linear_modifier;
 } data_t;
 
 static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
@@ -266,6 +275,7 @@ static void test_init_ops(data_t *data)
 	data->alternate_sync_async = false;
 	data->atomic_path = false;
 	data->overlay_path = false;
+	data->linear_modifier = false;
 }
 
 static void test_init_fbs(data_t *data)
@@ -768,8 +778,14 @@ static void run_test(data_t *data, void (*test)(data_t *))
 			continue;
 
 		test_init(data);
-		data->allow_fail = false;
-		data->modifier = default_modifier(data);
+
+		if (data->linear_modifier && is_intel_device(data->drm_fd))
+			data->allow_fail = true;
+		else
+			data->allow_fail = false;
+
+		data->modifier = data->linear_modifier ? DRM_FORMAT_MOD_LINEAR : default_modifier(data);
+
 		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
 			/*
 			 * FIXME: joiner+async flip is busted currently in KMD.
@@ -792,15 +808,20 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 		test_init(data);
 
 		for (int i = 0; i < data->plane->format_mod_count; i++) {
+			uint64_t modifier = data->plane->modifiers[i];
+
 			if (data->plane->formats[i] != DRM_FORMAT_XRGB8888)
 				continue;
 
+			if (modifier == DRM_FORMAT_MOD_LINEAR)
+				continue;
+
 			data->allow_fail = true;
-			data->modifier = data->plane->modifiers[i];
+			data->modifier = modifier;
 
 			igt_dynamic_f("pipe-%s-%s-%s", kmstest_pipe_name(data->pipe),
 				      data->output->name,
-				      igt_fb_modifier_name(data->modifier)) {
+				      igt_fb_modifier_name(modifier)) {
 				      /*
 				       * FIXME: joiner+async flip is busted currently in KMD.
 				       * Remove this check once the issues are fixed in KMD.
@@ -844,23 +865,35 @@ igt_main
 			require_monotonic_timestamp(data.drm_fd);
 
 		igt_describe("Wait for page flip events in between successive asynchronous flips");
-		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
+		igt_subtest_with_dynamic("async-flip-with-page-flip-events-tiled") {
 			test_init_ops(&data);
-			if (is_intel_device(data.drm_fd))
-				run_test_with_modifiers(&data, test_async_flip);
-			else
-				run_test(&data, test_async_flip);
+			igt_require(is_intel_device(data.drm_fd));
+			run_test_with_modifiers(&data, test_async_flip);
 		}
 
 		igt_describe("Wait for page flip events in between successive "
 			     "asynchronous flips using atomic path");
-		igt_subtest_with_dynamic("async-flip-with-page-flip-events-atomic") {
+		igt_subtest_with_dynamic("async-flip-with-page-flip-events-tiled-atomic") {
 			test_init_ops(&data);
 			data.atomic_path = true;
-			if (is_intel_device(data.drm_fd))
-				run_test_with_modifiers(&data, test_async_flip);
-			else
-				run_test(&data, test_async_flip);
+			igt_require(is_intel_device(data.drm_fd));
+			run_test_with_modifiers(&data, test_async_flip);
+		}
+
+		igt_describe("Wait for page flip events in between successive asynchronous "
+			     "flips with linear modifiers");
+		igt_subtest_with_dynamic("async-flip-with-page-flip-events-linear") {
+			test_init_ops(&data);
+			data.linear_modifier = true;
+			run_test(&data, test_async_flip);
+		}
+
+		igt_describe("Wait for page flip events in between successive asynchronous "
+			     "flips using atomic path with linear modifiers");
+		igt_subtest_with_dynamic("async-flip-with-page-flip-events-linear-atomic") {
+			test_init_ops(&data);
+			data.linear_modifier = true;
+			run_test(&data, test_async_flip);
 		}
 
 		igt_describe("Alternate between sync and async flips");
-- 
2.34.1

