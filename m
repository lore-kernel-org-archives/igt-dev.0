Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FBFC83F27
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 09:21:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB3A10E75C;
	Wed, 16 Jul 2025 09:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yamqg9hA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A22410E75C
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 09:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752657665; x=1784193665;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PuW76IUTY/wXhivew4RAF6QWF+YQal7RoiaOh+0RKPc=;
 b=Yamqg9hAmACbRr/z7q6UBOLvQR2RByRsE0bAbSi1yjFW0vDDyw+5bZK/
 lpWJfRUqFBNj5QP+7vv/Vymwpggi7tROy2KjPuT6sdV7w3y0NXfPJUTk7
 kc5E+8LEBGeIjY3ezAD6DshkijCMxviPynykz9yZTHG2ZN27W3UP/OWzR
 nZNt1+H+fX3SRY33tH+geCDkjW5/+du7DIZnuyxtwacaV6vdjRg3LBiCC
 8oZPB52EWeVzEUJelpSwkvpkm8GBqFEIFkuhB3gp32aA7+C7o/85WOdyC
 gGGEYJgTCwPxSnX5QznfkYPYNS4s4CQNwW8MaUOV9IVpUEBC8AS0xxANJ Q==;
X-CSE-ConnectionGUID: 99cyzB9HRYqMtV/o53urGA==
X-CSE-MsgGUID: 1dK1Ow/VQFmGWaaMQ9bDaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54005882"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="54005882"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 02:21:05 -0700
X-CSE-ConnectionGUID: F+zQlc75QeyFjB6BmQrQqA==
X-CSE-MsgGUID: sj9veSPpT3O+CfuLlIWCyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="161775905"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 02:21:03 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, pranay.samala@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 2/2] tests/kms_plane: Split pixel format tests by
 RGB/YUV filtering
Date: Wed, 16 Jul 2025 14:50:36 +0530
Message-ID: <20250716092036.301862-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716092036.301862-1-ramanaidu.naladala@intel.com>
References: <20250716092036.301862-1-ramanaidu.naladala@intel.com>
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

Introduced dynamic subtests for each pixel format type, covering
both clamped and unclamped scenarios.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane.c | 48 +++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 8 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index f7b672c7a..cb89e74c0 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -72,13 +72,18 @@
  */
 
 /**
- * SUBTEST: pixel-%s
+ * SUBTEST: pixel-format-%s
  * Description: verify the pixel formats for given plane and pipe
  *
+ * SUBTEST: pixel-format-%s-source-clamping
+ * Description: verify the pixel formats with source clamping for given
+ *		plane and pipe
+ *
  * arg[1]:
  *
- * @format:
- * @format-source-clamping:          with source clamping
+ * @rgb:	rgb
+ * @planar:	planar
+ * @packed:	packed
  */
 
 /*
@@ -114,6 +119,7 @@ typedef struct {
 	uint32_t crop;
 	bool extended;
 	unsigned int flags;
+	const char *pixel_format_type;
 } data_t;
 
 static bool all_pipes;
@@ -1106,6 +1112,18 @@ static void test_format_plane(data_t *data, enum pipe pipe,
 		    f.modifier == ref.modifier)
 			continue;
 
+		if (strcmp(data->pixel_format_type, "packed") == 0) {
+			if (!igt_format_is_packedyuv(f.format))
+				continue;
+		} else if (strcmp(data->pixel_format_type, "planar") == 0) {
+			if (!igt_format_is_planaryuv(f.format))
+				continue;
+		} else if (strcmp(data->pixel_format_type, "rgb") == 0) {
+			if (igt_format_is_packedyuv(f.format) ||
+			    igt_format_is_planaryuv(f.format))
+				continue;
+		}
+
 		if (skip_format_mod(data, f.format, f.modifier, &tested_formats)) {
 			igt_info("Skipping format " IGT_FORMAT_FMT " / modifier "
 				 IGT_MODIFIER_FMT " on %s.%u\n",
@@ -1348,14 +1366,28 @@ static void dynamic_test_handler(data_t *data, enum pipe pipe)
 static void
 run_tests_for_pipe_plane(data_t *data)
 {
+	uint32_t z;
+	const char *append[3] = {
+		"rgb",
+		"planar",
+		"packed"
+	};
+
 	igt_describe("verify the pixel formats for given plane and pipe");
-	igt_subtest_with_dynamic_f("pixel-format")
-		run_test(data, test_pixel_formats);
+	for (z = 0; z < ARRAY_SIZE(append); z++) {
+		igt_subtest_with_dynamic_f("pixel-format-%s", append[z]) {
+			data->pixel_format_type = append[z];
+			run_test(data, test_pixel_formats);
+		}
+	}
 
 	igt_describe("verify the pixel formats for given plane and pipe with source clamping");
-	igt_subtest_with_dynamic_f("pixel-format-source-clamping") {
-		data->crop = 4;
-		run_test(data, test_pixel_formats);
+	for (z = 0; z < ARRAY_SIZE(append); z++) {
+		igt_subtest_with_dynamic_f("pixel-format-%s-source-clamping", append[z]) {
+			data->crop = 4;
+			data->pixel_format_type = append[z];
+			run_test(data, test_pixel_formats);
+		}
 	}
 
 	data->crop = 0;
-- 
2.43.0

