Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23ECCE7DEF1
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:32:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA22010E4EC;
	Mon,  2 Feb 2026 14:32:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Kn6+xP0k";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B5310E4F6
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id CA6C84E423C3;
 Mon,  2 Feb 2026 14:32:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9C48060767;
 Mon,  2 Feb 2026 14:32:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 688BA119A88F8; Mon,  2 Feb 2026 15:32:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042775; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ipmOhvdGHwBcJLUS3K+7IPplk/yRbtYoL0q2xAFv4Ug=;
 b=Kn6+xP0kFwXa8z/EJinBMf9m0IhV9Z/b+gTUCwmUvs+emoBtq0BwD2TXbyn3UEq4bj1jgR
 Rb6S/keywoca23ZPgGJBVoHRjinM6p2fTZHSWjsqEPB/120jMzRMZZJ8CpoiGTzeWJfocx
 KTUz55cyK7iFXAm+XdS1DpqNL8dUjKTzV3GTkgkMMdB/3Ek5RhRMRQaAINKzb8W0lE6M0I
 PIN6h6kqADteWRy/JYC0hhIOMPEYGD7VTwjGqlDU/WOlQ11NIaPh/yp5t2NfaRjXPfWgdy
 fQlT2/igvl1yetXf8h99Z+UDLcd26Rb7OW9rSbuXHPE6QE9rErM70kph4Y4Dgw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:33:10 +0100
Subject: [PATCH i-g-t v6 31/48] lib/unigraf: Add unigraf CRC capture
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-31-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2130;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=5OBRN4j7Gs8dHpOF26YzpuazrIPsuy+KEfg3AGtbCr4=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWSL691juJsUi9Aa0teuXHrBzqV85qo70S0s
 Bq8Cl9jSaaJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1khsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIx+RAA1uX5nQ6D59mZlKyNTDZP6/0sN4wyJ0l
 RU6nuALssS57l8U4GJ88koaQ7bt/YgpWZi/B0uUU0A2dRVto3jU62G+Kqy44xdIZe5BR9oj9Wup
 cpicD7d9R6vxq3SVAfVEV7Cvmue+D848j5Ih1cLQsn7HjuBxDkIpxgXKAbnKqD+HiZZXyAw2R+O
 X3pyBx42Bq9ml8Ul7Xd4bk+C79XY59BN5x4uiVp9MLF/Seb1PKR4Um1M66oFWrYZSX+Gy7WJHaj
 QB7jUNDmjzEUvUd1bQPnONSD1kPWaNu++OTOGrssAfu8XUqK+K636VROBRkOwbTqfHn0atvPJ6S
 UReYPOEedSzmdBDGvnY0a7Y1X5IgGCqklcz4hyZAar+3VchW/sH9GV1wrli2IuGTPIcy6/3RHTP
 dBjuS+2dtRqSdrNHHjMTyMSojmtUwuUZbIK4v4qeiNjTRS9CpOO9o4Kp8+B0/5FThD2zpeisEs3
 Jy2wscCnDlTVG+OvHaFq+UqfHqkNgCCOOuJ+qUaFeRiV/Cjp2p7+f5HyxCw4a6eZfkOCcuEgBK2
 eTcVawm6BTbBiihcVMkrfz/8hXjyvQf9wfhxP/1cIYyI+Qz12D7CaF9ARwIL96jwoQfMAPpOppY
 KG6BULWyDf82HJSL1iH7POe9v4UOHgP0U09gmJJ0gyPIU+PHVrk4=
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

