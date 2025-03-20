Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDBEC36000
	for <igt-dev@archiver.kernel.org>; Thu, 20 Mar 2025 14:00:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C905E10E3A8;
	Thu, 20 Mar 2025 14:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="WSsBTWxw";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5FA10E60D
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Mar 2025 14:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AL1EGrTc4pG3GjQuFRFpiL4V4Kpjesc8p6Pz5NWnJA0=; b=WSsBTWxwj/7LraMv70LkiifRm1
 O+2kuA8U4p1P8Lu1jznRc70ulNb9pSiKbpSH7TLroMEGRzJFcaUCPxZNLwDBNKzV+eg5U40k+g8HM
 96vo9UWdA6akbGZpiXZvYoHCKuuxQGVW7m9WpUT9eWP4dIdIAF38vbw9xNOM0jsIqfvoaZPGVyGIQ
 VaqNdaTqUjXOHM5HyeXXDUIqS6pOUZBHzJOf+wuHvHwakSUDuhQwslEr7bjMZpWtdgdOupUPaNNnB
 d1pg9OT0scX3dK9iOOSNl7SO/cZPubyUAjKRK3NXZdAyoQxbzTxOBiUTjMKn1m4OHnmQgf1xMuIU7
 Kcc1z0Rg==;
Received: from [179.98.221.3] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tvGRq-003kht-VU; Thu, 20 Mar 2025 15:00:39 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: kernel-dev@igalia.com, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Hung <alex.hung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v3 1/2] kms_async_flips: Refactor data options
Date: Thu, 20 Mar 2025 11:00:29 -0300
Message-ID: <20250320140030.557446-2-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320140030.557446-1-andrealmeid@igalia.com>
References: <20250320140030.557446-1-andrealmeid@igalia.com>
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
---
 tests/kms_async_flips.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index da426f753..d4af9b383 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -708,6 +708,9 @@ static void run_test(data_t *data, void (*test)(data_t *))
 			test(data);
 		}
 	}
+
+	data->alternate_sync_async = false;
+	data->atomic_path = false;
 }
 
 static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
@@ -738,6 +741,9 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 			}
 		}
 	}
+
+	data->alternate_sync_async = false;
+	data->atomic_path = false;
 }
 
 static data_t data;
@@ -757,6 +763,9 @@ igt_main
 
 		if (is_intel_device(data.drm_fd))
 			data.bops = buf_ops_create(data.drm_fd);
+
+		data.alternate_sync_async = false;
+		data.atomic_path = false;
 	}
 
 	igt_describe("Verify the async flip functionality and the fps during async flips");
@@ -766,8 +775,6 @@ igt_main
 
 		igt_describe("Wait for page flip events in between successive asynchronous flips");
 		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
-			data.alternate_sync_async = false;
-			data.atomic_path = false;
 			if (is_intel_device(data.drm_fd))
 				run_test_with_modifiers(&data, test_async_flip);
 			else
@@ -777,7 +784,6 @@ igt_main
 		igt_describe("Wait for page flip events in between successive "
 			     "asynchronous flips using atomic path");
 		igt_subtest_with_dynamic("async-flip-with-page-flip-events-atomic") {
-			data.alternate_sync_async = false;
 			data.atomic_path = true;
 			if (is_intel_device(data.drm_fd))
 				run_test_with_modifiers(&data, test_async_flip);
@@ -788,7 +794,6 @@ igt_main
 		igt_describe("Alternate between sync and async flips");
 		igt_subtest_with_dynamic("alternate-sync-async-flip") {
 			data.alternate_sync_async = true;
-			data.atomic_path = false;
 			run_test(&data, test_async_flip);
 		}
 
@@ -802,7 +807,6 @@ igt_main
 		igt_describe("Verify that the async flip timestamp does not "
 			     "coincide with either previous or next vblank");
 		igt_subtest_with_dynamic("test-time-stamp") {
-			data.atomic_path = false;
 			run_test(&data, test_timestamp);
 		}
 
@@ -825,7 +829,6 @@ igt_main
 			      "PSR2 sel fetch causes cursor to be added to primary plane "
 			      "pages flips and async flip is not supported in cursor\n");
 
-		data.atomic_path = false;
 		run_test(&data, test_cursor);
 	}
 
@@ -853,7 +856,6 @@ igt_main
 		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
 						       I915_FORMAT_MOD_Y_TILED));
 
-		data.atomic_path = false;
 		run_test(&data, test_invalid);
 	}
 
@@ -876,7 +878,6 @@ igt_main
 		/* Devices without CRC can't run this test */
 		igt_require_pipe_crc(data.drm_fd);
 
-		data.atomic_path = false;
 		run_test(&data, test_crc);
 	}
 
-- 
2.49.0

