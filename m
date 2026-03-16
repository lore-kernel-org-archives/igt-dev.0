Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6285DF46446
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:24:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E5710E252;
	Mon, 16 Mar 2026 10:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="OqsUCdaK";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2B510E25A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id DDD4D1A2E70;
 Mon, 16 Mar 2026 10:24:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B5CE95FC4A;
 Mon, 16 Mar 2026 10:24:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9865510369F08; Mon, 16 Mar 2026 11:24:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656657; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=QNPaZGAsjWJcGWK44l7OddXkwE/UVb1V+rq0W+tBnh0=;
 b=OqsUCdaK2SPbuwh5fqAKkVyRvO1yFdF8mhdhnc/dMP8ktVj0BXO3g051zVQYd1H4KOb0Mt
 4PToubY5mlAKqMijjpGmlHiDT4RvKo6EXSuHxx7oFYJwoqVAO0s/1f3Y5kB3c3ieXOLNKo
 Br0KD0i2VLaSBT4DGdr8ZMJzx1bEZGn46zDszPWO7vJ2JdGMKwAj/78yiOGxMTx88T0OCi
 qqeJvnw5tS+FNQ5oXfNAh4WuwLhxEH/ATlmCbO5SD4e2YqwjAWGirNKpVrDjUs2F3UvAPS
 GRO+HzALZfVAQmKFsivOPz6rCmFFYYE2YgDaV+6zTlSEe8VcMr2NrheDBqujRA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:42 +0100
Subject: [PATCH i-g-t v8 34/49] lib/unigraf: add
 unigraf_get_connector_by_stream
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-34-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2354;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Qks+WVvFSFwjsP+PKQCu3Znz6w4BRSWyYRuGc5a78sY=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pT8bX0qeb53uO1kq2Px/wQ9rlvRmGd8END0
 xYdsiLFsx+JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaUxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLEOw//Yla06mCLOYJ/ZQhV2SAaupFC2K62aUF
 AeBijpNI98vnhfl38g6/7CRQjOQsV8hqGdmhfOhUpuq409KLVf6631rfiJ2yaGHndyPbowDgGbP
 i222Xi14V05ucxgjI5ZIRMc+5fKCc33+89O+tPgxb0p4nJzHUwGqGFV1vGJNiGMmhhCNhzDAgVT
 aIUEmCpe10SvK1d4oQJRDqowx0m/5rfXtrd4GCuaB4x08KvS+Whzv5p2vUVgLX+A+Tk6C97BJv5
 77lhkiXbFppuYsCxi+MjU84rzuhtoOkEViij1d7nNBkLriLm3zMVC27Ol3e4CnxH2/j5yXmV9cY
 ddDzFOwFZMDN3d9Z55t9v80EhIClJ9zQ+FN5UenBx+xOKrEUk2PhFWpZr3kjaB9YSt3WBze49Gb
 zo48ZnMSJkkn9UK6+mVve7UI+pcr5fyTbMFM7IisgYYcmsOFZl5ifHq9pwFqbJMVlMalOLP0Beg
 0WJjuW5AOZsZ2tr314rTkK9IXERfxCEPFmhj+uj26Ibq4WMI8It5Kxzg1bbxfS3yBomXwqNcAol
 b2lVH4PM3ZhyBZiI3E7q5Q9VY5rqnOd2IR4bFIljVafyQkCXZ/JL/JoJglGL/HQmhpcDARuz1No
 5WBUlzuUEzwswEw4KudWKO9LpDWFF2G/3+6w3l2sOHfi+QxLsyg0=
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

