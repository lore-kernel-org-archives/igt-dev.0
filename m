Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C03EE7DEF5
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:32:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9417710E4E3;
	Mon,  2 Feb 2026 14:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KlmV8+oy";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4BB410E410
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9BB864E423CC;
 Mon,  2 Feb 2026 14:32:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 737B060767;
 Mon,  2 Feb 2026 14:32:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 33BC3119A8891; Mon,  2 Feb 2026 15:32:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042753; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=4z/44qq/RSSlytOCOV/XrgIxm5p6pvif6AIour1WYb0=;
 b=KlmV8+oyj7wsqsoDvT1os/SVY0eY4GlEsmVvqA/oVRSHVO8YsPunYA+nH4HsaCxJps0qML
 CMSKXNFRxKp16PvtU9s9Xm8qgQVRlHfLaqIjfhuyQsEgajHGVGy5Nhlikk+sDEGOilI10W
 iKuW6drfiN1Gmb/Wbv+AiOxS4Djgq5Xve1zmlWI/dKIPocXhKG7apoVHwF7GrSabM9IaWA
 ptExAOJTUsRDR9SznSwXczMJOoz+qcvwm+OfsRLl+0mczLRW4b2oJ8cXd5PdFvjF21vL2O
 OcGPDJDj3Lo0t9nqPIwLjpHxY9SPFveZb/zwtDODVgw8Rb9imtJjkmMAgyLoLg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:32:46 +0100
Subject: [PATCH i-g-t v6 07/48] lib/igt_kms: Expose dump_connector_attrs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-7-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1189;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=tm90l0/aPYk1jJ2VYkRuszqAok8WTa8hrJ0DSgq8Djc=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWPO8taijNmfWldJLUTIYTWfPKDpGPjLophq
 k/gtJhrsRaJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1jxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIV5g/+Ph9Ca+qGUphHtJf0PsZRlDOSt0yRVDq
 z6AWGYoP4e22T+xD6vp7+Vdw8avP2ZuF0WrXwaPr31a8rrasuHTMD3ecI/jNQxVyiNRkcheLtoh
 ZiOwJa183gbDE/WjcqI1QUXalQbEbx3fvs/qMtqBU6VUPBxq9lYi+V4egA6TYKYUv+weSHytHQz
 vh7QWfYKCGcw16TrkleGwkuncZQtungWTC+dVQ2TLh1v9+YNvujkyuVR/WBDDgToaAqkg+P90wr
 aM3Y8NOF7KvrVqbwjOIp86PCS6pevvWmA5fCU8dFcNzHOE0eGbuSnZc96/8wEnwqO1M7z3wA5U1
 Yjl/a/En2lPIjCIxK0wmljArIVbe7hVytQGEftCdh5nV8IuDIc/nunm5AtCnhGk64rDcTqBh3R0
 UzpQQmRY2d5Q4fVH7ez9abCyCjVUZa6qmszE3okH6QqgRRxJ02syCiRqZ/ciUF1rAx6bQgANZMc
 LJzrmM+tKZtweisbI675hxlVA2Ji4L8mLwGj2AlKFU0ZiKY6eFfwM6zE3fFXqxqABGKQ1xt+WdT
 eOigZBfOf/tUhH2rnzwPPLWrNkHwrGSAae2wwaUpNwkHaqp5AUbCZcDD03R7vXJDN15gX6XSNX6
 DIF50qQnVmHYYo5Gp8gjXIAgWx/7KrJkMoTxH+Fm/3X+IGmAZF/0=
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
---
 lib/igt_kms.c | 5 ++++-
 lib/igt_kms.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e24140fc117f..76bd6dac2fe6 100644
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
index f2eaad61fdf7..23652ec6649c 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -266,6 +266,7 @@ enum joined_pipes {
 
 uint64_t igt_kms_frame_time_from_vrefresh(uint32_t vrefresh);
 
+void dump_connector_attrs(void);
 bool kmstest_force_connector(int fd, drmModeConnector *connector,
 			     enum kmstest_force_connector_state state);
 bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector *connector, int joined_pipes);

-- 
2.52.0

