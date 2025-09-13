Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3BCCAC582
	for <igt-dev@archiver.kernel.org>; Sat, 13 Sep 2025 00:04:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19C510ECF0;
	Sat, 13 Sep 2025 00:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="eVWBUnOE";
	dkim-atps=neutral
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EE210ECF0
 for <igt-dev@lists.freedesktop.org>; Sat, 13 Sep 2025 00:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757721842;
 bh=bIAD1DQgYlqGQ4+DUOJpejHyewLUUzEr6vxIqy0NNJk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=eVWBUnOEaU2ae/jrlz0+sowqFeLCWYpcJAFblj8aahgbbDGRXd/5VCNysjXkUXraM
 JAc9P7UGyipaYe8QZ3dS+Y2rcua5A9f2W+QF6sXjrs4ial5rV1jTT7T1iU/0Qo4lbM
 cvlnFTP+8YKfZIZjLB1l6otoG05TcBQ1qBd/Wf+gfi6FcTAQDtgli9FaSQ1kR7n5aA
 clCGVIu81V/Lo3FuWkwXyio6NRIm62kda9jaDpqP79/BQDydkm1F/8+9QYsw61eSgO
 9PtLbfAooNF4/EHw1c9Y7zioiTpOhEe9bDccWxKyIn5QFMhTHoZu9eToNZdl2Y1WHA
 wZlNbmcwJU2pA==
Received: from [127.0.1.1] (unknown
 [IPv6:2600:4041:5b1a:9400:62f0:406e:ac79:4a96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5175617E12B8;
 Sat, 13 Sep 2025 02:04:01 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 12 Sep 2025 20:02:57 -0400
Subject: [PATCH 5/9] tests/kms_colorop: Check for colorop unique id in
 CRTCs as well
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250912-post-blend-colorops-v1-5-83fc62420cba@collabora.com>
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

Extend the check_plane_colorop_ids subtest to also check the colorop ids
in the CRTCs for uniqueness and rename things accordingly as it's not
exclusive to planes anymore.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 tests/kms_colorop.c | 36 +++++++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index e63876d608c3f1bee60e60d3137cbafef70acc4f..025a25c638bfa0d90e1ccc81be36758b69749be9 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -542,18 +542,43 @@ static void colorop_plane_test(igt_display_t *display,
 
 }
 
-static void check_plane_colorop_ids(igt_display_t *display)
+static void check_colorop_ids(igt_display_t *display)
 {
 	igt_plane_t *plane;
 	int colorop_idx;
 	igt_colorop_t *next;
 	int prop_val = 0, pipe = 0;
+	igt_pipe_t *pipe_obj;
 
-	/* Use hash tables to track drm_planes and unique IDs */
+	/* Use hash tables to track drm_planes, drm_crtcs and unique IDs */
 	GHashTable *plane_set = g_hash_table_new(g_direct_hash, g_direct_equal);
+	GHashTable *crtc_set = g_hash_table_new(g_direct_hash, g_direct_equal);
 	GHashTable *id_set = g_hash_table_new(g_direct_hash, g_direct_equal);
 
 	for_each_pipe(display, pipe) {
+		pipe_obj = &display->pipes[pipe];
+
+		/* Skip when a drm_crtc is already scanned */
+		if (g_hash_table_contains(crtc_set, GINT_TO_POINTER(pipe_obj->crtc_id)))
+			continue;
+
+		g_hash_table_add(crtc_set, GINT_TO_POINTER(pipe_obj->crtc_id));
+
+		for (colorop_idx = 0; colorop_idx < pipe_obj->color_pipelines.num_color_pipelines; colorop_idx++) {
+			next = pipe_obj->color_pipelines.color_pipelines[colorop_idx];
+			while (next) {
+				/* Check if the ID already exists in the set */
+				if (g_hash_table_contains(id_set, GINT_TO_POINTER(next->id))) {
+					igt_fail_on_f(true, "Duplicate colorop ID %u found on CRTC %d\n",
+					next->id, pipe_obj->crtc_id);
+				}
+
+				g_hash_table_add(id_set, GINT_TO_POINTER(next->id));
+				prop_val = igt_colorop_get_prop(display, next, IGT_COLOROP_NEXT);
+				next = igt_find_colorop(display, prop_val);
+			}
+		}
+
 		for_each_plane_on_pipe(display, pipe, plane) {
 			/* Skip when a drm_plane is already scanned */
 			if (g_hash_table_contains(plane_set, GINT_TO_POINTER(plane->drm_plane->plane_id)))
@@ -580,7 +605,8 @@ static void check_plane_colorop_ids(igt_display_t *display)
 
 	g_hash_table_destroy(id_set);
 	g_hash_table_destroy(plane_set);
-	igt_info("All igt_colorop_t IDs are unique across planes\n");
+	g_hash_table_destroy(crtc_set);
+	igt_info("All igt_colorop_t IDs are unique across planes and CRTCs\n");
 }
 
 igt_main
@@ -650,8 +676,8 @@ igt_main
 		igt_require(display.is_atomic);
 	}
 
-	igt_subtest_f("check_plane_colorop_ids") {
-		check_plane_colorop_ids(&display);
+	igt_subtest_f("check_colorop_ids") {
+		check_colorop_ids(&display);
 	}
 
 	for (j = 0; j < ARRAY_SIZE(formats); j++) {

-- 
2.50.1

