Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF83C021B6
	for <igt-dev@archiver.kernel.org>; Fri, 21 Feb 2025 16:52:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A2D10EB08;
	Fri, 21 Feb 2025 16:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Izmsd+DI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B01C10EB05
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2025 16:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740156764; x=1771692764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0CBgS6kwFBw9iZo0J+JjWUD2aP1HGiC+x4sA31Vd/u0=;
 b=Izmsd+DIFnWx86LixZFecuVfPNneuAyGWQ1FzncCl7lIW6FUFUBsZ6/0
 kW/VxmYkF4h2xpnk7viffSH7TLu8DTYEs/rCQpPgzu81LbXDK4O2K4k80
 WiSqNnlldKP+wrz/XCpyqVbViJhM8FvEayVpiu8IHDEUBr1U1xG4xzXlU
 MLNe1/YoW0xEwVfyZ+fZa9m3Wjd9ltD6aZc6E2+4w3Y6pPrwMs8OncQEL
 tUDoGh6LyH8Zl7tSPovXIdDNoDdwHgPDmnY/C/ZuhUHhkcpt5AMXAO9rV
 KRYjXJRAM23dy7wAoH8EkmgBDH1OdhRjxivVAV1jrtmrr0Qe7yMs776Be w==;
X-CSE-ConnectionGUID: 9FI/+Ml0TQq9I3NmqLnX4w==
X-CSE-MsgGUID: 1xla08QoRCSEZfqGnJzNXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41186738"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="41186738"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 08:52:44 -0800
X-CSE-ConnectionGUID: WtlxOlFmSvigva3mebpPxA==
X-CSE-MsgGUID: P5bw6qQLSBKV04iuH5a0/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="120517583"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 08:52:43 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t, v2 04/11] tests/kms_sharpness_filter: Add toggle subtest
Date: Fri, 21 Feb 2025 22:27:42 +0530
Message-Id: <20250221165749.460347-5-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250221165749.460347-1-swati2.sharma@intel.com>
References: <20250221165749.460347-1-swati2.sharma@intel.com>
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

Add subtest to verify toggling between enabling and disabling of
content adaptive sharpness filter.

v2: -Use imperative mood in commit message (Ankit)
    -Change iterator from k to i (Ankit)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/kms_sharpness_filter.c | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tests/kms_sharpness_filter.c b/tests/kms_sharpness_filter.c
index 92981c2ae..2bc87374e 100644
--- a/tests/kms_sharpness_filter.c
+++ b/tests/kms_sharpness_filter.c
@@ -34,6 +34,9 @@
  * SUBTEST: filter-formats
  * Description: Verify content adaptive sharpness filter with varying formats.
  * Functionality: casf, pixel-format
+ *
+ * SUBTEST: filter-toggle
+ * Description: Verify toggling between enabling and disabling content adaptive sharpness filter.
 */
 
 IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
@@ -44,9 +47,11 @@ IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
  * is seen without corruption for each subtest.
  */
 
+#define DISABLE_FILTER			0
 #define MIN_FILTER_STRENGTH		1
 #define MID_FILTER_STRENGTH		128
 #define MAX_FILTER_STRENGTH		255
+#define NROUNDS				10
 
 enum test_type {
 	TEST_FILTER_BASIC,
@@ -54,6 +59,7 @@ enum test_type {
 	TEST_FILTER_ROTATION,
 	TEST_FILTER_FORMATS,
 	TEST_FILTER_STRENGTH,
+	TEST_FILTER_TOGGLE,
 };
 
 const int filter_strength_list[] = {
@@ -145,6 +151,23 @@ static void cleanup(data_t *data)
 	cleanup_fbs(data);
 }
 
+static int test_filter_toggle(data_t *data)
+{
+	int ret = 0;
+
+	for (int i = 0; i < NROUNDS; i++) {
+		if (i % 2 == 0)
+			data->filter_strength = DISABLE_FILTER;
+		else
+			data->filter_strength = MAX_FILTER_STRENGTH;
+
+		set_filter_strength_on_pipe(data);
+		ret |= igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
+	}
+
+	return ret;
+}
+
 static void test_sharpness_filter(data_t *data,  enum test_type type)
 {
 	drmModeModeInfo *mode = data->mode;
@@ -173,6 +196,9 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
 
 	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
 
+	if (type == TEST_FILTER_TOGGLE)
+		ret |= test_filter_toggle(data);
+
 	igt_assert_eq(ret, 0);
 
 	cleanup(data);
@@ -229,6 +255,9 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 			case TEST_FILTER_STRENGTH:
 				snprintf(name, sizeof(name), "-strength-%d", data->filter_strength);
 				break;
+			case TEST_FILTER_TOGGLE:
+				snprintf(name, sizeof(name), "-toggle");
+				break;
 			default:
 				igt_assert(0);
 			}
@@ -341,6 +370,17 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
 		}
 	}
 
+	igt_describe("Verify toggling between enabling and disabling "
+		     "content adaptive sharpness filter.");
+	igt_subtest_with_dynamic("filter-toggle") {
+		data.modifier = DRM_FORMAT_MOD_LINEAR;
+		data.rotation = IGT_ROTATION_0;
+		data.format = DRM_FORMAT_XRGB8888;
+
+		data.filter_strength = MAX_FILTER_STRENGTH;
+		run_sharpness_filter_test(&data, TEST_FILTER_TOGGLE);
+	}
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.25.1

