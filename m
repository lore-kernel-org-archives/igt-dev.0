Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EE2FED3EF
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 17:00:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FC210F642;
	Fri, 24 Apr 2026 17:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="QNkvuXB9";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226438961D
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:55:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 109EE4E42B06
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:55:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DBE87604EB;
 Fri, 24 Apr 2026 16:54:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E771B10720A30; 
 Fri, 24 Apr 2026 18:54:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777049699; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=5xXryxEmKUtgmQm1OC6eVPuTMK1e8qTbkx4LM3R3df8=;
 b=QNkvuXB9LXiF9heaA/XgstjxexGTWxn9TP2+JB6ieHh+K72Qjqj+vsSxwlrYkqCtrncYl5
 BIU3T3xeLllwlEv5qTWd52+IP8BKtmlqVsF18c+Y1D9DwWeED/YMUN9Hqev6V6CHyNe7CR
 Dt3Ry+dLMqqihUe3NV4h28zeoc+5qQl2uOR76Fr4UFNqYlWWiWfzhvYKc3aLos58dK+Lg1
 HWfTlkD2YfXTOllpak/1JzBsmVd5ZKyh5wyc2jNmvCzSFGooWIZzRa5qJXhGD1uY1dxEQu
 DrH6Kimxsi4f9MtMccYKN41WC0cqMG1aZHiNCx2G7tVy3TNclMw/UFuh+HHgfw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 24 Apr 2026 18:53:07 +0200
Subject: [PATCH i-g-t v11 32/49] lib/unigraf: Add unigraf CRC capture
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-unigraf-integration-v11-32-0c5f5346ae60@bootlin.com>
References: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
In-Reply-To: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
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
 lib/vendor/unigraf/unigraf.c | 22 ++++++++++++++++++++++
 lib/vendor/unigraf/unigraf.h |  4 ++++
 2 files changed, 26 insertions(+)

diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
index f3353b8c3bb6..e7e643abbb98 100644
--- a/lib/vendor/unigraf/unigraf.c
+++ b/lib/vendor/unigraf/unigraf.c
@@ -17,6 +17,7 @@
 #include "igt_aux.h"
 #include "igt_edid.h"
 #include "igt_kms.h"
+#include "igt_pipe_crc.h"
 #include "igt_rc.h"
 #include "monitor_edids/monitor_edids_helper.h"
 
@@ -664,3 +665,24 @@ void unigraf_select_stream(int stream)
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
diff --git a/lib/vendor/unigraf/unigraf.h b/lib/vendor/unigraf/unigraf.h
index fdc4441740fa..67fb44db107b 100644
--- a/lib/vendor/unigraf/unigraf.h
+++ b/lib/vendor/unigraf/unigraf.h
@@ -13,6 +13,8 @@
 #include <stdint.h>
 #include <xf86drmMode.h>
 
+#include "igt_fb.h"
+
 /**
  * unigraf_assert: Helper macro to assert a TSI return value and retrieve a detailed error message.
  * @result: libTSI return value to check
@@ -71,4 +73,6 @@ int unigraf_get_mst_stream_max_count(void);
 
 void unigraf_select_stream(int stream);
 
+void unigraf_read_crc(int stream, igt_crc_t *out);
+
 #endif // UNIGRAF_H

-- 
2.54.0

