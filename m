Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F27F53D6F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:24:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B528210E2B5;
	Mon, 16 Mar 2026 16:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="oKiBxHvH";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D14310E292
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 26A33C55044;
 Mon, 16 Mar 2026 16:23:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 810B95FC4A;
 Mon, 16 Mar 2026 16:23:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 591A210372201; Mon, 16 Mar 2026 17:23:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678195; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=s9YuUZC0RhGSIRe7ts3vkhhpY0RCjiKmROMjp2LJagw=;
 b=oKiBxHvHvpiDdxVg/ExG2mJh74ALl3EYcXc6VNC4rF0+nvDN8MIwSdQmI7KDuN9hnEc/oZ
 H+a1C6pr+ODthD1yJas0I/yOIiH/zBF0yjaDvzTvrb5QlodC2WtDhEROdULLlE00DRxjRD
 vMCcPsW1z6ug3D42LnUbRy7rxcND8J6U6u5VBskxOXm4jpdof8FpbINEtRSVI+4sXTHogi
 0espoDQ87Re6rMDkUKxfn19YDw6KFd42GZHKNZmpx3zso7M/4C/WbM63WiuSTeyUWh9P1v
 RtKUUUdemmAd1tQTU+jxJWK+CTDC/Vp9w72//fVd8ZPme8cyYb/u5viEYZ6XZA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:17:29 +0100
Subject: [PATCH i-g-t v9 08/49] lib/igt_kms: Expose dump_connector_attrs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-8-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1245;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=bBK2oDjiF4Ok5s3/ROcnsGpKFHnHLaW00eah4+vnfPM=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6Kg6W0L/2h27KWeeESqR6j9x5p8pNqU6NDj
 Qmnt51gQkSJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabguihsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLXHw/9Fl+4LNtZVvl0R4zLSW5GtLlir7K7Ua8
 E3RJkEyLdqOr5WcQXtjg19rkT+AU3h0T/do7Ju89+HdI7KKUj4m4ryCK09+9mIE7UCsUXmyICqO
 og8i7WDU2N16FlHU1+IYLrtP4TE3827gUfhVl236sU9b8x8OpaCT6xD9KKmeLs+/SRiNu2o8X31
 jQG3VvXDEiTFxcxw+CowhZg0KY5ZaFNm8m/OOOQ+ya+DPZjpHDaByo+TwhFuHpSzNveNeND8wu9
 SHVH4rN8+85KwnAGBSFCOxfyp2WjZEmP3BK5lToWAgrOPqz0HmyCJCfYPNP/J5VXqy4m6Eyn3nf
 VDuDA09Lbwy0BmE77QbS8yzJ2nL8SW2Rl6Kuhm1EZcGuEG/kSik7dtKJicIBD/tViHZ+aiqmLJE
 bVqh6/44c1JAp6nFWjunxHt+3L93qeBWNLVBwU8Jmr89r80Q/V/5GCK4R5PboxPTlcgMZjq/SRu
 l8U4itO1ofpydxxTkcP0oEXwkvZO64BxVDOHnbjRr2sE5H5XznaoJ5FzVK7YS1Gy7V/hz0YoCcv
 y3w5YQMPcXDdYC14wKoDOipzmisffuf/bEzseWuJS/KnAErSDJfKAWHui2lTSZ2mTpLwy+gX3+r
 iJ9zdWC4bd2VeZnGIBRmQr+jKLqe8mAK67hHkaY4AUguBwfgRqHs=
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

dump_connector_attrs is used by i915 DP helpers, so expose it from igt_kms
to be able to reuse them.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
---
 lib/igt_kms.c | 5 ++++-
 lib/igt_kms.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 1b34f5eb7ee7..a0d12800404b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1766,7 +1766,10 @@ static bool connector_attr_set_debugfs(int drm_fd,
 	return true;
 }
 
-static void dump_connector_attrs(void)
+/**
+ * dump_connector_attrs: Display on debug log all the connector attributes
+ */
+void dump_connector_attrs(void)
 {
 	char name[80];
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index d346801e7915..d071ca1800f8 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -258,6 +258,7 @@ enum joined_pipes {
 
 uint64_t igt_kms_frame_time_from_vrefresh(uint32_t vrefresh);
 
+void dump_connector_attrs(void);
 bool kmstest_force_connector(int fd, drmModeConnector *connector,
 			     enum kmstest_force_connector_state state);
 bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector *connector, int joined_pipes);

-- 
2.52.0

