Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD06D25B5D
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:15:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0191410E6DD;
	Wed, 28 Jan 2026 13:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="HNjBcRVG";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242D910E6E7
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 16B1D1A2AC3
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E0D836071F;
 Wed, 28 Jan 2026 13:14:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EC64F119A882B; Wed, 28 Jan 2026 14:14:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606093; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ipmOhvdGHwBcJLUS3K+7IPplk/yRbtYoL0q2xAFv4Ug=;
 b=HNjBcRVGnxh2yrBpIv3vp4DHx20sM71rG/tS3HWSZKhc7Sbpm0np6ye9dLasjEYif5LFYU
 EwmLtxwoWsPM8R8cs1kfujCFo7lRMTPCeKMiG5+V6r18KoyoNY1qSciMmNWrji9RMCjzoh
 ycmhso/gkQ10ji6lKnz0JAQSG17F/Z0pxrPXbdhh6TepZPZg8H/uk3bp1dZNAyqOBQEdRl
 9ADVfwMth5d8bDG2/4vgFGIygvAdKbqy1zbydJIbyLcgazmytA1dCXgzjkguw3dGnb5pTX
 6jCzVaPUQvoOcRIJtAV3++ZRjlg02gzrcl9jkG+SZv3kn5o6OWUMQiJt1lDtqQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:15:02 +0100
Subject: [PATCH i-g-t v5 31/48] lib/unigraf: Add unigraf CRC capture
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-31-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2130;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=5OBRN4j7Gs8dHpOF26YzpuazrIPsuy+KEfg3AGtbCr4=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvLVVfJbZRBFs0fmdTsA/pS/8+94YpI0pylB
 xaov39d+N+JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLyxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLESBAAnxKSuYZ5PwkVTD3WWwAP+BrqsBh2RtI
 nlaYDgpNgLUkQnnm5stsRwq7czH5G4B2wYa37ODok0bMZPWNgcAYm4BJFjWlFGIRK2uzmylyWyl
 rFwZ9I3VJGPYXAd+KIRSG4TTFqUpMLyMSlk8omM5e3V5dUm1JCdbP3cO08ZgbiMtlGW71QDm/hS
 rNl6e4hycIpSN8D+2Rjq6XEW0fG0dLQHtn0TvYk/vdYk1Dewv4Ns3kO2fYvxyBKWJWVkB0LUQWk
 n9kFKDc014ccDPVsMUh8bO3qPhFRYM0o4GSs0iWw9Qe8U+bz+WnUhhJPhiyiUgLVxmtfq52kkCz
 1qgsBuUPSM8YascdJHU5I3mjkPQw8wlO8FcgaouYRJytqxSrD9AoXkSNi2eq2f7rwYc/eUDhu7B
 Cpip8Fi9jbSf3y2pnGotVO2x62nJxaKXAcXBvmSOwHqxcd0wtDA1fdwWca31HQn35OqzRntX9Il
 +EixLtzK7HKghDgdf8TCU9Tvz1x3LOETN9Kk9MM7GUWP5TgslptcNHLIjD+7NliQ/6o7gUxkxo+
 yHgCQgr2DmQMJBHuX+BtCK/osixe8XIjel+TcFYP18odd7esVy+mFPssXk9xNccpTUB1QDFMcVE
 YcXzHS+Y2SnLfOGFqlod0daL67nZ1oj4END8mgfVYJHFh3YAJJhI=
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

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 22 ++++++++++++++++++++++
 lib/unigraf/unigraf.h |  3 +++
 2 files changed, 25 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index bed65b0db247..e626fb5e8222 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -8,6 +8,7 @@
 #include "TSI.h"
 #include "igt_edid.h"
 #include "igt_kms.h"
+#include "igt_pipe_crc.h"
 #include "igt_rc.h"
 #include "monitor_edids/monitor_edids_helper.h"
 
@@ -678,3 +679,24 @@ void unigraf_select_stream(int stream)
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
index 80c0f3b92db0..380610622668 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -3,6 +3,7 @@
 #ifndef UNIGRAF_H
 #define UNIGRAF_H
 
+#include "igt_fb.h"
 #include <stdbool.h>
 #include <stdint.h>
 #include <xf86drmMode.h>
@@ -65,4 +66,6 @@ int unigraf_get_mst_stream_max_count(void);
 
 void unigraf_select_stream(int stream);
 
+void unigraf_read_crc(int stream, igt_crc_t *out);
+
 #endif // UNIGRAF_H

-- 
2.52.0

