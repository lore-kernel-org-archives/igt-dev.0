Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D5BEA4FAE
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:09:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6883810E374;
	Mon, 23 Feb 2026 12:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="QlRv7XOR";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11AE610E38D
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id F05544E41032
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BB8BB5FD43;
 Mon, 23 Feb 2026 12:09:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D05E210368FD2; Mon, 23 Feb 2026 13:09:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848569; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=xY6bzYGsnp1GVFDW/v3owo+t83b81O+Iy6k6sXSd94Y=;
 b=QlRv7XOR5KSUk9SX6zXBXIQ3pDcOhIjs11CRx67iIpUi9WM45TJA53Q+vCgbbaLbPYlbfC
 8vAd/zW1yKnDXjRhyCCG9lL2XYB7GAErHCOhhsbdu5yecLkWpyGAXwFGejCTK3NXI97YvT
 g8jqi9H89eTPl6JgPeOTo12NnTgDK9CX/tJ24p00zGQEvQq3y8/T3a1MmdKCLgjJM2TZNN
 32IBunX3DgZ/P46ezrqpzkRGPvo/R6xLylCAFIY6KbBYotRYBZnfytdTRAStDdK2/AzW/Q
 Veaz4EVgJHfRzqI9CLUpTtakfdCYc8oRFAMWGNviSq6+YjR1oXseo4u2j4IIvA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:50 +0100
Subject: [PATCH i-g-t v7 43/48] lib/igt_kms: Add helper to get a CRTC from
 an output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-43-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1447;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=7ZUSTUWSP1K70BH6UVa6YafESjTuKG3O8zY6y56NbdY=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENsLmM/pRTccWTlV84Q9Shr16kAnTwX4gDp+
 45AomvphKuJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDbBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLmKA//S4+Qmit8/h6mgfee2WhGy7tTphN/hH7
 l32HUX1BOVMZpTYnqPxRjlgomUMarPndcVwGgGfkJM0oxeIye9o2d7N+rdLCyuLYiP/DT3uCVsQ
 O/+9+qSGvBjxmkWyGJ/qdPYuUZaQDqPIJGRRnDuTdwZAL7kFYwFkDhkc2kuZsWMYXit9/uHqavF
 xR4pQRFZA3t/GwLm1i/rZyexgmfWmvs8iWhB8dqOFSt/9grW8SmgiEX7Q5eoC/3YTGpq9+4EK3g
 dXoK6dMK/hozE6NMLCgi6K1Tl0RvcTuo1aN7NiuSJ7Ku4UsD5xceWb9ypXPdgA4QTMl74SmfdeE
 rdChDzCo2YaX7P9HHJgfvEqQBaxO2ois3X4ObuANhddKqgDUGY00hGv5Kxt4kYdnuP4DZkjSkTw
 aYO4L7nfWnnxWJqDfW7jwhOtaEE+msWYO1gz+ySq4t/AFd1B89Y/pyontaqnGwG8VSIGFc6O2Ry
 JZuu0JiDU0Ukb6l2FIlPAy8KIj/dGEDVT9et0YkgjzD0ICyfX5iTv9yRWBzIm+70gJWZCFBsdYt
 EWahS8YA3zp77oR909+KTr3izLzwpv5JvTNKxslJ0Kced/J8oaTDBKXpG2uRinll5oC+w1UKZq9
 QIWuf8mFiSEMLekUinlzrReo8KAZcPwEeibZ0URAdXC36Ei7Hg/Q=
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

Grabbing a valid CRTC from a specific output is useful when testing
the output.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 20 ++++++++++++++++++++
 lib/igt_kms.h |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 0c61ac6e2788..9f8e09008e19 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7937,3 +7937,23 @@ int igt_get_crtc_index_from_connector_id(int drm_fd, int connector_id)
 	}
 	return 0;
 }
+
+/*
+ * igt_get_crtc_for_output:
+ * @display: display to fetch the CRTC
+ * @output: output to use
+ *
+ * Get a valid CRTC for a specific output. The return value is the first valid CRTC for a
+ * specific output.
+ */
+igt_crtc_t *igt_get_crtc_for_output(igt_display_t *display,
+				    igt_output_t *output)
+{
+	igt_crtc_t *crtc;
+
+	for_each_crtc(display, crtc)
+		if (igt_crtc_connector_valid(crtc, output))
+			return crtc;
+
+	return NULL;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 4b5f6fcc929b..716d203a7c2e 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1329,5 +1329,7 @@ get_list_diff(const uint32_t *list_a, int list_a_len, const uint32_t *list_b, in
 	      uint32_t **diff);
 
 int igt_get_crtc_index_from_connector_id(int drm_fd, int connector_id);
+igt_crtc_t *igt_get_crtc_for_output(igt_display_t *display,
+				    igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.52.0

