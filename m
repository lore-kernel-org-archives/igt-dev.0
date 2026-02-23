Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BD1EA4FB2
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:09:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5A210E35F;
	Mon, 23 Feb 2026 12:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="tot5kwll";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC7410E35F
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A3C9E1A0993;
 Mon, 23 Feb 2026 12:09:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7A3235FD43;
 Mon, 23 Feb 2026 12:09:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4576A10368F9A; Mon, 23 Feb 2026 13:09:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848549; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=cnx3AAj9yZuvySNmHU6PSJiEk2DPNDwAQQP4ELHqtiw=;
 b=tot5kwllja1vfo0HJj9Vbjo84BRO3GYkvzo0EXABYbiNpPR23BP/iLxK/+lmspvNJPuVcj
 0m5tjsa6HokYX9ckJizieqTrcYtMGVTD3mrEOXPkelrtVvWcwP6qkin/VI53Ywd5gix3ov
 TqnEL8TGdUd+OIg/plZqhVT3zuwYnIutsQOrS+nQpxGviIUe+ZY6fourkrNq7Yv1L6TeYJ
 uWObBrIwURLtMo3vdm2B22jb87kGlKzK6OUAHJRRrMKviimkEhKT94Q6/fCS/aazcM1ACk
 tsHJ/ZzDyRiprqXeOjKVNhKYMOspQIPv5x31YrBvWQdl3DEP12zG2bVcHxD00w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:31 +0100
Subject: [PATCH i-g-t v7 24/48] lib/unigraf: Add reset function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-24-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1518;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=PiJLmEsZRL1t9vz+PBlt0xhPiZMbLKx3ip2sQhBFJJU=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENpYSeh3Roo7qKA622VpxOSwYJ69bnP6gi+8
 91w9B3mMnmJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDaRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOK+BQ//WaBuQqUneRASIpd5w04E32sh+CvCRxz
 vhsU5twa3y4k/EC4Spzt2GOaOBedX72mx/HC8PHS88Ie1rRlKzZpQXgWgGD7ERwMOutV9+cawDE
 uU1EEW/H9af0Zfn+tt1H10HIMKYDSI5iynuains/pPMtaDQqEkAeVdeAkpIc9qwUSGr4o50YDnY
 JNidv8Bk+Y5l2TrLpgHEt5V4XHaERR1aUS0VJU1TaawJfX1ZRYGdlQw1Xl+9A2/+M06nHwUdQ0Q
 oRxfNbtx0cTKM3k3wtaHG2gnsRHsOTeSLVRdNmLhg0oVWt2UwBm5v7D4EmF8DmDf8iDIg9PQztp
 jdBXFxykxsOMousZXXdFugMOdGWbR41yc7NHt+B7PooN2EcKMHw5QAuA4I5UmzxkQ25RsrdScj8
 QFo7lwWJ6qpiNsWQa5kepPqr70w2cTwXq1XUGi40WQUk7B+faCKF5SZCUvYIZXz3BjggwYBoeGC
 S6cyz3umr5zZmI0jxD57PdaofYs/hDR3JxruHLcrcR1IxgpoJ4bDievdGxkRd6jWAW+bWUisTyA
 d18C89oa1ylMvHo++mJiTq6PD3Uhm9MNO9PlTtEXyBagSjdL9MpdAFw5ihATji+h8FwcUtxk6HB
 AXrhvLp+htVIkweJzxWEsGd2HXCKa60geKj1JOrJZzP1mWg5TzHc=
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

To have a consistent state at the beginning of tests, add a unigraf_reset
function that will restore a known state.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 12 ++++++++++++
 lib/unigraf/unigraf.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index ec351ebbd89c..bd47cebb8480 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -267,6 +267,8 @@ bool unigraf_open_device(int drm_fd)
 	unigraf_assert(TSIX_VIN_Select(unigraf_device, chosen_input));
 	unigraf_assert(TSIX_VIN_Enable(unigraf_device, chosen_input));
 
+	unigraf_reset();
+
 	return true;
 }
 
@@ -280,3 +282,13 @@ void unigraf_require_device(int drm_fd)
 {
 	igt_require(unigraf_open_device(drm_fd));
 }
+
+/**
+ * unigraf_reset() - Reset the Unigraf device
+ *
+ * This function performs a hardware reset of the Unigraf device, restoring it to a
+ * default state. This includes resetting all configuration parameters, stream settings,
+ * and link parameters to default values.
+ */
+void unigraf_reset(void)
+{}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index c08ce62894c5..4c2cbd6b1aa5 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -40,4 +40,6 @@ bool unigraf_open_device(int drm_fd);
 
 void unigraf_require_device(int drm_fd);
 
+void unigraf_reset(void);
+
 #endif // UNIGRAF_H

-- 
2.52.0

