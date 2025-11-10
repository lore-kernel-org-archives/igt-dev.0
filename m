Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1A1CD13D3
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:40:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39DD710E3BE;
	Mon, 10 Nov 2025 13:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="S4qdtCQ1";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8461510E3BA
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:40:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 620D24E41608;
 Mon, 10 Nov 2025 13:40:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 31ED8606F5;
 Mon, 10 Nov 2025 13:40:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5AE1C10371905; Mon, 10 Nov 2025 14:40:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762782000; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=yjdf9CqaTw7sQHIpVQltdn9by8IA+kolxwfiXeb+Fk4=;
 b=S4qdtCQ1T0pXULvHKSuzr9HI04GXbwrXprOoRKd4gYHZF9h7/MUg8YpHT3N7PurlJREbky
 PUkVH/9exCBGM/PKkeZAGwaDplD+lde3oc55qF/1938QqASKaihLqvP7si9xAcx17sOteZ
 CK5kg+0UHUkUr/RHEw9Pfc1joq03V+PHBimirw+SnB7Tu5xMWAn1wyDpB33oOVlu8cn2ZV
 AO706GXqqrWw7fVXwoRfUNx0uGhJtIxPGWVDfbrMPU6Nn+1oEW2OTcf79A1xeGtDXx1Vgv
 puKVbPG4c0YFwjhVyc08g02MFB0RVXtLKSK2pBEjLA2BQmCD9E8JpU/5VprLvw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:35 +0000
Subject: [PATCH i-g-t v4 33/46] lib/unigraf: add
 unigraf_get_connector_by_stream
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-33-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2402;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=lbCRviPjsD706ROEKJhwet/klUSs+LX9os2HalhwZX8=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesSScnh+jy9MmD0vrF3pDgLhXszRCS+5xz/d
 mzW3gcaZFWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrEgAKCRAgrS7GWxAs
 4lXvD/45naf852+xYvfg0KsifVe214evN73agUnqpGQboL25+YAnXdGxWRpRzwq1X/3x4uHpW3f
 OpCihBMs0BZGmK4Hj1FWXb5tknAhyhrCKfyF6pyJ7U8KuClYuG1v0RnmWN+ZtcCCEe2MY2KWwIr
 44NspuFgwviYP7eqUE3718K3/Sa2wDcP/dbikY6TtGQFqeiT16dcH493hciAmKbfo+5Tt1kYj/o
 5PS+i6MXRfkZUbd7FlQXdUMwyDfsx6ft1VX8jH15SyPUFGfKgH04SODAhwCDJW4nQ4bNd08FFPU
 ZfNKv1Qig4mKEzax8r9yWyGFPsufTD4WxbYzZhxrX1aVlm/apXWzsAJNtbA7rOkUnReva6LGcYt
 xrUqizsBdM01V7uGFB5SfOADkSTtfLxXz05HfTdYLOWCf/GvtZAgItl/BCC2Vhe9BtZf8jXGnUN
 L+fUi5g0ejZ4H3oarEEedwf3LSbnMUck75iQ7El6m+rEl0GgqhkMzNzIO1bYs/sP0F3ptF9/uPu
 51qsHrs6oQO+wx1soAShTjoiw3znSBPYDsz7LqPAh8iwLdjTGg3XH2XgK62ki9vDCrKLrpS/xRt
 E5C37C26uTwXvGM3xo8UDEnupVINkZMVrXG2quQLlzs40Umi0vO70M2vu192fAA2hhkOF51Bdfw
 w3s1IEOJuL4wXpQ==
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

As unigraf can emulate MST, we need a way to grab the corresponding DRM
connector from the stream id.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 36 ++++++++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h |  7 +++++++
 2 files changed, 43 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index ce8a12a1f889..7770d3a86ad1 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -6,6 +6,7 @@
 #include <stdio.h>
 #include <string.h>
 #include <time.h>
+#include <xf86drmMode.h>
 
 #include "unigraf.h"
 #include "TSI_types.h"
@@ -292,6 +293,41 @@ drmModeConnectorPtr unigraf_get_connector(int drm_fd)
 	return igt_get_connector_from_name(drm_fd, unigraf_connector_name);
 }
 
+int unigraf_get_connector_by_stream(int drm_fd, int stream_id)
+{
+	drmModeConnectorPtr main_connector = unigraf_get_connector(drm_fd);
+	drmModeResPtr res = drmModeGetResources(drm_fd);
+
+	char *mst_path;
+	int mst_path_len = asprintf(&mst_path, "mst:%d-", main_connector->connector_id);
+
+	igt_assert(mst_path_len >= 0);
+
+	for (int i = 0; i < res->count_connectors; i++) {
+		drmModePropertyBlobPtr path_blob = kmstest_get_path_blob(drm_fd,
+									 res->connectors[i]);
+
+		if (path_blob && path_blob->length >= mst_path_len) {
+			if (memcmp(path_blob->data, mst_path, mst_path_len) == 0) {
+				if (stream_id == 0) {
+					drmModeFreePropertyBlob(path_blob);
+					drmModeFreeResources(res);
+					drmModeFreeConnector(main_connector);
+					return res->connectors[i];
+				}
+				stream_id--;
+			}
+
+			drmModeFreePropertyBlob(path_blob);
+		}
+	}
+
+	drmModeFreeResources(res);
+	drmModeFreeConnector(main_connector);
+
+	return 0;
+}
+
 bool unigraf_open_device(int drm_fd)
 {
 	TSI_RESULT r;
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 9c7c71a22d82..f870843cc7b5 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -182,4 +182,11 @@ void unigraf_read_crc(int stream, igt_crc_t *out);
  */
 bool unigraf_use_crc(void);
 
+/**
+ * unigraf_get_connector_by_stream() - Get a connector id from a stream id
+ * @drm_fd: DRM device where the unigraf is attached
+ * @stream_id: Stream to grab the connector from
+ */
+int unigraf_get_connector_by_stream(int drm_fd, int stream_id);
+
 #endif // UNIGRAF_H

-- 
2.51.0

