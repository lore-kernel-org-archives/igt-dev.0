Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A283AE7DEF3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:32:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E02110E4F4;
	Mon,  2 Feb 2026 14:32:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="dO4Ruxkb";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476E310E4EC
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D8CC6C237F6;
 Mon,  2 Feb 2026 14:33:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1979760767;
 Mon,  2 Feb 2026 14:32:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 26939119A8888; Mon,  2 Feb 2026 15:32:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042776; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=w6AvpuWbSuEw3UcATJMA0tzZb1Z3yc1PMrQuNe7ODbg=;
 b=dO4RuxkbxXeVt/pLCtQnniP5++puZqnYBXi+GgUERI0qazJnKqikhLLH2dQWjLxldObzNL
 w4BjTXGi6/s3uowtZ2oDpU2buocQm+XgtDLYQiO083oCejFo0psfSioY1RapBSMCb+VCkQ
 l1zFzugKoF5A6/RyEN41VpAsFuD32IIuMf5NXKh2jq71IZNyhr9wdTvWw0pmsaObQgOPCH
 Z42FgMrvd5s2RRDJVL5YMgDprO2S1Hv4DxPIuNyj80VKP1BDGxjG+L4FtJk9DXPsVIKIkq
 1Bu+veTEVq/UXRzb7zhfto3frtkOJkGRzweOnLNp60iOUlcoCGWxjy22iGLZyg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:33:12 +0100
Subject: [PATCH i-g-t v6 33/48] lib/unigraf: add
 unigraf_get_connector_by_stream
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-33-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2310;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=bUpCjmymQfl0vyc3lGySvMSZhEnox5st1APye41Ok8g=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWT9v6qg+Akke8Gv3gNcNNc3iQ/ADpVddVUR
 IBiYOwKTUSJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1kxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLocxAAvGlmb8GdMr5QjyPuRfndPeNLBQ9vSY8
 VjkUTrdFD2Q+TwaSEwmsGBwO8XXmd/+XLnU/sdunYWLT8ucOUxmymNQOPlQIZtiu/1ruFHb5Hu8
 AJTKTiBNTBhWCjCF4WhTpbz4NXYyhIFPVaZKvDjuSW4K3Uc4DeMz4oakf5LaGDQmQsER9Ys2QKP
 4p4lyc5SjHxe7oFTd5Uk0EKtRDRJInxolhIol2X27R5evHnYw8PnQd9Nc2TiCF4mI0mhjgQ4jRW
 2OWGFrRCQsV/NZDr+1svl/GHF3oEhQT5g6M2JkXgWlaFsvdI6PYTV4YEHsZckBsE6Wv5nQbuc7o
 tdvzHGH7XYNEiohqcddMSGI5bzsaJGf1XQT8YIiRt2CEidw02HfODC6MaZuyzaimIlt1Xy85HFv
 Gkg374FNtt7OeWvEHVSNsK282kUMMYySSPdUSoyyY5+l7O4gSBsaqbAI1zuLuhOn1ryilFVByk/
 ZSWcQ8g2IU9DNv3o3DACTB237/Qi5gCNDtQ5Dunfjqxu08Y8WoRqQUyIIEgIlncKqJ+i/1FXGWM
 KWvOpVRFcgM0wDicx+oWSq0DHKgRHR+bDUQYkUd2N08saMR/8yzhYSQjpfhXFekJGyvwGRP0uD+
 PoDwN1K0t03rcjJnuok3wePDzzk05m38PS10Zwrl3+Oh3tzRycSw=
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
 lib/unigraf/unigraf.c | 40 ++++++++++++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h |  2 ++
 2 files changed, 42 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 643a3c1169ec..63dd7f62cc20 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -296,6 +296,46 @@ drmModeConnectorPtr unigraf_get_connector(int drm_fd)
 	return igt_get_connector_from_name(drm_fd, unigraf_connector_name);
 }
 
+/**
+ * unigraf_get_connector_id_by_stream() - Get a connector id from a stream id
+ * @drm_fd: DRM device where the unigraf is attached
+ * @stream_id: Stream to grab the connector from
+ */
+int unigraf_get_connector_id_by_stream(int drm_fd, int stream_id)
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
 /**
  * unigraf_open_device() - Search and open a device.
  * @drm_fd: File descriptor of the currently used drm device
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 1530bb8d540a..43b74306d11f 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -70,4 +70,6 @@ void unigraf_read_crc(int stream, igt_crc_t *out);
 
 bool unigraf_use_crc(void);
 
+int unigraf_get_connector_id_by_stream(int drm_fd, int stream_id);
+
 #endif // UNIGRAF_H

-- 
2.52.0

