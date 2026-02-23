Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A98AEA4FB2
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:09:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0712610E35F;
	Mon, 23 Feb 2026 12:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="qe8Fhfoy";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9642210E35F
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:08:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8970C1A1170;
 Mon, 23 Feb 2026 12:08:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 60F485FD43;
 Mon, 23 Feb 2026 12:08:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2E85310368F8E; Mon, 23 Feb 2026 13:08:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848535; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=E0jfLMRFfHQEWChydSeZRJsrsa0fo0QW+ATj3A2xYhQ=;
 b=qe8FhfoySnGt1YNYOFLtRr/+7bCCUV2Z6mC6+EiWBzCTFNzdsdwZqWq43107tY9Lrc+m85
 bzSep/aBC/2aHNlzoxkyMXDO7afJ9iR/rUkfIUrNwdxF+4O1l4Jy7m6hYwDLbtJhZQ+bi9
 A+ABxf5luHBZHlrwFv/Ok9nA/syjFJJeKkbYzn8iDeJjH/JRbkcuOUV5Z9+g74U2PsQ5pp
 0bHBgeIm4Zm0haPw9NkmWn8LXb4a2rUzf+QqE97u/SOzTdqSTBuczXcRZQehcYPCw7Th39
 vurU+GAtPRIuQ88jvE97vfX3wUJAjbH5Ac6Z3irr42vs6FGRk3SrTwNM9y1fkg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:19 +0100
Subject: [PATCH i-g-t v7 12/48] lib/igt_amd: Add const when make sense
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-12-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1634;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Qs3TO86JT4LfvE+hJvoqDPdSs4D6kkSYfEFxNnJ2dGk=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENoSKeUlYBWOttgP4glS4z47JxbKxqJvmlrS
 Y6UBBK0sKmJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDaBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJguhAAqn8ChEBty8xcQrtHy1tK5fgIqxQkfGq
 8U9zn55wixOekLOCgsV271uoLhDIj7dnkPvYg0UjfmjlmT1pPKrKrVi/cQkf4ygrtWkMUdZAX6y
 S0eMrR+cSzlnTZoADkHqsI/av0+m1w1A1672Y7lo4JFAsBGQ2Ver3cqITv1rKcd4TgrvzOu0OKH
 gPIco/MdVpeXg4RdXwoKm8GFIPAjjoRgPkIboNtDA4Im4W0PU/BZtuD3wBH8GBaD+ZVunTUEM+S
 C8UKtld3p1fuCLFJ5rFZsFjn+1Rk7N2dQcObdp7K1O6w1aaZmpVe3uedQcXqGtSZC2+Z0ee1xtl
 Og6JDqeoUR1eW4NFBic5werfnLF0ftcW10F58QRbVg1gE9m3xEAujuHNm23swjVlPIy2fzoaksl
 zgVfSuWE+PCPiwU8VsxqPDKgGAyAz+LNPGcJfuK4aUIzQsG+kTyVDl1la13e6XVtCjwX8gxYiuH
 bGJeXEcKXpX3od3kez87LsaGzrsvMFgwNuQ1d1pSabtdaUiG+sFmsQIqEAHS1fuSXfe0o7i5hB9
 NW+eg/WySTpqhL46VuT8mDfW9HQLZsLY+dE/rgA1odN3omJXeNYgDXW3KjmyZSLfwZBMQcShLHN
 GMxXb9ira8SwSPvmUawPomDzwmlGUZXOgoGD1fod+XNBnWM5wTQM=
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

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
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
2.52.0

