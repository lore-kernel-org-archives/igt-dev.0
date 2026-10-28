Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA22606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 14:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SIAho/HL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065B810FD11;
	Wed, 28 Oct 2026 14:56:05 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9360810FCF2
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 14:53:00 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-3ae6b4c669fso156423a91.0
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 07:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793199180; x=1793803980; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MFhMEe9STQyWG9H42xsw/wbuyV0p/rNcR3lpdA1xkHs=;
 b=SIAho/HLZ/9EbmhfHSaSgpVqG4FoRzqNzNy/wDXOAdiDZlspI2dLESLmpqp75/MrrT
 HcVf8ccBEjeOX7i+i0nvRETHHiBCESmC61p21jhnVcseYCBRUF3f6s/ThpK7g0ojzNu+
 ndOKeS6e6s6Ai6y8hL/T0rlAmUYAVAwgfWPk0ZVVnMIrhsN+aJP+EP2za/osw4TfzOfE
 CAANLG7ojCGpjUK4Ah2hTaThnRk17x+GZn0PIPbxooqFVQPDkdAmcFDvzZgl6RgHKEwI
 QiZ3/tcpBBI6L4mOhl8/3m/WQFhr/r7KaBfwwFRhixUBsdNk2MpPXGLEOOhXDuhuMcY4
 vuhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793199180; x=1793803980;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=MFhMEe9STQyWG9H42xsw/wbuyV0p/rNcR3lpdA1xkHs=;
 b=QIDcAveEZR0S3+3vdW8IOrUNN2ck3bAKdcIJHeRn6RG9TFzZOPScU4PP6hU0gEXBtS
 wE9DHPuTtpeI7sP5yNCDI/N1pZSBj8hwGYMOZPtCdZB9KLiRED+1of7UsKwPqFjjZ0D2
 dpl9GwP/PdBLuj3F5xQhtEbCFzZwp/BpUkDs0KLPvu5K7Xe4i5AkpkTsh310oZNG3GsE
 5EvQoYXuhNrF1l/zv8Pe8yLBNy45G5XqUbOagqSujV9HAO6jSUJlcttM4osTpFdDDXQp
 Lsfp12nPGOgFnSHw744U5S55i51zCqW9EGA6Wrq48SiBt3k/7B/Ojze3Bklo8V7ADLCm
 a+pA==
X-Gm-Message-State: AFq9FYJ4cTM6z9a1ignwcYPOIyeBVyA1rrnWFdC8NW7dgOTHi5lcd+Gl
 A0TGw6evkz79IcOlqnnq24mAZTdt4ijqkeL5GX5aR0lV+nV+VQeKsQ2YE8FWac+cUv8=
X-Gm-Gg: AYBFou0DjtyehR8xE7K0EpWJ7/4YfyoeG0cno4Yom1Km8TG83+7Bd5DbhXNivgAU/TT
 Nv4gwdPEBl/Rjkr2shv7AM9qxaGE1PlnaPhx09laBLcxjsnb80ztQEI0WvQtTi9SbWqj3539K1c
 xa48WdYgNC5gXsX148sl/LKwExgR4jE26UjxnQr5pKRDJXi+VMjO6ALeolqTSucWWskjKusdGcI
 M14+LmfBXzCNRWmAD61jbJx/m2/7SACF2r4/sOF7tNM/RRVXFa0qQ4iIP0Pf7VEnDBBxqS5VwJY
 FB277vkE1gBPssrrPrHQWQu/C7wRFnABSfxD4D2qzWDk4iRmpL8K3XNk+zrEaJMpB81u1dWZlqZ
 +DFE1Vilm3BjLDTxmgENKnusW3DECuqjWqt9x+NatuCCCvII+IeLlpxEjuunqOdtHvHucMTTMHx
 vB4Of1D9uq59e5FdUEQqeAtUDKyZP9CRolXo1XqN2r+1iNJuZqtX0u7A80QozGvfjvXUj2DKSh9
 4mupQHcsLnNF33oOq2MCzeegvLUaX9fH5NoIi7aHlf54QvnWQbnv1KWxLttwZFo5quT2cNrgA9e
 qgocrQ2AMX+jpGx+55igArAjBylGlK8xxHb7QayNp8uzXXrmlvIwNoRQCtft24+Abw==
X-Received: by 2002:a17:90b:4b07:b0:3ab:a3ee:339b with SMTP id
 98e67ed59e1d1-3ae404167ddmr4024771a91.35.1793199179980; 
 Wed, 28 Oct 2026 07:52:59 -0700 (PDT)
Received: from localhost ([192.55.54.47]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cdacea7938bsm2544480a12.27.2026.10.28.07.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 07:52:59 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 06/10] tests/kms_plane_scaling: run plane-*-max-crc on
 all pipes
Date: Wed, 28 Oct 2026 16:51:58 +0200
Message-ID: <20261028145202.3128915-6-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028145202.3128915-1-juhapekka.heikkila@gmail.com>
References: <20261028145202.3128915-1-juhapekka.heikkila@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Instead of testing only the pipe driving the highest native resolution,
run the max scaling crc tests on every pipe that has a scaler, each with
the valid output that has the largest native mode on that pipe.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane_scaling.c | 80 ++++++++++++++-------------------------
 1 file changed, 29 insertions(+), 51 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 957a4ab61..2e7434b7e 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -1128,7 +1128,6 @@ test_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *output,
 	uint32_t format;
 
 	plane = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
-	igt_require(plane);
 
 	igt_vec_init(&tested_formats, sizeof(uint32_t));
 
@@ -1769,47 +1768,42 @@ crtc_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
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
+	if (igt_crtc_num_scalers(crtc) < 1)
+		return NULL;
 
-	for_each_crtc_with_valid_output(display, crtc, output) {
-		drmModeModeInfo *mode;
-		uint64_t area;
+	for_each_valid_output_on_crtc(display, crtc, output) {
+		drmModeModeInfo *mode = &output->config.default_mode;
+		uint64_t area = (uint64_t)mode->hdisplay * mode->vdisplay;
 
-		if (!crtc_output_combo_valid(display, crtc, output))
-			continue;
-		if (igt_crtc_num_scalers(crtc) < 1)
-			continue;
-
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
+
+static void
+test_scale_max_crc_pipes(data_t *d, uint64_t modifier, enum scale_dir dir)
+{
+	igt_crtc_t *crtc;
 
-	igt_debug("Selected pipe %s output %s (native mode %dx%d) for "
-		  "max scaling testing\n",
-		  igt_crtc_name(*found_crtc), igt_output_name(*found_output),
-		  (*found_output)->config.default_mode.hdisplay,
-		  (*found_output)->config.default_mode.vdisplay);
+	for_each_crtc(&d->display, crtc) {
+		igt_output_t *output = scale_output_for_crtc(d, crtc);
 
-	return true;
+		if (output)
+			test_scale_max_crc(d, crtc, output, modifier, dir);
+	}
 }
 
 static int opt_handler(int opt, int opt_index, void *_data)
@@ -2116,17 +2110,9 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
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
@@ -2134,17 +2120,9 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
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

