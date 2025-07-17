Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95F7C83F1A
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 18:47:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8E110E89C;
	Thu, 17 Jul 2025 18:47:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="L0eEcSj3";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B4910E883
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 18:46:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5EB25442A9;
 Thu, 17 Jul 2025 18:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752778006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L27m1qpw0fGlLaHu0km7Zy4sabMUpC3HkoZqp0lCHPM=;
 b=L0eEcSj3vUF72CCuiwSCkwCVLXgh6V7jtz6QmSAIj4i/8D5ZrRDabWcXXedLYDTm98YuPQ
 F4akJmFFENkHd3pUgIWMKXQIkYxYWX2PRbsmG7jXz4EIjOVfM+0wMHfCzCDukRqHjiKHjl
 m2/usuA/9nk4toRpa7zLlmOLOBiF98s/9p3YqT/UV/5kKuGAaiM/oRE/sLBzly74C0/q6x
 bOttVLz3esUcfOYbm7SP/pfkim7u3HJCwsgOu005Pr3tWTRZaAlje7ln25Xl2D6WUdIpx8
 QGR1hioKzaPDkZBL78gg/WKN9KLSAget054CMps6h+9BsHBvhaxIl8Pr0WI+oA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 17 Jul 2025 20:46:44 +0200
Subject: [PATCH i-g-t v2 24/26] lib/unigraf: Add unigraf CRC grab
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-unigraf-integration-v2-24-77dc329e584c@bootlin.com>
References: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
In-Reply-To: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, mark.yacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2161;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=kBAZvrZeYOVfOb2vWIANb8OLigprWTL03yIwj77VAB8=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoeUUOqYmCd6/MkccLFAJuifHPys7IX2foVVBKF
 FHty8qyt5qJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaHlFDgAKCRAgrS7GWxAs
 4hONEADJ8+RGGZ8wgL4Wlu9v3OovlS1YumsBqK2p+zTHJQcUSVI9IT+QtHsEDf5ztKniI9f86Qf
 q6Zblw+bMhsQ5kvuo4hNlxHKgo9ths9qKkCr2/2vV4OR6QU/iYBSnfhL+exBP9P0sHQH8K/tH7a
 jbtJqfP4Q2ZHe6eva3Dp+womzWLAoPicaMxZj7ERikUWEAjDmE/TplKE41HXEDbFl35XUAJPP6U
 NcMxDgOcHPbRNQSxqb8QET8ngrJEcZWw1sIvGCxDAQHSw4Ij9zutuQo0AXYEtRZlm54baTXlM3n
 CRN9SFSExQbbSbF9/3qKKFYFh9VA01HedaLW/KBUVnwfiiY1YHKYO0acQfXwoyXy97VRugXXLhp
 mHGq6BzbQGOxg2XJmL+tVxJDHQ20rfDAfMKxFkKHlRO9q/FaX4D2/a03zmkEXaeqlxyQEWcsxuV
 RB+KWvJNxxS30sB3Xur8wByVrar6SRa3tWWgqPWieuoKJ7k08z9Gu1XAWOSm7GtFP6BDogPEjrT
 TN5DWZcHtO2Cb3M3dxhhF9XQ2nFqwbuoCQsjqLAk+surv1RiHlBE8qj9sK0nxEp5W3e7/6L7t/7
 VG0z59ts2dbAjq8v4KyTUrydjcvh4/yoecwJnERqlxRHtEptmilbAdMzqDonN/j+zrYCeJogEcU
 0l75fLfIg2xfx+Q==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeiudefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehtdejtddtteeiiefgleejkeetteevhfdukeegleffjeehgeeivefhgeduffdvvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrieejngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepihhgthdquggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrrhhkrdihrggtohhusgesghhoohhglhgvrdgtohhm
X-GND-Sasl: louis.chauvet@bootlin.com
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
---
 lib/unigraf/unigraf.c | 15 +++++++++++++++
 lib/unigraf/unigraf.h | 10 ++++++++++
 2 files changed, 25 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index add5d5b2b1379bb34ff73505ee917e51398f4b66..9ccd53e55ab5d261d236348fa8a3c7721e87698f 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -12,6 +12,7 @@
 #include "TSI.h"
 #include "igt_edid.h"
 #include "igt_kms.h"
+#include "igt_pipe_crc.h"
 #include "igt_rc.h"
 #include "monitor_edids/monitor_edids_helper.h"
 
@@ -499,3 +500,17 @@ void unigraf_select_stream(int stream)
 	igt_assert(unigraf_device);
 	unigraf_write(TSI_DPRX_STREAM_SELECT, &stream, sizeof(stream));
 }
+
+bool unigraf_use_crc(void)
+{
+	return unigraf_crc;
+}
+
+void unigraf_read_crc(igt_crc_t *out)
+{
+	igt_assert(unigraf_device);
+	unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device, TSI_DPRX_CRC_R_R, &out->crc[0], sizeof(out->crc[0])));
+	unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device, TSI_DPRX_CRC_G_R, &out->crc[1], sizeof(out->crc[1])));
+	unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device, TSI_DPRX_CRC_B_R, &out->crc[2], sizeof(out->crc[2])));
+	out->n_words = 3;
+}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index e014ead67b57e860907bd0cd3521fb5842240594..11e483312699fd9f304586bffcc5616c10fb637d 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -3,6 +3,7 @@
 #ifndef UNIGRAF_H
 #define UNIGRAF_H
 
+#include "igt_fb.h"
 #include <stdbool.h>
 #include <stdint.h>
 #include <xf86drmMode.h>
@@ -147,4 +148,13 @@ bool unigraf_set_mst_stream_count(int count);
  */
 int unigraf_get_mst_stream_max_count(void);
 
+/**
+ * unigraf_read_crc() - Read the CRC values from the Unigraf device
+ * @out: Pointer to an igt_crc_t structure where the CRC values will be stored
+ *
+ * This function reads the CRC values from the Unigraf device and stores them in the
+ * provided igt_crc_t structure.
+ */
+void unigraf_read_crc(igt_crc_t *out);
+
 #endif // UNIGRAF_H

-- 
2.50.0

