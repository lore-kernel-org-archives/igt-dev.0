Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77C0FED3F0
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 16:55:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904C28961D;
	Fri, 24 Apr 2026 16:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="L7RNiUTS";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08E7890BE
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:54:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E1DD11A3402;
 Fri, 24 Apr 2026 16:54:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B9C40604EB;
 Fri, 24 Apr 2026 16:54:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9856D10720A22; 
 Fri, 24 Apr 2026 18:54:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777049675; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=lOF/tCK0cM+JmKdyKjQTRzt1INzYylRDi6q3mqHByaI=;
 b=L7RNiUTSoBUvNHPwjEqS8cxjxcSHLUlnWfBD/kUmdB0BJ0bgpsUn2qLL1B2rashGJLdcPt
 /LgXf709lVSdieQqRViUyCmEUuk8vZlQlbH3vzfw6q7M0pGkhKjpz4rDjKFpw3O1Pp/GPN
 dpRv8EKl1yx7Hy5fBLQWYsHnTZmYVVWxYFMj/Uix3vjehkz6mWthmIkIQ+J7VnvbF1BoPe
 2XMzCPhgx4Eick2nhpzeO4y7Q1iaJkZ1MIec0aC2x1zo32tctgxnC2ThMSlFJx6aGxE0f7
 ATrL2BfFPfS7svMuetZnfD+2dOxoYELMDGPwfmWoPnJovqHa37c9oVC+aPic2A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 24 Apr 2026 18:52:44 +0200
Subject: [PATCH i-g-t v11 09/49] lib/igt_kms: Expose reset_connectors_at_exit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-unigraf-integration-v11-9-0c5f5346ae60@bootlin.com>
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

reset_connectors_at_exit is used by i915 DP helpers, expose it so it can
be reused in a different file.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
---
 lib/igt_kms.c | 7 ++++++-
 lib/igt_kms.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 72a69b853b86..95e46d49ad85 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1580,7 +1580,12 @@ void kmstest_set_vt_text_mode(void)
 	igt_assert(set_vt_mode(KD_TEXT) >= 0);
 }
 
-static void reset_connectors_at_exit(int sig)
+/**
+ * reset_connectors_at_exit:
+ *
+ * Exit handler used to remove any forced state from the connectors.
+ */
+void reset_connectors_at_exit(int sig)
 {
 	igt_reset_connectors();
 }
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 82936e34c05e..4e5fe80ad565 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -152,6 +152,7 @@ int kmstest_get_crtc_index_from_id(int fd, int crtc_id);
 void kmstest_set_vt_graphics_mode(void);
 void kmstest_restore_vt_mode(void);
 void kmstest_set_vt_text_mode(void);
+void reset_connectors_at_exit(int sig);
 
 enum igt_atomic_crtc_properties {
        IGT_CRTC_CTM = 0,

-- 
2.54.0

