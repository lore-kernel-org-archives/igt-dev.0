Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F39F53D70
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:24:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 464DB10E3B3;
	Mon, 16 Mar 2026 16:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KbmrPE2C";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB7F10E292
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 0752AC5504D
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:24:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D805E60050;
 Mon, 16 Mar 2026 16:23:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B5D2D1037220E; Mon, 16 Mar 2026 17:23:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678225; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=QNPaZGAsjWJcGWK44l7OddXkwE/UVb1V+rq0W+tBnh0=;
 b=KbmrPE2CvCLbSYQVhRX4awf3x4Cvw0FeZMZP5ysI03o5KnEaH7UIMRm+5ml0qal/PD8dzr
 iRDoEPTZLmE1MZg6FNHhA4crDEiUpjxb/ptxkCQTLyVA2wjFvPz61LxBrMr231YM6AUYTb
 xG8Wy3hrIzGvYHtfUsxVNKIf/aVgBT7xVkNw1DBgucu99MC3seM+sm/Pgdetidg8byoaHL
 iYchh4AEzkiHAGtNX8O9bBfadM7KzWYywLhFa/v9qFtTzp/mP6vmEf+hvl6cLp+tVnEaFl
 jik5Hc1pOen8gtTooGSVY+RgffVwWzV8yVphhBeoywGablTRKGkDXCXSUEhh2w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:17:55 +0100
Subject: [PATCH i-g-t v9 34/49] lib/unigraf: add
 unigraf_get_connector_by_stream
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-34-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2354;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Qks+WVvFSFwjsP+PKQCu3Znz6w4BRSWyYRuGc5a78sY=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6OlR6PHOZRtWpJ+r3iczPVzkmxhQYr4fj1M
 lmDO7IUqSqJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabgujhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLf/w/+LtYDFoFEBhswL5/2ftSjXrz+Xxn0wnJ
 JiEnERlTr0SeojyR5RThMp+L7/R+8tpnYGsWczSjf7ZRv/d4besGvrboz3InxD5u785lVSTDMVH
 U3LokLVSTO9Dx36yfpjGGTHJa7OE1WKtPa0B99uC6b7wz0w/867umKBQdCgO3/UGAhmjx+Lxjet
 CZvlXj+ryqnfif6o+I60HCJdHbdc4Y9H3pEO9Ga4V0BQ+Caq88Dtw2LzRKH/AWWya7NDFdEWqGh
 +QyC6gUqGtpAM3mPFArClK55lny9g8Jvvx4DE99OgWiokSFnIw5WF55SahMBscoCiUvlLFpXq6X
 9BaMduSJwYcx3bGsoyJ8twHRA1NLrfRXF1cciv/JuVElr4LsPs+gPmRdWf0p/cA6f/uI8eaWffw
 X44+5QzwB63y3ehgissnxec2ZAltiNPvhdAqdNCFQfKvQnBRuG/OhGXj0+HpC4gUX5BhyJbYk/a
 MMaQhktoqh2/TZ3nqhkfiFu1c9n9oNVX6t/ThT6qaz0W0hThNYm5pLCqEGwYxhwE8DV6yJ3AINf
 yGQQrKjZ04scBnblj6VMPQ1X2DfQgfWwnPf2nNUR+KWWxzCZMQSiCriI8PXI5nhjtMcwDRn0wM2
 1c2HE4uwXCPlA2yydvTQ+ytveTICbdd3mCx2QKQc0RVSCygUoGx0=
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

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 41 +++++++++++++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index e14f1fd5b050..6d192ffe36b5 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -301,6 +301,47 @@ drmModeConnectorPtr unigraf_get_connector(int drm_fd)
 	return igt_get_connector_from_name(drm_fd, unigraf_connector_name);
 }
 
+/**
+ * unigraf_get_connector_id_by_stream() - Get a connector id from a stream id
+ * @drm_fd: DRM device where the unigraf is attached
+ * @stream_id: Stream id in the MST streams
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
+		if (!path_blob || path_blob->length < mst_path_len)
+			continue;
+
+		if (!memcmp(path_blob->data, mst_path, mst_path_len)) {
+			if (!stream_id) {
+				drmModeFreePropertyBlob(path_blob);
+				drmModeFreeResources(res);
+				drmModeFreeConnector(main_connector);
+				return res->connectors[i];
+			}
+			stream_id--;
+		}
+
+		drmModeFreePropertyBlob(path_blob);
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
index f22f4c993622..0ed6d1eb2713 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -76,4 +76,6 @@ void unigraf_read_crc(int stream, igt_crc_t *out);
 
 bool unigraf_use_crc(void);
 
+int unigraf_get_connector_id_by_stream(int drm_fd, int stream_id);
+
 #endif // UNIGRAF_H

-- 
2.52.0

