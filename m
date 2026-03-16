Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD73F53D6D
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:23:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C4E10E2A4;
	Mon, 16 Mar 2026 16:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="qWT3kwEO";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1C810E292
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 95E4E4E4260A;
 Mon, 16 Mar 2026 16:23:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6D8885FC4A;
 Mon, 16 Mar 2026 16:23:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 372271037220E; Mon, 16 Mar 2026 17:23:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678197; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6EcE2qxMle+TG+wJSgbKVMDJVCNSb9z1+xs4HZS+p6E=;
 b=qWT3kwEOLnBeTHY3LFHd1uNXl8azFO4V8Qz+LSPbQDvNP1CsaMjADJegca8T2rw7sPrXuC
 7/uORgJY8KFchjnBgmzqvxAPLCP2FwLL3pp72GvECXUBWu1sv2Ruf+KTpRxCBVFHg8HGqf
 NczVxqDYXhE7tF3zNDQKbfpFtLu4N/Ou4KHjxKATzbzfVUe7byA3BjRLD7iduJ6aR8yfyj
 EIlGbm2FYLDIlxrMgFH2WhLVTvXlyAPx5ULZvxWUVTCmhfKXkowdjAsVpiW5tCk7cjFSzV
 fk1wWK6x211lvOpDAOKfJ0c28NN4NOmPOxkJNf1DWtN5528ogmrSGGvZtYnoiA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:17:31 +0100
Subject: [PATCH i-g-t v9 10/49] lib/igt_kms: Expose connector_attr_set and
 igt_connector_attr_set
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-10-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2613;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=mEalr9OApTui0QytUpthazYtkWyOgfcWb98CZfilDBU=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6KlGOrgK1NyyPZdNkKSHJB1H70kY3yl7FPI
 Mrkl/SzNKOJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabguihsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIuGA//RdDymWqbuJ33IDLJWNq43Jz8J8CxjLb
 muN8l9f3ft7Qp6e3CvNqa+T7hHuno428YyR4g2iyX4ZeT1yWHeoRME+j3qxiy2QFQmYeRH+eO1i
 sPPJpUTvZ5MkKv00Z683+t90IayEkLIjfYGCfx+NIdPw8rz51JaDcJFcuEKRcqX9lLfxS2Nrl+u
 3Jahyh+lNrOwoNCvYqPKjU+4cf5SHoAb22RN5zdm0Hc96yG0Gj5b84C3djydRLYYrtTtbDPvGti
 +pHgiRYhx/WghNPDcEir+o6ds0s+mRQddEtcyu05/2hOqeQPGgkaON+q82iel6ZoFPXqrz/Axai
 t3v5cywbMz5fdxvGPvJaEoAn8zwiQiT+ZRGT4tfWFJLoQmXVUAummgS8UWrchushoopMTokJqFm
 awtKx6WmVVfMR3Hh7Upf7/w+koww8/Vac84Wwm40/YK5cpD4EvMnUxV0UMWuB+kfANZbBbe5d3l
 6vimnuaCWNL4SkZ/3hea2w7hzmr83dd22s9PWhM1g0xt29qd6OCqa6wSLg+koQeECLrtWnbUiBr
 yxOb1yFs4NkC4PDKiNes5xmMwLkrkLUJbrcrQhvQ9dgyJSFuViHz11KLbcGdSIVPNyUEyYrlx5W
 SG+7GKsRakgQqYG/AW2l41FTwnuyvbcroOaaUX5z9Qe2CuJ2+/gw=
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

Some debugfs helpers need to use connector attributes. Expose those helpers
to allow using them in igt_debugfs.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
---
 lib/igt_kms.c | 30 +++++++++++++++++++++++-------
 lib/igt_kms.h |  6 ++++++
 2 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 451b273999f0..ce9f70f31f64 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -100,8 +100,6 @@
  */
 #define IGT_KMS_CONNECTOR_NAME_SIZE 50
 
-typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const char *value);
-
 struct igt_connector_attr {
 	uint32_t connector_type;
 	uint32_t connector_type_id;
@@ -1682,11 +1680,29 @@ static void connector_attr_free(struct igt_connector_attr *c)
 	memset(c, 0, sizeof(*c));
 }
 
-static bool connector_attr_set(int idx, drmModeConnector *connector,
-			       int dir, igt_connector_attr_set set,
-			       const char *attr, const char *value,
-			       const char *reset_value,
-			       bool force_reset)
+/**
+ * connector_attr_set:
+ * @idx: card index
+ * @connector: libdrm connector
+ * @dir: directory file descriptor
+ * @set: function to set the attribute
+ * @attr: attribute name
+ * @value: attribute value
+ * @reset_value: value to reset the attribute to
+ * @force_reset: whether to force reset the attribute
+ *
+ * Configure a new attribute for @connector on card @idx that can be set
+ * using @set function.
+ * connector_attr_set register this attribute to reset it to the @reset_value
+ * during igt_reset_connector.
+ *
+ * Returns: True on success, false on failure.
+ */
+bool connector_attr_set(int idx, drmModeConnector *connector,
+			int dir, igt_connector_attr_set set,
+			const char *attr, const char *value,
+			const char *reset_value,
+			bool force_reset)
 {
 	struct igt_connector_attr *c;
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 5a9efc8cee48..6298738b452f 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1231,6 +1231,12 @@ void igt_parse_connector_tile_blob(drmModePropertyBlobPtr blob,
 
 int igt_connector_sysfs_open(int drm_fd,
 			     drmModeConnector *connector);
+typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const char *value);
+bool connector_attr_set(int idx, drmModeConnector *connector,
+			int dir, igt_connector_attr_set set,
+			const char *attr, const char *value,
+			const char *reset_value,
+			bool force_reset);
 uint32_t igt_reduce_format(uint32_t format);
 
 

-- 
2.52.0

