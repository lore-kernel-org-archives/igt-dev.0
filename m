Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C4D60A2612
	for <igt-dev@archiver.kernel.org>; Wed, 21 Oct 2026 15:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=YwsFLvrO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC49010E031;
	Wed, 21 Oct 2026 15:25:53 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DC010E039
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 15:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:From:Reply-To;
 bh=s4yHjsihHZcfr/bfgf586PynpqwdrUxw51iy69lhnHU=; b=YwsFLvrOu7O561vp7Hc//qagZw
 ffVTxbKKJ73CKOa85gk7/1VV2HOy1IS0gc3rPC3eFpiXHh6Nv6hipmMB2I/HC39kT7F2Jcw8LJFsV
 euHUDFrK35KnprH0pMSwXmTODHuGURpXSBZBC+nVFJVq42K6bslaLUD/oUqVRCdVu5R4whBeqAaBX
 BiMrTlUvsBH5pQgNQJcV1Pu/VrvT5SbGPuisAeL2jlHxhKkY31KGZG5zj5QHC6sY9T7Jn/Uxx3yvu
 IUQ0g13S0tkP+WZEqCc20LFlz0OM0DbPnp2YaNK/Jje+TAbVQsSSulEeS8OEgp0o0iUGwCDJKr955
 +XL3PjZA==;
Received: from 62-87-103-230.red-acceso.airtel.net ([62.87.103.230]
 helo=killbill.home) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1xJY6o-005l0E-2i; Wed, 21 Oct 2026 17:20:06 +0200
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
Subject: [PATCH i-g-t v6 4/8] tests/kms_properties: give non-primary planes
 their own fb
Date: Wed, 21 Oct 2026 17:18:28 +0200
Message-ID: <20261021151929.62529-5-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021151929.62529-1-mwen@igalia.com>
References: <20261021151929.62529-1-mwen@igalia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The properties of a colorop should only be tested or modified if its
color pipeline is active (i.e., selected in the COLOR_PIPELINE property
of the plane); consequently, the plane itself must also be active.

To follow this policy, we need to enable a plane and activate the color
pipeline of a given color in order to test its properties. Currently,
only the primary plane is active. Enable non-primary planes before
testing their properties using a framebuffer other than the primary one;
this prevents the primary plane — and, consequently, the CRTC associated
with it — from being disabled on AMD display driver.

This is groundwork for the next commit, which checks colorop properties
on an active color pipeline.

Signed-off-by: Melissa Wen <mwen@igalia.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_properties.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 2b4cb152b..07594f669 100644
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
@@ -255,6 +255,19 @@ static void run_colorop_property_tests(igt_display_t *display,
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
+			igt_display_commit2(display, COMMIT_ATOMIC);
+		}
+
 		/* iterate over all color pipelines on plane */
 		for (i = 0; i < plane->num_color_pipelines; ++i) {
 			/* iterate over all colorops in pipeline*/
@@ -272,6 +285,13 @@ static void run_colorop_property_tests(igt_display_t *display,
 				colorop = igt_find_colorop(display, colorop_id);
 			}
 		}
+
+		/* only the fb created above needs to go away here */
+		if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
+			igt_plane_set_fb(plane, NULL);
+			igt_display_commit2(display, COMMIT_ATOMIC);
+			igt_remove_fb(display->drm_fd, &afb);
+		}
 	}
 
 	cleanup_crtc(display, crtc, output,
-- 
2.53.0

