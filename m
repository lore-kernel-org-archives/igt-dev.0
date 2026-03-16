Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDCAF4644A
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:25:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5779310E263;
	Mon, 16 Mar 2026 10:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="t6DIbNQY";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C0710E25A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id BDC431A2E6F
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 94AD35FC4A;
 Mon, 16 Mar 2026 10:24:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AA7D210369F47; Mon, 16 Mar 2026 11:24:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656666; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=NxipDSJdLUtNQgCIvq18oms8AUvYxa/HjM6xPcdiHfs=;
 b=t6DIbNQYvt5VX5fpo5AqmVLesQijMhJQaNOzbih1VLXYAuBnvMh+zdVVEp4vYS5BiyB4mS
 85RPDwqo/mOxAo+x0g4pgk1OpZ238a+ALOTQ9afFGaXi672xhA1ps2Q02/U2siORt3eymR
 2nNlCqE9pNrqDzP42np2YzaDDUEJ/1DpVmchPQYPKBckERIxiPJZE/OBAG722CrbTnwHxm
 EigYNozsP7vvJaOdE2LSZsA9HYIRJWWd7p74QH4gXkPbHQ51DBJV3+V7cQTQUVg0ujealB
 mhVGVcnmAancFVD1PrAHdJujwJRMiPzqCbFXNHTZm5duSpaErgBMKIpSXVndbQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:52 +0100
Subject: [PATCH i-g-t v8 44/49] lib/igt_kms: Add helper to get a CRTC from
 an output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-44-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1449;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=EmtlCOcOLwxG3gn0a/PLOFtA2Duc2BodrtE1TOMMV0s=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pUviDMvmeyiSd/WzuP4rmbYTJNoW0rWjk03
 HhsBvAnFTSJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaVBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIUMBAAiBsFEwpNYDe2EOCJo7WOLGmsRxCYZeB
 QD2MUTsVfQGkejVvmCAdw5sNG6msBDi3SxnW5v/vQQaawN0o5CQ8Md23qyPVJLrBQKBLYVvuurP
 K2Ikb1tyairewr0qrDf3or4FXQegJZx99fLr4Kc7AaGmHDh0LpB4KcuUzpkfeVuX8a2ZE1AyLVE
 CYC9sPKnsxN2gCqcJuBHvvg65+xu8fEVckKe0HvZZAW+ugL311lbX6Adm7nPHZymUFZvyrxTN3T
 vlXX+oSPm3Gp+phibHsmrTWjMvCwC5CQWAAvsFAxfGinvYsu+gCwzbmKVX7pyzOmmET/E2Qp64S
 2jp4UWjC85aRj947GqJ/zzlWjcYVe7MvsNoXHkgXPCWCLOVKOxn003CBbQpRef5ylNY5qU5ygzI
 eS4skJc4+PQ6kBCGVAJgpQ4r3nR0qF/wep/+Uma8DdvF8qtEsAIWRo5KP4Az5EWTiHCJBZBVpT4
 HkHRKfOHkgU6QzSq8Gy4y7iIz0q9ZfezFkecMo0tdGdP6z5Az27980Cx+DUsT/tzUUKi+FI2Q84
 6bNvJ27eL21VEeEG4P/+TScS/VTIqNuo5/G51JTmzEAwzKy2R+88ulzbgwx65XjpT7tB4wlnHTV
 JKdhkeJMXZncLuaiJp5YrHS0FpISBxV+/m0yURWv4eS5NCr3S3WE=
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
index 81d5077b3acc..d3ab26576313 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8090,3 +8090,23 @@ int igt_get_crtc_index_from_connector_id(int drm_fd, int connector_id)
 	}
 	return 0;
 }
+
+/**
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
index 042fac6b21b0..af27e8fcad4e 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1311,5 +1311,7 @@ get_array_diff(const uint32_t *array_a, int array_a_len, const uint32_t *array_b
 	       uint32_t **diff);
 
 int igt_get_crtc_index_from_connector_id(int drm_fd, int connector_id);
+igt_crtc_t *igt_get_crtc_for_output(igt_display_t *display,
+				    igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.52.0

