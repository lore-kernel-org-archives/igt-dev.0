Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0BDF53D6F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:24:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F22C10E29A;
	Mon, 16 Mar 2026 16:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="h3Oqbb11";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0762410E2A4
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id EEC1D1A2CD4
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C59226011D;
 Mon, 16 Mar 2026 16:23:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9EFDB1037220F; Mon, 16 Mar 2026 17:23:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678220; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=TdRP4hmPZA2esDbyiuR8F4CDPCK2+dAY52QlRUD4NS0=;
 b=h3Oqbb11MYDQjAH62NJnLdpAD/JpFf0Stbr0jxKblJ9TzokkHDpX0gnAWWdtBOAnp2bCPJ
 a6wymxMXkbO93C+rWCktZFolGm7CNyHlhtBukzgvRTzU1cxjpp76l1yIoFOdFBBaPAkunh
 a5fLOmhrk8PmY9pBPPpAMtpJd3zMB87jS/V1PaxgBm3QRpU60bhJpK9ZdB3OYnnup6BRQj
 Qk2RlK1m4Ixq4eZZDMFXABvgSEROX3M76pH3NzfJE1uXxr5KmNJegIsPDBTg/tLyvIPeRy
 c46pMkPNbmGgKOkO43Fz36pvfR4zPenHWlGg+xycc7TwMc+4IKTUm9u98/7xPA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:17:50 +0100
Subject: [PATCH i-g-t v9 29/49] lib/unigraf: Add helpers to read and write edid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-29-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3669;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=RhwoazbD6R5Qprtybzf9GSxpW5nhd1HD9MftV+Ywx3c=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6N04apPvFMwlwx5UUOzTlVblZPJ/sM5aZ8M
 ENNjrUpXS+JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabgujRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJ0TRAA1ie+jGVN+0o9iaKUC8Ydt5RMfmqdnDZ
 XWZfmbxloobPxxxGExbcucLHwQMr45B5msoBOc3Vr/ClUp4FSypsouPGlmKC1decD7qg471ITvr
 wNqMO9qY7dSXU4ufZ97IPRf2Igg8WgMEQp6s8IB9ATJnQj9sMKe+aqcLiVP4E6OMQxdTrFh/ike
 owLb///BV8Z68nIqr64p+1nDDu5FzmA0w3m+goWTwc/KBHf1ziDHLb2LmmzO9S9P43FYbqhblna
 0XE59XO4oTJfTLY2KLRDcJEEBkN4vbNQ2tl5q/vcxu7HI9nS0twvbDNnEXMpUg1/aG9KFY/Fcyi
 Ho/AVOMyYS1At9ccRXvX26LtozwQtsgxvYAlRYlKnF1ryazePsHXxBN9rArSinQG5tMOtGv+dzw
 B/i3yi+ZcsJLrenk20noekunyImD8ag3l7Bxu2iqLo+MiShsFHyuVvKAnNcg7PHtV6AI977ihHR
 qBq0kJvpYPlTMx7GvgtYoBR1uQA0kvUVQvlTXrlxoeQdhUAuPK7p1eQY11qRWBZysgkR70Vnu50
 JR6o302p4E26PI7pIh85gYcb+b4Z2ZtJexvr0h3APKvYsjwwF30brGNxhQPYhbNYjKKrfnFBp21
 6n7NTJaMkfQ4fFFRj8FhpCLTS+XOpxpK1x2zb0FOmnTCDK/ERtNg=
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

Read and writing EDID on unigraf can be useful to emulate different
screens, add helpers to read and write them.

There is a limitation on the libTSI.so, it is only possible to read EDID
using buffers of size multiple of 128 bytes, and there is no way to query
the actual EDID size. The current implementation can only read EDID up to
2048 bytes.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 lib/unigraf/unigraf.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h |  4 ++++
 2 files changed, 63 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index b752ff573ace..d06da6742e95 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -56,6 +56,11 @@ static char *unigraf_connector_name;
  */
 #define UNIGRAF_DEFAULT_INPUT_NAME "DP RX"
 
+/**
+ * EDID_MAX_SIZE - Max EDID size that can be read from the unigraf. The
+ */
+#define EDID_MAX_SIZE 2048
+
 static void unigraf_close_device(void)
 {
 	if (!unigraf_device)
@@ -127,6 +132,20 @@ static void unigraf_init(void)
 		value;												\
 	})
 
+/**
+ * unigraf_write() - Helper to write a value to unigraf
+ * @config: config id to write
+ * @data: data to write
+ * @data_len: length of the data
+ * Returns
+ */
+static void unigraf_write(TSI_CONFIG_ID config, const void *data, size_t data_len)
+{
+	unigraf_debug("Writing %zu bytes to 0x%x\n", data_len, config);
+
+	unigraf_assert(TSIX_TS_SetConfigItem(unigraf_device, config, data, data_len));
+}
+
 /**
  * unigraf_device_count() - Return the number of scanned devices
  *
@@ -329,6 +348,46 @@ void unigraf_reset(void)
 	unigraf_set_sst();
 }
 
+/**
+ * unigraf_read_edid() - Read the EDID from the specified stream
+ * @stream: The stream ID to read the EDID from
+ * @edid_size: Pointer to an integer where the size of the EDID will be stored
+ *
+ * Returns: A pointer to the EDID structure, or NULL if the operation failed. The caller
+ * is responsible to free this pointer.
+ */
+struct edid *unigraf_read_edid(uint32_t stream, uint32_t *edid_size)
+{
+	void *edid;
+
+	unigraf_debug("Read EDID for stream %d...\n", stream);
+
+	edid = calloc(EDID_MAX_SIZE, sizeof(char));
+
+	unigraf_write_u32(TSI_EDID_SELECT_STREAM, stream);
+	*edid_size = unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device,
+							  TSI_EDID_TE_INPUT,
+							  edid, EDID_MAX_SIZE));
+
+	return edid;
+}
+
+/**
+ * unigraf_write_edid() - Write EDID data to the specified stream
+ * @stream: The stream ID to write the EDID to
+ * @edid: Pointer to the EDID structure to write
+ * @edid_size: Size of the EDID data in bytes
+ *
+ * This function writes the provided EDID data to the specified stream.
+ */
+void unigraf_write_edid(uint32_t stream, const struct edid *edid, uint32_t edid_size)
+{
+	unigraf_debug("Write EDID for stream %d...\n", stream);
+
+	unigraf_write_u32(TSI_EDID_SELECT_STREAM, stream);
+	unigraf_write(TSI_EDID_TE_INPUT, edid, 2048);
+}
+
 /**
  * unigraf_hpd_assert() - Assert Hot Plug Detect signal
  *
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index c2caa9c2c54c..40f706ebd483 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -42,6 +42,10 @@ void unigraf_require_device(int drm_fd);
 
 void unigraf_reset(void);
 
+struct edid *unigraf_read_edid(uint32_t stream, uint32_t *edid_size);
+
+void unigraf_write_edid(uint32_t stream, const struct edid *edid, uint32_t edid_size);
+
 void unigraf_hpd_deassert(void);
 
 void unigraf_hpd_pulse(int duration);

-- 
2.52.0

