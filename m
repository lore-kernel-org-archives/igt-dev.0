Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C45FED3F0
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 17:03:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D90E10F645;
	Fri, 24 Apr 2026 17:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="D6KRgWj8";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6FE890BE
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:54:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id B7D61C5EF2F;
 Fri, 24 Apr 2026 16:55:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E3CC1604EB;
 Fri, 24 Apr 2026 16:54:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AA02010720A1E; 
 Fri, 24 Apr 2026 18:54:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777049674; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=EXMR5ETloVGklSsHnl3vbBQ07DmEGala4GH6/O2/3k4=;
 b=D6KRgWj8zC+a8jf1Eg1C6qHuBHM7Z3D1RpRxPx0w3htTp67u4QArSlkgNU0YWZA8298sfA
 XCgTftTOGbBKL6WOqkrWiELDe9f7jJl3n053+opzw3pqM7M52xDLAYBlwYL4I/Fz1khbOS
 lyPRts3x91q5jCgztYSds3REujGU1ViQZ3GrNJgajIHfIoFh40KVSV/HfLszfJ5pVmV+hP
 /zLpQOIMswWPkv2zB63hN8UTDi182pBRtx1yGFGm53wV5yXkv1D5QDTVC/BRzaal5Lrv99
 JafLqDioXrMMf6p6tlsORVhno19NJwCuyJYUssJrmf83Oba6pP3JwKozxdMi9A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 24 Apr 2026 18:52:43 +0200
Subject: [PATCH i-g-t v11 08/49] lib/igt_kms: Expose dump_connector_attrs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-unigraf-integration-v11-8-0c5f5346ae60@bootlin.com>
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

dump_connector_attrs is used by i915 DP helpers, so expose it from igt_kms
to be able to reuse them.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
---
 lib/igt_kms.c | 5 ++++-
 lib/igt_kms.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 31098d6bdd4c..72a69b853b86 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1769,7 +1769,10 @@ static bool connector_attr_set_debugfs(int drm_fd,
 	return true;
 }
 
-static void dump_connector_attrs(void)
+/**
+ * dump_connector_attrs: Display on debug log all the connector attributes
+ */
+void dump_connector_attrs(void)
 {
 	char name[80];
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 6fd3d7589e32..82936e34c05e 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -258,6 +258,7 @@ enum joined_pipes {
 
 uint64_t igt_kms_frame_time_from_vrefresh(uint32_t vrefresh);
 
+void dump_connector_attrs(void);
 bool kmstest_force_connector(int fd, drmModeConnector *connector,
 			     enum kmstest_force_connector_state state);
 bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector *connector, int joined_pipes);

-- 
2.54.0

