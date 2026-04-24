Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B58FED3F0
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 16:59:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D7210E3F0;
	Fri, 24 Apr 2026 16:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="jIiD1pOQ";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E838C8961D
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:55:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id DD5301A3402;
 Fri, 24 Apr 2026 16:55:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B3E1F604EB;
 Fri, 24 Apr 2026 16:55:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A336610720A11; 
 Fri, 24 Apr 2026 18:55:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777049712; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=EhhTeoziEWfIDz5Pg2WEwG8A2aPZ2yGmxICAGB/117c=;
 b=jIiD1pOQVWzoLehtR8madkXZU8hSEwFrO+Pd5B+WT7tWar1fHPH6pDhzq9Dju13iqn6QY0
 PUGDGkbEoeO7DCm+I4dFlfwpcS0YcQ7mLxmg0L7vF9BJmSvZe0WBJlRBi76GNrSeg5xJ/+
 NnfBykfB4WVDGH8klLOdR1/vX7aoV4rVjdcm93qwqzMsK6MAAr6UPTzkSo5ZuiMl5CcpFI
 9ZUyqW59m6FMGyYfDvu31kG3CLXeE+LmbC9M3sLdw2NkU92wjxFvnmgQ+VPH5u/DxeTLSq
 yJQUR0zgF1VfPJ7NU40ZBx5XhZRp5XfOHx82Cdn2Dr6zUJFTrvjBL1u49cQSSw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 24 Apr 2026 18:53:19 +0200
Subject: [PATCH i-g-t v11 44/49] lib/igt_kms: Add helper to get a CRTC from
 an output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-unigraf-integration-v11-44-0c5f5346ae60@bootlin.com>
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

Grabbing a valid CRTC from a specific output is useful when testing
the output.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 20 ++++++++++++++++++++
 lib/igt_kms.h |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f623b741d775..ede8c046cdaa 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8192,3 +8192,23 @@ int igt_get_crtc_index_from_connector_id(int drm_fd, int connector_id)
 	}
 	return 0;
 }
+
+/**
+ * igt_get_crtc_for_output:
+ * @display: display to fetch the CRTC
+ * @output: output to use
+ *
+ * Get a valid CRTC for a specific output. The return value is the first valid CRTC for a
+ * specific output.
+ */
+igt_crtc_t *igt_get_crtc_for_output(igt_display_t *display,
+				    igt_output_t *output)
+{
+	igt_crtc_t *crtc;
+
+	for_each_crtc(display, crtc)
+		if (igt_crtc_connector_valid(crtc, output))
+			return crtc;
+
+	return NULL;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index df2bdf52ec90..c070d8d99029 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1299,5 +1299,7 @@ get_array_diff(const uint32_t *array_a, int array_a_len, const uint32_t *array_b
 	       uint32_t **diff);
 
 int igt_get_crtc_index_from_connector_id(int drm_fd, int connector_id);
+igt_crtc_t *igt_get_crtc_for_output(igt_display_t *display,
+				    igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.54.0

