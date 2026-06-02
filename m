Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5ED4CD5BD1
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 21:16:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A5110E6A0;
	Tue,  2 Jun 2026 21:16:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="oYv1w1p5";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC44810E683
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 21:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GYF2q0aEFTHGRzHNVWEbL7NBjhH/PChYMV5SereNE34=; b=oYv1w1p5DygKuf7KPMAghpqhI/
 DF8yORK89oOuoWwCYqSLZuY0gHLbpEunvmS48zGwE5c77qVVvhP8C/TLUG1luMpXWan+TCcXrZaYp
 OqJEZbDGyn2JQElhGizOQXuofn4gMzsMQBESrG5/TMJXSpZ13Yk2hh9xFH8GHrpesyk53boXySU7J
 T0IzGqrd3lbzOVSpg248iF4nXXEecT2KUGrNRuSRdEbEv1OkVtME0DdxKpmwIoAafp7Yp8gG1bN/n
 DtQkhgISzdwd4VpME7QAwXOcqUKcaLm3UPnnKOvQYtMrkyTaFiWEFc6vI2mItr5EEk+AvwXR1qKC9
 EOA9rymQ==;
Received: from [79.117.146.159] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wUWS7-00BtIm-Af; Tue, 02 Jun 2026 23:15:11 +0200
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
Subject: [PATCH i-g-t v2 3/4] tests/kms_properties: check colorop properties
 on active color pipelines
Date: Tue,  2 Jun 2026 23:06:44 +0200
Message-ID: <20260602211259.898147-4-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602211259.898147-1-mwen@igalia.com>
References: <20260602211259.898147-1-mwen@igalia.com>
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

Colorop properties can only be changed if its color pipeline is active,
i.e. the colorop is in the chain of the color pipeline set in plane
COLOR_PIPELINE property and its plane is active. For AMD, a CRTC must
have a primary plane active, so overlay needs its own fb and cannot
reuse primary fb. Also, color pipeline cannot be enabled on planes
without COLOR_PIPELINE properties.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 tests/kms_properties.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index f735839da..79d691448 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -237,7 +237,7 @@ static void run_colorop_property_tests(igt_display_t *display,
 				       igt_crtc_t *crtc, igt_output_t *output,
 				       bool atomic)
 {
-	struct igt_fb fb;
+	struct igt_fb fb, afb;
 	igt_plane_t *plane;
 	igt_colorop_t *colorop;
 	int i;
@@ -247,14 +247,31 @@ static void run_colorop_property_tests(igt_display_t *display,
 		     &fb);
 
 	for_each_plane_on_crtc(crtc, plane) {
+		/* don't check colorop in planes without support to color pipeline */
+		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
+			continue;
+
 		igt_info("Testing colorop properties on plane %s.#%d-%s (output: %s)\n",
 			 igt_crtc_name(crtc), plane->index,
 			 kmstest_plane_type_name(plane->type), output->name);
 
+		/* AMD requires primary plane enabled to keep CRTC enabled */
+		if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
+			drmModeModeInfo *mode = igt_output_get_mode(output);
+
+			igt_create_pattern_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
+					      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &afb);
+
+			igt_plane_set_fb(plane, &afb);
+		}
+
 		/* iterate over all color pipelines on plane */
 		for (i = 0; i < plane->num_color_pipelines; ++i) {
 			/* iterate over all colorops in pipeline*/
 			colorop = plane->color_pipelines[i];
+			igt_plane_set_color_pipeline(plane, colorop);
+			igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
 			while (colorop) {
 				igt_info("Testing colorop properties on %s.#%d.#%d-%s (output: %s)\n",
 					  igt_crtc_name(crtc), plane->index,
@@ -268,8 +285,13 @@ static void run_colorop_property_tests(igt_display_t *display,
 				colorop = igt_find_colorop(display, colorop_id);
 			}
 		}
-	}
+		igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
 
+		if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
+			igt_plane_set_fb(plane, NULL);
+			igt_remove_fb(display->drm_fd, &afb);
+		}
+	}
 	cleanup_crtc(display, crtc, output,
 		     &fb);
 }
-- 
2.53.0

