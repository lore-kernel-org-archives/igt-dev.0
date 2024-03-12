Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA6CC54E66
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 09:39:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025E610F6FA;
	Tue, 12 Mar 2024 09:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ntadd0TO";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38F310F686
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 09:39:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A72FA20007;
 Tue, 12 Mar 2024 09:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1710236343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fEdXy8rmA+v180rAVExeRwcBlxp8a/LQL0Hm5/LuBnY=;
 b=ntadd0TONujJCpdzX4P/a1/n6O0gTWmD20m7e6ZAboOtrF8kLOyu1oMlljJ8LRcI2iqWxR
 /J49V+uqYcf4KmxzhiuD+mc5Oqh7yHDpPWcBcMiaSBGoG3PmRdQcrT3EcrG/HEdmkTdXsv
 aPJzEen02tf00vptyZo5jF+81A7SCphxfpgriBjeY8JnQz2l3SNCjduMvM4W0m1f2mty7j
 x+hjw+jTnbXBV609r8sm6dW5wvihCRinIT623HKsqcmNfdIhL4lGIDaTkd99851ot1zZQB
 8ml1Ansbv7bWePU60LeEVXohqdHaXg+lvsvpSlBlkQ8LlIUP0TIwfOZ9GJq7CQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 12 Mar 2024 10:38:58 +0100
Subject: [PATCH i-g-t 1/3] lib/igt_kms: Add reflection name and mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240312-new_rotation-v1-1-ed9fe82589df@bootlin.com>
References: <20240312-new_rotation-v1-0-ed9fe82589df@bootlin.com>
In-Reply-To: <20240312-new_rotation-v1-0-ed9fe82589df@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: miquel.raynal@bootlin.com, jeremie.dautheribes@bootlin.com, 
 thomas.petazzoni@bootlin.com, arthurgrillo@riseup.net, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1885;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=0JgzxsxgNGb+L5Q1j46K8K/GYXOIErM01+gNhBN2b+c=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl8CK27d52oLF8IdKxfPBrXf4gLSFvGuXt+ownO7WN
 0n0ZNnKJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZfAitgAKCRAgrS7GWxAs4tr2D/
 4oBJstWTZZ/kDKddpQ/KBOAcb8lZV8dDeJfIaFxnGN9vEFidJPvXfev/KsoMsDP5v1TcEjeup0h3tr
 JXCMZebYMg5s6Dp+gaFxZEN5qbJzt8CFSr19LWiumWC35+06K5Jo6WXMeRKqoDuOKHnRLHC4tHl7oh
 LCUxbOPcvGBtl3Okt270X+j4EnJolwGVNl03JFNxJrVMa8pQPvdJ3KPGhvDopxDYkw/q8bYsxWDmVI
 SFi+P0I/25LLAuu3QVl8xwxRp+XQU3fLHnAsGV3zzEtxnftQm80Cu6YB+YaKHbEO7+Y6/RRYnSkieo
 uINRXz17R43dXkzy6y48LlfGDB/EXUnY/ZCd3pnGdBJkKNeAMNn6tT6Is+uz0TIsOlCM6gCKvCdBBr
 vd6xL35OvLjXfTyCK3N0EhkX2OjisOSUKYH9OrFKQBfGG/CE7p7qDV4TkBFSb7daYLHn6E0C2AXtAQ
 RDb/lXnUIqu8crhLDtJ189l9OkHL2SHKAZHJ37nk2e4y3PL/Ra3IQ8CQkRYZRYKPbVNPJY7cuy7C5P
 wQ1CfebpCg2kU2YuZY9HJRBSUlSYEaRekTx4qT5fh0xEDKE1f0GXk7IcxLuK7QvgwhVwsN2Bi3Nnva
 9Z+o5VKwIl00DVLJNxdooqFyhoQcOfKZc/KGJpo3SoUizZIn1wTzOl8aLEmw==
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

