Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2ECC369AB
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 06:36:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5709F10E2A5;
	Tue, 15 Apr 2025 06:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="chs8BTpM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E6010E2A5
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 06:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744698962; x=1776234962;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+Z+zYgxWn5rT6dUz7kQ3k2FHdy46L98ghIg+qFly8fM=;
 b=chs8BTpM1bLg0DIXOtdBfxCspQ9g1GbCPiyBGpGbrRjX32hVcChkSmKI
 T2uAHbZurSjL5ayE2tGobXiYxisMV92H6H3o0plEyvOoUTa1Ae7icIn+O
 iSc+b2SSFXiVJY0IrA7HtAoFPvZB7/FKCOWr4Yymwhv04ySn7dztS7V2k
 3t4A+pofvWxRkSWybda2YIxS8wlQBQ11f5W1e3B7E8FnEi9hl7lE03e0O
 c8aLzpb/qz+DlF5M5cRsfdBImhJlcB15zdisqx7OuHrGUG9xgjbKvma4A
 595aiWgpz5czKaBe68YW2Xvkdu23Q8lss0AJsdTyiRJXC+XxO2aYCaLHr g==;
X-CSE-ConnectionGUID: Z/NOcKClQnG+7oWkckY/8Q==
X-CSE-MsgGUID: r5JymW3uTvuSsOKie4XYvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="57555385"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="57555385"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 23:36:01 -0700
X-CSE-ConnectionGUID: eEmlXKsES2yuoM6WS0ybLA==
X-CSE-MsgGUID: UgDZhAVrQwW9yRxiDZmdKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="129880041"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 23:35:59 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_async_flips: Split subtest to handle
 linear buffers separately
Date: Tue, 15 Apr 2025 11:59:01 +0530
Message-Id: <20250415062901.2872752-1-santhosh.reddy.guddati@intel.com>
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

As linear buffers are considered corner cases, split the existing subtests
run_with_modifiers to handle as a separate subtest.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 41 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 031417ed8..df3e136b7 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -88,6 +88,14 @@
  *
  * SUBTEST: overlay-atomic
  * Description: Verify overlay planes with async flips in atomic API
+ *
+ * SUBTEST: async-flip-with-page-flip-events-linear
+ * Description: Verify the async flip functionality and the fps during async flips
+ *		with linear modifier
+ *
+ * SUBTEST: async-flip-with-page-flip-events-atomic-linear
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
@@ -792,15 +802,23 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 		test_init(data);
 
 		for (int i = 0; i < data->plane->format_mod_count; i++) {
+			uint64_t modifier = data->plane->modifiers[i];
+
 			if (data->plane->formats[i] != DRM_FORMAT_XRGB8888)
 				continue;
 
+			if (data->linear_modifier && modifier != DRM_FORMAT_MOD_LINEAR)
+				continue;
+
+			if (!data->linear_modifier && modifier == DRM_FORMAT_MOD_LINEAR)
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
@@ -863,6 +881,25 @@ igt_main
 				run_test(&data, test_async_flip);
 		}
 
+		igt_describe("Wait for page flip events in between successive asynchronous "
+			     "flips with linear modifiers");
+		igt_subtest_with_dynamic("async-flip-with-page-flip-events-linear") {
+			test_init_ops(&data);
+			data.linear_modifier = true;
+			igt_require(is_intel_device(data.drm_fd));
+			run_test_with_modifiers(&data, test_async_flip);
+		}
+
+		igt_describe("Wait for page flip events in between successive asynchronous "
+			     "flips using atomic path with linear modifiers");
+		igt_subtest_with_dynamic("async-flip-with-page-flip-events-atomic-linear") {
+			test_init_ops(&data);
+			data.atomic_path = true;
+			data.linear_modifier = true;
+			igt_require(is_intel_device(data.drm_fd));
+			run_test_with_modifiers(&data, test_async_flip);
+		}
+
 		igt_describe("Alternate between sync and async flips");
 		igt_subtest_with_dynamic("alternate-sync-async-flip") {
 			test_init_ops(&data);
-- 
2.34.1

