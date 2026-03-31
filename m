Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5E110F92E3
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:16:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10AB310ED48;
	Tue, 31 Mar 2026 17:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ZxTzIlSM";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5009310EC48
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id CE489C59956;
 Tue, 31 Mar 2026 17:11:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 37C9E6029D;
 Tue, 31 Mar 2026 17:11:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 05248104504AB; 
 Tue, 31 Mar 2026 19:11:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977087; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=NCAJB63IP4l91LUz/Ir6mKd6v9Ni2Bu1s9FIRY4bQk0=;
 b=ZxTzIlSMeStKn2ef0pK1lzp32hx1n1YJ1Pyw+Z19l6w+V/qFVqLeEfSKHe1TvomysfMd5L
 BUCajmaxYqOgyFcgblxl9vrChHleyBVvc5GajHcraKTPMrJc1Sm4a8RTf1AyyGNqhzaEol
 xAUqCyywwuUgSyly2aNtX4cWDN3tqoAjxjAf0XZ5FPvPJ8Sh06cb3G8vBvXQTVk7dhU0GU
 fnHP51os1Urp0lbB0O/ZyVo3DOs8hcwh+f/PxV7LEY71tm9QvWZRoXXQEf85B/ej4jDwf2
 ev3MpLJQklEXHgAjpwIWQBf7FEk8p/pRvl1t8DJga1yPN+CZAGAvOiWNzucHQA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:12:01 +0200
Subject: [PATCH i-g-t v10 44/49] lib/igt_kms: Add helper to get a CRTC from
 an output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-44-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1449;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=CY45G9dCpLggxTJ1F9dd0+ShmDgmkJXguPqJFPsrrgY=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzABBWKzN8IbzkjSd0uXf4avQMxt9yh9QN83ED
 SkUfPV0hCGJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAQRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJAdBAAy2Ryu1wUBb9jE7eAuKxMZlSz3Py5CJB
 Jr31tDX21717+NVcjZPxUouwDu8suhSJRrHk/aFEBdUe2G8Wqkg65aM4CdyXpFTjQ3mZ2ezAMsU
 MTAL3FUEkVsYhbmfPBLxJ4HCklaFYpBxMjxLOuGECsjf5Z3f2try/gyLwiVXmz14smJbACJv69y
 8CnMbeJX7FjJZKe3LHq1ra+tk98lpiwE6vO9Cc3rD/xW8z88VUIbKvw8NEaMOG/19NJclpMnAaQ
 7Y/YXRlTmMjod9qXJ1xxbMNLEDpSCMB/r+lZ2SKw7VX+oCXnfHwKTUYufgRHGdKxXv0JjCtlueW
 0ewKUk3kraUCEL5QxTtQ1CvkhuTP2mvpl30Hxh/bvW4CRR33lyJd0Xa0DSqBhxFDYbKwDo8ug8f
 xQy2iNgfi+YpQaxKCi3ZP33HY5EYobvo4VmYrAYAGa1GfMO9XImA9i2toHYi9HkWblYu1NWW0V/
 o6abhWjZ21lfNLynq+mS+I7sYFZaVhjmo4p87jWZrFatCC9rkS/ToZfHYYir45GjfW4zItgWVYi
 Hz3d62LTF9MCFU7Hwc5W95sPGhD+Nh347pV0xvmk1StsLcx7kBN3VCtLPEOmhB0762mdUWHHZlE
 0sl1sqMIB8hQbx+sK8vbDtduhOk8I4bvy71qBUPbYXMC1gTgB/lQ=
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
index c2b2ed2d5169..878de55a06d0 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8157,3 +8157,23 @@ int igt_get_crtc_index_from_connector_id(int drm_fd, int connector_id)
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
index 441a1bcd4df0..fe4ec6457b52 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1303,5 +1303,7 @@ get_array_diff(const uint32_t *array_a, int array_a_len, const uint32_t *array_b
 	       uint32_t **diff);
 
 int igt_get_crtc_index_from_connector_id(int drm_fd, int connector_id);
+igt_crtc_t *igt_get_crtc_for_output(igt_display_t *display,
+				    igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.52.0

