Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6ECC36014
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 22:16:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFEBA10E188;
	Thu, 27 Mar 2025 22:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="S8WgNrwh";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B0110E183
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 22:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nQ34Vw2pPbX80xohp3kwbaeP6tLHBQ4+4RxunS5UDGo=; b=S8WgNrwhJQH28KQoqHyDyHxzdJ
 sTkVRiK2YV2QnpN+jOfQnsBor+e0G8mGjb2JDZQl63YXyEbXAes793YDZdOusBGGPRMs+MYvs7BuQ
 CZSl4pqcbRSekETJnAXF6N+08XSL+xauAxK491HMu7BJ7/RfWqxdGDrLnen/BS4gPydtTZCVSAx9a
 7VD7aLGMj1yEyTDGtNrr82w7Z+IVxg0siMBNOXjsFrv5Nzc2avA17Og0Me0NjfXVJuTPp7qr5q8wJ
 ukzzUpg/+Ws8+fOH8VO4OvzbQc1xRr6Qk569mLxXtXlLH62sGterT6sWYqCpczDyKYDYXVO7fqna2
 5q8A4m6Q==;
Received: from [191.204.197.72] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1txvWI-007Qr7-EH; Thu, 27 Mar 2025 23:16:14 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: kernel-dev@igalia.com, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Hung <alex.hung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v4 2/3] kms_async_flips: Refactor data options
Date: Thu, 27 Mar 2025 19:16:00 -0300
Message-ID: <20250327221601.19086-3-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250327221601.19086-1-andrealmeid@igalia.com>
References: <20250327221601.19086-1-andrealmeid@igalia.com>
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
 tests/kms_async_flips.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 2975925c2..5c7e1ae13 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -230,6 +230,12 @@ static void test_init(data_t *data)
 	data->plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
 }
 
+static void test_finish(data_t *data)
+{
+	data->alternate_sync_async = false;
+	data->atomic_path = false;
+}
+
 static void test_init_fbs(data_t *data)
 {
 	int i;
@@ -717,6 +723,8 @@ static void run_test(data_t *data, void (*test)(data_t *))
 			test(data);
 		}
 	}
+
+	test_finish(data);
 }
 
 static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
@@ -750,6 +758,8 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 			}
 		}
 	}
+
+	test_finish(data);
 }
 
 static data_t data;
@@ -778,8 +788,6 @@ igt_main
 
 		igt_describe("Wait for page flip events in between successive asynchronous flips");
 		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
-			data.alternate_sync_async = false;
-			data.atomic_path = false;
 			if (is_intel_device(data.drm_fd))
 				run_test_with_modifiers(&data, test_async_flip);
 			else
@@ -789,7 +797,6 @@ igt_main
 		igt_describe("Wait for page flip events in between successive "
 			     "asynchronous flips using atomic path");
 		igt_subtest_with_dynamic("async-flip-with-page-flip-events-atomic") {
-			data.alternate_sync_async = false;
 			data.atomic_path = true;
 			if (is_intel_device(data.drm_fd))
 				run_test_with_modifiers(&data, test_async_flip);
@@ -800,7 +807,6 @@ igt_main
 		igt_describe("Alternate between sync and async flips");
 		igt_subtest_with_dynamic("alternate-sync-async-flip") {
 			data.alternate_sync_async = true;
-			data.atomic_path = false;
 			run_test(&data, test_async_flip);
 		}
 
@@ -814,7 +820,6 @@ igt_main
 		igt_describe("Verify that the async flip timestamp does not "
 			     "coincide with either previous or next vblank");
 		igt_subtest_with_dynamic("test-time-stamp") {
-			data.atomic_path = false;
 			run_test(&data, test_timestamp);
 		}
 
@@ -837,7 +842,6 @@ igt_main
 			      "PSR2 sel fetch causes cursor to be added to primary plane "
 			      "pages flips and async flip is not supported in cursor\n");
 
-		data.atomic_path = false;
 		run_test(&data, test_cursor);
 	}
 
@@ -865,7 +869,6 @@ igt_main
 		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
 						       I915_FORMAT_MOD_Y_TILED));
 
-		data.atomic_path = false;
 		run_test(&data, test_invalid);
 	}
 
@@ -888,7 +891,6 @@ igt_main
 		/* Devices without CRC can't run this test */
 		igt_require_pipe_crc(data.drm_fd);
 
-		data.atomic_path = false;
 		run_test(&data, test_crc);
 	}
 
-- 
2.49.0

