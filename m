Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11472EA4FB5
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:09:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB27810E37C;
	Mon, 23 Feb 2026 12:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Uh+v9wOa";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CE310E382
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:08:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 8B5234E41031
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:08:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 62CAF5FD43;
 Mon, 23 Feb 2026 12:08:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0825D10368F8C; Mon, 23 Feb 2026 13:08:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848534; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=J6xtUs3jACmOaPD20VEfdXMTYLX3PGubSMZrP5ebMEY=;
 b=Uh+v9wOaxrcqkCbZ77TGux237EaqUbyzpwOgloYrTA7cYie7BJWtQQ9TZDb780B/TO0ACe
 uFccOwOkdH9VHmnB+vbMaFLLXJUtqWPkBRdhe284TReG0zLf9oi9sfrNcb7GqVUHxQduxD
 jcVUeXOwYur96SW8vF2DQcSw2u/7nDho/0+OfgHmWGMCVooZtDqQTLqIOs9JH5cd2p2ysG
 n5my0eRSBEKB3p8oZ3ix6HMonUS5vBVUoHlh2cM41WSDV3IMzIhkXl1vX8Pz7lUe/k1RJ3
 xwccfSWw3t3As2RkSCluvE/BoPfYf7sjQnypz05xy2erk0hhtasN41yFIvGZ4Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:18 +0100
Subject: [PATCH i-g-t v7 11/48] lib/igt_debugfs: Add const when make sense
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-11-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2843;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=LYmW3Ga59dCsG3c6vI4LAWid343CsexDjH7ESbFjXhA=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENnYySl1wH9HzXP8LCb65mGEVQ4ynwXH3sTL
 M7WoSF1roiJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDZxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOK/ZA//fZ46lPz3lL+GTaHpyfolPgsRJhRwEk6
 tL9bX6gfVoD3d7azdBxghRgEHEBieBxOuKRoS/1+5ZOkzuS0msCaFg86UD57M09+xJhT2PhMZmu
 /N61nw7GbZtfzxSnk6iPncZix1Yon2iwHitqjB4kBR5f3j1swz2SlUsUReC5tJRFUKQzgjSsmQj
 HqvIVfSH36HSaKNQuRhjYYkIIh2SUjMMXXOkNLGUsksprPx5eexN4N0tpSMtfA81A8v0FC5bYRf
 sIvi8L3lQ5z/si2vuLf+NiX05dVhBtJNnzi8H+k70VQpgE2n8thA90D8RrHmxxsJA+JKZ4ezwrz
 EwCDeufAtwdcf+Tv+I42gl1PskdzsoTiAF6/OYptb5+HkORVozPzWPgtKanXQ5/sVCDvQzgAaL4
 NcaRWyy3LzvcI9enqN2gP41Ba+2qLQ3qJwl4ka7ZlfO9o9MhnvKYnB/kXaIsFFQVxnRlZKUfYUD
 nDN3st33ytmsboyP64SLUtF1ZzNFIP8cupdy2UCuQVd8WIeHtBFKrprSEl9/6Qcum7i4UNJfpK9
 VMeS3YlX5UAZMe6viXooylcuTDAiLPgcFi/kwAyMxoUy6HUN3c1AGbrCLCYoIs9j3KQAmAvMFEG
 jP5qMMbVUYBK6MfFt9onZ+6maUhqO1RAWfarGuJvEKIsL2wftkgA=
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

