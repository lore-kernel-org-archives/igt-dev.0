Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41ED8FED3F0
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 16:58:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE6A8961D;
	Fri, 24 Apr 2026 16:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ZNybazVK";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5480810E2E5
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:54:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4A19A1A3402
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:54:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2163A604EB;
 Fri, 24 Apr 2026 16:54:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1519810720A11; 
 Fri, 24 Apr 2026 18:54:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777049692; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=4Q2BxIB3lIcSOgrQ87aKu/jDuTHVTr7MwFXszRvgnqE=;
 b=ZNybazVK022KPXai3AX3obEFgGR+4CshAjh4hUXICpbsh3fBDJvJmJc8/Bdw1/xJeJGknj
 i28/eaHbljYaF95Evp5flw7p6vywF9Mre8/SN0rM7PZdBYzqbMwCMSEnAKfDHaivVZuAZu
 EbqjC+qaXpOqL7O7y+2o0CMg6rKC6u5CAHPVGzVG4ce8qkQ8XiMQjCzCS8kBidWzfFwmG3
 IirSrh3JB2XfUnQvLUxlrFBqTeiZrXD1n/G8fV1XcceoKYpo2hFuSe+MV68bPydgj/zdpG
 yRiI/Kh9KJ1qsbP6av+s7IHLxEYx6KKkkkXk6864OcrFp4lAggAyczFmrqG9Bg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 24 Apr 2026 18:53:00 +0200
Subject: [PATCH i-g-t v11 25/49] lib/unigraf: Add reset function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-unigraf-integration-v11-25-0c5f5346ae60@bootlin.com>
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

To have a consistent state at the beginning of tests, add a unigraf_reset
function that will restore a known state.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/vendor/unigraf/unigraf.c | 12 ++++++++++++
 lib/vendor/unigraf/unigraf.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
index 591e99e938b4..e6760ba84386 100644
--- a/lib/vendor/unigraf/unigraf.c
+++ b/lib/vendor/unigraf/unigraf.c
@@ -268,6 +268,8 @@ bool unigraf_open_device(int drm_fd)
 	unigraf_assert(TSIX_VIN_Select(unigraf_device, chosen_input));
 	unigraf_assert(TSIX_VIN_Enable(unigraf_device, chosen_input));
 
+	unigraf_reset();
+
 	return true;
 }
 
@@ -281,3 +283,13 @@ void unigraf_require_device(int drm_fd)
 {
 	igt_require(unigraf_open_device(drm_fd));
 }
+
+/**
+ * unigraf_reset() - Reset the Unigraf device
+ *
+ * This function performs a hardware reset of the Unigraf device, restoring it to a
+ * default state. This includes resetting all configuration parameters, stream settings,
+ * and link parameters to default values.
+ */
+void unigraf_reset(void)
+{}
diff --git a/lib/vendor/unigraf/unigraf.h b/lib/vendor/unigraf/unigraf.h
index c08ce62894c5..4c2cbd6b1aa5 100644
--- a/lib/vendor/unigraf/unigraf.h
+++ b/lib/vendor/unigraf/unigraf.h
@@ -40,4 +40,6 @@ bool unigraf_open_device(int drm_fd);
 
 void unigraf_require_device(int drm_fd);
 
+void unigraf_reset(void);
+
 #endif // UNIGRAF_H

-- 
2.54.0

