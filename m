Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE13AEA4FB2
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:09:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D01710E36B;
	Mon, 23 Feb 2026 12:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="zKWNrB4H";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1174A10E36B
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 04F6B1A0993
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CE4AC5FD43;
 Mon, 23 Feb 2026 12:09:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A8A1E10368F8B; Mon, 23 Feb 2026 13:09:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848556; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=4Agfyobk97xjgyG8yq9CtIlmTUKfdoH+Ifn1Rr+Y4LA=;
 b=zKWNrB4HZzeIBt9brwQe2UruvRiTNPT0l7OYpjTh7QHNEXuaL0Xv+tSOhPLxHvcmmNSvoZ
 cDk1flefw3Hh9M21dcjr8tqXF5h/ofrkvLd6d522TdrXmPdM67olx16AHDrpqKiH+yTkSb
 wxkZXZkYfWJVHLQxBjHLc6MDT5pfumLjq+AvaOqwkHHqtLH+ZDTwmfg1swqYk48llknkwD
 kERSx21X/3RZtN593veivTC4rjI3dqzNNSLDNRQ4DQtoxMtwOxn9fj6ObF2cP+IqJo0zwW
 zQByBtaiUB/sNEkqTzBMfNLyh3cfYZcGdJW2IvLUahNF63t5rN2IjL6rQPcfdA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:38 +0100
Subject: [PATCH i-g-t v7 31/48] lib/unigraf: Add unigraf CRC capture
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-31-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2188;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=SstysiBbUGJGplIWL0bIDze4UJ1oVT2fObj2ctD+HjE=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENqnxOS2xx/ZCqcZDtvr5J/9jnqf+kYvCEpA
 4stxR1dhI2JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDahsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKtEA//bm5AVB/i4IMOr3rv7lwhcxa/ZHpD3H2
 dgADW8OQM4QoRtOrRWFxQRSoGMXOPtr4+obt8UrwbMZC49DdksUpZ+I313sLkrAWFlzE5P6CJT7
 944+UwdSQ1yvzOG8wblnlYRyzBcEBPi5Oh7TBq0jr92rZSPYA7z89bffsHjQYkX4II6Jkno42ni
 uRwkibO+rRJaQCGWAjZMqEd2s0cdjedxJoEaKmJOhrgDBW0X1b2NoxWkIwg/UTyO3P1IIQ37ANQ
 JtLZ3PlWx9dm72KZfEZL3QpjjmZRDaDQAwPHV7bQl2sPioyQbG3Q3KDqnJXUcaNgLALWj5WRunZ
 AZnDVPhXmxZQGHQYMOaF4vkMafyDroShvtFzEdZ0KsnQkfTH8d3uiA4K6Tv4Qkf84ADBoD5j3a2
 f5ZlhnlDSoBZsr5S2NxzIfyO+sWjhL62bgR3qx2ZPRFAAe8l+aGMJcyA1PI+6vP2Ms4dU8OU6En
 LMz8lUC+Dl9zURHltI+hE87xFQIdqTgO/5cMcUvKMfaLn3x3Ss3LIO9u8ZdZl6Jo71WWm6oVqhu
 jQxWQfWLl9E51349sb4gWMMi+9Xb2Ea/TeTM+lCPJdvoSv5k0selWGSf3HGNEXfpaAJJsI0quvj
 h767/b53SDivIja5pignBDqWD1VePIqNOn8sJeQhciZH8tDBwH3Y=
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

As unigraf devices are able to grab a CRC for the current video stream,
add an helper to read the CRC.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 22 ++++++++++++++++++++++
 lib/unigraf/unigraf.h |  3 +++
 2 files changed, 25 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 549196bb90bd..927eee3d184d 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -15,6 +15,7 @@
 #include "TSI.h"
 #include "igt_edid.h"
 #include "igt_kms.h"
+#include "igt_pipe_crc.h"
 #include "igt_rc.h"
 #include "monitor_edids/monitor_edids_helper.h"
 
@@ -658,3 +659,24 @@ void unigraf_select_stream(int stream)
 {
 	unigraf_write_u32(TSI_DPRX_STREAM_SELECT, stream);
 }
+
+/**
+ * unigraf_read_crc() - Read the CRC values from the Unigraf device
+ * @stream: Stream to grab the CRC from
+ * @out: Pointer to an igt_crc_t structure where the CRC values will be stored
+ *
+ * This function reads the CRC values from the Unigraf device and stores them in the
+ * provided igt_crc_t structure.
+ */
+void unigraf_read_crc(int stream, igt_crc_t *out)
+{
+	unigraf_select_stream(stream);
+	unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device, TSI_DPRX_CRC_R_R,
+					     &out->crc[0], sizeof(out->crc[0])));
+	unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device, TSI_DPRX_CRC_G_R,
+					     &out->crc[1], sizeof(out->crc[1])));
+	unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device, TSI_DPRX_CRC_B_R,
+					     &out->crc[2], sizeof(out->crc[2])));
+	out->n_words = 3;
+	out->has_valid_frame = false;
+}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index fdc4441740fa..8b38261dca09 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -9,6 +9,7 @@
 #ifndef UNIGRAF_H
 #define UNIGRAF_H
 
+#include "igt_fb.h"
 #include <stdbool.h>
 #include <stdint.h>
 #include <xf86drmMode.h>
@@ -71,4 +72,6 @@ int unigraf_get_mst_stream_max_count(void);
 
 void unigraf_select_stream(int stream);
 
+void unigraf_read_crc(int stream, igt_crc_t *out);
+
 #endif // UNIGRAF_H

-- 
2.52.0

