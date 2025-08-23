Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFD3CA0FED
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 02:17:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9265710E1C7;
	Sat, 23 Aug 2025 02:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="XOfwMVLt";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B229F10E189
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:17:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id F33961A0D9F;
 Sat, 23 Aug 2025 02:11:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CC330606A7;
 Sat, 23 Aug 2025 02:11:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1B34E1C22DB03; 
 Sat, 23 Aug 2025 04:11:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755915119; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=WmniUX7q5muqNBl5PWfg6wziIOpR10yn2epvUloju0A=;
 b=XOfwMVLtd0ihcCmQPumKcTFPbrBOUt5tmM3ZNSNZ6DYl+Vxung2GOiyus/g1O71xIjn8ki
 yvrC1b7gUl4jY2ewO1kTY4iBYMbkNFZR9cDwhnLUNU54mNDFtySYnf6zKJbcgKlmACYTuM
 usDULNR19fOotDAk29jEemOV5YF+TDGN+td8nJW64fuxjnJfcJo+tPaElWvBaJ01t5s8Iv
 jG/Fb7QxTxbzsIlVVvnbwUgnz4bK1qMZ15EK5nF+I6dDRR7SplBtqLjd60H7IL6qDKNNnT
 Wmgxmc+B9+Hbvti3TEAZ+P+Quj3cftCqCF8+3GXBBJD6v6RcRgHsYrzHvtehIw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 23 Aug 2025 04:11:40 +0200
Subject: [PATCH i-g-t v3 20/29] lib/unigraf: Add helpers to read and write edid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-unigraf-integration-v3-20-cdc36d5fab4c@bootlin.com>
References: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
In-Reply-To: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2965;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=J8YLHSYbEFK4MudqTtV5ZGhaiyAQX0luNsvY+WwZ8Co=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoqSNWjuAx5m6oJLtiRFZk0ngX3QAPecMZi9lR4
 myvcvjkUomJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaKkjVgAKCRAgrS7GWxAs
 4pm/EADWLlJJSXKYMW1lWhDObWWAx2k2Di68HefziZ4/qnQT/kiFYqQyTzPFUBJ3S0n7RXORwQM
 Ulr+x1wEXc5Uhky/gz4/T7hsO52hNK/OXQvAerzogSGAjjRYuSrOo0DOuBuRm9QbhCe6n87WFrQ
 uAp4v6MFjsXWKyWmOLVpTauTgHns4pbHVl3gToyspSjLGkLJSHi+a9b4JnmASyB/Z1adNLY6kIj
 d8vs1n0Oi/A2ZsRMuWdOO1ZA2RYKNCYcB+09tQKeqAY+tdGti06hUU5PDpSRot61VaHBeU9G1gz
 k+ffxrVGx0CXunt6XllLIGrBdbAwji+hM7kitNutF6eV/vyYyMhTjZQsSpHwNfe4fMk44XAJm8Y
 vp8i/namU9CnnzA4J/OoP+t9nJ5oidO12OI+bBanEr36LKlUVUA5Vaf8FbI/q8h0bxLcVuU6a/s
 fKLFwG1De1gwrF5rd+6Cx6OSZIf8npIUq9lGvs/keWtTsBS0nJaDnD5VFqmNkrRVmrfCPHwn8pX
 pYc9mTxXQUZbuZuXNfOpahcpjLhh2LiWG2MRDgaaYHZkKtTM2r+ifPU/Xdn0LggKHWYBsJUgQII
 8wXNBT/F0kG3zwD5HbiQ8/ahVKPYCijrLAvvwcBpIEPW8ob18KuT1sfolEnA37lhJc1JVTM3eN/
 3sENw/6PfAOMVtA==
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
 lib/unigraf/unigraf.c | 27 +++++++++++++++++++++++++++
 lib/unigraf/unigraf.h | 21 +++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 6166a6d7e9bb8e348c8f6e6f42ad30b6487bbdd6..6b11fb7744a78d003b064183127c2666d4c36c74 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -304,6 +304,33 @@ void unigraf_require_device(int drm_fd)
 	igt_require(unigraf_open_device(drm_fd));
 }
 
+struct edid *unigraf_read_edid(uint32_t stream, uint32_t *edid_size)
+{
+	void *edid;
+
+	igt_assert(unigraf_device);
+	unigraf_debug("Read EDID for stream %d...\n", stream);
+
+	edid = malloc(2048);
+	memset(edid, 0, 2048);
+
+	unigraf_write(TSI_EDID_SELECT_STREAM, &stream, sizeof(stream));
+	*edid_size = unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device,
+							  TSI_EDID_TE_INPUT,
+							  edid, 2048));
+
+	return edid;
+}
+
+void unigraf_write_edid(uint32_t stream, const struct edid *edid, uint32_t edid_size)
+{
+	igt_assert(unigraf_device);
+	unigraf_debug("Write EDID for stream %d...\n", stream);
+
+	unigraf_write(TSI_EDID_SELECT_STREAM, &stream, edid_size);
+	unigraf_write(TSI_EDID_TE_INPUT, edid, 2048);
+}
+
 void unigraf_hpd_assert(void)
 {
 	int d = 1;
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 4d9eb1b926dfe9ad531e58243f4edf1623a24473..95c86a8cd428725d4e3a28bb91158800c840654c 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -47,6 +47,27 @@ bool unigraf_open_device(int drm_fd);
  */
 void unigraf_require_device(int drm_fd);
 
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
2.50.1

