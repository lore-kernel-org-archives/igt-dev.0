Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2206ED25B5A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C417F10E6DC;
	Wed, 28 Jan 2026 13:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="zvy9nlap";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71BC610E6E6
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:15:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id C24AAC211E7;
 Wed, 28 Jan 2026 13:15:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 459CE6071F;
 Wed, 28 Jan 2026 13:15:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4C360119A880E; Wed, 28 Jan 2026 14:15:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606105; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=0D15cDWAAmH1jTQpKeyw5ifKCjyGmCVl6+6zmYUuwL4=;
 b=zvy9nlap4vid2WPnVq3eed7NqyNbsTPeYqZZcPZfS62wC31+fzJ7Y5vWPPirsZNdwv2BUO
 RTq6aISIaQ2RQ7b8byjjo7VacCYuWbg+zfP1gM+60VpYMQGWTMHT39mGi6UYQvr2/2ofy5
 C2vEtK7MrQwW4di/mExVPbfFVRzWS8oQihJMPNIdip1ecVLso41DWbJux/Sqc2eraf9MCD
 Ookitnnf3ZT6S2JmJFFoXFD0+0hF+u7BGeiiPUbHgjXsZmtugI+QX0i8JKt0xEa88sPMNb
 m+7MJb5G/99MPn6fgz3OuoWFUlMlMpiRBmVYzvRKfuIchfwJADhItOU9QL4Hmw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:15:18 +0100
Subject: [PATCH i-g-t v5 47/48] lib/unigraf: Add helpers to get the current
 LT status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-47-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1607;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=8z0utHSb2A1fJQFMcIJ/+WwLKcAXBh/pxjQy0seB6jo=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvOgaEz2lnFfQdReHzrmj/h1SA26HxXP9gf2
 gQxp561kUWJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLzhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKEXw//WSe2f/TL5JWAWN9yAPEvPHOH4YhLbra
 FP5QBK9ssQ0zuoH+1oQ4JSt9OItpDN80i8kfDNHtP/Pz1RvsBBrR5qVwIF3HocEdmZwaL+ruPPP
 7q/0KFyOTgMlSEignAMrMiz5uSqmGOSAvO6nVevBulFlztKVMxQBUzRcor9AqRoyV40zXh8LVRc
 kKwRh5+bRJqUD0sfSn31T8py1tdrKeiAV1dp5hPC5sXIU4BE8iF1iGlwqSNZWDZoPfYG1U994hU
 dgqJSR0KSpiXXC/mnWo17HPVECXehm+x88NzkKQTk7NVYBP8UnLxGQf5f6+yCwsxWCcfiwxxWRj
 SVRE96QrYAMdYIbR7TKQnmFl7AqEOAgiOsYpOgmXcZWV61ihMMxQV/CBCwn7/3V8TS+FHYdJuSp
 +jyW8NVEXK67SDKfMdJjKtjIpNfRLKHHFD01vJ4aY+3v58qZTVeU6Fi62AnnQT8xBOH047jgo7e
 hkDA24xrmFa3oHFlGSfN5RMLke6xOLvm2SduQ5TUrspwIO23kD3WE3w2DH5oE6sLOXKcuP18cj+
 2+okBdTHSMCCGZzgz8jAY8HLE3HvNdG8rXSvmabzT2bXvYC9bW4VpVqgC54xYXqEjMSQSjUhma7
 IyM0DWLAaDe/JYi9Zz0ESDEg6rtbY3YCKMvAsY6mgoTG7HZyMAew=
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

