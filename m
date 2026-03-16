Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED35F46446
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:25:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304B710E252;
	Mon, 16 Mar 2026 10:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="e0N4eOAG";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C6E10E252
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id EA0CD1A2E28;
 Mon, 16 Mar 2026 10:24:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C296B5FC4A;
 Mon, 16 Mar 2026 10:24:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D0EA110369F5A; Mon, 16 Mar 2026 11:24:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656649; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=W2vinQ7mYvSFHswawiIZENJEyGzN/Ka82YWGNy3XMMg=;
 b=e0N4eOAGGVQ7SzhLRktR6IIUDNOrZF+maH8bdwlVyeklR95z4jHwisV/eJDmWHZi3iUTe3
 VUvh1llFWPZNO7uXLTCah3AaU8t61/WPf+AxXFwabcV+MqYKChdCRqvkDCZ+ae/foP3cTA
 ZInXmslQieAXLh2aizKBenlLRe8LfhDuGmC17vOtkZ1C4oUfZaeCWbckf/m0UZh4xJ6WCp
 R/zzBuXyW/spfn6W4OGg49TScfHPfaiOfTdmgWhHhLi2nh03Ih5OhJDkwi/YNLU/Wqcizt
 pfT0u7aU7AEZlpy7PYFk1x6s9FCvOxJ97BfIKo0rADeltedxte1Na2jMDx7j5A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:33 +0100
Subject: [PATCH i-g-t v8 25/49] lib/unigraf: Add reset function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-25-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=IQVeKgAKedViPewNWRa0NL9uC50OEs+o94h//QZVLGc=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pRIb4Bhp56RYaJ5MLLEWdirCOvUijbemYst
 Nc8q1exDauJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaURsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJY7BAAum0IVVJaFOvtRivPyuzPXWzemqsf8IE
 QLvzRv+Og7rJcU04cvJwAzMdP+z7BjDmmWXJnu9YroSA6pZzXyYMtc21Sppw1eMbamWS73J7CrY
 D4MQTSDZ73U0dGo/nwB4/BYaWAo9w+Cq5Jws69vknCTeiK94Hf34PsZs+y2Jp7wVi0kshgdGSBw
 TxxRgchmHGVWq8O1q3wbkOKW9VyOyHfaho+EDVXd4xr4GNRPhutRgTaXN62KpB0FV+Vp3S2Hkgl
 gM/AVdoBYhj04DHv9Dn7F2zIJANJ4UlE2jV1lqRX8XPcNB7d8IWKs3S99A5MAEY+qG41O61hH++
 hOFrbdvbjRwQwWin+ayvlShyT4tntc5iT58XqBjUu56Yw4P0uedSkGjoStkx3uPSCcd0y8X5eVj
 VOhy20mw1fvBBHLRYNP3+ll9ZYWZSUFLH9idPbk3gTkIBK6WmeQp8WRTO7CF2TlZ9TtbqlupicN
 127RN8rjf3a9harw+uQ6Rw5FW+z7TJBZW8amb8ySJat+g2yeakSBicY+WOZFrJKhoptKhV5VhdO
 x9+6RGL+Ur6Bq8uFd5lfcFBinVGxzlCbDeDxwGi436LWXVoY3OWvAM4/SKang9sqJZmHncFM4i5
 BchOsGssKf3EHyS1oyHy1J2kukckKf2Pkakf3HpnbUb7r1/FxBrw=
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

To have a consistent state at the beginning of tests, add a unigraf_reset
function that will restore a known state.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 12 ++++++++++++
 lib/unigraf/unigraf.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 43179d5fb600..9cfff8254009 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -264,6 +264,8 @@ bool unigraf_open_device(int drm_fd)
 	unigraf_assert(TSIX_VIN_Select(unigraf_device, chosen_input));
 	unigraf_assert(TSIX_VIN_Enable(unigraf_device, chosen_input));
 
+	unigraf_reset();
+
 	return true;
 }
 
@@ -277,3 +279,13 @@ void unigraf_require_device(int drm_fd)
 {
 	igt_require(unigraf_open_device(drm_fd));
 }
+
+/**
+ * unigraf_reset() - Reset the Unigraf device
+ *
+ * This function performs a hardware reset of the Unigraf device, restoring it to a
+ * default state. This includes resetting all configuration parameters, stream settings,
+ * and link parameters to default values.
+ */
+void unigraf_reset(void)
+{}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index c08ce62894c5..4c2cbd6b1aa5 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -40,4 +40,6 @@ bool unigraf_open_device(int drm_fd);
 
 void unigraf_require_device(int drm_fd);
 
+void unigraf_reset(void);
+
 #endif // UNIGRAF_H

-- 
2.52.0

