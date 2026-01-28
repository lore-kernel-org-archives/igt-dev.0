Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23530D25B59
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:14:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6B510E6CF;
	Wed, 28 Jan 2026 13:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="xtMBCuMk";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1EE10E6D9
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 434504E422FD
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1A8356071F;
 Wed, 28 Jan 2026 13:14:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D6C84119A8816; Wed, 28 Jan 2026 14:14:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606078; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=2t7ibwNn6PQAx3AHo84BzjrIe3RkCOYCGjiNY1GmBWQ=;
 b=xtMBCuMk7bciFaQCK0xvxJZoUqAMcm9VvMWWLn51rNd+pOch5IIMpxICeXtWVxif7tr3kz
 dS/UIZMX34T5SybMP1YyIguHQ0JgqS19PT8PpahbqGwX2Agk3Z6XB8ME1vO/V8GGCPQit2
 vWrgz7euAtDmasbMI1aVGbKVgS1atD8pdwnA6108n4TuATlzAkx46Mjd4emNvwXTsqwkke
 SajlPqqJBgjH4ehJkBqPLIDhPRfzJ0unAoKkQKyxhupD+tyZTnAkHvI+JCsXwVaVpH8gzQ
 IY5BbBB0RUnRUCJJV8ZZCBrXjYnrGhBdGJjH0sln1gcD8zqntKg0HbQhAJXT4Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:14:42 +0100
Subject: [PATCH i-g-t v5 11/48] lib/igt_debugfs: Add const when make sense
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-11-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2208;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=PFv1skDSi2XZOTcvRvCqh4Kzgzl1+hzz1NgsuRvohbk=;
 b=kA0DAAgBIK0uxlsQLOIByyZiAGl6C8igyCDbceLKN038UIuEmRAssSA7bk48j5KTBFmu7rbDP
 4kCTwQAAQgAORYhBE+PuD++eDwxDFBZBCCtLsZbECziBQJpegvIGxSAAAAAAAQADm1hbnUyLDIu
 NSsxLjExLDIsMgAKCRAgrS7GWxAs4uEYD/4o2E6bzjbV6wj/njX+qzL1gbgxDeDzM94iYd8hyaG
 nd8eQ+c5G69Nlh+MM/H0GJ88vLf+WyZOLKd2iQ1gWEMjcHfCipHU8p6pTMY/t1kZfmEOroyJYe9
 T3rnGe3WhL2aDrW+pxqSqM5nS/r6YLzFIV/KLqQyRyXuWECaBlvl5zMJcQ+1POPBidM47ONyS+g
 ZIiOxuhr0aPXnyWogSHZDH4Blp0G7+VuC8CVfGYvXZ7mIst25DDUXjTxCYp0u/g1Z0iZfFegSAB
 4ZoG4iXHldiSZCZe2JrW3BoEtDRLDC7A5QftFMg3ZNEmp88hfLuqX6aW3pOywdyLBo+6AHSGOcc
 RJsDXsZbPJFxteh0uYqHcHoqVi1bhdIshpE9IbE9rTvoRtgpznmogMBMz679mbalm0lo0Hcagnj
 gtaji71uP7/1JOPaMvSZgt5CHIiFpCoeyPvNMlmpLr6FLgqfFOfHYWIHMnMFpLsvKmAsRefRwrr
 RgfrI5UAc+2PAtEj+D0Lh2ATCaP/kor54cEtEr9hQlVdSU+JOwE62Xsw/cO5ziq5M9FB4oEJykL
 DaVWc/9QDOWxNPLhi1ZTcOmimXEHNy3qRL98W3iqoeIQjfnyeXyzGjwUEz44boOkW/imKvbnfnG
 6wY9mgrYzCdtvDssFw5W41QVlXy9NDm5hbr8TmHRVSw==
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

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 lib/igt_debugfs.c | 4 ++--
 lib/igt_debugfs.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index 31e40901f25e..ece8b34f4ed9 100644
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
diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index 6c2efc16ff5e..8c0224f78427 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -36,7 +36,7 @@ const char *igt_debugfs_mount(void);
 char *igt_debugfs_path(int device, char *path, int pathlen);
 
 int igt_debugfs_dir(int device);
-int igt_debugfs_connector_dir(int device, char *conn_name, int mode);
+int igt_debugfs_connector_dir(int device, const char *conn_name, int mode);
 int igt_debugfs_pipe_dir(int device, int pipe, int mode);
 
 int igt_debugfs_open(int fd, const char *filename, int mode);
@@ -179,7 +179,7 @@ int igt_get_stable_obj_count(int driver);
 void __igt_debugfs_dump(int device, const char *filename, int level);
 #define igt_debugfs_dump(d, f) __igt_debugfs_dump(d, f, IGT_LOG_DEBUG)
 
-int igt_debugfs_read_connector_file(int drm_fd, char *conn_name,
+int igt_debugfs_read_connector_file(int drm_fd, const char *conn_name,
 				    const char *filename, char *buf,
 				    size_t buf_size);
 int igt_debugfs_write_connector_file(int drm_fd, char *conn_name,

-- 
2.52.0

