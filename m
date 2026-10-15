Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E8FCC6B34
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 13:21:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E838310EBBD;
	Thu, 15 Oct 2026 13:20:56 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D77410E168
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 13:17:00 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2e977109392so44635ad.0
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 06:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792070220; x=1792675020; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qgWT3W9fuLSblB6L8xq1RRaKTp9pry8bfezSOAVSvmw=;
 b=mxf3mLo17TzhWanxSDdI4Qsq5ip8vktNchK4F/ILBC5v8CDY0s8KcYzLm/Mq0mzq6D
 ordeS7VBx66vNjFlK0QfjtIztZQzFIOYS18Naqm1WC94peCAPrnJiZAPivoMw02ZPRxl
 anL4wRp71sUScD/NLMmVJze4iVlCp8pt/a5beN7MDovAnIIJEMvkaLOFYnmrkb/YfyMj
 BoVK07dnGMuduN4IpNFqr1H0ii/sC3vGCzO7lZmvS3pQjX2HHi2ag9GPCzJVDoilJ+YN
 aLoa3+cjVUhaudVn36CW569rBrqQ9aXYOB24/XmQwAhrTYjSExSzdfc+pNEgr8QjK8uf
 l/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792070220; x=1792675020;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=qgWT3W9fuLSblB6L8xq1RRaKTp9pry8bfezSOAVSvmw=;
 b=VMvBTJop921sphOjxT9/DbxrGBlVbfSz6dkxaL/C6UDB4177QRBgLd7tu8YvdcwFpl
 N8iGo1G4RY/oCwLD8Ps2OvD4HqE5sXLa1Ei1qqvmFoRKIPNhpKmBXuhg65YWIg4/xsbW
 HkPjmPtuplkkpI3crwxjYid0Cy+9h0bGZtrU2kT0GKNo36RMFYAWg572OEukEbLInKDm
 W8m4Xc6AbTfiIg9pq2Umw6vwtXHXu1W3mFsGyJnwPoRvX0NAL6aFKwF1EmKHzabnmLIR
 Mh1yh558+8qo/IMZ56GqHorSLrM05uLxTKI2dDyk1fiAi6gEPpfPPU5iglvwuqktQszo
 uvmg==
X-Gm-Message-State: AFq9FYLbZ2Mp0mEAWumFNfuOrKw8rJJDeamto543bDk2PlrbWw4mq8gL
 Jgr4aRhl96VGdX5XJrt2DHOliRaPqeL03Zux8OS9/Qu3dVFss1b5Mzii9IHk08LNxUw=
X-Gm-Gg: AYBFou0c0Yvumx4hzuF7MAOwwrMuG+0fGR3aBzJRUW0hKvvymMt91iGNekxLK3rf/9D
 hjIQUaIb46fBk8n9t1Y/yV7403QlX8P/GWIl99I+sxRemZT+3yiXSanqXYCoa5e/Yo/WSKmJ1Iz
 IyLLdhbVnCMMxu1OC36Fs1rpjt2wtUbbJaeY6VDLOJ+W+ttIrdpZ68Sv8dnyVWLkp1jH6jfNAi1
 W7ZnCAyVkmgUx49hAfl4LdSJcDmsEbEhB0cQGpBTVBmYGhjvWd3RgFuTotZCSjITYVCxneZtYNk
 ojB37KPGN5jGUnimuha7NadWjoMxu73481jZe2fi/hgww3gGs96M77831ftsM/07dICK4ocpiWC
 NwPa+7RkUDmG5tWSHFdEDzkPpsy7MDh2shNDxJRCBMXiqLRy4Bzoq/9WQrWonK78oA+0/FqSrPK
 bAnvjV2PNLiZRooCjLzEHxwdVjPbCs7hEKkpKAqrEkC9tyfU2PcvfFVxdQN2iTWlFVjb+QDGTxq
 zhCdI1c+YHnfuDkJ/Ph586+2ShuynjQYVGz
X-Received: by 2002:a17:903:1b6b:b0:2bf:7b62:a038 with SMTP id
 d9443c01a7336-2e842aba3fcmr174009355ad.9.1792070219609; 
 Thu, 15 Oct 2026 06:16:59 -0700 (PDT)
Received: from localhost ([134.134.137.74]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e944c23f17sm17677545ad.27.2026.10.15.06.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 06:16:59 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 6/9] tests/kms_plane_scaling: run plane-*-max-crc on all
 pipes
Date: Thu, 15 Oct 2026 16:16:13 +0300
Message-ID: <20261015131616.3172918-6-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015131616.3172918-1-juhapekka.heikkila@gmail.com>
References: <20261015131616.3172918-1-juhapekka.heikkila@gmail.com>
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

Instead of testing only the pipe driving the highest native resolution,
run the max scaling crc tests on every pipe that has a scaler, each with
the valid output that has the largest native mode on that pipe.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane_scaling.c | 82 +++++++++++++++------------------------
 1 file changed, 31 insertions(+), 51 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 4118f0dd1..14298df3c 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -1127,7 +1127,8 @@ test_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 	uint32_t format;
 
 	plane = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
-	igt_require(plane);
+	if (!plane)
+		return;
 
 	igt_vec_init(&tested_formats, sizeof(uint32_t));
 
@@ -1768,47 +1769,42 @@ crtc_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
 	return ret;
 }
 
-static bool
-find_native_res_crtc_output(data_t *d, igt_crtc_t **found_crtc,
-			    igt_output_t **found_output)
+static igt_output_t *
+scale_output_for_crtc(data_t *d, igt_crtc_t *crtc)
 {
 	igt_display_t *display = &d->display;
-	igt_crtc_t *crtc;
-	igt_output_t *output;
+	igt_output_t *output, *best = NULL;
 	uint64_t best_area = 0;
 
-	*found_crtc = NULL;
-	*found_output = NULL;
-
-	for_each_crtc_with_valid_output(display, crtc, output) {
-		drmModeModeInfo *mode;
-		uint64_t area;
+	if (igt_crtc_num_scalers(crtc) < 1)
+		return NULL;
 
-		if (!crtc_output_combo_valid(display, crtc, output))
-			continue;
-		if (igt_crtc_num_scalers(crtc) < 1)
-			continue;
+	for_each_valid_output_on_crtc(display, crtc, output) {
+		drmModeModeInfo *mode = &output->config.default_mode;
+		uint64_t area = (uint64_t)mode->hdisplay * mode->vdisplay;
 
-		mode = &output->config.default_mode;
-		area = (uint64_t)mode->hdisplay * mode->vdisplay;
-		if (area <= best_area)
+		if (area <= best_area ||
+		    !crtc_output_combo_valid(display, crtc, output))
 			continue;
 
 		best_area = area;
-		*found_crtc = crtc;
-		*found_output = output;
+		best = output;
 	}
 
-	if (!*found_crtc)
-		return false;
+	return best;
+}
 
-	igt_debug("Selected pipe %s output %s (native mode %dx%d) for "
-		  "max scaling testing\n",
-		  igt_crtc_name(*found_crtc), igt_output_name(*found_output),
-		  (*found_output)->config.default_mode.hdisplay,
-		  (*found_output)->config.default_mode.vdisplay);
+static void
+test_scale_max_crc_pipes(data_t *d, uint64_t modifier, enum scale_dir dir)
+{
+	igt_crtc_t *crtc;
 
-	return true;
+	for_each_crtc(&d->display, crtc) {
+		igt_output_t *output = scale_output_for_crtc(d, crtc);
+
+		if (output)
+			test_scale_max_crc(d, crtc, output, modifier, dir);
+	}
 }
 
 static int opt_handler(int opt, int opt_index, void *_data)
@@ -2115,17 +2111,9 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 				     "output matches an unscaled reference using "
 				     "CRCs.");
 			igt_subtest_with_dynamic_f("plane-downscale-max-crc-%s",
-						   scale_modifiers[m].name) {
-				igt_crtc_t *sel_crtc;
-				igt_output_t *sel_output;
-
-				igt_require(find_native_res_crtc_output(&data,
-									&sel_crtc,
-									&sel_output));
-
-				test_scale_max_crc(&data, sel_crtc, sel_output,
-						   modifier, SCALE_DOWN);
-			}
+						   scale_modifiers[m].name)
+				test_scale_max_crc_pipes(&data, modifier,
+							 SCALE_DOWN);
 
 			igt_describe("Probe the maximum horizontal and vertical "
 				     "plane upscaling factor for each supported "
@@ -2133,17 +2121,9 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 				     "output matches an unscaled reference using "
 				     "CRCs.");
 			igt_subtest_with_dynamic_f("plane-upscale-max-crc-%s",
-						   scale_modifiers[m].name) {
-				igt_crtc_t *sel_crtc;
-				igt_output_t *sel_output;
-
-				igt_require(find_native_res_crtc_output(&data,
-									&sel_crtc,
-									&sel_output));
-
-				test_scale_max_crc(&data, sel_crtc, sel_output,
-						   modifier, SCALE_UP);
-			}
+						   scale_modifiers[m].name)
+				test_scale_max_crc_pipes(&data, modifier,
+							 SCALE_UP);
 		}
 	}
 
-- 
2.43.0

