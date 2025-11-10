Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BCECD13D2
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:40:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB3210E3B9;
	Mon, 10 Nov 2025 13:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YOrOexMw";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1D910E3C3
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id BBEBF1A19A8;
 Mon, 10 Nov 2025 13:39:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 937B7606F5;
 Mon, 10 Nov 2025 13:39:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 86A2310371918; Mon, 10 Nov 2025 14:39:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762781997; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=d1bEfKmqpDKd+SygkRAakF7L6xyO2ktS83YKg0uDrbo=;
 b=YOrOexMw/ErQ4RWPRNtTOpg4gWWV5ByBMTTC0hFeSJiUwAd93/RPhHB8FR3yZBxfrzV4kE
 AQ+E47Mm11VyDvFQnOj+hhDg9YsJgC/t7V2DsbaIEDoqh7E68aQtUZH9H21WdQAy0mdyq8
 h5+wjvTFvOt3eql1Vn+3bhKY+Qmcec/0G4faIWsZqkhAk/r+QCgDAVWDc4hxMFzi8ZtE08
 /yOC0S2XhdhWf3SYLTwVMmdHmBl+Y9UaChJDPyieLn1EPbjgVTAqJRWTUUJ0kDTAIo2xh/
 o952h2W4Wz8PURD8WDtqxDB6uBcPv+cubo542LdW/HwmZGM0hGr7Fclv8oMxaA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:30 +0000
Subject: [PATCH i-g-t v4 28/46] lib/unigraf: Add helpers to read and write edid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-28-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3442;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=drKhU3ZzZ12HZrPhTm51PICAkn+bDrWU5lt8Yvo6dlc=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesRtSyUF+gR0mGHH6HBkGBA7aiUFXLE3dCpG
 XQZeTvvvw+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrEQAKCRAgrS7GWxAs
 4mgNEADNyAYnnpGnTI2ilpcrE3uNBdGpZsp98f97u/sYHz3X99kJywIaD7GI1kGIQT4Q3rBRsMQ
 MkpGz2zHxvE4JPWn2XbCpsiH0JpR+baBjl/Z0aSqWaMHQpageM/yViV56dNs6PAc88dEkX//OXf
 TGg2f1RQNfN85FFvieSFwnnuo6yL0czGOXR5fAbhtaU5yy5mEsilyBV5rGSqKuTxqFTSFJg3oFe
 FRV3pmwM7TrQXu//n4I/0Yrlh1iWDtIarmm7gwQa8WHCwQ1cyFiISgNUpEGHhXY0qzvwQd1lxnQ
 E5ncRWIpK3KChhfrSOQWdB4wfTERUIB6MN/IC81QEWQl2/ReKiGYBp/lxZr3X0ODCCaf4lwSELl
 QvuB7kSbbmGHzVMcHfTHzJbFnq78VNrE69F7CMZas1dnnNfNK0WHdaD1BatC0YJMQqjEuOCw49W
 N6R1qGaq5RM2Qh+7Od5ixCf3UD+tj6K10LU+1v8QT58TcFfiBcb9yphNR272BUpWngQAr8gN+un
 IR5iKskBYyWN7APaJFD3X24g14nmL0c05liwlm4tGQHrnNRx+T53BEafH1WFccG1acz8eQAM7Kk
 T7F8GVSVjF6shHofh60ZxUymKE2NKvmArHE+eLECnhR/zANDsMq7ZKvO4AVFVvRqpcvoAsggKV/
 5XBO1eShqn0zF3Q==
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
---
 lib/unigraf/unigraf.c | 40 ++++++++++++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h | 21 +++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 9e77a052d755..2229202ea868 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -125,6 +125,21 @@ static uint32_t _unigraf_read_u32(TSI_CONFIG_ID config_id)
 		value;								\
 	})
 
+/**
+ * unigraf_write() - Helper to write a value to unigraf
+ * @dev: device handle, can be null for some config id
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
@@ -332,6 +347,31 @@ void unigraf_reset(void)
 	unigraf_set_sst();
 }
 
+struct edid *unigraf_read_edid(uint32_t stream, uint32_t *edid_size)
+{
+	void *edid;
+
+	unigraf_debug("Read EDID for stream %d...\n", stream);
+
+	edid = malloc(2048);
+	memset(edid, 0, 2048);
+
+	unigraf_write_u32(TSI_EDID_SELECT_STREAM, stream);
+	*edid_size = unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device,
+							  TSI_EDID_TE_INPUT,
+							  edid, 2048));
+
+	return edid;
+}
+
+void unigraf_write_edid(uint32_t stream, const struct edid *edid, uint32_t edid_size)
+{
+	unigraf_debug("Write EDID for stream %d...\n", stream);
+
+	unigraf_write_u32(TSI_EDID_SELECT_STREAM, stream);
+	unigraf_write(TSI_EDID_TE_INPUT, edid, 2048);
+}
+
 void unigraf_hpd_assert(void)
 {
 	unigraf_write_u32(TSI_FORCE_HOT_PLUG_STATE_W, 1);
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 9fcae674b1d5..983a21bbd61b 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -57,6 +57,27 @@ void unigraf_require_device(int drm_fd);
  */
 void unigraf_reset(void);
 
+/**
+ * unigraf_read_edid() - Read the EDID from the specified input
+ * @dev: The device handle
+ * @stream: The stream ID to read the EDID from
+ * @edid_size: Pointer to an integer where the size of the EDID will be stored
+ *
+ * Returns: A pointer to the EDID structure, or NULL if the operation failed. The caller
+ * is responsible to free this pointer.
+ */
+struct edid *unigraf_read_edid(uint32_t stream, uint32_t *edid_size);
+
+/**
+ * unigraf_write_edid() - Write EDID data to the specified stream
+ * @stream: The stream ID to write the EDID to
+ * @edid: Pointer to the EDID structure to write
+ * @edid_size: Size of the EDID data in bytes
+ *
+ * This function writes the provided EDID data to the specified stream.
+ */
+void unigraf_write_edid(uint32_t stream, const struct edid *edid, uint32_t edid_size);
+
 /**
  * unigraf_hpd_deassert() - Deassert Hot Plug Detect signal
  *

-- 
2.51.0

