Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D679310F92E0
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:11:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC9910EC4F;
	Tue, 31 Mar 2026 17:11:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="xFVmYOi4";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B193810EC39
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A65AE1A30B4;
 Tue, 31 Mar 2026 17:11:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7D1746029D;
 Tue, 31 Mar 2026 17:11:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8FD4C104504A1; 
 Tue, 31 Mar 2026 19:10:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977060; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=sslOeQSDexx3qv6aX+eUznVLOc9+QPCccqWFhqhJ42E=;
 b=xFVmYOi42frO8gDrECRTMWCg/YA/UnKfXyDzhioKKGPd06nPl8HksncSlypl9k3czOaZCt
 nOirrv4sd/CfP+02t0HCNFqkFiX10yYhSAQSDxgo3FeBzI5QmROEBBGLrugKnFdy/Ft6FB
 nwuR/GL36eSNGVM4WQN0UCrZTirngs7ieVx1/0cTltKVux0eQ4dJqxH4451gG58i4JWLxq
 8Fi2bgyEPD/5mBRfkCsJUPEgbBiYDKmxngoy1mHqsyl7S86bjRWPZdgBs88oigovHFAy4w
 ujWPj9/IuUMNFQTfhZunTlwG0qjBYouhuelCeKB/pkJxxKpBnARIuB11MMxqEA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:29 +0200
Subject: [PATCH i-g-t v10 12/49] lib/igt_debugfs: Add const when make sense
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-12-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2833;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=1DFky+uJTXjmax38AWNlbyuViwErnOzcU+yyFbKKziY=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzAA8FDFNh0zbYNScfEcpwXXIze1+WkNWEjEJ6
 WFwsRdc8FiJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAPBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOL4MxAAmoUSeABudcaHnbqKOY+BMlNi5la88Ek
 RUaEa/T5XaNHGC8GJXTVKjnMDkmzURAWyX/zd3q/JZoCmMlQbjYpL3R6Z+xFu74jjj+GnF+ac3U
 HuKBGeB9Jszm3eW42xOyUHMs/02av5i0TrPsp6HEfT1VC+C6FNPeESz/bECEAYS2/TRalLGmL+p
 4a/lLmviVDnkwq9zNgzUPcMBBSVWMZ9LTeJFM1E/qQ+zQbc/soXZMc+ZTu+HW+o0lcOPAlOzXqi
 GuyrIxa753E6uPWNkHV/VJtscQqzLj3qmxsLNFu54wkQ+jPBOTqB3sF2/Lc6VQNG70k3c+U8y1m
 90VDe8aCMJztVG1yNEp7LC1+PhTTxvt+O/Z+EZ2X9Ul+bk7ut4mYA3HRjzZ9aX8bfuTq4gQQ4nz
 PGqaE/9TsP2HWxTUb32NL4zd+3SK+hJWC5hUU6FLu4gQUsBK0BLzgyOMTKlFYRSOMslCTg483E5
 bGvsbG9j1mcNpKdJ3seaA6T25dSa+utuW9iKjpojIOIhwG/FrZwuJ/QguFUQO7oznUgjQ/M8zWF
 7TmQgA5NqzHCg9P1yC1AdI1FXkK+iXjdYXO8ovUoO6F5XP8Ttts+pLaAlUlfS3PqmbiG6qpbobp
 5d0omCNcI/Ml0k8/Rf5tjovjcUSawluKqxup7kNPK1IM+9gQvHBo=
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
2.52.0

