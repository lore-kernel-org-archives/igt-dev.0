Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391C6E7DEF2
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:32:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83DA10E4E3;
	Mon,  2 Feb 2026 14:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="nU7qL5tP";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF58B10E445
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D9A884E423C9
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B0E8160767;
 Mon,  2 Feb 2026 14:32:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A6B3D119A88FA; Mon,  2 Feb 2026 15:32:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042757; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=xPJ9Ym4BKdkqPXnnTHXUToVFBruSoQTMgttF3U5iCCo=;
 b=nU7qL5tP9mDAxgcEx7gUMamSbezuypG7R3mI92QnRQ8sTDuBbbu2njQTCJxUyUeEJRf1Gb
 VBIOwP4gX9xOEJPAR0hESfx5l2WYouWHw0njxEyCs5SK616GUqzX63Ripz6QunmthN1/03
 KzlhF+MuIDxik5L3AYWvTqUtup1TsLe8WU1XSuWJ0Qui5A6dUMguP5EoYQmJDH6Lv8wtTd
 OXLaw1tD64iCTkIiVC/yEbYZAwTBAJCwZ/lEx5MY8Aub1iQ7R3grt7YzJauwDFSGICBXww
 tMV126v15ss1di0kHet29WCP1XK8osh3bXZoohpjmU48gd0b3Tq2xTOxlJTHlg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:32:50 +0100
Subject: [PATCH i-g-t v6 11/48] lib/igt_debugfs: Add const when make sense
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-11-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2214;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=I6guwp0Eiw1Lv/7hL4PIxGPzlTIX5WF+aOFB0d27VPg=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWPItBJATrngI44aqwDgmYB3JsE9lvJYKiZR
 l0h4nd3bfyJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1jxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJOchAAvvh/M+3//kxIZxJQIYHN/WsHOG1C0cl
 Shof9oukSxJ9s/Hh+Bp1ZgmKxGEZRzG9wMJ2Nvyrx9U82aXSi+wruiMNk+dvsBgrkCjxt6Pwe4E
 gdfIdXXjEgVC0CecO9Th5Y04AF2+nBFpYc34LuHrJaUEiOmOi4hueBdoe+Nx1NZbPEibFRFuX7C
 IxM9KAutXxtXn30WlqHu4gCa9bgQKB9Y010uC9snsZ+W/OsvPEwYKNGkA8Lz9o96ov6iFfzMkId
 uAYEf9e6FHh5khGvxI/wuBsD7taZmdzoeTPRF+qekFAl0BPHtFne8nS+Osqvhgj2NiRZlpltbeF
 k6G2P+yNsQd3cvLpNUakCKMaQiFH0eDv9KcywfNR0SOoBCwYdh2XwrnSqsB+BfJrH9nnrKTiXc2
 5odxxIR1BwYHuz4Zfxgt4FBcsU0VEGkPq2OjFCgLyKQcZ13zkom77wktGByd+7VHG6TSO22DCYj
 W6B+dAp+lf4JmGgnc0Cgm2K6RLcyygFOrm7uxp2bYkV/KUMe6k1UT3VN0UcIuVIe/dtRcf1tYGX
 0poDaxJqDtyKnDglmaQq6U78QRFpiaDS6apAW836f0ZeVcl2sAFt+G97bOks9WSMCvcQRYqNpR0
 aKFroV5NoPpz8yHnCN+j70uLWte++kx7YLhK7mPv35Qg4ARe/MpI=
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
index 6072d7d68025..5de64ac5acba 100644
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
index 49fbadd2a74c..bb91cb1e99e7 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -34,7 +34,7 @@ const char *igt_debugfs_mount(void);
 char *igt_debugfs_path(int device, char *path, int pathlen);
 
 int igt_debugfs_dir(int device);
-int igt_debugfs_connector_dir(int device, char *conn_name, int mode);
+int igt_debugfs_connector_dir(int device, const char *conn_name, int mode);
 int igt_debugfs_crtc_dir(int device, int crtc_index, int mode);
 
 int igt_debugfs_open(int fd, const char *filename, int mode);
@@ -177,7 +177,7 @@ int igt_get_stable_obj_count(int driver);
 void __igt_debugfs_dump(int device, const char *filename, int level);
 #define igt_debugfs_dump(d, f) __igt_debugfs_dump(d, f, IGT_LOG_DEBUG)
 
-int igt_debugfs_read_connector_file(int drm_fd, char *conn_name,
+int igt_debugfs_read_connector_file(int drm_fd, const char *conn_name,
 				    const char *filename, char *buf,
 				    size_t buf_size);
 int igt_debugfs_write_connector_file(int drm_fd, char *conn_name,

-- 
2.52.0

