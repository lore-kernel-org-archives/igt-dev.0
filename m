Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA02CA0FE7
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 02:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A7910E193;
	Sat, 23 Aug 2025 02:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="agA5YYRZ";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4ED10E191
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:20:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 382794E40C5C;
 Sat, 23 Aug 2025 02:12:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0C9B5606A7;
 Sat, 23 Aug 2025 02:12:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 53A8B1C22A1BC; 
 Sat, 23 Aug 2025 04:12:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755915123; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=8LD3JpilFmIRXAY/Is4LpbBfZQUoMxqxvIeOWy+4vSs=;
 b=agA5YYRZfd5iNfhRlfM5q5RlFD1JWkYStYVx/Ti41uw+U1+LNFZzhVO3J+hMxhT4i1ae0f
 lqGCFrE2/uwXBVz+2UZ+tgwh0CbSLbTo/lYyqy7jgvRsuPam9AYY0MI7vvuVSh9RL8G+9R
 7XF800RU4BqUqclvjCaIXCJGZqVvJG6jFWsrJGe37T4z22nhDC0tSNsv2kHv5cSBKMVUCp
 0MkNgKROA7RuFsNr30KEpw1sYFZZt+9gQ5JRQkP4qulGc8fE0/PZHCTqXMXer3N6nDr623
 IcnVT6qxEMIOmlEiRSyDAMzMDDzwHw2twzJC9LoNGpnMTLgYFZRFqW3HvJ3V9w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 23 Aug 2025 04:11:47 +0200
Subject: [PATCH i-g-t v3 27/29] lib/unigraf: add
 unigraf_get_connector_by_stream
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-unigraf-integration-v3-27-cdc36d5fab4c@bootlin.com>
References: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
In-Reply-To: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2547;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=iFbSHTcv10ZE6CNYpEMym9n127yLqJhLkdctqVboLeE=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoqSNY8DlYgA4OmYe4WalpoJA8J6CvIC5YyP7/w
 2JnmkpUCTKJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaKkjWAAKCRAgrS7GWxAs
 4tdSD/wLm3H4QIfrQZHzXkz2aU4rH2zWdDGYSUw6tKP+h7O9zUCuorxJ7Ite3ittDR1EYwBd1Yx
 LtfVj2jnxhSfz3uOJiJjGxTVGU6H9FwtxwfyOuNVZTv4PzdOUhFlS/8bw42syLqzBCi6OD/OwgW
 lyYu8mFgrEV0pBXgyJkDdeVOXVDMItYG1FKETIhnL/j8yWujb6mdAEFz51wENE8DqWo79ik54jP
 +f3MwuzusXTX6U9VD8JrbA2pe0R4PgBUF/7RTulZUAycmLvfhx2Bg6Weh0miPwh3drT9iLXdqKs
 b8QV1TB15U6mcTQu3w6W0sBhzD6W3BzIGtGstmcKU1ggE6zmxdt2BZ1Ed9EgL9ABczqHXZ6KqOe
 7E6CLe+3yGVhriM+qE9N39uL2j5GhiS+MdN4hIFbXK1hC57ayyYEOng0sr+aKnZ9gbdOOgBPzkU
 ybhZro6WHaewHqUxMMRAXtmGxGKEu9jo9bxM+aCQ9s9b/sStAHl64BK2xQHN2Bevf9s0hrh+HoK
 Xp8AwvnLc+XxONy/tcrnXjOHefXZ6LawZ3sj0X4qoRmrlfNofPRifTatrpD2PIzuZFdVh1DRjMl
 Cy+E2tv9PiJbfFtM2DTWUdoJuOQ2lP/XNT2DkGykxet5fTOTUbeKF1wAxpD3ppHTninqVz+xVKa
 W84KPSYbcWjbeag==
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
 lib/unigraf/unigraf.c | 37 +++++++++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h |  7 +++++++
 2 files changed, 44 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index e2a26f9bb199d83d9a1474ac2613a181450e0530..8de2c74affdda741b11933a1a55f1c2d2b1bb61b 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -6,6 +6,7 @@
 #include <stdio.h>
 #include <string.h>
 #include <time.h>
+#include <xf86drmMode.h>
 
 #include "unigraf.h"
 #include "TSI_types.h"
@@ -257,6 +258,42 @@ drmModeConnectorPtr unigraf_get_connector(int drm_fd)
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
+		if (path_blob && path_blob->length > mst_path_len) {
+			if (memcmp(path_blob->data, mst_path, mst_path_len) == 0) {
+				drmModeFreeResources(res);
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
index e2013e8dd887389b573fbc3faddffb119f10c9b5..be958df5278b2997b031c38b89615eb6af51159e 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -172,4 +172,11 @@ void unigraf_read_crc(int stream, igt_crc_t *out);
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
2.50.1

