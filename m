Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199C510F92E0
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:15:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40BB10ED44;
	Tue, 31 Mar 2026 17:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="NFshwku6";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5027410EC39
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:10:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 439961A30C6
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:10:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1A8D06029D;
 Tue, 31 Mar 2026 17:10:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2838A10450418; 
 Tue, 31 Mar 2026 19:10:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977057; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=yHGYl4n8fs5nNWhLywHS4m7LY8PRzl1Nf8bjzpyqFJQ=;
 b=NFshwku6YUPSRP2Oviv6VdlIMp8Ko+reaBOh0xLNeXPisy+KIrFRwQOluW9+trAhCnMDPV
 1VHwcmlk1dl1yDbVA0uRYqSTH0hsVeAbYiTPGUGuYnuMc4zKH4DF4ThCBQW1RQycNqggR+
 0b04fLTwhomHHFZCz2Vh0AJ7v0aXWnGr1Q9JYN8woijUhQcwWgikfoBXQ8zQU4ORVlvnX6
 gJ6yYMLwoYecs/PHK/gI1LdNcVKXCS+mLavQj2pgiB1K5fsQq3pBsB0HckB18OnOAgKbXd
 RxrXKC3HkJyIelxiU69zSKvSb9/VrnbmmiGrycFQ2ar9dFXS1r8AfqrOpGDQ2g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:26 +0200
Subject: [PATCH i-g-t v10 09/49] lib/igt_kms: Expose reset_connectors_at_exit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-9-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1256;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=nWAMbwK2H8g7GP3jLNkAZI12+ZffMMWcf7BljBLflok=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzAA8dFtI6yuLcgc5z6ARF3FoF3tFelVkLqOgb
 7iNzS2tSK+JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAPBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIsDxAAs/3rEb6eI5Hvenr0iqh+yq6XFblrcMt
 YcCLutbzkAPFfRW5E4G415dT+4fbRZD1+k8lapoIVG2bbE6HCGAG3D/dOH53yCqGW5nogfED9ix
 Xjc5FsVNAr+Pr8S40nONeXxkUHwwPN80TOzSV19p/IxZLs+6KOjNdcR0CX/w3ubgw2R+eQ8J8oB
 LZ4OPJT1GxDOFGxIp/EOJx0LNc9Y4X7jr8ohBEujT/4bj3yrKX76rpTnbYizXqp6V0dWM8+9w1N
 M3jXYyHwg9mgPNwUHCfhCu5Qim11E7ui0N/pAjjqHVmlj4DfDcqv1IP9uw1tw0yItAlYwt1sCka
 D/trLYl0Ket6lqnWF8fujVq0Gga7kDDs/+GjGyWZj6mGyGXLJvKBBbbcuU4CYxKatEpR5jpAkoh
 HZiYpuYpEcFLQ+M2K8lUr7rZqxc1bChgmMEsqhxobpy9RfvhBEn25yiBlbGI2DGYba07yvZMxSH
 ZHUgMNosNiV8DAmuFdqJEIGydkkpgxouKnzHXYtU6n6biO0KrsHDmHqCxlZR4Hmv8DZKbRC6qxm
 3oVAqPH9yv4iYE139DpWehscdWSdkTvhURci6nzhkCW1BqrcgATaw3MNJ5gX9kSdDHs1m4FnkQ7
 2Nm2kcH8OttTzKx9mqz0dsQA1IhCgDuUQ5lbMsWFjgbR9+5ciOZ8=
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

reset_connectors_at_exit is used by i915 DP helpers, expose it so it can
be reused in a different file.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
---
 lib/igt_kms.c | 7 ++++++-
 lib/igt_kms.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e9e6e8fedb83..0ac4eae008c8 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1580,7 +1580,12 @@ void kmstest_set_vt_text_mode(void)
 	igt_assert(set_vt_mode(KD_TEXT) >= 0);
 }
 
-static void reset_connectors_at_exit(int sig)
+/**
+ * reset_connectors_at_exit:
+ *
+ * Exit handler used to remove any forced state from the connectors.
+ */
+void reset_connectors_at_exit(int sig)
 {
 	igt_reset_connectors();
 }
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 72303bc9e865..f2c9fdd996ce 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -152,6 +152,7 @@ int kmstest_get_crtc_index_from_id(int fd, int crtc_id);
 void kmstest_set_vt_graphics_mode(void);
 void kmstest_restore_vt_mode(void);
 void kmstest_set_vt_text_mode(void);
+void reset_connectors_at_exit(int sig);
 
 enum igt_atomic_crtc_properties {
        IGT_CRTC_CTM = 0,

-- 
2.52.0

