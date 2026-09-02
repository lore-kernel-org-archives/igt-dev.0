Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B32C61DD6
	for <igt-dev@archiver.kernel.org>; Wed,  2 Sep 2026 18:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B15110F304;
	Wed,  2 Sep 2026 18:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="dIw4Dqro";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77B010F30D
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Sep 2026 18:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=Mavzq6A17SZMU3ZMprtVMR8DVPQRv4AphCqbPY+9ZyU=; b=
 dIw4DqroGb/svZQwsvyMQ63qbygWtPsuiCW0PoJQrVSmYn8w9LsTFfHKADDE/G0lpheFa+7qk8Xqf
 FNH2kIioY5VygGaYXtocLdJNTbjghholcQQ3Ibrl8V27O5EzTj6umu31Rj6Q8hu5TXU4hgrdX3ZZI
 glZkUEceO4LzkfBgaDsbXuAzQTzcvrzrzgq3ZpNMuGl8vxeHVLBfuWB5oTFKkmtV/IY75I/3J3CzC
 TvsBjRBKey2KrYRsyPw79uSwnWrB+fPpbSZEhzLsvoq9vMoozZmQX/Q4e7nmWZSiedacGAbbV1NLs
 a1rLNcoHisiURkxh89rugh6hKmWQSiHkdA==;
Received: from 113.red-79-144-92.dynamicip.rima-tde.net ([79.144.92.113]
 helo=killbill) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1x1pGI-00DxQx-N6; Wed, 02 Sep 2026 20:00:38 +0200
From: Melissa Wen <mwen@igalia.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Alex Hung <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>,
 Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland <harry.wentland@amd.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH i-g-t v5 5/8] lib/igt_kms: extend igt_plane_set_color_pipeline
 to accept Bypass
Date: Wed,  2 Sep 2026 19:58:05 +0200
Message-ID: <20260902180016.303482-6-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902180016.303482-1-mwen@igalia.com>
References: <20260902180016.303482-1-mwen@igalia.com>
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

"Bypass" is just the COLOR_PIPELINE enum value with no colorop object
behind it, so make igt_plane_set_color_pipeline accept NULL and set
"Bypass" instead of making callers poke the property directly. Convert
its callers, igt_plane_reset() included, and drop the now unused
set_color_pipeline_bypass() from kms_colorop_helper.

Keep assigned_color_pipeline pointing at the outgoing pipeline when NULL
is passed: the kernel accepts a colorop update whose pipeline is in the
plane's old state, so reset_colorops() must still be able to finalize
colorop settings in the same commit that deactivates them. No functional
change.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---

v3:
- new patch, replaces the open-coded "Bypass" setting in patch 6
---
 lib/igt_kms.c                                 | 20 +++++++++++++------
 .../chamelium/kms_chamelium_color_pipeline.c  |  2 +-
 tests/kms_color_pipeline.c                    |  2 +-
 tests/kms_colorop.c                           |  6 +++---
 tests/kms_colorop_helper.c                    |  5 -----
 tests/kms_colorop_helper.h                    |  1 -
 6 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 6039ad18a..cabe60a31 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2708,7 +2708,7 @@ static void igt_plane_reset(igt_plane_t *plane)
 		igt_plane_set_prop_value(plane, IGT_PLANE_HOTSPOT_Y, 0);
 
 	if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
-		igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
+		igt_plane_set_color_pipeline(plane, NULL);
 
 	igt_plane_clear_prop_changed(plane, IGT_PLANE_IN_FENCE_FD);
 	plane->values[IGT_PLANE_IN_FENCE_FD] = ~0ULL;
@@ -4430,17 +4430,25 @@ bool igt_plane_is_valid_colorop(igt_plane_t *plane, igt_colorop_t *colorop)
 /**
  * igt_plane_set_color_pipeline:
  * @plane: Target plane.
- * @colorop: Colorop to set as color pipeline.
+ * @colorop: Colorop to set as color pipeline, or NULL for "Bypass".
  *
  * This function sets the given @colorop as color pipeline on @plane, or fails
- * the test if it's an invalid color pipeline for the plane.
+ * the test if it's an invalid color pipeline for the plane. Passing NULL sets
+ * the plane color pipeline to "Bypass" but keeps the previously assigned
+ * pipeline, so that pending colorop changes are still submitted with the
+ * commit that deactivates it, which the kernel accepts because the colorop is
+ * in the plane's old state.
  */
 void igt_plane_set_color_pipeline(igt_plane_t *plane, igt_colorop_t *colorop)
 {
-	igt_assert(igt_plane_is_valid_colorop(plane, colorop));
+	igt_assert(!colorop || igt_plane_is_valid_colorop(plane, colorop));
 
-	plane->assigned_color_pipeline = colorop;
-	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, colorop->name);
+	if (colorop)
+		plane->assigned_color_pipeline = colorop;
+
+	igt_plane_set_prop_enum(plane,
+				IGT_PLANE_COLOR_PIPELINE,
+				colorop ? colorop->name : "Bypass");
 }
 
 /**
diff --git a/tests/chamelium/kms_chamelium_color_pipeline.c b/tests/chamelium/kms_chamelium_color_pipeline.c
index db6107221..5738c6dd1 100644
--- a/tests/chamelium/kms_chamelium_color_pipeline.c
+++ b/tests/chamelium/kms_chamelium_color_pipeline.c
@@ -161,7 +161,7 @@ static void _test_plane_colorops(data_t *data,
 	chamelium_destroy_frame_dump(frame);
 
 	/* Cleanup */
-	set_color_pipeline_bypass(plane);
+	igt_plane_set_color_pipeline(plane, NULL);
 	reset_colorops(colorops);
 
 	igt_plane_set_fb(plane, NULL);
diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index 78860a845..f71416ce1 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -168,7 +168,7 @@ static void _test_plane_colorops(data_t *data,
 	igt_assert_crc_equal(crc_ref, &crc_pipe);
 
 	/* Cleanup per-test state */
-	set_color_pipeline_bypass(plane);
+	igt_plane_set_color_pipeline(plane, NULL);
 	reset_colorops(colorops);
 	igt_plane_set_fb(plane, NULL);
 	igt_display_commit_atomic(&data->display, 0, NULL);
diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 732b9d57f..2bee1eecd 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -287,7 +287,7 @@ static void colorop_plane_test(igt_display_t *display,
 
 	/* reset color pipeline*/
 
-	set_color_pipeline_bypass(plane);
+	igt_plane_set_color_pipeline(plane, NULL);
 
 	/* Commit */
 	igt_plane_set_fb(plane, input_fb);
@@ -315,7 +315,7 @@ static void colorop_plane_test(igt_display_t *display,
 
 	if (!colorops[0]) {
 		/* bypass test */
-		set_color_pipeline_bypass(plane);
+		igt_plane_set_color_pipeline(plane, NULL);
 	} else {
 		/* get COLOR_PIPELINE enum */
 		color_pipeline = get_color_pipeline(display, plane, colorops);
@@ -343,7 +343,7 @@ static void colorop_plane_test(igt_display_t *display,
 	/* Test bypass transition if requested */
 	if (verify_bypass) {
 		/* reset color pipeline*/
-		set_color_pipeline_bypass(plane);
+		igt_plane_set_color_pipeline(plane, NULL);
 
 		/* Commit */
 		igt_plane_set_fb(plane, input_fb);
diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index da234410e..a109c1b06 100644
--- a/tests/kms_colorop_helper.c
+++ b/tests/kms_colorop_helper.c
@@ -450,11 +450,6 @@ void set_color_pipeline(igt_display_t *display,
 	}
 }
 
-void set_color_pipeline_bypass(igt_plane_t *plane)
-{
-	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
-}
-
 static void reset_colorop(kms_colorop_t *colorop)
 {
 	igt_assert(colorop->colorop);
diff --git a/tests/kms_colorop_helper.h b/tests/kms_colorop_helper.h
index 9a1477666..2a0e3799f 100644
--- a/tests/kms_colorop_helper.h
+++ b/tests/kms_colorop_helper.h
@@ -114,7 +114,6 @@ void set_color_pipeline(igt_display_t *display,
 			igt_plane_t *plane,
 			kms_colorop_t *colorops[],
 			igt_colorop_t *color_pipeline);
-void set_color_pipeline_bypass(igt_plane_t *plane);
 void reset_colorops(kms_colorop_t *colorops[]);
 
 #endif /* __KMS_COLOROP_HELPER_H__ */
-- 
2.53.0

