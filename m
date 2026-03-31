Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BBAFF60F4
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:14:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33FB10ECE0;
	Tue, 31 Mar 2026 17:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="a+ejDXUd";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A7610EC39
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:10:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 868D01A30C7
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:10:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 562726029D;
 Tue, 31 Mar 2026 17:10:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 69085104503EC; 
 Tue, 31 Mar 2026 19:10:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977056; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=F9PTfadpQPQ4EDoYsMwkb+BLnJBzIC0BWEelyM962l0=;
 b=a+ejDXUdi8mBhIi2+hK7/bVAIVmIucH6Ki6tlrbpYsU3vlM4a0LVwRpSaNI6/Snw6pJlBN
 DKl8n0BUMUUQOEWRo+x6AbFiMeIfP0Mgr2gSJRKe0IKcuUeyaRgy0F2HIwZKJ8hdG2E9kn
 ldUP73ebKyPffZWuH/X9a/xFUW39qFTOrAXOToTYqWjYIhVRK/YPT67iDqgzP9agmkdccq
 KrYLhYkurZn7hO3LA8m68dse+vKs9ezG9IPuqgLu9mwFhas52thb9pTbTy44HA52UUsaZT
 nEDm4o9l/xalj0SaekT2QzNMbrrXAc7OwGIneY/O45fYgZM7PG+hHBJwIH7jHg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:25 +0200
Subject: [PATCH i-g-t v10 08/49] lib/igt_kms: Expose dump_connector_attrs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-8-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1245;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=mwJsj0fERGfyYCydcIeLWmGWNUOYH0UDey280Bt9YBQ=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzAA83Q5MEFaGawEa72c89OjMCQIwpQY1Y42KY
 gHYgKNCl9iJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAPBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIOnRAApcyHCiKrcax+e2nHF0JRpncLVnBjpdL
 0ZwTHR7sTeAe5lOTuLB4AGgI0ah/qceNPl8kizCq36aMjd+6FVa4sy28wLb+4NZc+Nyo9pl4/jf
 mhc0fRab/kNZsNiJg8vkAmP6HtD1kCagS6evt48TiL2shBN0aHyxv8/iJ+abgEzgTEwWga3j9bv
 EK+PWhBFTQGY/0g3YNIlE/32sdCS/0uiRhHwFUBAm9aN+IHqnbfQKFjv4ljgihz2REe1sOy1c8o
 Fbfe+4aUH/Af9akD5L/jFzXLfXTG7fTOozvrOWNUYNZSzb6JbilIYE1bZb2RxRMrGs2pYEMonNO
 1LCCGJ1a2m+7zzWv+X8VbexJMb8UV9llSN2QAYoX75rrM2oghr8a5OCX6TESAuqiozikJiCNvc3
 xbB7Sqtp9inDeyydGbrqNxJxhpg9RqtQzN4vJZUghgy7Go1TbZBWdihzso0vmVsH3BVyU6qQL+I
 ts8ypOh/BiYdVGyFiPKEe08OknFIG3kZZkZENtgzt9slz5o05RMWVmdl94L9aZzyJh0bCj7NMHB
 Wxkbx7lxMj7ibv4UZmv7WEkZWs+B9b6/YsyT0M0J/vZPRaKGqzFQUbQbXqd4c3FrkLdCpqq7mQI
 6iFAgu6dQ7NXb42mM/hM36JIhEFEPuAmGZmlrdG9+zD2ETBgLpIU=
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
index d134fd4bb80e..e9e6e8fedb83 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1769,7 +1769,10 @@ static bool connector_attr_set_debugfs(int drm_fd,
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
index 462e139c46af..72303bc9e865 100644
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

