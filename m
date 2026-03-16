Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0589EF46449
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:26:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A936110E272;
	Mon, 16 Mar 2026 10:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="mJIQZlsa";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4C110E25A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 7D3A6C415A5;
 Mon, 16 Mar 2026 10:24:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 012AB5FC4A;
 Mon, 16 Mar 2026 10:24:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1354010369C02; Mon, 16 Mar 2026 11:24:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656652; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=TdRP4hmPZA2esDbyiuR8F4CDPCK2+dAY52QlRUD4NS0=;
 b=mJIQZlsaMRha/xAK+W6Yz4JMlzke18DxKu01oHTFxVO/wHqrVA26LHCazgjqxKbCREob/M
 Vw/pZlvc05XIyNAm2at18UbrX8x0u6o0HkeiCbD+/3O8XonnoSH7tTL4FXB0J30zRodVRL
 /3TAT+lTuc1D3HdZzlkVi0TiAijosdHbWyyokrCk45zmiqFWhKXnR2jGq8O3KioA6K2N5b
 kWqH8dYLNUkQWLqkqvFwPlxTqyaXo6Lw++m+SDNuAyzrZkerDVMlzP7Mf+Q5iZoFUHPKAG
 C6dLrswTJhQFXxaTlh8Tgaw6ixDFy0OioUgRKrftoEwiUi9ZzH9kY0cc+Dt7Ww==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:37 +0100
Subject: [PATCH i-g-t v8 29/49] lib/unigraf: Add helpers to read and write edid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-29-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3669;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=RhwoazbD6R5Qprtybzf9GSxpW5nhd1HD9MftV+Ywx3c=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pSnG7Dm6Xe5eTI0V1AE1rOrK4nxyV+x7RZr
 5OM4AQ/pgmJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaUhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKCiw//QEwDWuk0o2jTucOeRk3x3Fnajhy06Xh
 dPmY4Bq1ZmzzMMdDxJmuiXzvOnd/83xXlIUqkHWCqwOUqbKFicdjx7MaXnW6unCEE0i3TP5ShdB
 LhBzsX9oHT3jlK6EqESe+VOeGBpznPYpha4rcKmBbRAq7l7pmorOjCMwsDVtIVaUZALyZEGC8pQ
 sC1tu29HKS9CZe0MdSoeEwqdBonw9IZz/rzacpstIGoWtd+9TtC6v9IeGwgx9KwXQ/zTAi4GBU6
 oBleeDNYSqVrFUYZTs9KfGARGKZvMiJZYhoplOaPFAPF/yF05qqQbLLKW/1Ckf6h5lYR7PNMEae
 klZfk51vx84LRoWuxtLLsCJ+5VYsioa1I2slyw0RLb6nAcOrtMQ0cp/su/esopbU6705BOGciWA
 RODu+Nk6oy53bf+SmxeaDYexrBNcdNxIEG4zlpgntX5CWaXsdCiWymkLU66wp3nLQEB7hjQICi3
 Hy8+oJIEVoKtiwy3mqFBAWDI8rl4HPIU3CnXquXQzz60JcJZrXlnh7GwGCgrLpl9KoWcLuE90rN
 /AUkgJXCAZf7pfohpE13/3KO30jbDbs93NvM6uSADjSFFZTeacVOMvB3Hu2Avq+DVoKLTKX8vbQ
 GmIJqk+eei9MQHPLPKSquZ6PkLUpt75E6LoIAjU0mRmFEwn+ubUo=
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

