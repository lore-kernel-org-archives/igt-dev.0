Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8268AE9D40F
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 16:58:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241B610E6F1;
	Wed,  4 Feb 2026 16:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L3YwvU3v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A673B10E6F3
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 16:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770224292; x=1801760292;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tyDKzNP5JuJ6fWkFnY0GthbH5WjOfFjGUPZsAs5xAoM=;
 b=L3YwvU3v17N7WVvV8aSdGQ9s07nNN5RX3CBNWglTRl0hoBHLHmFcqb75
 I99n8tqCQwbNj5i2MbD35P1HGvEjBV2q8QvI3S2QcUja4e+4f+p+ecRVv
 8TV1zrTL1/pJZwipL7mfqd4KUe2/ohGC4Dv2Yn99SI3Jwdflq7ywwwBV7
 2Fl4guL+oHVQjAkYWIEHeCpZyPHD2/4KYCBZH/vzPa1yvptt8s27zs5Dy
 HD7N6jBE0tmf9tJZIC0EYERpyne8HEaMFPgyw2+gc2BewmblaUtcAF5A/
 WdrC6CBqazOpaDhAyGlpbV02XuIAPzlPaZdXz0p4yK3ikgfpsCuapdT47 A==;
X-CSE-ConnectionGUID: L7qe6aN9RuqJV4lfHrAxbA==
X-CSE-MsgGUID: Vk4f8eOVTWaG6/ILtAB1Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71580083"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="71580083"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:57:55 -0800
X-CSE-ConnectionGUID: k8ZY/PChS3aVc7mJaR4p3Q==
X-CSE-MsgGUID: pbnAHqFyQ72lO8UMGnjeLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="210253003"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:57:53 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v8 6/9] tests/kms_writeback: Remove unused invalid_fb
 parameter
Date: Wed,  4 Feb 2026 22:48:15 +0530
Message-ID: <20260204171819.292327-7-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204171819.292327-1-sowmiya.s@intel.com>
References: <20260204171819.292327-1-sowmiya.s@intel.com>
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

Remove the invalid_fb/output_fb parameter since it is not used
anywhere in the test.

v7: Remove invalid_fb in a separate patch as per review (Suraj)
v8: Move this patch before refactoring writeback-fb-id test (Suraj)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_writeback.c | 26 +++-----------------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 63917bf4f..0c423d58c 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -300,7 +300,7 @@ static void test_invalid_parameters(igt_output_t *output, igt_fb_t *valid_fb, ig
 	}
 }
 
-static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb, igt_fb_t *invalid_fb)
+static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb)
 {
 
 	int ret;
@@ -701,36 +701,16 @@ int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 
 	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid options");
 	igt_subtest("writeback-fb-id") {
-		igt_fb_t output_fb;
-
 		igt_skip_on(data.dump_check || data.list_modes);
 		igt_skip_on_f(!(data.supported_colors & XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
-		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
-				      DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &output_fb);
-		igt_require(fb_id > 0);
-
-		writeback_fb_id(output, &input_fb, &output_fb);
-
-		igt_remove_fb(display.drm_fd, &output_fb);
+		writeback_fb_id(output, &input_fb);
 	}
 
 	igt_describe("Validate XRGB2101010 WRITEBACK_FB_ID with valid and invalid options");
 	igt_subtest("writeback-fb-id-XRGB2101010") {
-		igt_fb_t output_fb;
-
 		igt_skip_on(data.dump_check || data.list_modes);
 		igt_skip_on_f(!(data.supported_colors & XRGB2101010), "DRM_FORMAT_XRGB2101010 is unsupported\n");
-		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
-				      DRM_FORMAT_XRGB2101010,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &output_fb);
-		igt_require(fb_id > 0);
-
-		writeback_fb_id(output, &input_fb_10bit, &output_fb);
-
-		igt_remove_fb(display.drm_fd, &output_fb);
+		writeback_fb_id(output, &input_fb_10bit);
 	}
 
 	igt_describe("Check writeback output with CRC validation");
-- 
2.43.0

