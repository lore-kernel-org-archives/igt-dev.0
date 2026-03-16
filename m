Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430ECF46449
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:26:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECFAB10E264;
	Mon, 16 Mar 2026 10:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="xLE7ysgf";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7871A10E262
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6108B4E426C0;
 Mon, 16 Mar 2026 10:24:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 38D175FC4A;
 Mon, 16 Mar 2026 10:24:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 51ABE10369F53; Mon, 16 Mar 2026 11:24:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656669; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=sLKx7kL29gS3PevNbSGMLolfYFKHwGhccO3OGxrCJ00=;
 b=xLE7ysgfkLEtesiiHqw/gPzbudtZCLp1M/TP0Kqp/FLACMle80IE7oltdSiFR7l/lal0gq
 OUPWljpeLPvzUGnlM3rWa/K+IEnXIdwytSiGCm2ecIWL4eNZICJ8LyJIp7ci5tGmkiPtu7
 Z9B3uUCCQ61pCriTnHZosjthm9uWNlLjmjadPVR4I6xSNcQ4SCM7va04ciRNoOqKahI1EW
 z3wcC0UZyzPvUnLksb+KUZtY1dFyhTeLYi7ZO5gI1fwHb7NF/173XxNfgAHY5Th5L/Qby2
 21nF7RV4t9U654R+2TApuyC+QGzLknSC35KcVpnT+4mSR8M2ACreUNYcF9vyrw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:56 +0100
Subject: [PATCH i-g-t v8 48/49] lib/unigraf: Add helpers to get the current
 LT status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-48-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1668;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=zBoMxWSAP93gccKT8um84KhbAXMd1VMDY96LvQp68co=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pVnHfQJmAu4NmhCDDPHkiav0P9wvZpU8qeY
 s1gH2QX97KJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaVRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIPUg/+KOhoRnXfHA93EeumE9swoMkrsim542w
 KK5B8u3vMEB7Jx/P573RTcuyIG6MmmHtdefYcks2Z2ZJhaGyUWYWguatzoAzhJuKr2Qw5BTIQcU
 LM3vvDf5fRe+8RKUkwOF8b9+fDF9JfA/XXu0DiYKu9Ke9u6quwxWDER6Qq+SJCTQP3xmwMzkCmG
 69jmug5O271dQ0UOjWzw86GOp1Y9nGctbCYhbupTStHIBlnKrxmB+QECfXYz3Arb4SQ0+XgtYOA
 NGWU2YXxdQ7VK7R3hif7fkZMCv7L+/k3RiMlRANCGiIOlFe9b97MDdor4ljbC759MwQuHR5k6Mn
 T7ueuJSAHBhEkDKzR2/+XRHnIM9q+tu9vfq5n+WJeWN6dq8StOfnWBeYgUYX6yIyksS84Ttr+p8
 Gs/cKNcDbECJDxTwrOpg2sHTD+zJUXIaftcCPQ76VlL10mzgdDPqmKfW91ra1V4nl8TC9rkHF6A
 zW8cTJKUgHNZjEqGlqbjl40LA43Kpfp4dXRvghbZkPxSw4/5qZ/uwFr9WoAeeugaKEGzJPVCoBD
 3NL8t0MvymtalD/AOEIoxwiJYLXa1pa+ixXlY2fYOf/c6ZK+4mGjKiER27+lNCBvTihe8cVWrce
 NJPFI9d7lWP7NFFih9EEGz3xPoyrBkyCd3irO9jNvxXT3mDGAWDU=
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
 lib/unigraf/unigraf.c | 20 ++++++++++++++++++++
 lib/unigraf/unigraf.h |  4 ++++
 2 files changed, 24 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 74957b6b3f5d..2e38dbfc9f1d 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -836,6 +836,26 @@ int unigraf_get_max_lane_count(void)
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
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 3cba15732daa..8032ef8e7fe6 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -98,4 +98,8 @@ int unigraf_get_max_link_rate(void);
 
 int unigraf_rate_to_kbs(enum unigraf_rate rate);
 
+uint32_t unigraf_get_lt_rate(void);
+
+uint32_t unigraf_get_lt_lane_count(void);
+
 #endif // UNIGRAF_H

-- 
2.52.0

