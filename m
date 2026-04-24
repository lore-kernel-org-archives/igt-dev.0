Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B764FED3F0
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 16:59:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B16E010F642;
	Fri, 24 Apr 2026 16:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="1XWno2KS";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B83A890BE
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:54:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3E9351A3402;
 Fri, 24 Apr 2026 16:54:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0EC02604EB;
 Fri, 24 Apr 2026 16:54:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0F52610720A24; 
 Fri, 24 Apr 2026 18:54:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777049679; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=wFtXdwChAsJtNcJ3hylVXTM26rKt/ZaQNQAJ1pDhs6E=;
 b=1XWno2KSlx1uZrEHYy10+IyWiLmgPQvSOF57M23puvIdQe2NV8yA3lvIXNFMmHsbB6rg7u
 ckA2ooJNRSBTkD/bM9cdu744IITXWYouIV8RMZpqSFcnPv8lWJUgrTZ5i2sduxad/a4xjB
 cyPPL7GVpgFZaCd0R19r5K8OLbd3CV8DUsHSf3JhRpL2jhmurnrHyVI1HQ+IddcBUClfD6
 vnd+ATBJYekm+a9R9MOMFqiwyg7w/NgkMNk4zhfueOCB8e4iaISel4oqOMAfQarPWvfpKl
 UK0Xwr5j+8LeQmvpi+lYbzDvEuW6aGradJ2itXAyoVCrFw9Y7Y/FA4EZDChycA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 24 Apr 2026 18:52:49 +0200
Subject: [PATCH i-g-t v11 14/49] lib/igt_kms: Add const when make sense
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-unigraf-integration-v11-14-0c5f5346ae60@bootlin.com>
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

Const qualifier helps to avoid unwanted modification of a pointer.
To help avoiding those errors, modify the function signature to
use const.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 2 +-
 lib/igt_kms.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index cd435f29e6ea..c8b0074a18f6 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5158,7 +5158,7 @@ int igt_display_drop_events(igt_display_t *display)
  *
  * Returns: String representing a connector's name, e.g. "DP-1".
  */
-const char *igt_output_name(igt_output_t *output)
+const char *igt_output_name(const igt_output_t *output)
 {
 	return output->name;
 }
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 1f25bd8fe432..e0ff5f30ae58 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -594,7 +594,7 @@ igt_pipe_crc_t *igt_crtc_crc_new_nonblock(igt_crtc_t *crtc, const char *source);
 int igt_crtc_debugfs_dir(igt_crtc_t *crtc);
 
 igt_crtc_t *igt_output_get_driving_crtc(igt_output_t *output);
-const char *igt_output_name(igt_output_t *output);
+const char *igt_output_name(const igt_output_t *output);
 bool kmstest_mode_is_valid(const drmModeModeInfo *mode);
 drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
 drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output);

-- 
2.54.0

