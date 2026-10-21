Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9440C606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 21 Oct 2026 15:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=nW4JR0Me
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4862410E031;
	Wed, 21 Oct 2026 15:26:40 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7FF10F4E3
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 15:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=HNObdddPHefyLRj9VjoJWSxpXaOvDXx4kkuwwoBvzf4=; b=
 nW4JR0MepLPQLikhEFXxaa/N8q941nJSXUxcvMch5uoKwzNdMCxp8q/NnSD/va9RVGm76cR4tcv1b
 eXNzAvdXBCZK6zSVDZVR0a2u6tpWlZAph+iikhuraLNIazg0WdfrRaSJlj71At26UtA9PmfmHlGg9
 26KCvFv5xg4yChXSBko9+KtXLs+lbnDJvQt0ZebsXKptgBejNEgX4vjhrspSyoBUOwikd1Iiu7y1p
 p0o5Sjgo8F0NJnyG1XteYgB1Mhbbj5VIz0wXgM77Lo6MwLvAHaKd56thZUHJ2bBDqkSCxdYqLLFd5
 k5TKXVHUuX0qzPZdnrA8ffXN1/rSJWVl6w==;
Received: from 62-87-103-230.red-acceso.airtel.net ([62.87.103.230]
 helo=killbill.home) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1xJY6q-005l0E-4t; Wed, 21 Oct 2026 17:20:08 +0200
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
Subject: [PATCH i-g-t v6 5/8] lib/igt_kms: extend igt_plane_set_color_pipeline
 to accept Bypass
Date: Wed, 21 Oct 2026 17:18:29 +0200
Message-ID: <20261021151929.62529-6-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021151929.62529-1-mwen@igalia.com>
References: <20261021151929.62529-1-mwen@igalia.com>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_kms.c                                 | 20 +++++++++++++------
 .../chamelium/kms_chamelium_color_pipeline.c  |  2 +-
 tests/kms_color_pipeline.c                    |  2 +-
 tests/kms_colorop.c                           |  6 +++---
 tests/kms_colorop_helper.c                    |  5 -----
 tests/kms_colorop_helper.h                    |  1 -
 6 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index dcd62d46a..33d2d66bc 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2712,7 +2712,7 @@ static void igt_plane_reset(igt_plane_t *plane)
 		igt_plane_set_prop_value(plane, IGT_PLANE_HOTSPOT_Y, 0);
 
 	if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
-		igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
+		igt_plane_set_color_pipeline(plane, NULL);
 
 	igt_plane_clear_prop_changed(plane, IGT_PLANE_IN_FENCE_FD);
 	plane->values[IGT_PLANE_IN_FENCE_FD] = ~0ULL;
@@ -4438,17 +4438,25 @@ bool igt_plane_is_valid_colorop(igt_plane_t *plane, igt_colorop_t *colorop)
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
index b39ad6f3c..908508888 100644
--- a/tests/chamelium/kms_chamelium_color_pipeline.c
+++ b/tests/chamelium/kms_chamelium_color_pipeline.c
@@ -203,7 +203,7 @@ static void _test_plane_colorops(data_t *data,
 	chamelium_destroy_frame_dump(frame);
 
 	/* Cleanup before assert so failed plane doesn't affect next plane */
-	set_color_pipeline_bypass(plane);
+	igt_plane_set_color_pipeline(plane, NULL);
 	reset_colorops(colorops);
 	igt_plane_set_fb(plane, NULL);
 	igt_display_commit_atomic(&data->display, 0, NULL);
diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index bf4781796..88419db8a 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -181,7 +181,7 @@ static void _test_plane_colorops(data_t *data,
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_pipe);
 
 	/* Cleanup before assert so failed plane doesn't affect next plane */
-	set_color_pipeline_bypass(plane);
+	igt_plane_set_color_pipeline(plane, NULL);
 	reset_colorops(colorops);
 	igt_plane_set_fb(plane, NULL);
 	igt_display_commit_atomic(&data->display, 0, NULL);
diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index b1ec4aaaa..a12a0a212 100644
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
index e612859f9..66e0ac503 100644
--- a/tests/kms_colorop_helper.c
+++ b/tests/kms_colorop_helper.c
@@ -462,11 +462,6 @@ void set_color_pipeline(igt_display_t *display,
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
index ea70d2e80..4392386ea 100644
--- a/tests/kms_colorop_helper.h
+++ b/tests/kms_colorop_helper.h
@@ -126,7 +126,6 @@ void set_color_pipeline(igt_display_t *display,
 			igt_plane_t *plane,
 			kms_colorop_t *colorops[],
 			igt_colorop_t *color_pipeline);
-void set_color_pipeline_bypass(igt_plane_t *plane);
 void reset_colorops(kms_colorop_t *colorops[]);
 
 #endif /* __KMS_COLOROP_HELPER_H__ */
-- 
2.53.0

