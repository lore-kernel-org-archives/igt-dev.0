Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C499C624D3
	for <igt-dev@archiver.kernel.org>; Wed,  2 Sep 2026 18:03:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C26510F304;
	Wed,  2 Sep 2026 18:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="OiITpJgZ";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEDC610F312
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Sep 2026 18:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=oOD3VUV3YWQHw9bXDmn4mfJdE+SgyuTqtw3OyqPcSC4=; b=
 OiITpJgZy3TVv0kupAdk6k2GObfxr6a+o9Xzvo+8mAcYpLR19l0X/xI5fdOIA+/96Qnu8b8skyvrL
 siEGsLNlnRfPXl6RPApibrfc2qAiG0YBOwkif7+n8dpJqVv7k/CQ0nULpHORwXpgDHYSX91RCqTe/
 Vs5RJqM4n4F6SH1OuUP4463JTOMfbsmLHTJ9Kx3gTjFuX/W1acNSPgnoecvrhyKTAz3fpIDON7skk
 pLTHrvswr/DxPyQT05Zw7nUi3Dr6Hx+tUZroaxoRfipmoEs9juhP56B45BLW3JdrGDxVofSAoOgfe
 mEOIwKQ1uL5dOZYYsubvHKQX8ylSdA/mIw==;
Received: from 113.red-79-144-92.dynamicip.rima-tde.net ([79.144.92.113]
 helo=killbill) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1x1pGH-00DxQx-V2; Wed, 02 Sep 2026 20:00:38 +0200
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
Subject: [PATCH i-g-t v5 4/8] tests/kms_properties: give non-primary planes
 their own fb
Date: Wed,  2 Sep 2026 19:58:04 +0200
Message-ID: <20260902180016.303482-5-mwen@igalia.com>
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

On AMD drivers, a CRTC remains active only while its primary plane is
enabled; therefore, handing the primary's fb over to a non-primary plane
would take the CRTC down with it. Create a dedicated fb for each
non-primary plane before testing its colorops and discard it again
afterward, leaving the primary plane and its prepare_crtc() fb intact.
This is groundwork for the next commit, which checks colorop properties
on an active color pipeline.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---

v2:
- detach different changes from a single commit (Chaitanya)
v3:
- move hunk from next patch to fix mem leak (Alex H/Chaitanya)
---
 tests/kms_properties.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 2b4cb152b..c55a271da 100644
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
@@ -255,6 +255,18 @@ static void run_colorop_property_tests(igt_display_t *display,
 			 igt_crtc_name(crtc), plane->index,
 			 kmstest_plane_type_name(plane->type), output->name);
 
+		/* A non-primary plane needs an fb of its own: AMD keeps the
+		 * CRTC active only while the primary plane is enabled.
+		 */
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
@@ -272,6 +284,12 @@ static void run_colorop_property_tests(igt_display_t *display,
 				colorop = igt_find_colorop(display, colorop_id);
 			}
 		}
+
+		/* only the fb created above needs to go away here */
+		if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
+			igt_plane_set_fb(plane, NULL);
+			igt_remove_fb(display->drm_fd, &afb);
+		}
 	}
 
 	cleanup_crtc(display, crtc, output,
-- 
2.53.0

