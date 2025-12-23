Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F02E6FE23
	for <igt-dev@archiver.kernel.org>; Tue, 23 Dec 2025 18:32:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD03B10E2AF;
	Tue, 23 Dec 2025 18:32:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="W1Us0p8A";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383D310E2A9
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Dec 2025 18:32:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766514739; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=OdVaAyGraj9xqU9Bdj8orll5UFCpCAe1Eln9uo5KEbnmWwlrLiOavfa6wABUYNTBdzbBuuCQmlw/CwWL/FPTUVUo4gxQYRSvC3Hv9BJ69cjh7f5zJ2It8uoM6pxngR8Ji0RZDr5HZdgRboQijZdhpKqMKsIbH2sZkhzR2xdBfTE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766514739;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=VamcvSkQvHgH7+fhd0biAZCWU+ZCqwQDwgRqt8J3B/g=; 
 b=jQMK9ixXDgNVhGNLgnWOXSMZ/j5OOvQLAS4JXDjYzSEAsfWBNc+qC5V7Gfc3fMWodNHu47bYRwmgOTYyyZh1djfORgBPRLhSFHS3xHNPm/toetdqwlMXqeNGUSke5XqqLjaXnI75khHs5EiKpIrOOxj7DyRvxHj/U0GrV2q35+I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766514739; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=VamcvSkQvHgH7+fhd0biAZCWU+ZCqwQDwgRqt8J3B/g=;
 b=W1Us0p8ArMw2z+rbgDGy0TULYhTgoxih2PIFwmufyeYffAlRfsmNN38tvrGMYBTc
 /qdOSgcEYDY6FKJ8wajnhGhBU91zWYm+SkzOAMwH/xNSTfIBlMjz2HHLTKOP3PTRsZ9
 QPmFcC4Bv+tI7sCTyeej7nsPoVZsrMjqbHqiKlEs=
Received: by mx.zohomail.com with SMTPS id 1766514738343904.4693733276905;
 Tue, 23 Dec 2025 10:32:18 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 23 Dec 2025 15:31:47 -0300
Subject: [PATCH v2 01/10] drm-uapi/drm: Sync with CRTC (post-blend) color
 pipeline commit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-post-blend-colorops-v2-1-f40aca9795bd@collabora.com>
References: <20251223-post-blend-colorops-v2-0-f40aca9795bd@collabora.com>
In-Reply-To: <20251223-post-blend-colorops-v2-0-f40aca9795bd@collabora.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.hung@amd.com, harry.wentland@amd.com, leo.liu@amd.com, 
 daniels@collabora.com, leandro.ribeiro@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766514731; l=1356;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=LRAmBva23bdGDOXrkrq5NzQyOZYTkcm+vzAHOr0W9WM=;
 b=aoYba+Tl0OznRLT1loA2ynxNVrHxoPnNikfX8AeH/jTijHsUUqtr/jXCZwCnRqQP3VH9eF4Ry
 xdY6Uf32m9QDCTIGz0vIq2u2o/1cDy5GoWZ7oVClIExNz+RTxECD94Y
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

Sync DRM_CLIENT_CAP_CRTC_COLOR_PIPELINE with drm-next kernel commit
<TODO: update when kernel series lands>.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Co-developed-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 include/drm-uapi/drm.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
index baa620e3f..0d7825c1a 100644
--- a/include/drm-uapi/drm.h
+++ b/include/drm-uapi/drm.h
@@ -883,6 +883,25 @@ struct drm_get_cap {
  */
 #define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE	7
 
+/**
+ * DRM_CLIENT_CAP_CRTC_COLOR_PIPELINE
+ *
+ * If set to 1 the DRM core will allow setting the COLOR_PIPELINE
+ * property on a &drm_crtc, as well as drm_colorop properties.
+ *
+ * Setting of these crtc properties will be rejected when this client
+ * cap is set:
+ * - GAMMA_LUT
+ * - DEGAMMA_LUT
+ * - CTM
+ *
+ * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
+ *
+ * This client cap can only be set if the driver sets the corresponding driver
+ * cap &DRM_CAP_CRTC_COLOR_PIPELINE.
+ */
+#define DRM_CLIENT_CAP_CRTC_COLOR_PIPELINE	8
+
 /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
 struct drm_set_client_cap {
 	__u64 capability;

-- 
2.51.0

