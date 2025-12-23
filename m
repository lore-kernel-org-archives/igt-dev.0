Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B68E6FE23
	for <igt-dev@archiver.kernel.org>; Tue, 23 Dec 2025 18:32:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653BD10E2B0;
	Tue, 23 Dec 2025 18:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="L7E9Mpwk";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E56A10E2B0
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Dec 2025 18:32:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766514744; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fVq4YGZpbVbtoEYxLXdZabXTtrz03HCJ8adVV8o6P2addmxE+HtTCwNW42S0QgEaEpUXujK71iqkYuII3XUTT3mhWJcief2HGLrhHDxKXGDAbAtdmroZdoQi/0TGxCDf0rzu5pgPFmmyLw5DMZBJbfsJ0sRlNXufq2G6Kvy7xxY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766514744;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=N/UO9ZttcEFhLoX+2OkVIeTThaF2Wv8ZS3osaHmcuN8=; 
 b=lC58qcHhylp00t2RzPAJOe4EzOEeCeBIFXozvlS2bAJROLjk2iY56a/Pid9vz9HBRAKhkCTb0Y6XFtLSlVsNxmArb6sUe0EI573NajBHxZ2DymEscFq61c8O0it+1HMup2iMW+WoKhhQptcnVZ0IEY0MQJIBin0gTMemBdQtmeE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766514744; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=N/UO9ZttcEFhLoX+2OkVIeTThaF2Wv8ZS3osaHmcuN8=;
 b=L7E9Mpwk2aJrcyybuklCK5N2r7hUtKhb04PZss9rOGYux+oplCAbGmq//V/K7h3F
 Sgyw/6tVGE32v291K+BBG6p3xH24j4nGQ5vneZjDo+MwtHsVAvJdecN8AmNkWLvxgPI
 U7r8/Ix6v0lzsWZM2RDcKuC/WkxdgxS6ivihePeU=
Received: by mx.zohomail.com with SMTPS id 1766514741238586.1430183521359;
 Tue, 23 Dec 2025 10:32:21 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 23 Dec 2025 15:31:48 -0300
Subject: [PATCH v2 02/10] lib/igt_kms: Store pointer to display instead of
 plane in colorop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-post-blend-colorops-v2-2-f40aca9795bd@collabora.com>
References: <20251223-post-blend-colorops-v2-0-f40aca9795bd@collabora.com>
In-Reply-To: <20251223-post-blend-colorops-v2-0-f40aca9795bd@collabora.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.hung@amd.com, harry.wentland@amd.com, leo.liu@amd.com, 
 daniels@collabora.com, leandro.ribeiro@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766514731; l=3193;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=4/SAGtWLNqpZDQWhwimbVnmHnQrDIpJwPBiCeUs4iVM=;
 b=3+TFBexT/HSPd2MUaAJcJefpQC/HuZSmOTXtqOJPKYTERbI4vtDMFqK80KaXoZG7oSPyJFjcX
 PVW62tplpffAGzNh/QCQaH2ZFlAs0SXuuePk5I/V6baJrhCKLReqGef
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

As a preparation to support CRTC (post-blend) colorops, at which point
colorops can be exposed by both planes and CRTCs, store a pointer to the
display instead of the plane in igt_colorop_t as only the display is
needed and is common for both planes and CRTCs.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Co-developed-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 lib/igt_kms.c | 12 ++++++------
 lib/igt_kms.h |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index a58f41b48..c648180fa 100644
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
 		snprintf(colorop->name, sizeof(colorop->name), "%s", name);
@@ -866,7 +866,7 @@ igt_fill_plane_color_pipelines(igt_display_t *display, igt_plane_t *plane,
 
 			igt_assert(display->n_colorops < MAX_NUM_COLOROPS);
 
-			igt_fill_colorop(display, plane, colorop, prop->enums[i].value, prop->enums[i].name);
+			igt_fill_colorop(display, colorop, prop->enums[i].value, prop->enums[i].name);
 			plane->color_pipelines[plane->num_color_pipelines++] = colorop;
 
 			/* get all NEXT colorops */
@@ -875,7 +875,7 @@ igt_fill_plane_color_pipelines(igt_display_t *display, igt_plane_t *plane,
 			while (colorop_id) {
 				colorop = &display->colorops[display->n_colorops++];
 				igt_assert(display->n_colorops < MAX_NUM_COLOROPS);
-				igt_fill_colorop(display, plane, colorop, colorop_id, NULL);
+				igt_fill_colorop(display, colorop, colorop_id, NULL);
 				colorop_id = igt_colorop_get_prop(display, colorop,
 								IGT_COLOROP_NEXT);
 			}
@@ -4512,7 +4512,7 @@ igt_plane_replace_prop_blob(igt_plane_t *plane, enum igt_atomic_plane_properties
 void
 igt_colorop_replace_prop_blob(igt_colorop_t *colorop, enum igt_atomic_colorop_properties prop, const void *ptr, size_t length)
 {
-	igt_display_t *display = colorop->plane->pipe->display;
+	igt_display_t *display = colorop->display;
 	uint64_t *blob = &colorop->values[prop];
 	uint32_t blob_id = 0;
 
@@ -4541,7 +4541,7 @@ bool igt_colorop_try_prop_enum(igt_colorop_t *colorop,
 			       enum igt_atomic_colorop_properties prop,
 			       const char *val)
 {
-	igt_display_t *display = colorop->plane->pipe->display;
+	igt_display_t *display = colorop->display;
 	uint64_t uval;
 
 	igt_assert(colorop->props[prop]);
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 4a814f0e9..2ea1b4f55 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -413,7 +413,7 @@ typedef struct igt_plane igt_plane_t;
 
 typedef struct igt_colorop {
 	uint32_t id;
-	igt_plane_t *plane;
+	igt_display_t *display;
 
 	char name[DRM_PROP_NAME_LEN];
 

-- 
2.51.0

