Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0612FE7DEF7
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:32:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9569F10E410;
	Mon,  2 Feb 2026 14:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="OjnsvngW";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA36610E4ED
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A4F254E423C3;
 Mon,  2 Feb 2026 14:32:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 760E360767;
 Mon,  2 Feb 2026 14:32:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7091B119A88FB; Mon,  2 Feb 2026 15:32:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042757; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=57TFzKl+2SRsvM6e/cAgvtl1k0owV9oeaLn7aVwaOHc=;
 b=OjnsvngWVZMpqONHyZ+6L62wGmWxImFrxRQOFxpolZPNvZ1NncW5ilVToFffW2z8dLeM5K
 EJ5foywJVm59pQbtxvgelP/F2dSwh/iIHBNz+XJ3QZcKHblDgnOJfrsVCjqcrN82rCwAoD
 CVBQEWX7wGajO2bPoDEqQKVg5GlA1wjp48/jIAPAL8wO3SYVNOumVr0/p3wxyY9QKYDhjL
 2PXhrr4a2Lz7K3KCJ1mLiah5qeX0PsaDz0PkF/Q5f4wsMWHnzlWqy4vls1ihpGPJmSAi94
 4EdgaZFHF1bRTdXxQUa9Y03qa0reFB8SEK3lU1q7dzQJfhCQXGHs+rj1gT97Fg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:32:51 +0100
Subject: [PATCH i-g-t v6 12/48] lib/igt_amd: Add const when make sense
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-12-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1578;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=imoyiYaQ4r0RGLIZsyMkXVhd6gC0/SPlQOCgPWS9cws=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWQOPG6+OKHIhPTS5DUHBLs6uDW8zO8ad1o0
 /spmVCHsxaJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1kBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKWhg/+KKaQwoqd2rXhnDSGkdUJyDlujCNLl3x
 KjYCS3eF0H+tnvSPrsa326eN/yMbQV/aVKBn4E5LDgflTY/NfggpZhQd8aiRztVmuAwug4Ln8VE
 pXBOFDX/ZTRqKb4JW4FpUVP4M0q4DMsu6Pdzm9XryIFs9jWdR67DOQLnPk6gDwe4XVLb5UjgGwA
 QHnKUigD9orkmZalsyKDjurOZZNKCfRrvF54E5mHeADATtIq1a2fOaNT5V9YBZ7+8QRmKa9FWnR
 vm297V52ti/yBKifgaegbY8kdDDp+Xm13gMvOveiaA7VMW1jCsCh6BxDWgATLMvcWDezK+e/vbF
 anF2YIDAsVVowZcXEL0lyrd6tyzQuyPyK7GWDnBjqZ9s+7mW9hul+40TEiQdDXqcERE3SWpoXk0
 PqosZmOafQUs8GbJXWMMgLqkdm+s3AqSJRuhb7uiD2SXMwMFrNzDMyhPfmNmSC1fGj3z2kQZsEz
 jkz9IebqrwQH6WYD9Lc1Ed+EBnnTJaFGZcmCbjyin5p5cyRG+PZ4fSeSoHqJGstD8UC79dYLBVg
 Gwm9Sd67kUBrHsSibN3Uri4xmVJs3dwuAb2drB1r2ejBiLrfikGtsOkfiOyo1NfFQ8ZimF+ECcr
 m8vfz7pxwV3R7tLLVCmeKfAO8agBv27RK+pb7lhMyAiN9NXcxWj8=
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
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
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
2.52.0

