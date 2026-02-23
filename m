Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E797BEA4FAE
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:09:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD0B10E35F;
	Mon, 23 Feb 2026 12:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="cngqRVZ0";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3EB10E384
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 87797C143C5;
 Mon, 23 Feb 2026 12:09:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6D8A25FD43;
 Mon, 23 Feb 2026 12:09:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E053410368F90; Mon, 23 Feb 2026 13:09:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848574; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=wZ4HgBNB/upTogvrbNUWCWXi0kTz64CCPWvfnKs9KF4=;
 b=cngqRVZ0DmIwyj3LDCVRycrbK0z/JOi4b6ea2aT1kS673crzUtc2zFoo7kCXsASpLfeuVf
 tEzoYnNacQh4fBsipaAHX7UymyMY/eaFYxUjv690+tBUBjRCgMFsN9xeiWOVewBqHFYx1m
 UM8Ij8jtsfuaE0YbOlyX/4kc82qHHxylyzxDj29Wqb2b9gpgiqFTuXvHhwU3e7gz+2rlcX
 e7kgbJ235S9CoCl7swAYDUSZUwH4y7KxuU93sfB68OTdu0axNVR2QYAKZEfEEpEgPMKxLe
 CtX7r4cKXU1w5S7ZbmW1gfk9cBhmgoFOVmCv5IkCf5FROnIcx5bQrgSNPQUK7w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:54 +0100
Subject: [PATCH i-g-t v7 47/48] lib/unigraf: Add helpers to get the current
 LT status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-47-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1663;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=M3XqNq6Xg180+9LcH0XHst/yPkugjNJb7CeTlLILieM=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENtzWOLZ8J/G5Uuus3Cl8L3E2ac4dnvfC/Fi
 rRIQVByOiOJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDbRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOK3sBAAgO6rMbxDSRQuURqex1qxBgXDLYwKdul
 4SYHE9UjcS3rDxjmeioEnc1QPu6g33uXRSwMbbfyGqPIuEN4xYf9JViR128iEaVi2D8ubI2uHYT
 yhgpZ9M15vH5IwikGTNdh8M0R0y7oKzOdrYtoXbXZ79mmzdpkse6eKyjsolLHE4PHSBmRdhiwXY
 5xZAmOg6bdFUAU2va1gIGP6boYpgEzM8/B3WuVBwUBvPN4pdgpKXSve3CSLkKy6aolsKyFf3LEM
 +AbGv6DBDNi2+MULY+/jICaPz1H/6eVppU/l+YN+UFTg4DXZXBQZW+M0c2xkxN59WubK3aYyAse
 yjDsi/Gamk4kcRVDkhtMajLDwMJ3Sjt7GUrxxKXHahOvoDjrVSs2y1+7FZ41hOQoquWG8mgSkLA
 x4Ojk6kmrlqiMzvweuI6iVZhk/cJBcEDGiG+a3ZkyOYT28lrEps6N6GSagYqjhDM/wTHouwROTX
 r7GzOjQeAVEL+vO9TF/K7JXykbFJrwS8D54gUKx+OCRWtLrIpC2P5nNiFeEDbcNSZwSkyoWc+Ec
 GgkIWTuCBch6cKXzsKz/nf7r5YQy/nePtedxCAZcF/XzkLLTkZ7HR/TwWEhaYtCiwzMAeKa61Ih
 BA7gV7BQ0sLoSTrriZ/ZF27aTrOjgdfFpRvMqDOp5Brpb6pBd70s=
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
index a18a90caad56..249eeaec2d05 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -834,6 +834,26 @@ int unigraf_get_max_lane_count(void)
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

