Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B17F53D70
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:23:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7046610E3AB;
	Mon, 16 Mar 2026 16:23:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="vY/nBDuJ";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B49910E2B5
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 04EE74E42609;
 Mon, 16 Mar 2026 16:23:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CA6465FC4A;
 Mon, 16 Mar 2026 16:23:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A298F10372212; Mon, 16 Mar 2026 17:23:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678200; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=E0jfLMRFfHQEWChydSeZRJsrsa0fo0QW+ATj3A2xYhQ=;
 b=vY/nBDuJqpKVRp0/GmsblD+ANloY+HdobDU0dTcNqVGfmZF5n21x6lzlB2+Fyzml0CfN1S
 NCsAQTKvQkeFvdN3DYR/m6ow3ex1w946+cBqghcID4bn4Uto0sv0WySC8+8SK31+J/3AGt
 H66gCESrG1WnOmUyrWXOso3659/UHln81i8vgImhE+wwt7vyWZTioGEOXshW/r4hoIHK2f
 CHk/GFlFkHCMgIt0aBt1ZGulo8QNwMffTlwCWkXXIK7+DzhQ1b+SgQJDYBwk7waiDGxEnh
 /9PAhlPBXeTILmgEwXyW3vaWifm9/X5HCT5RZw+acwu7Q2iLzXKxQt7s51S6rg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:17:34 +0100
Subject: [PATCH i-g-t v9 13/49] lib/igt_amd: Add const when make sense
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-13-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1634;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Qs3TO86JT4LfvE+hJvoqDPdSs4D6kkSYfEFxNnJ2dGk=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6KdxVW+LRrUY4fHKAp/U2rtwey2yz7jkACY
 mpL5nZn2lOJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabguihsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIHgw//dfNXUppwso4VqZwJN1fAZI+2kVN+NG4
 T6fFRrnmZseVWt2OBuk7X56UJXiHQaLavZQx/Gp+Rl1tKE1GIM5MqOjmyTg8iCRrUz7UykFVhIQ
 Yb3tu5hbVJiGw7U4QzdU83iL7P8Z3EUwuzuSRxDMygvBjfhnowT8Owd4hUEOB/DR7ZZsuGSpdsU
 dQISC/V43Bj+f8Yy6d8ZvYyFbA+YrRlqMFjgm8YijzPXgrvh97vL9CxeHHT72T5cEr6ycWZeVob
 KzPHXXUcCJ1TYioCAM5MLS3xIT323YH0STU74eMhh+R8PslIoPzJ+cZElQRAgK6U5EpGquwvjv/
 yxv6ZjfxIy190cdZO1F5xm6wwvcbU551IXsdHFOhQ0aeFmN1giR/0n1hM47zaX/TieUpOMXqgLF
 SZuwlCOVXtuL5p2Qw4mwkn9+CtqvB4UdnGUfmzAu+W+rmZvK6F0A3hnHx3+ydtIHyl20vJkbkSS
 fZA9QSueCC7hyTy8HPFrwMC/iJqEr5YvAsb5+E9lrDsNEwo4AGl6nGUH/J/NmAp/vZuAtBW1BuP
 mELRFk6QVg7Fx5VLjgVhFP6k7yctw/6LlSSHQMSQnP5w2CraE7riX3U4SiiN77i61KNlJc0auF2
 aBwghTUukcXKWKyC0/TUjBetFcYXtA7upOAVoCN14tGPD1E0VYqg=
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

