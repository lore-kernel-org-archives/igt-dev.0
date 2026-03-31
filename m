Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB7610F92E3
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:16:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B255C10ED49;
	Tue, 31 Mar 2026 17:16:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="yLE8CXiP";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9046410EC39
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 821541A30B3
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 40A026029D;
 Tue, 31 Mar 2026 17:11:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 468EC104504A4; 
 Tue, 31 Mar 2026 19:11:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977060; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=VYJ2qMGdu+p7w/fQ4lSjin8q4XWPCrM1/0kXm+uV9AE=;
 b=yLE8CXiPUnXFTtgQDQQYVcfLMJHvw+lUQJfzDIp2BIfIa5dRvzdilZ9uXfgJ/W/klthucN
 V6eSa7U7F8hJ3v3MX+yXoZK8H3+qY1mNGR9XihPexB1lQd54rrKp1WeqK7SEM9U47RolC+
 gvCTHGzFk2fL/s0k9qh2opRCEp167cQz4PpM34CkCZSjGOyJzxRS4MaWZmF4kI5zqnbtew
 xIofZg4rZQYYGbsTKVlAzfPT/An1SsZ2gXnBKFCSpSRkwMmy9yz1nrYTnI5JT5D9faRQ2S
 34smSkWvRR22w71B+ln1mKb4CQ13uIKPz1XC9imxUpBtwBpw+2dtHIER1z/35g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:30 +0200
Subject: [PATCH i-g-t v10 13/49] lib/igt_amd: Add const when make sense
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-13-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1634;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=q13I25UczY/okw86YiX0j8jUCFQErtLGO0RbZ44XlbI=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzAA9q21QBKOMPPwYlXbKQGZJtI+7Zfhre4LdW
 ltTNyPLfvqJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAPRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLMfRAAqNJO9P/5QhLlb+gRh3BNHnjUGlO7vz0
 ZZc5BaUQleMn/HJ3Hd/3GF2s6/p38fl3jHWbzP6q5Zo4NbVrOx7erggqZ25lJMgTQS0t5zXquB6
 rYc2KAorv/dkhfYmstBNzgw1lkhMkYz/b3txvtfA2GdS4bYOPw0y2GK2R+OxdciPbVCUwRuzjuD
 TCHrfdARc5BUXYVvulwtGXtg8YUVnwoZWKydPIX0Oj4R1gXJptkrYZVfmUG8Av/9RYGiylQwzpa
 LMgmSUctBguP/XGrHhH9HzsoKksCa808uvP1bKLMOt80NAHXggNJg+5QeLwjBurAKesa5Xq4fJ9
 dagA6tt4P9uU9gisup51emYMAqOGXKdwccynDtJmJe7NhDITgFTIhrSm8x7vOc5wNNA9xLL1JJI
 AV887cwYB80ZQhzHIbHi2g6xcwkO0meu97ELASKaMvFcOKI6E2mEfC/5AT57WpOQ0IX39mc1xmz
 AE6idY9koX4Nt3361VJdW0u7w+U1pyv3a7FkmgKUgrz3kQdwOaCdShu0MLa8vdctVhVMCXCpRTD
 ipOfpUsUk7ARAGbZmqCyy2NVGh4SLsinbnniwj2HsFQY97l8ctkPQgVtGypn/95S0A+4SGZnug7
 KHGwj1h2xI/tiJNcKVlfAHkd11hyRRq5T22jCL7hJV4RGYQGbfpo=
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
2.52.0

