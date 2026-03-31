Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AE510F92E0
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:13:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F1010ECA9;
	Tue, 31 Mar 2026 17:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="VsZjk32k";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972F110EC43
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 20AFBC59957;
 Tue, 31 Mar 2026 17:11:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7E3516029D;
 Tue, 31 Mar 2026 17:11:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C735F1045043E; 
 Tue, 31 Mar 2026 19:11:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977079; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=OgcXDu4JlSRKLAgyKdzGWmp5q8TM0eJm4n1z5PbmkGc=;
 b=VsZjk32kwa2bMP94RJVGzGDlMba5usw/waHcBoZPbHE+gsDu0+Aq5N0A6RZia8y9UmTQEa
 uS/S7AwlG6KIiZK1XWrxyzj8gYeuQvhnx5/iC00TUWlSS3me7OZHYPX0tr7ELlyGBVQBNf
 rheMO8/K8C8jhvQeeoryIbW/FWdWzS93lZVWIEGW9HzoIkN57XHIB/oV7+EcAHkuYckaSg
 VRa2FVnfVuDqApTuKjIA+KVSSwELuWddWbN+W5nqlP4vldGJJ+utMXjUi681E2ZOa93XdR
 /rsnPVXsEcWApaktJlsHbTVRzP4Ogn7EOlS1FLvySZD1/AQhNV67k8mV4Ct4GQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:51 +0200
Subject: [PATCH i-g-t v10 34/49] lib/unigraf: add
 unigraf_get_connector_by_stream
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-34-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2424;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=KqX1nwMYomTb4NPqnKixAAhaNQL6xkgmZpW77yV63wo=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzABAPiLUDHHnPhRW34lsoPBxd1aEKZFDhTF8j
 3VGFGtDiB2JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAQBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKIaw/+PyDOnLhn83Lihq0M+R8WPZYA9cnRIzr
 ocweTKqT+BeAf9VJj//YSqrMUrfr2SFTAWNj5UGvvqlZ/yy78c2sqr+y3zRNxJ3234zn8blZ46B
 07deXYARyqlaK8W7VqbybzvWAeP/GPLCIExGXIry5cWXDL0jn0lHY61pxrkWNAtHDMX0Z2zkee2
 SjT7/lXybAXYKcwt9TP9GpUr03gxGJazMKQJIGml9yXFLw9bdPQKO3Bpbsva35bekWPh9ZqdS3h
 HSQHM0lC1CuN07ibPLVbmC2Qxyx+5WGUygnrx+mCcNtBjdN+rjTBkD2JHUMNUXwbk3LU5cXy+/z
 tGwNelAgxIF4QbTC+eCYsjaAkYw92B/l8cCUEF7sL2JVbIw5P40fBO9cZZ3DuSMJvBVIVjMoseA
 CORt4JlubVMYiW6BlcZdXieMGtrXMKQAmnL/8fZifNn6Jo3QoMvqWLF675LsO7Qbx6i/5scuORZ
 sIgFxdvpNXKrL+RYkegS19F3sDJEk0hYL5+yv6dH77WaCa+3hYVcb8pSpEGXoH/0wC/G/nfiegQ
 cv9ZBLS6xyobvXHWPCLMlFcmSxCfXrE9y/3N/5VctpOyyGuXa58tZK3F8cZFI7N8SCEVhhX1oQs
 RujE9uJ547wkGgDmeg/TUi+YqOXK03WNFlBOEWtz7jJbARstuuB8=
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
 lib/vendor/unigraf/unigraf.c | 41 +++++++++++++++++++++++++++++++++++++++++
 lib/vendor/unigraf/unigraf.h |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
index d6e0c36062ae..dd7d3cbadd2f 100644
--- a/lib/vendor/unigraf/unigraf.c
+++ b/lib/vendor/unigraf/unigraf.c
@@ -303,6 +303,47 @@ drmModeConnectorPtr unigraf_get_connector(int drm_fd)
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
diff --git a/lib/vendor/unigraf/unigraf.h b/lib/vendor/unigraf/unigraf.h
index 34bdf15ed04b..e07ca6745292 100644
--- a/lib/vendor/unigraf/unigraf.h
+++ b/lib/vendor/unigraf/unigraf.h
@@ -77,4 +77,6 @@ void unigraf_read_crc(int stream, igt_crc_t *out);
 
 bool unigraf_use_crc(void);
 
+int unigraf_get_connector_id_by_stream(int drm_fd, int stream_id);
+
 #endif // UNIGRAF_H

-- 
2.52.0

