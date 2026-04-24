Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D884DFED3F0
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 17:00:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B47910F642;
	Fri, 24 Apr 2026 17:00:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="sU5fD3KJ";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59F910F645
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:54:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 57E89C5EF2E;
 Fri, 24 Apr 2026 16:55:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 83F19604EB;
 Fri, 24 Apr 2026 16:54:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 896BE10720A23; 
 Fri, 24 Apr 2026 18:54:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777049678; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=5O6GxdQoBP88N/2lOyPZp6q1r91maZRdwnfkRjc9b28=;
 b=sU5fD3KJQtMDRJhgoxui1cfhIdHix/DzuUzJTH+SYeHAYy++GdlqApu/UBN6UhjUiunD3S
 4FKIIzcXQrys4cAaK+VlkAzrDTGG6jZsNmYWy133an0zttSPoIN2iltEyTfInbqhZCmGV6
 kxABB72UhjJm4qwAOxyCN8DIvn54kFNWvb8mjCA5BZUtEmV8ahCjvEbvEtKiFby3smt/Yf
 5t/2kN+VBFvFZkTKHApVqV9jADaar8nBZoRrFgcqCRZaPRWAWr9ZnIEWrGwWBmKfLpRE7A
 9bB1ssfDnX4axGLwCSfrHzSEHqf2Ib/qu7t+IHIeT4a72rVbYFtk8cuPpgEAVg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 24 Apr 2026 18:52:47 +0200
Subject: [PATCH i-g-t v11 12/49] lib/igt_debugfs: Add const when make sense
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-unigraf-integration-v11-12-0c5f5346ae60@bootlin.com>
References: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
In-Reply-To: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
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
index 0b74afe3374f..ed0a2077368e 100644
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
 
@@ -789,7 +789,7 @@ void __igt_debugfs_dump(int device, const char *filename, int level)
  *
  * Returns: 0 on success, -1 on failure.
  */
-int igt_debugfs_read_connector_file(int drm_fd, char *conn_name,
+int igt_debugfs_read_connector_file(int drm_fd, const char *conn_name,
 				    const char *filename, char *buf,
 				    size_t buf_size)
 {
@@ -819,7 +819,7 @@ int igt_debugfs_read_connector_file(int drm_fd, char *conn_name,
  *
  * Returns: 0 on success, -1 on failure.
  */
-int igt_debugfs_write_connector_file(int drm_fd, char *conn_name,
+int igt_debugfs_write_connector_file(int drm_fd, const char *conn_name,
 				     const char *filename, const char *data,
 				     size_t data_size)
 {
diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index eb2a0b70c28b..9686cdbd1818 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -34,7 +34,7 @@ const char *igt_debugfs_mount(void);
 char *igt_debugfs_path(int device, char *path, int pathlen);
 
 int igt_debugfs_dir(int device);
-int igt_debugfs_connector_dir(int device, char *conn_name, int mode);
+int igt_debugfs_connector_dir(int device, const char *conn_name, int mode);
 int igt_debugfs_crtc_dir(int device, int crtc_index);
 
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
2.54.0

