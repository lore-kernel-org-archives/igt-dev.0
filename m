Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78ED0E7DEF2
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:33:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2245A10E4FD;
	Mon,  2 Feb 2026 14:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="AQdSxpqI";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3562910E4F1
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:33:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D3009C237F3
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:33:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 16B4C60767;
 Mon,  2 Feb 2026 14:33:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 062D9119A8917; Mon,  2 Feb 2026 15:33:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042788; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=0D15cDWAAmH1jTQpKeyw5ifKCjyGmCVl6+6zmYUuwL4=;
 b=AQdSxpqIA4lwoJGs+GFHqK36dScXogt7cwkJX/Q1iaCqkkIPyNPW1JpbrdFeU6dasq/Hgl
 vAHHjP430rYpBaAQjZfWbcXaDUxeLKmt/k7g8GQVn1iPg2wSr/dq6oxctiEaQbNXPsPdBI
 mNrv2+41ieMri3TgmyGNVzkPtVSkYl12+WXuwzKjosCDpLaNxtfpGuwr5AK7q4UEgKpUr1
 VEylRLqn+6/YDulYOz49UCIZGfKvFeJkrD2EJvCDy8L55fUc/4ehpYLEg3C5pN9Nql0RAz
 zUuRaQBB861Th7on5FECA0mmvy8ZjgKICoI3GgFSgzPWNR1dfWkLaceN0NPrCw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:33:26 +0100
Subject: [PATCH i-g-t v6 47/48] lib/unigraf: Add helpers to get the current
 LT status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-47-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1607;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=8z0utHSb2A1fJQFMcIJ/+WwLKcAXBh/pxjQy0seB6jo=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWVFwnQFkp+mhp5cFdRInS5f66q7uLLbmyyD
 T7GwxrmhXSJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1lRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOL6GQ/+LCFjUs4z5+DRepe1dHPYSfdA0tpSUhZ
 lWcyLIAQiV852vNE/z8WiHfrpm8b7K5MyiwOn1IgvEE3rWlOzqA1XG4ydD/hmlsZv+0oMLJNoJs
 iaHYf017DKBNu0PjbAZbjo8v9SWnaZhTMerGZCpBxkUW3YxRgpTuBqfT+1ap0tuwpU/KTzcbL1V
 SZgTAaOqFh8gswDqU8Aw2+KfXrLcd5kwKPzCKzuNdR4zIkTaDkM3FnvDAvj9eFXQGCG+FiowAQe
 vPKPNk9i6uAolentmyUVdsgOaKOtljLTbDM+fA5oe0useRZW/a36lKE8H11p3KkZ0DEduosGouQ
 bK/pAsQWAQPllBKRzUcF3B7O+JjT8yuxt1/N9LXCv0MoXtgM5o63hGxFtv/kiCIdwpmwkhRmtQV
 4gyjK9ieTMfmXHAbjE0ZHixx957Nrkvxl5pbut7PS4XKdVPp/0BNvhXuNnReehemvf8McYFvalU
 I1/UG+j/ScSntjMdi19aTIh9b2fnD+7cHILGuCYI6ZjAzO3jdK9P0aEvoOP65xM0M7wlgPUJMFt
 i91/AbTA83sXHIKVgPaIcLGdjsVnN+3HFf5zq396NfpyKvMWU3Ns+1ykixC3fUzhwjcZdV85a3t
 mZ9dLAvUlDZ8i91UvDPyV+q6VZJChfPDRGy/9aq3v0MXSo7bnaQo=
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

To ensure that the link training was correct, grab actual link
training status from unigraf.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 20 ++++++++++++++++++++
 lib/unigraf/unigraf.h |  4 ++++
 2 files changed, 24 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index e1f77a959a93..2e9700b37c95 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -855,6 +855,26 @@ int unigraf_get_max_lane_count(void)
 	return max_lanes;
 }
 
+/**
+ * unigraf_get_lt_rate() - Get the current link training rate
+ *
+ * Returns: The current link training rate in units of 270 MHz.
+ */
+uint32_t unigraf_get_lt_rate(void)
+{
+	return unigraf_read_u32(TSI_DPRX_LT_RATE_R);
+}
+
+/**
+ * unigraf_get_lt_lane_count() - Get the current link training lane count
+ *
+ * Returns: The current number of lanes being used in link training.
+ */
+uint32_t unigraf_get_lt_lane_count(void)
+{
+	return unigraf_read_u32(TSI_DPRX_LT_LANE_COUNT_R);
+}
+
 /**
  * unigraf_set_max_link_rate() - Set the maximum link rate advertised to the DUT
  * @rate: The maximum link rate to configure on the device. Actual value is
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 34d00de2786a..f314e52a8d89 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -92,4 +92,8 @@ int unigraf_get_max_link_rate(void);
 
 int unigraf_rate_to_kbs(enum unigraf_rate rate);
 
+uint32_t unigraf_get_lt_rate(void);
+
+uint32_t unigraf_get_lt_lane_count(void);
+
 #endif // UNIGRAF_H

-- 
2.52.0

