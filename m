Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104E9E7DEF1
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:32:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4E910E4F3;
	Mon,  2 Feb 2026 14:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="BN0K/73G";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F1410E4F3
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 49DF3C237F3
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7D32760767;
 Mon,  2 Feb 2026 14:32:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2F775119A890B; Mon,  2 Feb 2026 15:32:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042771; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=StdL+73sU/AP0lNaVVfWGqDceqsrwXeYTSo2jvG4ubA=;
 b=BN0K/73GtpWlhBVYRlComFW/ZBUBRJsmR+BBjUGUEBW9xqtS5VO1P7o9LaGfy672VUj+xB
 nVt+VRYoC3gyzUMQfYkSlkpRrs6qXMvYz3kFtGWmIMn5FEg0dbZL7SZ+6EkswgGDHXZK0D
 srktBiKi7NevkkjZw92T3LsbBMjFouS4RdLtNjmT+gH+AgQPTAnN+T8KesmvJEf1eYF9Mf
 qD9tOi1bTS12Y73gdtoaB3bvFEKqZ6TZpP20WLqJKx5BpDE6nbDfSwUv9vePofNpVHr5YD
 hdThI7TdVjiq75moeQzaLmdm4xus2i0P3UaZfV6wKpIvzcvjmXNWASVxBjGBFA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:33:07 +0100
Subject: [PATCH i-g-t v6 28/48] lib/unigraf: Add helpers to read and write edid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-28-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3389;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=ZgOIbJavNZhnZlmVLkoHtgkibPviX+aoRiLSrjvSbq4=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWS02Bs1cL+/b1YWJOhUqw7agWHowXyuPk28
 mc2Zhpqpw6JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1khsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOK//RAAwLNdbXX6eCGWkujxIorOlUpEukHorbx
 Q7xq0wkBbQKoCXoezdEQET9u+UeC+apcSYI7xrc3K+rhznFZCDiWgAonHfnZ6UTMLiVhrbYNUsQ
 FI0ijlu4JTDgrPmrTrkLviGYCtoiWISBZDrWTyRhxeHFwNPLJ5b3/CN20BZAFR0jzg4W86pDigK
 JwE1bYxJtgpTBpDS9hqm1zW+ON3BOY6KP4R/BoYrjQ7aXOORnaB/hBShNYkn/K8OVGH1Lnk4w0f
 L4lkaUe7p4sgYK3tdH23gL7E9qrbGogweYKqTsc7xnN3TC9qhSCESFVmvYJEMSZouCg321uB7PV
 iZGsSfhT7IkEWG5srTeOldFgJXxa39ZpHZ8qezepIsDT7Rep5uSURbJK6+uyKfU4nbQUFsl/RIG
 CRfaqX72wOGLJO6Xps6Qu6o1B9DYikV3NHB+4rPr7ZcZS3Tjm6LhdiDYkUc3Zk1Pi+Jomy2Zjzr
 jq7gX/7jG/5+VcEsG08vDLxc68E85V7/fBWasNIKbn03JsXot97QF8jkZw0igPFQanfUa05kNIf
 yAOyXcFPj+S2JEXWS8H6OMYJ3OjSa+DOEDmnCUrmvwqqiB0XAoHOwDsObaQ9IRJ1mjIbteoeWsG
 o+4qJh/S8Ch6UUZME0L3495cWEAe5ee37/N+SV+zSzxSZqMhPnpQ=
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
 lib/unigraf/unigraf.c | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h |  4 ++++
 2 files changed, 59 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 4a3b0a5fc28e..59a4720e0112 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -122,6 +122,20 @@ static uint32_t _unigraf_read_u32(TSI_CONFIG_ID config_id)
 		value;								\
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
@@ -350,6 +364,47 @@ void unigraf_reset(void)
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
index 7ff6dbda71fe..0d200b1ec520 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -36,6 +36,10 @@ void unigraf_require_device(int drm_fd);
 
 void unigraf_reset(void);
 
+struct edid *unigraf_read_edid(uint32_t stream, uint32_t *edid_size);
+
+void unigraf_write_edid(uint32_t stream, const struct edid *edid, uint32_t edid_size);
+
 void unigraf_hpd_deassert(void);
 
 void unigraf_hpd_pulse(int duration);

-- 
2.52.0

