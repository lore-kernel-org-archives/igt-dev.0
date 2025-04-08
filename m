Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4130C36010
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 22:36:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617BA10E796;
	Tue,  8 Apr 2025 22:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ZPS/RF/m";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983EF10E792
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 22:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Kv+eevRMnr0t9s+3Bpx3tIw4W78d8JulN3LT0HQknas=; b=ZPS/RF/mcq2YBLUZGy4gsdvx0+
 TXBTUR3Qd/qszBJa6ytmR3NC2DX7MPb376j8lfAM+ijNtqW3X6NCsTXxSljfLcSwbKGEd0p19+9fJ
 7B2jZPjxMZkVkgIkyQjrxUAb7NllGlTvuCil8v2xjqtiWHVTAPn/yK6P6SJG6eoazqUGchLeZEExq
 M5+wquR0S3Rpuxo9QI2FJpEvypl0ZtRITCeGlWFKtZYEulflvm/UxPhej5cLmRWmAEfrkBY1TP4Ez
 mzdCW0Ngi2LbkZTORFDfyEb9zXV3oPdxNdHUXo5Cp3rgNxQ70t3FEXaq+8dTYHbiqaJeMBY8VYbLs
 +SQraDDQ==;
Received: from [187.57.129.172] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u2HYK-00DbcU-CZ; Wed, 09 Apr 2025 00:36:20 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: kernel-dev@igalia.com, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Hung <alex.hung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v7 3/4] kms_async_flips: Refactor data options
Date: Tue,  8 Apr 2025 19:36:03 -0300
Message-ID: <20250408223604.289309-4-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408223604.289309-1-andrealmeid@igalia.com>
References: <20250408223604.289309-1-andrealmeid@igalia.com>
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

Setting the test data options as true and false for every test is error
prone. Instead, reset all the data to false at the end of a test and
just set the needed options to true before running a test.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
 tests/kms_async_flips.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 90ab7a076..ef2e77fdd 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -234,6 +234,12 @@ static void test_init(data_t *data)
 	data->plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
 }
 
+static void test_init_ops(data_t *data)
+{
+	data->alternate_sync_async = false;
+	data->atomic_path = false;
+}
+
 static void test_init_fbs(data_t *data)
 {
 	int i;
@@ -785,8 +791,7 @@ igt_main
 
 		igt_describe("Wait for page flip events in between successive asynchronous flips");
 		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
-			data.alternate_sync_async = false;
-			data.atomic_path = false;
+			test_init_ops(&data);
 			if (is_intel_device(data.drm_fd))
 				run_test_with_modifiers(&data, test_async_flip);
 			else
@@ -796,7 +801,7 @@ igt_main
 		igt_describe("Wait for page flip events in between successive "
 			     "asynchronous flips using atomic path");
 		igt_subtest_with_dynamic("async-flip-with-page-flip-events-atomic") {
-			data.alternate_sync_async = false;
+			test_init_ops(&data);
 			data.atomic_path = true;
 			if (is_intel_device(data.drm_fd))
 				run_test_with_modifiers(&data, test_async_flip);
@@ -806,13 +811,14 @@ igt_main
 
 		igt_describe("Alternate between sync and async flips");
 		igt_subtest_with_dynamic("alternate-sync-async-flip") {
+			test_init_ops(&data);
 			data.alternate_sync_async = true;
-			data.atomic_path = false;
 			run_test(&data, test_async_flip);
 		}
 
 		igt_describe("Alternate between sync and async flips using atomic path");
 		igt_subtest_with_dynamic("alternate-sync-async-flip-atomic") {
+			test_init_ops(&data);
 			data.alternate_sync_async = true;
 			data.atomic_path = true;
 			run_test(&data, test_async_flip);
@@ -821,13 +827,14 @@ igt_main
 		igt_describe("Verify that the async flip timestamp does not "
 			     "coincide with either previous or next vblank");
 		igt_subtest_with_dynamic("test-time-stamp") {
-			data.atomic_path = false;
+			test_init_ops(&data);
 			run_test(&data, test_timestamp);
 		}
 
 		igt_describe("Verify that the async flip timestamp does not coincide "
 			     "with either previous or next vblank with atomic path");
 		igt_subtest_with_dynamic("test-time-stamp-atomic") {
+			test_init_ops(&data);
 			data.atomic_path = true;
 			run_test(&data, test_timestamp);
 		}
@@ -835,6 +842,7 @@ igt_main
 
 	igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip");
 	igt_subtest_with_dynamic("test-cursor") {
+		test_init_ops(&data);
 		/*
 		 * Intel's PSR2 selective fetch adds other planes to state when
 		 * necessary, causing the async flip to fail because async flip is not
@@ -844,13 +852,13 @@ igt_main
 			      "PSR2 sel fetch causes cursor to be added to primary plane "
 			      "pages flips and async flip is not supported in cursor\n");
 
-		data.atomic_path = false;
 		run_test(&data, test_cursor);
 	}
 
 	igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after "
 		     "async flip with atomic commit");
 	igt_subtest_with_dynamic("test-cursor-atomic") {
+		test_init_ops(&data);
 		/*
 		 * Intel's PSR2 selective fetch adds other planes to state when
 		 * necessary, causing the async flip to fail because async flip is not
@@ -865,6 +873,7 @@ igt_main
 
 	igt_describe("Negative case to verify if changes in fb are rejected from kernel as expected");
 	igt_subtest_with_dynamic("invalid-async-flip") {
+		test_init_ops(&data);
 		/* TODO: support more vendors */
 		igt_require(is_intel_device(data.drm_fd));
 		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
@@ -872,13 +881,13 @@ igt_main
 		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
 						       I915_FORMAT_MOD_Y_TILED));
 
-		data.atomic_path = false;
 		run_test(&data, test_invalid);
 	}
 
 	igt_describe("Negative case to verify if changes in fb are rejected "
 		     "from kernel as expected when async flip is done using atomic path");
 	igt_subtest_with_dynamic("invalid-async-flip-atomic") {
+		test_init_ops(&data);
 		data.atomic_path = true;
 		/* TODO: support more vendors */
 		igt_require(is_intel_device(data.drm_fd));
@@ -892,16 +901,17 @@ igt_main
 
 	igt_describe("Use CRC to verify async flip scans out the correct framebuffer");
 	igt_subtest_with_dynamic("crc") {
+		test_init_ops(&data);
 		/* Devices without CRC can't run this test */
 		igt_require_pipe_crc(data.drm_fd);
 
-		data.atomic_path = false;
 		run_test(&data, test_crc);
 	}
 
 	igt_describe("Use CRC to verify async flip scans out the correct framebuffer "
 		     "with atomic commit");
 	igt_subtest_with_dynamic("crc-atomic") {
+		test_init_ops(&data);
 		/* Devices without CRC can't run this test */
 		igt_require_pipe_crc(data.drm_fd);
 
@@ -911,6 +921,7 @@ igt_main
 
 	igt_describe("Verify the async flip functionality after suspend and resume cycle");
 	igt_subtest_with_dynamic("async-flip-suspend-resume") {
+		test_init_ops(&data);
 		data.suspend_resume = true;
 		run_test(&data, test_async_flip);
 	}
-- 
2.49.0

