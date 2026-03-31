Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84B210F92E3
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:15:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F80110ED46;
	Tue, 31 Mar 2026 17:15:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="g1teCOKM";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66FF10EC48
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 9B7451A30C6;
 Tue, 31 Mar 2026 17:11:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7273C6029D;
 Tue, 31 Mar 2026 17:11:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8346510450574; 
 Tue, 31 Mar 2026 19:11:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977090; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=H1HYFEhzOoDa8y4Oi804X0U870l+5MYWfAzfMCjlOVo=;
 b=g1teCOKM6aIVAnEuG4aFOQnTs7eohTjzKcrf1u7FMQoiVxV2QaTm+m8d3TvslN8rnLvMz7
 AYsW4x1K46NP0TxZbwm/usR7r1ZPzCGb3Lzw2hn/tQ0eR/rG93Fnqk8dIdM/xELSjo28MG
 7ObBTHT7dqpYLHMNYax2ubfY2ieqoOGetk8zfyc2vlmwNv6m4A2PDB0RVyLaVrobstj1DB
 0Nc/yQcxL0YfRMGOplDffumEjytzo2t/aKyU1VXes0zHi/mARmxyCxvhMBCjyMuqKBs9T/
 alDhbZ/zoMQIPgByp7Tb7ZMjBbpvsgDKwKg03f7XFJE3rXI+O22uuYKPLCRvxg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:12:05 +0200
Subject: [PATCH i-g-t v10 48/49] lib/unigraf: Add helpers to get the
 current LT status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-48-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1738;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=h7t0/O+Ma1VT8jIWD0w1V2NY33QoNNMBeB9N7hgczDk=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzABCMRlu/MDHI8N/8HCy7Yjddh2ts4zmXUvVR
 xdV3WrbzrmJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAQhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIAnA/8CTbgf+vVcb/BEjnfKtES40jgSe+twIg
 6I7CBD8pQydTzfJCV28GLcoEqQg5MMg2v2imUKBjGiUtmnNHzo7S0uXFY8ht6TfDb5TuUDsejih
 Yc/ad/pJ43um8yIy1jLEUTuRW3ANPyp5Fp5Kjnv2oRJc0updfLtmE5XPt0aAhyQhBIg+z9g6H0B
 PwsW9zMI9x89TVs/KROCqldI/AJo0mL9PB5MYky8ZnSNPiCX0zqMA0VrcqQHAWji4n+kdBrraxR
 hm81FjlsUpv7T5pQyuTvmXScqW0FeXsK/DN35E4Zrkt6pBAlov6McpNWFy0gfBKhsQWVoBNuwTo
 L0WlBDgIGv292NqqTun44xklSWIntt7cAFi6N3GKw8ZjSMU8+fP0/UZASF6i894OHirY/N/jNt8
 qZG9/5qmqx/R6cYpyNyHB38TvvIQbNvMY2K0Xe7Tp6+SztKFhDrR8bmdF2XldKYFKxepa1s9lNz
 ZGQVbkaX/jeYPbWgrLU+YVNBW4t1GsXibSwMoWWsNMASpV3x3qt4Cbc6Qii8rISiKE4gi7AC64w
 j6FEsh534/Yb7GeKIo1tNSs3hH0SMggRqiNfYp5a49oaq3mnigfuX722M9DyfCS4WrQLO2rdUjn
 fD2mW+EhZEoe4kpIwAr5FseSxjsRo6OxFvoBtGx5CVYCQYqlKqRQ=
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

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/vendor/unigraf/unigraf.c | 20 ++++++++++++++++++++
 lib/vendor/unigraf/unigraf.h |  4 ++++
 2 files changed, 24 insertions(+)

diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
index ae293ef5a64c..ac8dc3b01d26 100644
--- a/lib/vendor/unigraf/unigraf.c
+++ b/lib/vendor/unigraf/unigraf.c
@@ -841,6 +841,26 @@ int unigraf_get_max_lane_count(void)
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
  * @bandwidth: The maximum link rate to configure on the device. Actual value is
diff --git a/lib/vendor/unigraf/unigraf.h b/lib/vendor/unigraf/unigraf.h
index cb49b5897b54..1570be3feb96 100644
--- a/lib/vendor/unigraf/unigraf.h
+++ b/lib/vendor/unigraf/unigraf.h
@@ -99,4 +99,8 @@ int unigraf_get_max_link_rate(void);
 
 int unigraf_rate_to_kbs(enum unigraf_rate rate);
 
+uint32_t unigraf_get_lt_rate(void);
+
+uint32_t unigraf_get_lt_lane_count(void);
+
 #endif // UNIGRAF_H

-- 
2.52.0

