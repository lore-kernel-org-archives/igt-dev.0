Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F57DFF60F4
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:14:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2631610E271;
	Tue, 31 Mar 2026 17:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="W0im6bkl";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 928D810EC43
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 7D07C4E4288A;
 Tue, 31 Mar 2026 17:11:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 54DEB6029D;
 Tue, 31 Mar 2026 17:11:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 914671045028A; 
 Tue, 31 Mar 2026 19:11:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977077; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=1PcOqe92QCoLWTGYlFtJasBtt7k5V0SRArfMwaRu5SA=;
 b=W0im6bklBT52QuWZr0BDuW6sUGx9Kc4R0jW3SaJmBzl9L5myqjNhh3hWE59JGsstSrF77I
 XzMn7LOmQXumx+fJRi0VLPA/JI+tmKDjWa1l/iN4LIkaw30NNo1ebktdg2T5a8FfbkA50z
 ArEXiu7XleSN4G4sR5rrnblqSG+np5k2k7+QOSFlHTGJUrFC0m6N2WUJRbKB5O86O82QbG
 0m1Kbgvv9Rko+nLkmrqyrCU+QjcMO93SG7MsqzNpeoEmTIoTMz/zItXrbuLJyb+sXjPJzL
 i3LbNsQyj2WSdcD+mbtH/WsLUc8gTjSjWHPt3RrZQCfLZSgbASl/IGl9PZ+3Tg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:49 +0200
Subject: [PATCH i-g-t v10 32/49] lib/unigraf: Add unigraf CRC capture
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-32-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2356;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=eGjHpExeDUrvCoEdgKdwdCWpBW0QlWb6UgX/3gLtmIY=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzAA/dNvtXyfC3ApH3vyQ15eNFSOOiYBXcciPj
 4z+bO+2sk+JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAPxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIHWhAAlXpldqx4L4MEPUtk6wgC0gKC4zaSlhK
 pBB7Hz1AA5G9EpbAfMiHz50h7ZFD2cK881fJpkRpyTwNrLkEtXcrCUoXtSZm6gEG7A10dNqdJfQ
 XxC6z709BTQKITQ+bVwiZOY703XpCudwlhfp2yIS14eU4UJNMaX3f2r72Ic3A5YIh07nxPddwdU
 frQLumoa1rWgl9gUmTbQ9re8LNxQs5/c60vJ09vBnRnibzdf7jtcNOHUSJGvvLc/TmrS64D9wD+
 kRQomP6xVuCage9ob2oTigwsiIrwvYWtbDCPnSTErcTvtAh0b4ce3mhWntzxwWui8Ay2VftLJ1S
 T95FezmHMem+Y8z3py4aShplYwq6c/xSeY//9jge6v+7VszW7yFT75S1QL2BMIDfgZYFiyX63aE
 0ri1ar79GvfQ20ADZoTVuUlr/HtN6gouAgRnW2+6zbOjAtPhvzXAMsd7lQOfViI2cssAluI9f27
 XKcKztQRrEL6x/lqa+3Mej7drAQPePFGE6q/lWPpwe7jLfalS4Wflz4vzl81rNew5WiGQjo5nCP
 N1fC8NJKpgB4uCqoNnhu/9dJotr/o3mTkkt5fxiMhHgWcWEh3k1bAvPb5DeMCUK2evGncFffnxp
 TVa8M/1CIGvDmjldkce69n3oCLWgiuFU29T5h2KHA054ut+kb0EU=
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
 lib/vendor/unigraf/unigraf.c | 22 ++++++++++++++++++++++
 lib/vendor/unigraf/unigraf.h |  4 ++++
 2 files changed, 26 insertions(+)

diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
index 6a866bbb3765..7af7ed07642f 100644
--- a/lib/vendor/unigraf/unigraf.c
+++ b/lib/vendor/unigraf/unigraf.c
@@ -17,6 +17,7 @@
 #include "igt_aux.h"
 #include "igt_edid.h"
 #include "igt_kms.h"
+#include "igt_pipe_crc.h"
 #include "igt_rc.h"
 #include "monitor_edids/monitor_edids_helper.h"
 
@@ -665,3 +666,24 @@ void unigraf_select_stream(int stream)
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
2.52.0

