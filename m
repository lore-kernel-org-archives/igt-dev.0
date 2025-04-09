Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B740EC36002
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 15:22:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEEE10E947;
	Wed,  9 Apr 2025 15:22:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="IWHgtf3J";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F344E10E947
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 15:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yEBnjuf80xNEMFFiyYATwHFCvtsjdDZsnrQku43DsSI=; b=IWHgtf3JFN3865p2my181qQEYz
 6Fpm4nL/+AwnktRG3KeOaGHBrtxgIG3vXRZxO+J4KeP5COtETDxwkdCKtEXux4q96q9vGLSnP9Bk6
 CBNWtwFqRzK7/hTFHuP0MyOmtViCBjEVB0YM7Zo3c0K3FxdGE4muU8R4Zkaew8SHdIHWTvR9gxauc
 LeIqXAY0hWgUQWnJeiuVHeIB0t/VppfvU/hdRr9I/tkrEA8/wtzaYziPu2DTRmMGR5gCOzp4yYzMZ
 KMliy+hoI6csr+pURqzGVMEByDzfpgVZyRUn059F2pdK3fMem8BSx9vo510IexyxsVxWS6nd6Tdz+
 uFC8a7Uw==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u2XFs-00EC3q-TJ; Wed, 09 Apr 2025 17:22:21 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: kernel-dev@igalia.com, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Hung <alex.hung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v8 3/4] kms_async_flips: Refactor data options
Date: Wed,  9 Apr 2025 12:22:05 -0300
Message-ID: <20250409152206.132022-4-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409152206.132022-1-andrealmeid@igalia.com>
References: <20250409152206.132022-1-andrealmeid@igalia.com>
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
index f7a233045..19c781925 100644
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

