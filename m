Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313A6CD1297
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:40:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3BDA10E3BB;
	Mon, 10 Nov 2025 13:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="EGe7u0/T";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 062DA10E3B9
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:40:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E3DB54E4160A;
 Mon, 10 Nov 2025 13:39:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BB94D606F5;
 Mon, 10 Nov 2025 13:39:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EC5AB103718FC; Mon, 10 Nov 2025 14:39:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762781999; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=sv8RINmeSUZC8KvkvLgUg/1dml5vFhinhR8vpmWSjsg=;
 b=EGe7u0/TXW6Vk2/4ibZ5a69aPG5c8y9VjPnGkYb7VL4I21hSfzIfAjytebou2qWK6U5ZFh
 m1AWiUxrzv78e3XtLJcFUraIlGqced0UdY8bSz32riEejzL6hi2QSVKtOkNAdGW/Hd+Mk1
 BHlFLIJV7Itdzpit2WDb3B4cS+718/adMSg3Q6rO91XqS/gL3O2vA7v16tL7LEdEYF9QIl
 4K1sqtDpleSGmogEo0GB/4Z8+5Jo2ZUeuXkL2e7O7HMz1g0jns32KlJY5h91ZLr9+nWfV4
 x7XL4pTDS+4nCZBFWIGVbccsJxsGW/eOF55kHbRAb9QaBlGgC9ereYLIeFLenw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:33 +0000
Subject: [PATCH i-g-t v4 31/46] lib/unigraf: Add unigraf CRC capture
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-31-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2180;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=BlkKsNgon4RMB+ntnc6oqs3kK1iDeJNEkt0UabPomfM=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesR69NuSsAY0iBc5nj2vOlKhPrF5R6qxFHUj
 VJE9LPxEB2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrEQAKCRAgrS7GWxAs
 4hPmD/4vqASY0fh0aNPkMNJ0I/Tt4GuhTAeSg7cZNsjjIJAbYWf73LSpUL1cGTeDvV33a/LJQ0L
 7hhyN7KRnlTVbJoglYsxX6ErB23h82158Jt4r8b/ynKARzPDubcqDTUAvXUAZ07D4BX9LLnMbup
 I0A8GLwK6cZtylI6+4+nC3IWK6w8qcaLUhSvq8qI2+sltPl9X7YMzcIaFhIbVCN3wxFxb7ia/yq
 PqhNDCME+QgV2F5xsy0CiKGIZhZJZMUNsCn0LnFTwNuILbLrLFCwrwjnswmc0KrFwWL1/udjLqm
 9MPdUfOg9y7CGZVLXcdNmemRDI5lib0/Jjibz601jzl6+9F93TXex2/QZaOCfqP2EkWGXUC5Dpb
 hfe5GPsSurvZiKKnX0ATNVnQSZ1LURW54d9w/SdG2zDmpgcAB+OtRLyhpE8nYFfai4OdxnsTdeV
 4NoDA07skdFbGUWkuoXmtWgnPpZfCp5juTResFyhWpE5RYwsrZoQsCILDyo1hlHTVu1Ys+oXd06
 Loc/R00RisnLfoJOdXqNUY60dk3OdFrw4M2XteJF1uYu+na2jn70sEPtfLZ679okwnHajeqSGu6
 ugRWmvVqqNl1TsxlpVInhNirBgiWNoHtwCa+kZKYjB0ysbMlVDva5OkDwx3y/qZHG5B8wlk+xQP
 Klm1/0FhEBgWB0w==
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
 lib/unigraf/unigraf.c | 14 ++++++++++++++
 lib/unigraf/unigraf.h | 11 +++++++++++
 2 files changed, 25 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 596fd6db39d0..173e56ccc268 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -12,6 +12,7 @@
 #include "TSI.h"
 #include "igt_edid.h"
 #include "igt_kms.h"
+#include "igt_pipe_crc.h"
 #include "igt_rc.h"
 #include "monitor_edids/monitor_edids_helper.h"
 
@@ -577,3 +578,16 @@ void unigraf_select_stream(int stream)
 {
 	unigraf_write_u32(TSI_DPRX_STREAM_SELECT, stream);
 }
+
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
index ca459949dade..d00895b64d39 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -3,6 +3,7 @@
 #ifndef UNIGRAF_H
 #define UNIGRAF_H
 
+#include "igt_fb.h"
 #include <stdbool.h>
 #include <stdint.h>
 #include <xf86drmMode.h>
@@ -163,4 +164,14 @@ bool unigraf_set_mst_stream_count(int count);
 int unigraf_get_mst_stream_max_count(void);
 void unigraf_select_stream(int stream);
 
+/**
+ * unigraf_read_crc() - Read the CRC values from the Unigraf device
+ * @stream: Stream to grab the CRC from
+ * @out: Pointer to an igt_crc_t structure where the CRC values will be stored
+ *
+ * This function reads the CRC values from the Unigraf device and stores them in the
+ * provided igt_crc_t structure.
+ */
+void unigraf_read_crc(int stream, igt_crc_t *out);
+
 #endif // UNIGRAF_H

-- 
2.51.0

