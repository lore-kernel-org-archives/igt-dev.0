Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9716CCFA13
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:39:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26C910E3B9;
	Mon, 10 Nov 2025 13:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="gFxdYUQw";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAEA710E3B9
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C3B524E41609;
 Mon, 10 Nov 2025 13:39:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9A6F4606F5;
 Mon, 10 Nov 2025 13:39:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C5E5A10371906; Mon, 10 Nov 2025 14:39:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762781985; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Mti3D5V+WwPF80aIYmI6xzylPiNs0GWzUjb12QGyZMA=;
 b=gFxdYUQwF2Rutt/FaW+jcQ1L81wNn8bghyA+kpIK9VfFi8roL+aR4CMKfRjlUM22wZCD1K
 w1F+x5W7BR+KOXnZlfxbco9fag6Q96t1kZVSqATykmF5ICRIeVf2luu3p5XceFR8lF5058
 +Sz2CnjHFTYAJRoZgIiYRSK44HTfbYuMPdcDbzUnJ5OdH05U8JC27fhOYi2MOFqijDKxuY
 fOjllhaFL6tRfuceOcYSSnHCJGnvtPXGyvjH7luZryBOy0C5IUkbTuKO1FfERDUntwERnN
 UiQ+9mrDaBXe74QY7SlV5Jp2kLY1UegLcexIz4xUlsC0MoSAuyNlbZZoIjnQ5g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:14 +0000
Subject: [PATCH i-g-t v4 12/46] lib/igt_amd: Add const when make sense
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-12-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1522;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=lvPkun9taZyDVjksYieOWslkBJStSgRTlf6YNOuqjPU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesNPXms0Svb9nznThRLX5mg6Cjan/fU5vmBD
 UGE4XVbSwCJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrDQAKCRAgrS7GWxAs
 4iEbD/437kdgkywCxZsCSUymYKrp8HaYOJCNapLImtggySucWlTKbp5PKHRHPoC8W41suHtqFuM
 Ip/VRvpMY+c9WaQBHx02EAP6yqXsDjjLpRa5OKkAffMc8EpqY6U5GEEwCFTpu3iF4BOxA+NSkYB
 r0zaefw4DKmTfqj5qqDkWCkhFz7e8dn1yuNysUBFxkDaFUiB+qh/iKepQ6TcUyVdSy8TVScUlU4
 J6R/ofTZM2PSyWMxYlokCBnu5YUisRgl1oJeJqHIef5XkxKfUpAqf3dkkPUGyr9lhzztqlxKUTt
 mFAFbcSqZvP4qLqOTO6su5gKRyGnsB8XE0B4myoRTuChF4ubhyd0gThHr6ZDYy/HS6xyIjUIDM0
 +G2MTUNK/ALFMSsN125DZEBEFwUxSLIiu+vgiI+Y4ooWq5nciXxb9vCrMg/5dipx54M+sTpq6SH
 cZqyonNMKU7xBSdP9yWcCF/lrzNqA8xElJcx2VtUNXQ6a+wrmWidSRjac8V75krdcEw4wHGgg9Z
 cBkQR1rESuU4O1BgDyjFbp+dstNk53eqKQjlzKIgBEJCuMEb+wBdu/6+YL9OMk/BYVGxJuajoXg
 pspBK+0hlOC4E1KvTW2idLaswTILOkz+Ru+G2nCJfzTMOR2IRxbI//oOR15dq3nnTTQ2NecYIXe
 qe3JA6+NFtT7c2g==
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

Const qualifier helps to avoid unwanted modification of a pointer.
To help avoiding those errors, modify the function signature to
use const.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_amd.c | 2 +-
 lib/igt_amd.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 3ddb5f40374e..081bad411355 100644
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
index bce4657cbcfd..217ee6dcbd02 100644
--- a/lib/igt_amd.h
+++ b/lib/igt_amd.h
@@ -210,7 +210,7 @@ int igt_amd_trigger_hotplug(int drm_fd, char *connector_name);
 
 /* IGT link helper functions */
 void igt_amd_read_link_settings(
-	int drm_fd, char *connector_name, int *lane_count, int *link_rate, int *link_spread);
+	int drm_fd, const char *connector_name, int *lane_count, int *link_rate, int *link_spread);
 void igt_amd_write_link_settings(
 	int drm_fd, char *connector_name, enum dc_lane_count lane_count,
 	enum dc_link_rate link_rate, enum dc_link_training_type training_type);

-- 
2.51.0

