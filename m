Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AC9FED3F0
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 17:01:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C20A10F642;
	Fri, 24 Apr 2026 17:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="E+iPUJVP";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7501210E2E5
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:54:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 18149C5EF31;
 Fri, 24 Apr 2026 16:55:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 44A4D604EB;
 Fri, 24 Apr 2026 16:54:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4DC1110720A21; 
 Fri, 24 Apr 2026 18:54:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777049678; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=15erovFRC76BCm8NbXKyKzponZEPP84IiU0EAt4yVm4=;
 b=E+iPUJVP7D0357J1caFrfRWo4iqG5Lv76jy9nNFNonwwVlXJDLaDOlUZkKYK20hhI7TuG3
 O+/glw8cwqs3/jpktLzb7omH/6GZ1v0Dh76CcOwSg1AbuD33ZixEKfcXGZmivJADtnrEjR
 0vqbeMW6qn74mXxhI4gcjk+CVum7HXfqgPeFr0E9TEcUBheQ4enbW4GLQd4xQD9/OsXjQ7
 +Z8rrLQqCLFeGVUYmdK0McaWOjU95YF+z6ZJl0v/w8olsheu6T+OtqoMG+BaX1dJ2ZvRf8
 yHm8sNuwEQnaRMo5jGFAl9TduH+/SL5eWqIaIA8xu4JcjSwH0Y7K1WPbXN8eqA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 24 Apr 2026 18:52:48 +0200
Subject: [PATCH i-g-t v11 13/49] lib/igt_amd: Add const when make sense
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-unigraf-integration-v11-13-0c5f5346ae60@bootlin.com>
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
 lib/igt_amd.c | 2 +-
 lib/igt_amd.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index a97adad43998..004bd2fe83e4 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -831,7 +831,7 @@ int igt_amd_trigger_hotplug(int drm_fd, char *connector_name)
  * values of "Current", "Verified", "Reported", and "Preferred", respectively.
  */
 void igt_amd_read_link_settings(
-	int drm_fd, char *connector_name, int *lane_count, int *link_rate, int *link_spread)
+	int drm_fd, const char *connector_name, int *lane_count, int *link_rate, int *link_spread)
 {
 	int fd, ret;
 	char buf[101];
diff --git a/lib/igt_amd.h b/lib/igt_amd.h
index a45122b68239..90ec4582850a 100644
--- a/lib/igt_amd.h
+++ b/lib/igt_amd.h
@@ -211,7 +211,7 @@ int igt_amd_trigger_hotplug(int drm_fd, char *connector_name);
 
 /* IGT link helper functions */
 void igt_amd_read_link_settings(
-	int drm_fd, char *connector_name, int *lane_count, int *link_rate, int *link_spread);
+	int drm_fd, const char *connector_name, int *lane_count, int *link_rate, int *link_spread);
 void igt_amd_write_link_settings(
 	int drm_fd, char *connector_name, enum dc_lane_count lane_count,
 	enum dc_link_rate link_rate, enum dc_link_training_type training_type);

-- 
2.54.0

