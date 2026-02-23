Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFADEA4FB5
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:09:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2329610E37A;
	Mon, 23 Feb 2026 12:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ROzAQb/3";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD5610E393
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id A7FBEC143C6
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8FC535FD43;
 Mon, 23 Feb 2026 12:09:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4F43210368F86; Mon, 23 Feb 2026 13:09:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848553; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=08YsdT0+mRjwqUFgcBjlBsxYj1KqPIyqy86+rfYDnPE=;
 b=ROzAQb/3M150Rj7E0BpeYlDTNmbdL1iufNmv4S94nSVr/JUDhAhdoYdzS84sA0BoreKVLc
 MlRsu0eZBUI+CbZ6v3ZDeJyE+lnmardwt4E09vHgTcploIMTsUID7HKC7X/DOR/bk7T6al
 uswrx6rYmkwrK2KOCELLgpzTdi7ploYxzHTFacUHyyn+A8qYijO2SyuhhOAHzpDRNN17YK
 TlPNFDdWuMmuhNl8ynEGtNi207c103Z6KM7dpE5sdXOONPOh9HHoIsvNPUougVhRhEnpjc
 bqJXgi3Ids29E3/vhTxDCufOWLxTtvSji4ch3DjtZeiAjUIlY9VDw4SxCgWONg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:35 +0100
Subject: [PATCH i-g-t v7 28/48] lib/unigraf: Add helpers to read and write edid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-28-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3365;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=WpybrTf8NootvB49jHr6iwEv16k3jexqIia3rBSv/w4=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENqTfhLDjmbHU6gvhVw4YX518jW+K6+GPcws
 olq5iS4O9aJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDahsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJpVw//X0coBDHqH7CMu0r9nhnPYwldWsOlQZt
 X91Itpin2Mi9AzLLz6qNwQoIoUo4/PJ4V/5qNrSfAVGmbNV7F2g1n0MniVPNEYmJsLjdhUn7Rfw
 5NOEyYF4fzSylKIO9IZ7lZkpK+37ASD/0L5jSx/OThEi7cso/UhCcrNxTR9p1lUCrrlm7rIg/B3
 sBdFLxzoqXbK0rSd2ewfAUV2ocjQV8h7ujgJd+kwa9p5CXtxzGEJNrcHBbjQKDr6PEjzr8PzIe5
 d0k9GCnqQ3RU2H6V+YUQVXzF9DhFFUvn2x6YXZrrrFavh3M6Ozrz7gWqO1jgRlpINugdWeOA8Gp
 EGjFAnVG9T6hER8AonM7ILb6D3Tq5/b1oKape9uOLM3feWTY3nG3GEMgWXH7sXCMo58AO/E423P
 GgfU3qh6i0leOYSOudStjljXHXOu4fYynizvyNVjrsPY4aUoDSnHrnf0ieBh4OBQ8FIFbugwWXK
 9+S/et5kqrd6Rsp/F/bUPJfs1RNNRkV1T8+nEDmjehrtC9NENRBOhIjeUDqj3GvGJskEPqvMz5y
 CQj2CblOVPaeIOQGoHxHEnt4JE43S0PJ5QWPlBggDtmyb/rzf7B9rgt1eRgV9xch50svzEHVD56
 03LTI8qSSd50AtJ3XMuRKcuSd5MtvFJMnROFkGl4YuWLEgM4rz/0=
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
index 56a1fbe71827..796848dd8fc7 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -127,6 +127,20 @@ static void unigraf_init(void)
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
@@ -332,6 +346,47 @@ void unigraf_reset(void)
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

