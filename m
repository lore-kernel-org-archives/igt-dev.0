Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E9FCFA474
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 05:41:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23FE410E110;
	Fri, 21 Nov 2025 05:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LorlzMKq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E299210E110
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 05:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763703667; x=1795239667;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yJ/jWCo8EZb20uAZoqCSQHWFNkN/Q17yOs7eGjbfSQE=;
 b=LorlzMKqDsYz3ckQCViw909lZ0Od9Up9UptVzMR8IJue858KN2Y5rX5N
 K1PfdZ76H7w/0Gc5rvF8nO5rNRUtRRHv6RXW9bRM8fKeX8veO0Vi7z3mZ
 cw9tygRwWpKKQB8YuTQ6kFKXEDtaDB/qBuVGzcEk54WByBs2el1q9XcZ0
 SgfzKHqKq8XuHeScQ1dGc/IipSGndDXxKbcAbsJwHgsG8O0yVfJpDlaON
 hY+SNp8/8c5KqY5hhjKG7vyDNsglyNkbwou6qGs47feEVYs5sr0rcoRtU
 D60P8SlgrXrt79Itn9gXMN4QF4fPQHbe8UK2viia0js/B7rvXmTdSChRW A==;
X-CSE-ConnectionGUID: 9iSElqmJSMiQfWqtZNPkOw==
X-CSE-MsgGUID: oE+5uGsKQiaLeL/qt5ghbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69658158"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="69658158"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 21:41:07 -0800
X-CSE-ConnectionGUID: paj+PL8mTIK799e1rhlJQw==
X-CSE-MsgGUID: jZAmM7/9SVOMxR8D8nJ0cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="214961884"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 21:41:05 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v3 10/12] tests/kms_writeback: Add negative test case
 for invalid-format
Date: Fri, 21 Nov 2025 11:28:37 +0530
Message-ID: <20251121055839.3116906-11-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121055839.3116906-1-sowmiya.s@intel.com>
References: <20251121055839.3116906-1-sowmiya.s@intel.com>
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

Introduced a negative test case to validate
handling of invalid-format inputs.Each case
is now executed as a dynamic subtest

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_writeback.c | 38 ++++++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 581963fe6..c35d1f948 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -234,40 +234,54 @@ static int do_writeback_test(igt_output_t *output, uint32_t fb_id,
 	return ret;
 }
 
-static void test_invalid_parameters(igt_output_t *output, igt_fb_t *valid_fb, igt_fb_t *invalid_fb)
+static void test_invalid_parameters(igt_output_t *output, igt_fb_t *valid_fb,
+				    igt_fb_t *invalid_fb, igt_fb_t *invalid_format)
 {
 	int i, ret;
 	int32_t out_fence;
 	struct {
+		const char *name;
 		uint32_t fb_id;
 		bool ptr_valid;
 		int32_t *out_fence_ptr;
 	} invalid_tests[] = {
 		{
 			/* No output buffer, but the WRITEBACK_OUT_FENCE_PTR set. */
+			.name = "invalid-missing-framebuffer",
 			.fb_id = 0,
 			.ptr_valid = true,
 			.out_fence_ptr = &out_fence,
 		},
 		{
 			/* Invalid output buffer. */
+			.name = "invalid-output-buffer",
 			.fb_id = invalid_fb->fb_id,
 			.ptr_valid = true,
 			.out_fence_ptr = &out_fence,
 		},
 		{
 			/* Invalid WRITEBACK_OUT_FENCE_PTR. */
+			.name = "invalid-fence-ptr",
 			.fb_id = valid_fb->fb_id,
 			.ptr_valid = false,
 			.out_fence_ptr = (int32_t *)0x8,
 		},
+		{
+			/* Invalid format */
+			.name = "invalid-format",
+			.fb_id = invalid_format->fb_id,
+			.ptr_valid = false,
+			.out_fence_ptr =  &out_fence,
+		},
 	};
 
 	for (i = 0; i < ARRAY_SIZE(invalid_tests); i++) {
-		ret = do_writeback_test(output, invalid_tests[i].fb_id,
-					invalid_tests[i].out_fence_ptr,
-					invalid_tests[i].ptr_valid);
-		igt_assert_neq(ret, 0);
+		igt_dynamic_f("%s", invalid_tests[i].name) {
+			ret = do_writeback_test(output, invalid_tests[i].fb_id,
+						invalid_tests[i].out_fence_ptr,
+						invalid_tests[i].ptr_valid);
+			igt_assert_neq(ret, 0);
+		}
 	}
 }
 
@@ -664,10 +678,10 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 	igt_describe("Writeback has a couple of parameters linked together"
 		     "(output framebuffer and fence); this test goes through"
 		     "the combination of possible bad options");
-	igt_subtest("writeback-invalid-parameters") {
+	igt_subtest_with_dynamic_f("writeback-invalid-parameters") {
 		uint32_t format;
 		unsigned int fb_id;
-		igt_fb_t invalid_output_fb;
+		igt_fb_t invalid_output_fb, invalid_format_fb;
 
 		igt_skip_on(data.dump_check || data.list_modes);
 		if (is_intel_device(display.drm_fd))
@@ -689,9 +703,17 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 				      &invalid_output_fb);
 		igt_require(fb_id > 0);
 
-		test_invalid_parameters(output, &input_fb, &invalid_output_fb);
+		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
+				      mode.vdisplay,
+				      DRM_FORMAT_NV12,
+				      DRM_FORMAT_MOD_LINEAR,
+				      &invalid_format_fb);
+		igt_require(fb_id > 0);
+
+		test_invalid_parameters(output, &input_fb, &invalid_output_fb, &invalid_format_fb);
 
 		igt_remove_fb(display.drm_fd, &invalid_output_fb);
+		igt_remove_fb(display.drm_fd, &invalid_format_fb);
 	}
 
 	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid options");
-- 
2.43.0

