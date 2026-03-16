Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEF9F53D70
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:23:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4650710E292;
	Mon, 16 Mar 2026 16:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YIQthxCh";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CE010E2B5
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C69C21A2CD4
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9D6645FC4A;
 Mon, 16 Mar 2026 16:23:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 975E710372211; Mon, 16 Mar 2026 17:23:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678199; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=J6xtUs3jACmOaPD20VEfdXMTYLX3PGubSMZrP5ebMEY=;
 b=YIQthxChKuC2UvkUPBEAvCVk4j3EiY+LSBKgchKEkT+ciUjr806sMAcLxHVbrq1BMbuuti
 mcLlZOSTCEYLIGI9+0BeXquIaA4LMszwsA6FkYeWcef94pNDzQORrrVjwWDVC4/pODx2wM
 yWPAQrlQLCbGitvZUQmrQnFjs8+FezCK9ueVuJY/me6VO2eVFJFWH4/8XafTO1UzjRxTB7
 PyOUAfBDvhToAFLspEowo3OGipj5yHbguS9TClMex5Wt6uTNk8eUrHOJ+bh5MzOEf51/ne
 2aWGZhMr9b1Sq20FxNopPJ63b8PWHNmZLDgxByrFvwgjpdkv1IaGDtRnQFMKJg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:17:33 +0100
Subject: [PATCH i-g-t v9 12/49] lib/igt_debugfs: Add const when make sense
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-12-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2843;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=LYmW3Ga59dCsG3c6vI4LAWid343CsexDjH7ESbFjXhA=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6Kbt+KxxO7hjxPsXnD8zYxl2aAkrMGJ0Hpj
 0yru6bgSG6JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabguihsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLaiw//X503G9vsELukmMUmQvvVN06QZ9FjDI7
 5tL2MXJr9qA76YRi17o+ObWwYEpbV5tBH4gP2z1Q/Xk6Jcw/ucJfcjTdD6zczXUqVpTafjPC3n2
 DNf4IRluvHCJdvqBD9073tJG2AOZBm5W5U+yBQwkbkrimglkINkZPNvlSaZ+mo/kWV00eaN7U5/
 jw7XYPSwWzyfXUTIVuqpGrQoyBqRVNvvjhMM0nTTHhf33Od8jaKlg5zeMiDCyeo4sAB9eVsYwQl
 Ak6clneDmQNjdG65tAM0S+N6QNB6ajjk74R5IurUHtG0pUavlknr4U8s7QRiggNNbglIGf9T2jj
 iEtt6zPccpUPLgZK8VrFIvxdOeji5w2L5UVWFS7zlm5QxyaOAYyf9LtrnWmvu1oNNwUbxcoRzRZ
 GjBw4ij0r3U2sSXWEiQnPN61spbYglrH8xZEu6VcspLij8FDp9Sp/HKBHLOUzb7u6zrqY3ngmpR
 XUOSMFobL0koEVvMtObGnJufv/XtGTvuJs043ZuF8x4K+5DJCmE6nF3w3fKV3A5ZpJ3GbzCRDyv
 qcndYulMRfaU9n+zidmUSTXD06pqjD3oI5KpAgTIoj6tQSqaj4L1ub9P1Pq1BLPeMScHQmCKMgC
 jTG4u19HBkpSoXrInCisOf0TLb4lbklEvC+Esod7VTl5TgXJjr1M=
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

Const qualifier avoid unwanted modifications. Add const at place where
it make sense.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_debugfs.c | 6 +++---
 lib/igt_debugfs.h | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index 6072d7d68025..b9f1e425c822 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -270,7 +270,7 @@ int igt_debugfs_tile_dir(int device, uint8_t tile)
  * Returns:
  * The directory fd, or -1 on failure.
  */
-int igt_debugfs_connector_dir(int device, char *conn_name, int mode)
+int igt_debugfs_connector_dir(int device, const char *conn_name, int mode)
 {
 	int dir, ret;
 
@@ -790,7 +790,7 @@ void __igt_debugfs_dump(int device, const char *filename, int level)
  *
  * Returns: 0 on success, -1 on failure.
  */
-int igt_debugfs_read_connector_file(int drm_fd, char *conn_name,
+int igt_debugfs_read_connector_file(int drm_fd, const char *conn_name,
 				    const char *filename, char *buf,
 				    size_t buf_size)
 {
@@ -820,7 +820,7 @@ int igt_debugfs_read_connector_file(int drm_fd, char *conn_name,
  *
  * Returns: 0 on success, -1 on failure.
  */
-int igt_debugfs_write_connector_file(int drm_fd, char *conn_name,
+int igt_debugfs_write_connector_file(int drm_fd, const char *conn_name,
 				     const char *filename, const char *data,
 				     size_t data_size)
 {
diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index 49fbadd2a74c..08f9152fec95 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -34,7 +34,7 @@ const char *igt_debugfs_mount(void);
 char *igt_debugfs_path(int device, char *path, int pathlen);
 
 int igt_debugfs_dir(int device);
-int igt_debugfs_connector_dir(int device, char *conn_name, int mode);
+int igt_debugfs_connector_dir(int device, const char *conn_name, int mode);
 int igt_debugfs_crtc_dir(int device, int crtc_index, int mode);
 
 int igt_debugfs_open(int fd, const char *filename, int mode);
@@ -177,10 +177,10 @@ int igt_get_stable_obj_count(int driver);
 void __igt_debugfs_dump(int device, const char *filename, int level);
 #define igt_debugfs_dump(d, f) __igt_debugfs_dump(d, f, IGT_LOG_DEBUG)
 
-int igt_debugfs_read_connector_file(int drm_fd, char *conn_name,
+int igt_debugfs_read_connector_file(int drm_fd, const char *conn_name,
 				    const char *filename, char *buf,
 				    size_t buf_size);
-int igt_debugfs_write_connector_file(int drm_fd, char *conn_name,
+int igt_debugfs_write_connector_file(int drm_fd, const char *conn_name,
 				     const char *filename, const char *data,
 				     size_t data_size);
 bool connector_attr_set_debugfs(int drm_fd,

-- 
2.52.0

