Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B96AD25B57
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:15:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C86A10E6DA;
	Wed, 28 Jan 2026 13:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="TYlISsx8";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D6E10E119
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:15:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 7FB65C211E6;
 Wed, 28 Jan 2026 13:15:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EB9AF6071F;
 Wed, 28 Jan 2026 13:14:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E9749119A880E; Wed, 28 Jan 2026 14:14:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606099; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=N38KY791UR7qWlaTcUDrSaCnSXQ+CwlaMaJ0V5+a1Q0=;
 b=TYlISsx8Q/waKJ0SgOy1CeVJCT8UgPXJ/z7g1pW6Ogde2CrUUY+mqr6HCz+WHGKuV5TSRS
 ciq/ED6Fe6qS2RkfLAW22jScj5HAnGthIuaV5gD+YXh4YBP6OT8t0SWYa+rZeufe0Zh4oH
 ZiZD6TkBtyOQ07t7NTcd4cwBBO+jsnkRTZ9Er/1+i0sZbmM7OCoYPMXUxQZDgSp46yOP58
 lLFXu/AiNjpihqMP0Ju2MPKiqGwV6TWC4APefCDVlXYXIVv/RocPvj50abwrYGwF60UNQ9
 yOwMS76BegZTrZoJ8BHZSjxyTBX2YvSbIw0GzV1AyLAPdRmFzMDgGTWgteH1tQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:15:10 +0100
Subject: [PATCH i-g-t v5 39/48] lib/i915/dp: Properly check sscanf results
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-39-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1905;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=T2p2V7hYzh2KMea4q9Yc0/EkYmrXLKFL8wt/5FNTZRM=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvMvHB9aUrc57yQhN2lleyRJHvdLXQ/8Y3sy
 tyyE8eAA1OJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLzBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOL5NxAAm5RaHAM01S5zJVjlJ9kOHE/ARtXEkop
 sSfauaSwNylDxQVbMPJ4wvR0Id9q3+wsmufRDf1B5gaRsuWszUqqOOFM1/g7MlmuxfcTmNnkuaf
 SDp1OGN3RTYm4e44bPoe7BGnfxuK16mWpDAwXoB8hQvsitNFXX1FIf3kCwx/rKEfQwu35lSfue/
 pUpXkkHfYW/tGFzOn+YYYzTZ58DM4k+gWxo2dTD83ccKvnElmqlwvB1ihr2mN/NYV8YhJzvRygv
 I8GEJFP0CTu+YvJ1aK19Mwr5wtCXk0OUUBIoFJvbJzCElnbQgBEt/3ihZMOKbMuNYmbOvCOm3gE
 Ra8zDUA0yS01gJUdcQG3hT5Jp0QQQYD4VH9c+dMU7P9e5bIWEwzeHGBf1CRyJdqTzYxOGOv4EGA
 5FPhmivsAJhxpKDaSW2JK6QmU79vPYy+u2Lsws49lFAbiMh+soBAyUpOUgI3TiIlag/vOspPmBC
 E6P0szcmlxy4yPhjLcT2+OY1HLzEmlV3VI8dJep5BBDSCbOGx7sYJWh7lolEfFmVxZNWBOGgBeO
 GW2F3S00E3SKurNt2EPEzRFSt+eJwzWcH7XtC1YrtdX8vLaRT4pwUE457wW9tQpzrrW3sh1W/2d
 bKcDA5rd1zbrGT7EKOjqtmosjdR0CIZUebnQlfZ/zOFfRawTh2Ek=
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

Current sscanf usage can fail silently, add assert to ensure that the
returned value is correct.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/i915/i915_dp.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/lib/i915/i915_dp.c b/lib/i915/i915_dp.c
index 219f3d29e362..53caf3fa7716 100644
--- a/lib/i915/i915_dp.c
+++ b/lib/i915/i915_dp.c
@@ -101,7 +101,9 @@ int i915_dp_get_max_link_rate(int drm_fd, igt_output_t *output)
 	igt_assert_f(res == 0, "Unable to read %s/i915_dp_max_link_rate\n",
 		     output->name);
 
-	sscanf(buf, "%d", &ret);
+	igt_assert_f(sscanf(buf, "%d", &ret) == 1,
+		     "Failed to parse max link rate from %s\n", buf);
+
 	return ret;
 }
 
@@ -123,7 +125,9 @@ int i915_dp_get_max_lane_count(int drm_fd, igt_output_t *output)
 	igt_assert_f(res == 0, "Unable to read %s/i915_dp_max_lane_count\n",
 		     output->name);
 
-	sscanf(buf, "%d", &ret);
+	igt_assert_f(sscanf(buf, "%d", &ret) == 1,
+		     "Failed to parse max lane count from %s\n", buf);
+
 	return ret;
 }
 
@@ -230,7 +234,10 @@ int i915_dp_get_pending_lt_failures(int drm_fd, igt_output_t *output)
 					      buf, sizeof(buf));
 	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_link_training_failure\n",
 		     output->name);
-	sscanf(buf, "%d", &ret);
+
+	igt_assert_f(sscanf(buf, "%d", &ret) == 1,
+		     "Failed to parse pending link training failures from %s\n", buf);
+
 	return ret;
 }
 
@@ -251,7 +258,10 @@ int i915_dp_get_pending_retrain(int drm_fd, igt_output_t *output)
 					      buf, sizeof(buf));
 	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_link_retrain\n",
 		     output->name);
-	sscanf(buf, "%d", &ret);
+
+	igt_assert_f(sscanf(buf, "%d", &ret) == 1,
+		     "Failed to parse pending link retrains from %s\n", buf);
+
 	return ret;
 }
 

-- 
2.52.0

