Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D618CAC582
	for <igt-dev@archiver.kernel.org>; Sat, 13 Sep 2025 00:04:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C3410E31E;
	Sat, 13 Sep 2025 00:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="QVCLjJt9";
	dkim-atps=neutral
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8411D10E16F
 for <igt-dev@lists.freedesktop.org>; Sat, 13 Sep 2025 00:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757721838;
 bh=YKB5n9O0dbzg7j8vcrvPwv31rR1+YL9rM7+1S5MU530=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=QVCLjJt90Q9gjItIxu9pgjFj+2iEpaLb87wGdDOFJ9W056ZWppjhz3fdZFs7qB9CS
 xdEosSBIQXAevKXA6exhTNjAKGr3GPMgQJ4qeF2/LaNIr+TVYt5g+PLNtOTQY56EcN
 aP+Qu8YxxWhozbp1H3w3WAsb6dkC+sAIkwnDZpLFNQvnuwsgitjFTiVyXbLVCsiOD3
 /Svg6cXrJPXU89AscCVZUgGS9+38Y+cClPtHH3ywjeoWxLuXuwptOe7/HEUc9L8p1U
 A9Bw+LNwTSkeUdIDGW1F4mtkom6prnewbUgy3LBG6w/9QzMpUtBvMvbxbpa7v2rxxC
 orD/0Lli6iYEQ==
Received: from [127.0.1.1] (unknown
 [IPv6:2600:4041:5b1a:9400:62f0:406e:ac79:4a96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 159FB17E12B8;
 Sat, 13 Sep 2025 02:03:56 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 12 Sep 2025 20:02:54 -0400
Subject: [PATCH 2/9] lib/igt_kms: Store pointer to display instead of plane
 in colorop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250912-post-blend-colorops-v1-2-83fc62420cba@collabora.com>
References: <20250912-post-blend-colorops-v1-0-83fc62420cba@collabora.com>
In-Reply-To: <20250912-post-blend-colorops-v1-0-83fc62420cba@collabora.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Cc: Alex Hung <alex.hung@amd.com>, harry.wentland@amd.com, leo.liu@amd.com, 
 daniels@collabora.com, leandro.ribeiro@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
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

As a preparation to support post-blend colorops, at which point colorops
can be exposed by both planes and CRTCs, store a pointer to the display
instead of the plane in igt_colorop_t as only the display is needed and
is common for both planes and CRTCs.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 lib/igt_kms.c | 12 ++++++------
 lib/igt_kms.h |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e9ec75eb868562dbc0190bdefd532a786cbfc854..d5c5db082e2b4c321f8872be7eea039a502d693d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -838,12 +838,12 @@ igt_fill_colorop_props(igt_display_t *display, igt_colorop_t *colorop,
 	drmModeFreeObjectProperties(props);
 }
 
-static void igt_fill_colorop(igt_display_t *display, igt_plane_t *plane,
+static void igt_fill_colorop(igt_display_t *display,
 			     igt_colorop_t *colorop, uint32_t id,
 			     char *name)
 {
 	colorop->id = id;
-	colorop->plane = plane;
+	colorop->display = display;
 
 	if (name)
 		memcpy(colorop->name, name, sizeof(colorop->name));
@@ -866,7 +866,7 @@ igt_fill_plane_color_pipelines(igt_display_t *display, igt_plane_t *plane,
 
 			igt_assert(display->n_colorops < MAX_NUM_COLOROPS);
 
-			igt_fill_colorop(display, plane, colorop, prop->enums[i].value, prop->enums[i].name);
+			igt_fill_colorop(display, colorop, prop->enums[i].value, prop->enums[i].name);
 			plane->color_pipelines[plane->num_color_pipelines++] = colorop;
 
 			/* get all NEXT colorops */
@@ -874,7 +874,7 @@ igt_fill_plane_color_pipelines(igt_display_t *display, igt_plane_t *plane,
 							IGT_COLOROP_NEXT);
 			while (colorop_id) {
 				colorop = &display->colorops[display->n_colorops++];
-				igt_fill_colorop(display, plane, colorop, colorop_id, NULL);
+				igt_fill_colorop(display, colorop, colorop_id, NULL);
 				colorop_id = igt_colorop_get_prop(display, colorop,
 								IGT_COLOROP_NEXT);
 			}
@@ -4484,7 +4484,7 @@ igt_plane_replace_prop_blob(igt_plane_t *plane, enum igt_atomic_plane_properties
 void
 igt_colorop_replace_prop_blob(igt_colorop_t *colorop, enum igt_atomic_colorop_properties prop, const void *ptr, size_t length)
 {
-	igt_display_t *display = colorop->plane->pipe->display;
+	igt_display_t *display = colorop->display;
 	uint64_t *blob = &colorop->values[prop];
 	uint32_t blob_id = 0;
 
@@ -4513,7 +4513,7 @@ bool igt_colorop_try_prop_enum(igt_colorop_t *colorop,
 			       enum igt_atomic_colorop_properties prop,
 			       const char *val)
 {
-	igt_display_t *display = colorop->plane->pipe->display;
+	igt_display_t *display = colorop->display;
 	uint64_t uval;
 
 	igt_assert(colorop->props[prop]);
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index a95293f50582574cfbf0181d14cffee472b6d3fc..c4e0c3b671c03c3728305d80c60aa95f799c6c54 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -434,7 +434,7 @@ typedef struct igt_plane igt_plane_t;
 
 typedef struct igt_colorop {
 	uint32_t id;
-	igt_plane_t *plane;
+	igt_display_t *display;
 
 	char name[DRM_PROP_NAME_LEN];
 

-- 
2.50.1

