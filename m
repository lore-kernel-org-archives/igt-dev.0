Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A454DC3DA52
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CA110E5D0;
	Tue,  9 Jul 2024 15:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="B6AWGcWP";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7F710E5BE
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:35:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D594320017;
 Tue,  9 Jul 2024 15:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zFkAyvRDD/04QwZxSTV88DKZSAOoEkF9NaaQ3O3BVbY=;
 b=B6AWGcWPwcMvE9QdWPEivTcayvipUrolUx1PLmYTqqWygxd+nOrKiH8CZ5xzkAhQr6kM7z
 9G376wAbcD8eLOCwsUygUScCW+EHWC1Yh9bx9d98U4NBkpiHcO9+7umQqqZEbY2kNBc2+U
 ZcQ9tR4bAuzkmib7Px1RTNUgvs6Wz+vFScrD59USWdlzdiuTfVgFEuqlulILo9A7t7E/e4
 Fx1cypEVOjqiU9iT1re21yiMIl6NWhss+LU6YB6nBOqihQtNpeRhBvfWbnxcAbdWD7anIW
 Sn7XULIyubKFBbajx+onlm2O+s2FFS1U62DA8lgCg3BhrYgrEx04zSSG2zFQBw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:52 +0200
Subject: [PATCH i-g-t v2 36/39] lib/chamelium/v3: Implement hot plug toggle
 scheduling method
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-36-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2155;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=IgFADBXNQ+OvqUy86iNEd+M6inm7HHsVfS7IaK0OxRU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViaRoFYlE74ActsVJNF2gg9k+QGvES4aPvDu
 IwWC3pMMqKJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YmgAKCRAgrS7GWxAs
 4jkhEACX6OErZ0IsZDIO1IzFvflJiTmkdu9rCaJvW6hFp8iG6oxMrSuveP4lYcnrMI7pUd+ClQi
 AOMOHcG6JYUQVnntFGzz5NJXnRbBlOPf2q2rmUUuqYzX6Sd8d9QLsyYozoEOTjXN7ZJisdaA8gf
 pZ83t8eFCetm7qkealr00ehL6qjJEvqox03gC8JCV46TZFTh7AyDSivVFZQGu3U/4l4HdV6Ho9G
 8y/6x/L2ZsBPhgvu66DUiKcO9CcB7+K1MzGrifFgtjUshFyDV7tMlW3js6PGd0ot0nLeUStqjlG
 iVYU+T0CcrKyrvtvWFdMBgM7XjRJ81aKkzQ35psNQlVnsjKvYeUO7FkNN3oc2sG4WRdO3Ihk1HA
 z5jAeRAPbyTPi9jpefmH3NgInDPvmiZfoqrnPgBjnqtMQk3exWBxsZt6Y0Ts3nyRLMDa/r3sWNk
 gR/AJuIpohp88FF2mv5M3J3mcAu5msYrZlcA++Rq0dPtWKeIwZ+McddtXBFuZ2KMOaheE0CGwAG
 UoeKFu6tXX2pW3OeIOC7xZrcsQ8Az/nRsuv/A8GZ8+0kvkUhwc5TGqgsDg3Iug3dIb/WCUpDXnm
 ImdoeEXDl8Mw+H1JLWOobpHs8cwdM1JgwNCODWSf3oryG3zlmBEFSzuLuh8yyFCytEiw9ZF7B+e
 ILeAygU/0NnvHXg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

This commit adds a new method to the Chameleon V3 wrapper to schedule hot
plug detect (HPD) toggle events. This feature is useful for testing
suspend and resume behaviors, as it allows the simulation of device
connection and disconnection events at specified times.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/chamelium/v3/igt_chamelium.c | 16 ++++++++++++++++
 lib/chamelium/v3/igt_chamelium.h |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/lib/chamelium/v3/igt_chamelium.c b/lib/chamelium/v3/igt_chamelium.c
index 436a3cba139e..fa70e2c1e296 100644
--- a/lib/chamelium/v3/igt_chamelium.c
+++ b/lib/chamelium/v3/igt_chamelium.c
@@ -1173,3 +1173,19 @@ bool chamelium_v3_port_wait_video_input_stable(struct igt_chamelium_v3 *chameliu
 
 	return is_on;
 }
+
+/**
+ * chamelium_v3_schedule_hpd_toggle - Schedule an hotplug detect toggle
+ *
+ * @chamelium: Chamelium to use
+ * @port_id: Port to schedule the hpd toggle
+ * @delay_ms: Delay before triggering the toggle
+ * @end_level: HPD status after the toggle, where true is connected
+ */
+void chamelium_v3_schedule_hpd_toggle(struct igt_chamelium_v3 *chamelium,
+				      chamelium_v3_port_id port_id, int delay_ms, bool end_level)
+{
+	igt_debug("RPC ScheduleHpdToggle(%d, %d, %d)\n", port_id, delay_ms, end_level);
+	xmlrpc_DECREF(__chamelium_rpc(chamelium, "ScheduleHpdToggle", "(iib)", port_id,
+				      delay_ms, end_level));
+}
diff --git a/lib/chamelium/v3/igt_chamelium.h b/lib/chamelium/v3/igt_chamelium.h
index bc0645f882c0..fb600e1d771f 100644
--- a/lib/chamelium/v3/igt_chamelium.h
+++ b/lib/chamelium/v3/igt_chamelium.h
@@ -84,4 +84,6 @@ void chamelium_v3_port_get_resolution(struct igt_chamelium_v3 *chamelium,
 				      chamelium_v3_port_id port_id, int *x, int *y);
 bool chamelium_v3_port_wait_video_input_stable(struct igt_chamelium_v3 *chamelium,
 					       chamelium_v3_port_id port_id, int timeout_secs);
+void chamelium_v3_schedule_hpd_toggle(struct igt_chamelium_v3 *chamelium,
+				      chamelium_v3_port_id port_id, int delay_ms, bool end_level);
 #endif //V3_IGT_CHAMELIUM_H

-- 
2.44.2

