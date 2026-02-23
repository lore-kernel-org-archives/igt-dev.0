Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9644EA4FB5
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:09:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A93310E38D;
	Mon, 23 Feb 2026 12:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="wrqm+do/";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ABF810E35F
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E6FC14E41031
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BE8945FD43;
 Mon, 23 Feb 2026 12:09:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7F86210368FB4; Mon, 23 Feb 2026 13:09:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848565; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Ut7zgJE/QeWFD4jXuLHpR/EX9K/taIAI/b+81poMTsw=;
 b=wrqm+do/A0W2Yl7yX+mrXbYM9jcA3AvkOr/5NQ+lWIlCTKXMfs2RZfLm/zSqwFe7CFpjty
 GoB3QQ6DpZ3hR+Mlxe/89L5od0ztHimTHxyj+PCui6Q9HRwG8ERpC+ez8zJJJbhdzZYmNv
 qjsxTOukDXKK2ioaS4jip6nxFsVVJ/B5aO+XPqIVCQC9e0wbvNgw25rFQha78/73w8qzdP
 JsxKtK8hOA2pHfjJ6pqo9aaotHpKRKFsthWI+J+VWzYmw+zFU6cT1gw5fGNy7P55bIIcSd
 ruhkDKCqgB+CjLwkQS3kJXKLaTEVx8d3JY4KdNKXPR11qiwogif0r5xhA3sGBA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:46 +0100
Subject: [PATCH i-g-t v7 39/48] lib/i915/dp: Properly check sscanf results
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-39-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1961;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=mlKgRgQnpCjaAe1Ok2WZixIqI7lbdNRvI4o8c9Q8MH4=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENrWBI5k9ke6jXK/Ux5Nk0Nqk73MI9RE8gl6
 dUa1qlUmZSJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDaxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLkAhAAxNFVr4wW8TQEup2lvgPW8seMyZjGPQk
 H7ezSYsst/L8Fr0QmWtAUSKtun/DHVqO2n0toEbx7Btam1Uonmlb0VoNB7VpxkKRTNBQgv0RMzY
 yLBoGwgIeDxVuXSE6/oIvcpPHu0lSkQCUv5foTKQT4bIV8K8SQdJc3W2e7q/w7xmMYpqrT75Cnv
 /Yct6JqI1iqFYgRWPckvvfYu9tOgJ1bVOC9XNZlx0rLaWuEgnfiR+VhD/5ts7en8VW8GITD4uDg
 Ygq7hk3CRqd7+i6A0izOghFmjskzwHf/2b9woyZH4jmOjKmS/RiMwlb43y+auPEnj5dU9BdKcCL
 2RxzZaUIiWIsH8vxgv8Lq4B3jbss3RSbexAnJywFEuvh7UO8wnk08KvYf/MwGaWVPMgpmiOEPQF
 wH3ad/9g+e6BwEX3qfUiFfGWtreEoCP3/+i97I077IEs/dBtSXwZBF1EZjto2H0EPEjMuljTuOo
 2JY/mNyxOi3lFw7oTowWpOUCOalp9ur4HMmrsdSkpDPCMFt6OmuwSDpG+J4yXJB/pu/naOk4+S3
 BdAuChy5p/mkDZ6NdnmNP6DeWB1mhue7OCNE/seu1qlpy4tz0GFJ0jufK+igOPu1hTVEbp+G9WM
 owroOoKcExcIiZIOjcDON4o3/V60sVIQH4xAYEVJ5NWVvS47XCZQ=
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

Current sscanf usage can fail silently, add assert to ensure that the
returned value is correct.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/i915/i915_dp.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/lib/i915/i915_dp.c b/lib/i915/i915_dp.c
index da3dd05c3293..c2cddb955d75 100644
--- a/lib/i915/i915_dp.c
+++ b/lib/i915/i915_dp.c
@@ -128,7 +128,9 @@ int i915_dp_get_max_link_rate(int drm_fd, igt_output_t *output)
 	igt_assert_f(res == 0, "Unable to read %s/i915_dp_max_link_rate\n",
 		     output->name);
 
-	sscanf(buf, "%d", &ret);
+	igt_assert_f(sscanf(buf, "%d", &ret) == 1,
+		     "Failed to parse max link rate from %s\n", buf);
+
 	return ret;
 }
 
@@ -150,7 +152,9 @@ int i915_dp_get_max_lane_count(int drm_fd, igt_output_t *output)
 	igt_assert_f(res == 0, "Unable to read %s/i915_dp_max_lane_count\n",
 		     output->name);
 
-	sscanf(buf, "%d", &ret);
+	igt_assert_f(sscanf(buf, "%d", &ret) == 1,
+		     "Failed to parse max lane count from %s\n", buf);
+
 	return ret;
 }
 
@@ -257,7 +261,10 @@ int i915_dp_get_pending_lt_failures(int drm_fd, igt_output_t *output)
 					      buf, sizeof(buf));
 	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_link_training_failure\n",
 		     output->name);
-	sscanf(buf, "%d", &ret);
+
+	igt_assert_f(sscanf(buf, "%d", &ret) == 1,
+		     "Failed to parse pending link training failures from %s\n", buf);
+
 	return ret;
 }
 
@@ -278,7 +285,10 @@ int i915_dp_get_pending_retrain(int drm_fd, igt_output_t *output)
 					      buf, sizeof(buf));
 	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_link_retrain\n",
 		     output->name);
-	sscanf(buf, "%d", &ret);
+
+	igt_assert_f(sscanf(buf, "%d", &ret) == 1,
+		     "Failed to parse pending link retrains from %s\n", buf);
+
 	return ret;
 }
 

-- 
2.52.0

