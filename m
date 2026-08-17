Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91EAC5B572
	for <igt-dev@archiver.kernel.org>; Mon, 17 Aug 2026 15:13:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CF710E82E;
	Mon, 17 Aug 2026 15:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="aBcCsTYU";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B2F10E825
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Aug 2026 15:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=MIkGTYw2rPdwFghgO0IRy0xzN/SqLUXOVcyavU9bWwE=; b=
 aBcCsTYUV/806yzyW6mBKFBe9vNHIh4CDFQFJ+4GJnPAN9vYOtksuCOEpnQs3Gu/vb0en6yroi0No
 /KR5b7ObUvwbUTwRUxGAxy2HsqTMo0ukoVvJS9qs//YcbBxB3iUwda1HA4K8kcRI1t6JD4h5E0Z/G
 7H6Rvyfct6unH7pAo3wMiYn2CQrOxECogCdMkHMwaft+6i8vlw0I5bHKmq7u6cWrDczNw+zjiFWWW
 mpwBsQHL+ue43etgB1JgM9uZ3tM3PQh3C7U1q6BBKEBNf48F0rZEbx1Xh2lFDHrZ9QES6Q/hBzbgX
 J1dYA8/1RYK2VlaG1tGfrGf2JeKdvEnfKw==;
Received: from 154.red-79-147-121.dynamicip.rima-tde.net ([79.147.121.154]
 helo=killbill) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wvywp-004dea-Qk; Mon, 17 Aug 2026 17:08:23 +0200
From: Melissa Wen <mwen@igalia.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Alex Hung <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>,
 Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland <harry.wentland@amd.com>,
 Uma Shankar <uma.shankar@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 igt-dev@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH i-g-t v4 5/8] lib/igt_kms: extend igt_plane_set_color_pipeline
 to accept Bypass
Date: Mon, 17 Aug 2026 17:07:46 +0200
Message-ID: <20260817150749.66509-6-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260817150749.66509-1-mwen@igalia.com>
References: <20260817150749.66509-1-mwen@igalia.com>
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
behind it, which is what a NULL assigned_color_pipeline already means
internally. Accept NULL and set "Bypass" instead of making callers poke
the property directly, so a plane's assigned pipeline always matches
what was committed.

That makes set_color_pipeline_bypass() a plain alias, so remove it from
kms_colorop_helper and convert its callers, igt_plane_reset() included.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---

v3:
- new patch, replaces the open-coded "Bypass" setting in patch 6
---
 lib/igt_kms.c                                  | 13 ++++++++-----
 tests/chamelium/kms_chamelium_color_pipeline.c |  2 +-
 tests/kms_color_pipeline.c                     |  2 +-
 tests/kms_colorop.c                            |  6 +++---
 tests/kms_colorop_helper.c                     |  5 -----
 tests/kms_colorop_helper.h                     |  1 -
 6 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 00fd7ee2a..e9a14c991 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2707,7 +2707,7 @@ static void igt_plane_reset(igt_plane_t *plane)
 		igt_plane_set_prop_value(plane, IGT_PLANE_HOTSPOT_Y, 0);
 
 	if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
-		igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
+		igt_plane_set_color_pipeline(plane, NULL);
 
 	igt_plane_clear_prop_changed(plane, IGT_PLANE_IN_FENCE_FD);
 	plane->values[IGT_PLANE_IN_FENCE_FD] = ~0ULL;
@@ -4429,17 +4429,20 @@ bool igt_plane_is_valid_colorop(igt_plane_t *plane, igt_colorop_t *colorop)
 /**
  * igt_plane_set_color_pipeline:
  * @plane: Target plane.
- * @colorop: Colorop to set as color pipeline.
+ * @colorop: Colorop to set as color pipeline, or NULL for "Bypass".
  *
  * This function sets the given @colorop as color pipeline on @plane, or fails
- * the test if it's an invalid color pipeline for the plane.
+ * the test if it's an invalid color pipeline for the plane. Passing NULL sets
+ * the plane color pipeline to "Bypass".
  */
 void igt_plane_set_color_pipeline(igt_plane_t *plane, igt_colorop_t *colorop)
 {
-	igt_assert(igt_plane_is_valid_colorop(plane, colorop));
+	igt_assert(!colorop || igt_plane_is_valid_colorop(plane, colorop));
 
 	plane->assigned_color_pipeline = colorop;
-	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, colorop->name);
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
index 16db0b8ad..8648bd7ce 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -224,7 +224,7 @@ static void colorop_plane_test(igt_display_t *display,
 
 	/* reset color pipeline*/
 
-	set_color_pipeline_bypass(plane);
+	igt_plane_set_color_pipeline(plane, NULL);
 
 	/* Commit */
 	igt_plane_set_fb(plane, input_fb);
@@ -255,7 +255,7 @@ static void colorop_plane_test(igt_display_t *display,
 
 	if (!colorops[0]) {
 		/* bypass test */
-		set_color_pipeline_bypass(plane);
+		igt_plane_set_color_pipeline(plane, NULL);
 	} else {
 		/* get COLOR_PIPELINE enum */
 		color_pipeline = get_color_pipeline(display, plane, colorops);
@@ -281,7 +281,7 @@ static void colorop_plane_test(igt_display_t *display,
 	igt_assert(compare_with_bracket(&sw_transform_fb, output_fb));
 
 	/* reset color pipeline*/
-	set_color_pipeline_bypass(plane);
+	igt_plane_set_color_pipeline(plane, NULL);
 
 	/* Commit */
 	igt_plane_set_fb(plane, input_fb);
diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index 5b79fe789..707661378 100644
--- a/tests/kms_colorop_helper.c
+++ b/tests/kms_colorop_helper.c
@@ -398,11 +398,6 @@ void set_color_pipeline(igt_display_t *display,
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
index a081fa02d..4d7d6bb3f 100644
--- a/tests/kms_colorop_helper.h
+++ b/tests/kms_colorop_helper.h
@@ -102,7 +102,6 @@ void set_color_pipeline(igt_display_t *display,
 			igt_plane_t *plane,
 			kms_colorop_t *colorops[],
 			igt_colorop_t *color_pipeline);
-void set_color_pipeline_bypass(igt_plane_t *plane);
 void reset_colorops(kms_colorop_t *colorops[]);
 
 #endif /* __KMS_COLOROP_HELPER_H__ */
-- 
2.53.0

