Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB373C25B74
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 08:48:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9E610E14C;
	Fri, 24 May 2024 08:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JBmOgXWa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE25610E14C
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2024 08:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716540500; x=1748076500;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eAjXPiSjWKtkC1nLgKa3Im3x/1PNEOk7CbJiPw7Yrgc=;
 b=JBmOgXWalVaCxgX1r0mNtCUiD5JfGj+zXOQuP2G2tYwt4HDSIT4npfdY
 HrQVC1Dh6xq2s5jyFrxFBSOn6P3Gs15A8JtodRpCQiWy27joQz7A7WweL
 xH/S1/z9hIQnSsN0vRb5TtxGeBQQsK1XhM/AOFhI8pWTxiypRNvB/Ksn0
 pRtMjuBa1hajSpVlyHQDciW+yQqjPH/zSjnIFBEHyTm9eZuq3bjxx8B+c
 IGYGzVWIH0h8nqSJ/Cv8BIqJfdytj3mt31wAM7rIVTDBtuTW3/ahzT2G9
 LCLDrvWdUkn4cPEY2JGltsNlTM64TBZYmc8eRxko8IYFy/Z3FHeJAJwPo g==;
X-CSE-ConnectionGUID: 2dl0wMNCSICu11ORi7VZbA==
X-CSE-MsgGUID: ZeiChOeDSjS/hS36oMOvJA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12692280"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="12692280"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 01:48:20 -0700
X-CSE-ConnectionGUID: j7u7Ti2wTK2jaFIrtxOpGw==
X-CSE-MsgGUID: J1PKp26IQgCsosWi/YId3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="33940853"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa008.fm.intel.com with ESMTP; 24 May 2024 01:48:17 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jeevan.b@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com, Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
Subject: [PATCH i-g-t v2 2/2] tests/kms_plane: Convert to dynamic subtests
Date: Fri, 24 May 2024 14:18:07 +0530
Message-Id: <20240524084807.480971-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524084807.480971-1-pranay.samala@intel.com>
References: <20240524084807.480971-1-pranay.samala@intel.com>
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

The test runs on all pipes on dynamic level to test all the supported
pixel-formats and modifiers on current plane of that pipe.

Updating the test to execute on multiple planes on dynamic level.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_plane.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 9062320e1..55473f61e 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -351,10 +351,11 @@ test_plane_position(data_t *data, enum pipe pipe)
 	test_init(data, pipe);
 	test_grab_crc(data, output, pipe, &green, data->flags, &reference_crc);
 
-	for (int plane = 1; plane < n_planes; plane++)
-		test_plane_position_with_output(data, pipe, plane,
-						output, &reference_crc,
-						data->flags);
+	for (int plane = 1; plane < n_planes; plane++) {
+		igt_dynamic_f("pipe-%s-plane-%d", kmstest_pipe_name(pipe), plane)
+			test_plane_position_with_output(data, pipe, plane, output,
+							&reference_crc, data->flags);
+	}
 
 	test_fini(data);
 }
@@ -1216,7 +1217,8 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 	for_each_plane_on_pipe(&data->display, pipe, plane) {
 		if (skip_plane(data, plane))
 			continue;
-		result &= test_format_plane(data, pipe, output, plane, &primary_fb);
+		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(pipe), plane->index)
+			result &= test_format_plane(data, pipe, output, plane, &primary_fb);
 	}
 
 	test_fini(data);
@@ -1322,14 +1324,19 @@ static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
 			continue;
 
 		igt_output_set_pipe(data->output, PIPE_NONE);
-		igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
-			test(data, pipe);
+		test(data, pipe);
 
 		if (is_pipe_limit_reached(++count))
 			break;
 	}
 }
 
+static void dynamic_test_handler(data_t *data, enum pipe pipe)
+{
+	igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+		test_plane_panning(data, pipe);
+}
+
 static void
 run_tests_for_pipe_plane(data_t *data)
 {
@@ -1366,20 +1373,20 @@ run_tests_for_pipe_plane(data_t *data)
 	igt_describe("verify plane panning at top-left position using primary plane");
 	igt_subtest_with_dynamic_f("plane-panning-top-left") {
 		data->flags = TEST_PANNING_TOP_LEFT;
-		run_test(data, test_plane_panning);
+		run_test(data, dynamic_test_handler);
 	}
 
 	igt_describe("verify plane panning at bottom-right position using primary plane");
 	igt_subtest_with_dynamic_f("plane-panning-bottom-right") {
 		data->flags = TEST_PANNING_BOTTOM_RIGHT;
-		run_test(data, test_plane_panning);
+		run_test(data, dynamic_test_handler);
 	}
 
 	igt_describe("verify plane panning at bottom-right position using primary plane and executes system"
 		       "suspend cycles");
 	igt_subtest_with_dynamic_f("plane-panning-bottom-right-suspend") {
 		data->flags = TEST_PANNING_BOTTOM_RIGHT | TEST_SUSPEND_RESUME;
-		run_test(data, test_plane_panning);
+		run_test(data, dynamic_test_handler);
 	}
 
 	igt_describe("verify planar settings for pixel format are accepted or rejected correctly");
-- 
2.34.1

