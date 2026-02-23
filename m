Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B34EA4FB5
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:09:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77F510E372;
	Mon, 23 Feb 2026 12:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Fn3aOLw4";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526BB10E372
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 4865FC143C5;
 Mon, 23 Feb 2026 12:09:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2F6AB5FD43;
 Mon, 23 Feb 2026 12:09:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C6E2C10368F96; Mon, 23 Feb 2026 13:09:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848544; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=gXFeHg7SrwQnBJQ3M13hNuUBgD38bnKls4SJgQkxhJ0=;
 b=Fn3aOLw4yLQo0sIBZs8QKLfvVy9y2TSHKSbAWW6Vl4PYffigMQDPB1haRNUbmtQZhzxBIy
 0fJNUr6Y1BIPMfFtCpun52M6UlC58PNjnx32Nu20q8mOfakezfkNSZvjXu+V3iJaV2/6TV
 CjodbZ4L9IVGYwYDFCsmzpjVImJ5x0UKH8FfjrcqmjarMuzEIEyEOcg7kLhXgFbOMBBASO
 hMWFrb+pgNn0ku6l7XaxTEx57Rm8mtmxnqFpo2DvWFmFW04h4pq4I6SniS1Be6ouzJabcV
 CsP9vgy4EGekrwMBtT/hrsjnIf7pW1sG0SzQi2QngNcdVkUS1fXVkXwkEg/UBw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:27 +0100
Subject: [PATCH i-g-t v7 20/48] lib/igt_kms: Automatically connect unigraf
 on display require
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-20-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=914;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=d0fApV15BgOiycMG2vNhPoKFEvIjy4DLwf1uj1KPZSU=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENpKj972HdBV5hpOIivT+WyAk6vcTT2J/Mm6
 VKTDJ79lbiJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDaRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLoJQ/+LkVjfNMfCxw3LQEvzdcQN8mEqPsilWU
 ZG5JKKyAxSOZd/rzMTkEKTUhwbNbI+xM/9USNQgNmDdhPB756EtWoAqNAeEHQwjghl6ucMR802c
 8IImXOs48mKuz06/ud+5l0TCwKA6CJ3fTZ+U6R3tGi/gHVakdgxtuwTEXaZwXJxufXzP9tj0hsI
 yXXdedBc53j3bvc43fdbqwdI4LyjDsYraeblb2Ya2tYzGLpo1Z0oCYABkN1TDV9Oo5gi0zym5tx
 g3E/r7Fh9Sh1XAwCogPUCrtACKogXVZOaI/OvfLOuvGn3+mPkS58yKdJ8ZLAK+3rXMKc7xVwpg7
 4TevvUPTSdc57rHH8WkvybpSBIhFVxxQVcWlrciGc81uyOX7B5MuoG1O9IONkoW5ogDEG2RoYz3
 jaiQEeUQmZhRaU2+3hb5YJKDIOa9u4bZ92rsJJ15aRV+mOQcqo+PgJ7DskN/Jk1VtPl51SaR7Wd
 c+vk0cxKp5svrqLO2Qfl1xXFavdhB6tPkqMhTorpLpepWhxinDwagFgMM2Zn60Qkwr+vdHJtD/z
 HAEryp7RoITT6iRnFEToV4YATLtEFI+FeQSMqgDAy7d2CHSQWRKMQGr3xeh3eUTMrHWtWGrMcPn
 Gkv+6vooIpvlNEfLf/NSoF8/r3t11XQ0PlUvWqpb66WZDXd110Ww=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3
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

As Unigraf can emulate a display, automatically connect it for all
devices. If a test is already using unigraf, this have no effect.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 lib/igt_kms.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 05d07ece6d9b..8fa2d8f9001e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -66,6 +66,9 @@
 #ifdef HAVE_CHAMELIUM
 #include "igt_chamelium.h"
 #endif
+#ifdef HAVE_UNIGRAF
+#include "unigraf/unigraf.h"
+#endif
 
 /**
  * SECTION:igt_kms
@@ -3125,6 +3128,10 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	int i, crtc_index;
 	bool is_intel_dev;
 
+#ifdef HAVE_UNIGRAF
+	unigraf_open_device(drm_fd);
+#endif
+
 	memset(display, 0, sizeof(igt_display_t));
 
 	LOG_INDENT(display, "init");

-- 
2.52.0

