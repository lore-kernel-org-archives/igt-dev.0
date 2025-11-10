Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7F4CD1297
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:39:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B85610E3BD;
	Mon, 10 Nov 2025 13:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Nd7SyJpz";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2229210E3BF
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 7CCA6C108F1
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EB71B606F5;
 Mon, 10 Nov 2025 13:39:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1D18410371908; Mon, 10 Nov 2025 14:39:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762781984; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ZRo/Au0wl37AnubZPO5P5kGHeO9YUEDgHBd86BL/yEo=;
 b=Nd7SyJpzYeaKioYD+a1F0TNdAehU0t3LWq8zQUSFgOXoj8kc5h8ZgiMZnEANyPViPbAgyE
 sLz81qndmdmj8600oTbhBKKc+77j+TBsUX7+j/c8/Cn/CmhbCk9hi+Q7vVlGflcwwzFKS8
 O1oqYRW7oSdTPU2UzoD5mmzqYmRqJK2OZkCoC5Dwktd3tYRUVAuD2Dmdx6fjQbmcdtIhNw
 RES08wjDNqrzueLspsDMj9diDaMemh+4Jv8DQnlN+cZjnpK2szTulnZrtK0HmWtlkjHB0F
 qZY0M9Vr4L+7+aQD3njkhnFYoat/LPvpRKPpXNLDYpwsHtU8rEvRSKLZGYCOvw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:13 +0000
Subject: [PATCH i-g-t v4 11/46] lib/igt_debugfs: Add const when make sense
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-11-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2153;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=wHWADwy07IKHydc7ntur9V3AMd88go/t2WZQm6p35cA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesNWIjFfbvqJFWcJJ7DaNZ+31rPbucL5mraL
 YiPKD2eY0+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrDQAKCRAgrS7GWxAs
 4grMD/0TrICer/ReKIdIu0d0d4jRnI9yVmqYPNxDG6Q6AHb5PQmhrSsYgmZk/4G9ANKyY+jRp5j
 ilG3OLDf7PHytbV+IduNMbVWmtzR0REhI1sAVI4ob9bPnHg/Fa/2F5q4SH6ti6MM0YSjIZK+gBX
 NrqyToFebB5eiPHtf1dfKTBoSIuldlCao6fh3v431rr/syZn1aGK4xLsov5mZhAfuCBp7zuyuQi
 OY7aHrfxc+6YoBnHrdmfZKnoFmeheSJhmXf5soWOS6EO2mTkEpA6hbu6gHXKI0gqSm6LjAGo5e1
 ipyVSpEB1iTmI7UzDtkwJTYj7kQhDy/G9h6T8jj/pWg5CYU1rz+V6O+hfu/cSrNtKzExFpgmb4b
 oViH+eTVLbwsET3XXnzYjKTEDeToLvfrQdCKZYXwPo8rc02WeHraIzIj2X4UrlvmLMB/5OSlRGr
 bOahObJ6c2jF/4GPgUSv49r2Qo6iPDjRJevHNde7WujlDas4VXZd5z/t6bKQI1wzC8JhLwF86hL
 ef6R5tSua5T+2PskEwsF5IuDpG6mJOk2UVjNOMofuZ/aB52b22c+7y+TmWjH8m+Wm/zwYAK565g
 9dZxE89of8+yTr17hF67pdWLDil52LSb9rPPasdthJ7W9QNk7WbmA65AlQztNuLQ2fV5dREqx1H
 /isB0/EsjtBvFHQ==
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
---
 lib/igt_debugfs.c | 4 ++--
 lib/igt_debugfs.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index e73db25835eb..6b19ffa3a7ae 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -239,7 +239,7 @@ int igt_debugfs_gt_dir(int device, unsigned int gt)
  * Returns:
  * The directory fd, or -1 on failure.
  */
-int igt_debugfs_connector_dir(int device, char *conn_name, int mode)
+int igt_debugfs_connector_dir(int device, const char *conn_name, int mode)
 {
 	int dir, ret;
 
@@ -759,7 +759,7 @@ void __igt_debugfs_dump(int device, const char *filename, int level)
  *
  * Returns: 0 on success, -1 on failure.
  */
-int igt_debugfs_read_connector_file(int drm_fd, char *conn_name,
+int igt_debugfs_read_connector_file(int drm_fd, const char *conn_name,
 				    const char *filename, char *buf,
 				    size_t buf_size)
 {
diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index c33908054da7..22046539d919 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -36,7 +36,7 @@ const char *igt_debugfs_mount(void);
 char *igt_debugfs_path(int device, char *path, int pathlen);
 
 int igt_debugfs_dir(int device);
-int igt_debugfs_connector_dir(int device, char *conn_name, int mode);
+int igt_debugfs_connector_dir(int device, const char *conn_name, int mode);
 int igt_debugfs_pipe_dir(int device, int pipe, int mode);
 
 int igt_debugfs_open(int fd, const char *filename, int mode);
@@ -178,7 +178,7 @@ int igt_get_stable_obj_count(int driver);
 void __igt_debugfs_dump(int device, const char *filename, int level);
 #define igt_debugfs_dump(d, f) __igt_debugfs_dump(d, f, IGT_LOG_DEBUG)
 
-int igt_debugfs_read_connector_file(int drm_fd, char *conn_name,
+int igt_debugfs_read_connector_file(int drm_fd, const char *conn_name,
 				    const char *filename, char *buf,
 				    size_t buf_size);
 int igt_debugfs_write_connector_file(int drm_fd, char *conn_name,

-- 
2.51.0

