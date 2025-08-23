Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259E5CA0EFC
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 02:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1DB910E187;
	Sat, 23 Aug 2025 02:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UXi/MBlu";
	dkim-atps=neutral
X-Greylist: delayed 333 seconds by postgrey-1.36 at gabe;
 Sat, 23 Aug 2025 02:17:17 UTC
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1CD10E06C
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:17:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id DF1861A0DAA;
 Sat, 23 Aug 2025 02:12:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B8C30606A7;
 Sat, 23 Aug 2025 02:12:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 146741C22CEB8; 
 Sat, 23 Aug 2025 04:12:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755915122; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=/Bv7GscDzLKiDJF/ablE53hzlVXC3sr/XbkHqRln22M=;
 b=UXi/MBlu9Mryg2knTb4P9HPo2qckQdbmosKgSAMULs/WhcOQXRu6KkNgKcu/IemMYQvLK1
 /akjlFbkf+aW8tmW1rXsU3Vo82d2ZjwSVk6PY0vZa/RG6clxFY6R5UAQNBxIAAmG/IPxG9
 bYYT2CMstbXOLqpruzZkmSum8VpFe3TU7vusTKKbSYuTyeAMJNZEfjmXyOr+NZWSfwEJIl
 bD0Gw8oseydZj8j1zpJI6/B1UaaYEuUXYlQvKlP8bmnjlP4n/2iypMDCNCHedqXiBnmFG2
 9yDNH+B04VTfBOMyC1J06nKx2oDUZ5TOHjnNlB+3UTqWUFnchQnf4jc6wsWsCw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 23 Aug 2025 04:11:45 +0200
Subject: [PATCH i-g-t v3 25/29] lib/unigraf: Add unigraf CRC capture
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-unigraf-integration-v3-25-cdc36d5fab4c@bootlin.com>
References: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
In-Reply-To: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2364;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=UyiPqMak79dUiAYq/637SkHi7yt0byBGpIKVgDPXAC0=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoqSNXH//2GKVnVhc6Ukzae60VU+iHU6PiEDsZK
 aZFHBNuINWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaKkjVwAKCRAgrS7GWxAs
 4rzcD/43JJE8vi0NXpgUsnBYu9/2STeX+Ev/gZdTTtx4nherET9CVhs3zqPUi354sCc9oKu4vGF
 x1gRmrcODYOqRB/Pb1je8KveoANmkpwCRwsH5fis5fgtTw2qipV8alSIqVepZB7bxtfy9nBJ+ea
 AmuomLWuGbSMSCnqYktnC7YhQ/zpR4eeOT/nr5XantKa/uwLeZJ7iMIjHIHoITuxFDEyzMfypIe
 1uTB5FQeKGnmiOafKrmhnYEx8PqT4Ub/h8No1ptN5MDhSC2BzqFfkvl4cVZRUtGZ2u2Xgy65TMg
 3BTJ7zY7QsEPOSSd/IfaeLyuHkByf/AD8Owynpt42sKkqrTTobeUSasJWvQJzuQ13OHLJf2Bn1W
 4SH+hF+WI5HDjyXmIBPjG7GALMMLDyEWr+SDkYgGn9qvjpB5H70ouICcqYF0PFT6cwGZM3iz6eK
 vFbkYMj697G/ZtPYnB2DG7GZbGnPl+uMY4JfB2gMAMBB22PYjSQbFvaDtd5ou8eVWWjmsoXaqJy
 Fr9ZDrUms8qCBtoHDa7crYt+QvBizigGxLiR+TnzXeQPSXPHakBerxsh2N/e6BD7kbo4sGOQ36t
 0KnfPmd5YbCBHXoiZFuKc9++EDNVI97HLbArvyXfygiQhQhI+PzvpXpbhRzfIwAR1C5ygPgnSMX
 9PuCpuSNq6iFW/g==
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
 lib/unigraf/unigraf.c | 15 +++++++++++++++
 lib/unigraf/unigraf.h | 11 +++++++++++
 2 files changed, 26 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 5aa5d94660255d9740db7b74c3e1eea0575fa5f2..e63182ccc61ca23c9333d1c36950a5d73f94b3ea 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -12,6 +12,7 @@
 #include "TSI.h"
 #include "igt_edid.h"
 #include "igt_kms.h"
+#include "igt_pipe_crc.h"
 #include "igt_rc.h"
 #include "monitor_edids/monitor_edids_helper.h"
 
@@ -556,3 +557,17 @@ void unigraf_select_stream(int stream)
 	igt_assert(unigraf_device);
 	unigraf_write(TSI_DPRX_STREAM_SELECT, &stream, sizeof(stream));
 }
+
+void unigraf_read_crc(int stream, igt_crc_t *out)
+{
+	igt_assert(unigraf_device);
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
index 553a732d746e5465472a81405f885add6a3a7c47..cf37054baf4dd9d8115cd6b2abce70400254c301 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -3,6 +3,7 @@
 #ifndef UNIGRAF_H
 #define UNIGRAF_H
 
+#include "igt_fb.h"
 #include <stdbool.h>
 #include <stdint.h>
 #include <xf86drmMode.h>
@@ -153,4 +154,14 @@ bool unigraf_set_mst_stream_count(int count);
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
2.50.1

