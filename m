Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2BED25B5B
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2693710E6F4;
	Wed, 28 Jan 2026 13:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="udQ+lvYk";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3F510E6DC
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 882AD4E422FE;
 Wed, 28 Jan 2026 13:14:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5EF276071F;
 Wed, 28 Jan 2026 13:14:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 611D6119A882D; Wed, 28 Jan 2026 14:14:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606094; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=w6AvpuWbSuEw3UcATJMA0tzZb1Z3yc1PMrQuNe7ODbg=;
 b=udQ+lvYkaDKxB2hliOJzgFimszg98gC1DqT1N3TN/jERJuE6zmkFcj5is+uSFR6GwTXJ/Y
 YNUhKj1VroDH5rGDZjASD4paWqJn4091EU7U2ULGWNUF0NMVZjWE+VjlRMZtZAYeGF1V7W
 9wVVAzs3ztR2tpa3vB1/0qgB/BZPVekjjU+M9ZD4+o/D0fKAaO0a+Ij9Uc2i8nX5eXAZSJ
 tAZu5rriT+4Z2TS9Ja2nSZJoORSl+8k0NxRGaQueWkTTFyW6/JWnUqPCwtkdEyyQERiNl2
 7/hlSmGaT7LCmgTAFBdZl43MIz4vRW0o/L54i4Yae3o0OF/dhEhzV5wHpmLYoA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:15:04 +0100
Subject: [PATCH i-g-t v5 33/48] lib/unigraf: add
 unigraf_get_connector_by_stream
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-33-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2310;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=bUpCjmymQfl0vyc3lGySvMSZhEnox5st1APye41Ok8g=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvMJuNFE709ri53WYtLkMFhOqHAa2EPYjIgh
 8FzVKucsYSJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLzBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKIHxAAhr3f3jhoOTwmqd3tjbx8GYhEpS1VifY
 t1S5TjQPdrcIjnLj062C4/utTE+0rg/Yd+8oSeHJ0r/UbTSydYlEZ9IE9JX+1ltnUBlL+8i7XeI
 LGarFAOZd1G0/66339hZUuWUuc+4h/PyPoI75yVrP9LCZ1HtqN+SI9GDmPHeXgRZ5fdeKJ2EBpk
 jlkhhD595LawcAX0fZNlZeExpVBCiM56dooDCg+hFXtYSsKi99QZQtTg9OzYehwHBBqBL4RfawV
 kb698bjeTpE/NB4OLjV7HvP0a0Epva3MZIPURmnwDY5scfr2lKndK8cXr9Eg+9u4y9Z/oetQZoV
 fk1q3nNRrU1yfI57S+gdwVtq9EzO4LGAeAIOSOe4DtdCxbZUCvv1taamJl5j0+DHKpeNnSn7Dy3
 mlaO+SlnhNyeIanG9pzI8cOMNal7D4Jj0V4XBl+TtMJ7OjplLtXqn6J6Bphf6Z8xtyKNQv+uIh1
 ozncb5IPs9OC341AeD4PEGQkzuM7c/j64cALpFmgRAOPHIh3EOYk+CAUtWMMmpvbuvxXz+2a4fA
 jGr+GnI0pS2w6yAjARRq6HQooafjLEbIwWHGwLUO+508Ipcd5qmU2nyO7s82hYHO1c59S2W8D7A
 VYOh43FKTK0mlU7r1hn3JvgGbWQkJ5oqwlLKV8hOl9+bI926Ogig=
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

