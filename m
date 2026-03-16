Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9003F46449
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:24:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64AD410E258;
	Mon, 16 Mar 2026 10:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="qOFTqg4m";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903A110E252
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:23:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 84A991A2E28;
 Mon, 16 Mar 2026 10:23:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5CCD45FC9A;
 Mon, 16 Mar 2026 10:23:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2681F10369F08; Mon, 16 Mar 2026 11:23:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656632; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=s9YuUZC0RhGSIRe7ts3vkhhpY0RCjiKmROMjp2LJagw=;
 b=qOFTqg4m5eknLM9dy2KD9514ZY5uXC6R1UJAziDr/QavoXpu64pUTOf1mrE1DjsopBPHtt
 JUfV/B68hHyQSQ44iZKLrtLDgVoXri7dM2YPHwHrOU4o8w43IYGUEWoT31TqdvxR8j6s+e
 Q+wzpdt7ntF+CqfFNS9+gpmUzon2DmNxHZX2kJKuT4hXM30Vw017vZo5UBTHv1fFj6eoVN
 +n/svH/K58rCmk03DKvoSdA14WGqHVjHnSNCPiOlGI1jT3z55mkDKFWImyK3lDJNfvc8aK
 qLF+NuFksf7BvJlid2+KuY8tCbfBSiQUQZZR3Uq9XzmAAP39ia2bc4bdIYGptA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:16 +0100
Subject: [PATCH i-g-t v8 08/49] lib/igt_kms: Expose dump_connector_attrs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-8-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1245;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=bBK2oDjiF4Ok5s3/ROcnsGpKFHnHLaW00eah4+vnfPM=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pPVhMIHOqeOmk+2VanZcB7wKwJ9Y3xFP/g3
 TRHabyPNfOJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaTxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOICiA/9HU79wCe/BFcXBMMJ1VZjG/jM7bmsJqA
 UXacZYP4KsYkqheZSTb4IQK6rdl6JeVTo68nxuTn4uHTV4lEF3grsCXe9ojIG6sCMirAfVuzyR3
 vQqdWkGC6L3NaU5O69AF0sZK6rnO+SlLPQhthVjZM6eY1DG1jog34TPUgBN1g816/cWZqG80eIS
 SVHBnBgSUB3wyrFbg/lLh6X0BnWb1VitIgZAyihsOTqwCZSB7eicBiY6sdcea8SCsF0Blqm1UhS
 MY4baG449Q6JwKaTW0XuIvHzrhLObqPcaKLeo0OdZ666anbc91stCOPR8ftUvjls0nW7B5yzBFx
 6VYI+j8qoUsCJ/dlt1/636KxAhpWpNlF0U7+swfAB4f4EX9gRqkbrxEqk6WtX90ES+yrqpdU4K1
 CgOz9BBZix0J8HdHzMzTN5fOcfmgkE3TsiNjG2phX8DsHxX580g/IX+lv0IjxAIXbyx20+sXLBi
 oCK5pIZww5oTGvgyH92nmwl7XlMFyiBAOZ6ECGMBh/7wCinhE65LqQddn95mnIUBuKH8XgTxceq
 K9x0B9LefTp6u5tJNi2fokoKO1eYfQXmkDG+QAhbZI4+WEdqQgFIdyRycjjkVrzilYSqBRYb5EK
 iOwLydDLj9u0C+waNBKzO+wexrtspsEVpbWpLhrO+xxKJR3VaAEI=
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

