Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FC3D25B5A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:14:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B4910E6E9;
	Wed, 28 Jan 2026 13:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="x6lLmlJc";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0D310E6D9
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 46225C211E8
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BF9DF6071F;
 Wed, 28 Jan 2026 13:14:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E1798119A881B; Wed, 28 Jan 2026 14:14:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606079; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=57TFzKl+2SRsvM6e/cAgvtl1k0owV9oeaLn7aVwaOHc=;
 b=x6lLmlJc72avgi0Z5dhJTOb2KGU5tgOMnzyeIwW6V62ikhRWcqTzLpq1NeqbF/nUc9P3jE
 9kfPe12IsCAIVMP1ARiB16apqx5wzpCgarhK76RDRT5a4MjnHa+2/hhQHSH0h3zJ3dgGWT
 0eD1ghPXxVJNXkCAoULQnR+/4/x3TfMIwJTmk+jZhbflFMTvHZy5ykI0XHCLclfstEZgpR
 Ye6EqhkpF2ojuq7bbOzW5nrN0pkw+wvuvf/GwAAO2GuOBhRkio9dK0Bs6btz2WbAOQo6a0
 oh2F+JFNrGNEoFxVkUs/Rv3T6u4gxQQ4VoEqySb0mTsN5ibb3w6ybiqmMLDvbw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:14:43 +0100
Subject: [PATCH i-g-t v5 12/48] lib/igt_amd: Add const when make sense
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-12-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1578;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=imoyiYaQ4r0RGLIZsyMkXVhd6gC0/SPlQOCgPWS9cws=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvJrgjKSN54bRJ96JyVylrvzrjnWPfdNen7C
 POAc3/9sXCJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLyRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIvKg/9FE+GTQYmIzCZ9XMaW5XKYKdH66c5u4a
 ezRkt2GeAvfxOIkR0Hc8QBQuXb+hz2NV82cdjpkUJq0KNzvjD3BTXuEpyfInzPGC9AgYjqPvoUS
 k7NcFFJHOZgYL2PXJTyVNPfcaTLVe0NoYQ3nivA5bJv+3xBAEtf2GMpgeYyI9kDm9wy1ZCd7rIY
 V34t5X/Q7Lv/s325JW+C3EbcjtXmXrcm6aB/1OEFk1Q9GIMQ5zzbRAD+/XZE4xvliZHq2t9HqKT
 N/YkJQLtlGuMvkPMxnNMEYzynN7OaM/x6NcS8BgeM85qPbva8n/T2PNOjUaoR9dvGXzfLJVVvdF
 igjREvNx176xO1QMIxjyGL/yYOtaqedgqY4Mhgz99x+nSVEmDM0J2vY83xAiBiGZxQSRiKhROUP
 H7Tvt0QN8JpVtLUL1xh9eIJRd2wF9mIyvob2yeXDvosZidj4x9qZcno5TwkmNyfmxOxaf3PZYdx
 plNUopFDtl/6APcCOr5zhSHnYssMwerAAeNbfR1Q8f1TNes2JG/l/EGTBnJ00fy9y/BhCbMU1DJ
 D3JfER8qjqWmcZFqsEkLfy/nZ1M/ECWgb6x/G/CGqvz4CfvdEfAhgQwKZ5TkmYdMJNdqo/3Wta3
 zctyjt1MHgbkV08Ih4pMyvvnYKx9ViQQ2mv/3kX1FfohOSRU2z8s=
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

Const qualifier helps to avoid unwanted modification of a pointer.
To help avoiding those errors, modify the function signature to
use const.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 lib/igt_amd.c | 2 +-
 lib/igt_amd.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 3ddb5f40374e..081bad411355 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -831,7 +831,7 @@ int igt_amd_trigger_hotplug(int drm_fd, char *connector_name)
  * values of "Current", "Verified", "Reported", and "Preferred", respectively.
  */
 void igt_amd_read_link_settings(
-	int drm_fd, char *connector_name, int *lane_count, int *link_rate, int *link_spread)
+	int drm_fd, const char *connector_name, int *lane_count, int *link_rate, int *link_spread)
 {
 	int fd, ret;
 	char buf[101];
diff --git a/lib/igt_amd.h b/lib/igt_amd.h
index bce4657cbcfd..217ee6dcbd02 100644
--- a/lib/igt_amd.h
+++ b/lib/igt_amd.h
@@ -210,7 +210,7 @@ int igt_amd_trigger_hotplug(int drm_fd, char *connector_name);
 
 /* IGT link helper functions */
 void igt_amd_read_link_settings(
-	int drm_fd, char *connector_name, int *lane_count, int *link_rate, int *link_spread);
+	int drm_fd, const char *connector_name, int *lane_count, int *link_rate, int *link_spread);
 void igt_amd_write_link_settings(
 	int drm_fd, char *connector_name, enum dc_lane_count lane_count,
 	enum dc_link_rate link_rate, enum dc_link_training_type training_type);

-- 
2.52.0

