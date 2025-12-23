Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C32E6FE24
	for <igt-dev@archiver.kernel.org>; Tue, 23 Dec 2025 18:32:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A00810E2B3;
	Tue, 23 Dec 2025 18:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="B+RyNtG+";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF22B10E2B3
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Dec 2025 18:32:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766514752; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kOdtykAId3yPeqIPf5KcudstGFuXptK/hl1BZmX0FnnoSCkp1MFAIM72OWXnEvVh2CkKMboUIHDJwrzjUzlsn1XLPDKTgO5zP3dhUM2TvtxCsbNVr+fRue0YZpFi4zYwtMI9zRWKXymB8Iw70MBZbW4cxf7R4CXk1ZHiwOn0nZg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766514752;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=dn8EKqVCHQ86AUvIXzNznXpRzdfqvRtq1SXeD94nlDs=; 
 b=f7eMLLl2P4GGVXLJ2Pf85lQWzl6EitsDplktmDPGdYwUYHfe0iKZK0BgAWWT6wGW5WKFFJVOnQaA6dsaUaZEZ2rQy1Q51gUJAAXKrTMUdiJ4zhMP1FdBsC+fT2H1h+6iMWKzYkfSWouxjmeVp5k8GeVxCqc2SjBoOgyrFWviFqE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766514752; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=dn8EKqVCHQ86AUvIXzNznXpRzdfqvRtq1SXeD94nlDs=;
 b=B+RyNtG+EO+roB/aYvOwufVLbKkIyRb09njLftpbjKvwKXbusdKHLXaNZ9uYoeUf
 GlxYaXjUNLwjJ/b4SaHGOk6SOyUle0MFgMrVtum388MRbp/VrgqDTVv87+HwKQyS3/U
 FIRyLPGcELNavN2QvdaO8Keay6KJCYVN0CNOUUgM=
Received: by mx.zohomail.com with SMTPS id 1766514750767279.4266983690877;
 Tue, 23 Dec 2025 10:32:30 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 23 Dec 2025 15:31:51 -0300
Subject: [PATCH v2 05/10] tests/kms_colorop: Check for colorop unique id in
 CRTCs as well
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-post-blend-colorops-v2-5-f40aca9795bd@collabora.com>
References: <20251223-post-blend-colorops-v2-0-f40aca9795bd@collabora.com>
In-Reply-To: <20251223-post-blend-colorops-v2-0-f40aca9795bd@collabora.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.hung@amd.com, harry.wentland@amd.com, leo.liu@amd.com, 
 daniels@collabora.com, leandro.ribeiro@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766514731; l=3715;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=Q3W/Qa7I+O+WTdu1khXw1zk5QjzwdGkyO8J3Xy9n2Oo=;
 b=sxqi9b91c88Z8UqtGTdf8bkzY4PkE87dGHkhfKUwMA9JBBZdaQr5m6Dv52ukrigpTt5voy1Xj
 L9dpc1W1XGCCGByZsxq5GFMiV2K5LrhDSK2QJtzcoWlhfdtJL3fjkYk
X-Developer-Key: i=ariel.dalessandro@collabora.com; a=ed25519;
 pk=QZRL9EsSBV3/FhDHi9L/7ZTz2dwa7iyqgl+y1UYaQXQ=
X-ZohoMailClient: External
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

From: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>

Extend the check_plane_colorop_ids subtest to also check the colorop ids
in the CRTCs for uniqueness and rename things accordingly as it's not
exclusive to planes anymore.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Co-developed-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 tests/kms_colorop.c | 40 +++++++++++++++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index d53022807..7cfbbb988 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -15,8 +15,8 @@
  * Category: Display
  * Description: Test to validate the retrieving and setting of DRM colorops
  *
- * SUBTEST: check_plane_colorop_ids
- * Description: Verify that all igt_colorop_t IDs are unique across planes
+ * SUBTEST: check_colorop_ids
+ * Description: Verify that all igt_colorop_t IDs are unique across planes and CRTCs
  *
  * SUBTEST: plane-%s-%s
  * Description: Tests DRM colorop properties on a plane
@@ -495,18 +495,43 @@ static void colorop_plane_test(igt_display_t *display,
 	igt_get_and_wait_out_fence(output);
 }
 
-static void check_plane_colorop_ids(igt_display_t *display)
+static void check_colorop_ids(igt_display_t *display)
 {
+	igt_crtc_t *pipe_obj;
 	igt_plane_t *plane;
 	int colorop_idx;
 	igt_colorop_t *next;
 	int prop_val = 0, pipe = 0;
 
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
@@ -532,8 +557,9 @@ static void check_plane_colorop_ids(igt_display_t *display)
 	}
 
 	g_hash_table_destroy(id_set);
+	g_hash_table_destroy(crtc_set);
 	g_hash_table_destroy(plane_set);
-	igt_info("All igt_colorop_t IDs are unique across planes\n");
+	igt_info("All igt_colorop_t IDs are unique across planes and CRTCs\n");
 }
 
 static int opt_handler(int option, int option_index, void *_data)
@@ -634,8 +660,8 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		igt_require(display.is_atomic);
 	}
 
-	igt_subtest_f("check_plane_colorop_ids") {
-		check_plane_colorop_ids(&display);
+	igt_subtest_f("check_colorop_ids") {
+		check_colorop_ids(&display);
 	}
 
 	for (j = 0; j < ARRAY_SIZE(formats); j++) {

-- 
2.51.0

