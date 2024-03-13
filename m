Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C419C54E67
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 17:10:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966FA10EAA7;
	Wed, 13 Mar 2024 17:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="JsSWXfp8";
	dkim-atps=neutral
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC9810EAA7
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 17:10:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 763AE1C0003;
 Wed, 13 Mar 2024 17:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1710349799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fEdXy8rmA+v180rAVExeRwcBlxp8a/LQL0Hm5/LuBnY=;
 b=JsSWXfp8M0tbisP/y/tEg9F/swX4ENHPN0vPYPP5fWAl5QudPye2i6lM7vmq6Ca1x1Qrmm
 Z7iExtfkpG7KDTtNK+DRA5G7H7YbH0kEHanul92Xo4CV297ir8LhEuXC8HyGuSZAPRwCdu
 Xb9DOoBBF1u+OM/AmpTyICewKq84kGXGpsIMuGtQVEDzuXlDusAoW2r5K/ZK65PbloPahI
 a0cVz5O9iPV7FcxJs7ybO+xIQmw7F1bOOrxly3HfBvCd3/4Ubapvn5UGn0lr3Doc8T1CDP
 K/zwr4yCBPHsqURxq2UTzSGuyPoGm6gZOYEk/14euCq6K6gMBVgAytbTMXMoGA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 13 Mar 2024 18:09:40 +0100
Subject: [PATCH i-g-t v2 1/4] lib/igt_kms: Add reflection name and mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240313-new_rotation-v2-1-6230fd5cae59@bootlin.com>
References: <20240313-new_rotation-v2-0-6230fd5cae59@bootlin.com>
In-Reply-To: <20240313-new_rotation-v2-0-6230fd5cae59@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: miquel.raynal@bootlin.com, jeremie.dautheribes@bootlin.com, 
 thomas.petazzoni@bootlin.com, arthurgrillo@riseup.net, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1885;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=0JgzxsxgNGb+L5Q1j46K8K/GYXOIErM01+gNhBN2b+c=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl8d3lCG97BB7VFqmo6oeEEsmus/K2NnKT+aT4IArJ
 lhTKl12JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZfHd5QAKCRAgrS7GWxAs4rLVD/
 4sHryjx6knZ+5tLk+bEkZl9qgxCIEH1ttl/xmh+t4yxfnw4g7fYyenfG3nCbx/Inx/phcc9X//qKNs
 LUFL80KdfptQMp2EFvqbAb3y66es+nwgGB9b7QC78nMQ5Qck3TOaBw1IPt2BFDKnVj1MSvi8K3HPZD
 dr5wjMsPd+xle3KtdzcQhsVoSRma4TgVcLWwUzeZNedYiU7cAzPEYraN65c2uEgNULPXIJPPyJujN+
 VGAMW0FYK2iKV9HK91ds2UHtIcBTaeT9c8ZwmFs0ov8UG0LPOEWflV5skagosLEOWnZN6txecGK8q/
 hOwObSvZpSnfbIoDyScjFn7aNOlm44twg+c7dyIfUfYhu0xlKRvhExwq/dExuVUEG2qKBWEyBhL5e0
 koRYcd9qTGie2E1qkvRytOM4lRtH1Ij3rIwedjhM/P9vCw/+r+1PykPCc/BJGw7QVOQnSaQR63BXvz
 yLP8zugleEJpcJUTlyU7wGcvBcJIFyWILCyqpW4pLhvVWRa++pTbjpZoJSO2VfWmYzOkej+9+yovLE
 WIdqP+qlb0ay31/WWSDhLuoHFtPgwKyggYZQ6SJ9AwU5B29aV58vhnkDts9uGDn/v1lnEDXknicaYs
 tqgCwtpJUGqbaR300nF3CEUNH+bN6ZqMWmw01a9kiWfw6gPC2wqQElaRI2YQ==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

As for IGT_ROTATION_MASK and igt_plane_rotation_name, create the mask
IGT_REFLECT_MASK and the function igt_plane_reflect_name.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 23 +++++++++++++++++++++++
 lib/igt_kms.h |  3 +++
 2 files changed, 26 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e18f6fe59882..85d278f3cae3 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5142,6 +5142,29 @@ const char *igt_plane_rotation_name(igt_rotation_t rotation)
 	}
 }
 
+
+/**
+ * igt_plane_reflect_name:
+ * @reflect: Plane reflection value (x, y)
+ *
+ * Returns: Plane reflection value as a string
+ */
+const char *igt_plane_reflect_name(igt_rotation_t reflect)
+{
+	switch (reflect & IGT_REFLECT_MASK) {
+	case 0:
+		return "none";
+	case IGT_REFLECT_X:
+		return "X";
+	case IGT_REFLECT_Y:
+		return "Y";
+	case IGT_REFLECT_X | IGT_REFLECT_Y:
+		return "XY";
+	default:
+		igt_assert(0);
+	}
+}
+
 /**
  * igt_plane_set_rotation:
  * @plane: Plane pointer for which rotation is to be set
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index b3882808b42f..4760394428f3 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -371,6 +371,8 @@ typedef enum {
 
 #define IGT_ROTATION_MASK \
 	(IGT_ROTATION_0 | IGT_ROTATION_90 | IGT_ROTATION_180 | IGT_ROTATION_270)
+#define IGT_REFLECT_MASK \
+	(IGT_REFLECT_X | IGT_REFLECT_Y)
 
 /**
  * igt_rotation_90_or_270:
@@ -562,6 +564,7 @@ static inline bool igt_plane_has_rotation(igt_plane_t *plane, igt_rotation_t rot
 	return (plane->rotations & rotation) == rotation;
 }
 const char *igt_plane_rotation_name(igt_rotation_t rotation);
+const char *igt_plane_reflect_name(igt_rotation_t reflect);
 
 void igt_wait_for_vblank(int drm_fd, int crtc_offset);
 void igt_wait_for_vblank_count(int drm_fd, int crtc_offset, int count);

-- 
2.43.0

