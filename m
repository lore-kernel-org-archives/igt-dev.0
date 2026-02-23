Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FC4EA4FAE
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:09:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4B710E374;
	Mon, 23 Feb 2026 12:09:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="shJm1SAL";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710F810E372
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 649C81A0993
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:08:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3BB715FD43;
 Mon, 23 Feb 2026 12:08:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2FDB210368F90; Mon, 23 Feb 2026 13:08:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848538; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=1QiW7MgRMXpHtA86djJ0E1B63shTyf66U5vShvvwSCU=;
 b=shJm1SAL6icyvOT8RTWhKerlMcnGZ+hdG82uOmC+HJPIc5cjYgSHOQL2PXzOmmgjhs6AKB
 qQurm/mALO6xEfean49110TBgk/K0u5WpjFVzCnwHQqJ5/i+UZ0bia+/Iba5Mq+auNZ+or
 v5K9+B1j6PAwYXvPn7o9BZfM9b2xKk5TWwuvo0lUm6D+2LxsnI07cbzebrM0Yl43LvEfOw
 lNHvunAi+OcVrE7FMAL7FdmZY3GwwpAnDe8ykgfRz8JkYNeS4pRM6u5hXT/Ismbh23lYXw
 jenaBClcA2RPoo3iaGxrq4SCvEJ8+T18A/YCVidicngK8J+gqitbkdNyD53Saw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:22 +0100
Subject: [PATCH i-g-t v7 15/48] lib/monitor_edids: Add helper to get an
 EDID by its name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-15-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2485;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=FhZgqL+h2FrdX1v4H70Wr6eZwvAN9ozyYPrAdOFd580=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENoUxkev78emV2oDZnd0U6ZuK3xJlpv14ffH
 TYxDZFtUAyJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDaBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJLRw/9GxmovKLrQ0H5Fkb01D2KfArsD8K0VU+
 oXA+1aicOYsImOfdue0FCpm4nASLCtPIqSN0wLV/DylLvLr7TVUUa84Yr1zQdfPnK8DOA3cnCZ8
 W7HKaUpuqMXeJVrFKh59kncMs5ycbkOG90feAuDgrJVUxdMDT/K3jtyJRi92DlqI6LQ3HqnIKCk
 k8uHFeqHYssJHNmVecX9r8WnZ7NyCfBfmCpdvF+MHYUHFNNRxFgtjqpB2faRHXWNa6KoSIOMttg
 wQMfDIEsl5oGLkAOqv84xqet1kR+DYGAiEZpBsJuVK/Y/d+mYtLb72aJMB+w0bM7Z+A8sKjGEMj
 SkZoh3HUJ9E7YxOGTwLCPaTtrUPBcYZ1emBFq61g6dv1tGh+FiaVei14BtetJKYuqjDAQG+NwrR
 v1AABDPI6lAMXjOL7K8ON0nVTIFmJARY8tSXJcyuoNmjqLBD2Yv8aJduySZgFr293Dl6zXi1Bpk
 jukXS4qNeW6f0ne5V7yUfRlEQHIq7+F88d3cEDGhEkHhWEmUoY5ugNxjywmpr8O2pMkOCsCAYt7
 Uai9pNe0ufZtu3UTcu8EoYVM/AKelanGkECdqH/r8qFi71C7UtGW6BHtPsE6kM9Y1kDFumi/NQs
 lAzXv9WMLhWbwkqTANwMCZ4eRZjPj92Mgqb4KRjv7KWg+mgiUsnY=
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

For testing specific EDID, it is useful to be able to retrieve an EDID by
a verbose name.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/monitor_edids/monitor_edids_helper.c | 30 ++++++++++++++++++++++++++++++
 lib/monitor_edids/monitor_edids_helper.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/lib/monitor_edids/monitor_edids_helper.c b/lib/monitor_edids/monitor_edids_helper.c
index 6043e7a084b3..34446066346e 100644
--- a/lib/monitor_edids/monitor_edids_helper.c
+++ b/lib/monitor_edids/monitor_edids_helper.c
@@ -20,6 +20,16 @@
 #include "drmtest.h"
 #include "hdmi_edids.h"
 
+struct {
+	struct monitor_edid *edid_list;
+	int list_size;
+} ALL_EDIDS[] = {
+	{DP_EDIDS_NON_4K,	DP_EDIDS_NON_4K_COUNT},
+	{DP_EDIDS_4K,		DP_EDIDS_4K_COUNT},
+	{HDMI_EDIDS_NON_4K,	HDMI_EDIDS_NON_4K_COUNT},
+	{HDMI_EDIDS_4K,		HDMI_EDIDS_4K_COUNT},
+};
+
 static uint8_t convert_hex_char_to_byte(char c)
 {
 	if (c >= '0' && c <= '9')
@@ -170,3 +180,23 @@ struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count,
 		}
 	}
 }
+
+/**
+ * get_edid_by_name:
+ * @name: Name to search in available EDIDs
+ *
+ * Return the struct edid associated with a specific name. As with edid_from_monitor_edid, the
+ * caller must ensure to free the EDID after use. If no EDID with the exact name is found, returns
+ * NULL.
+ */
+struct edid *get_edid_by_name(const char *name)
+{
+	for (int i = 0; i < ARRAY_SIZE(ALL_EDIDS); i++) {
+		for (int j = 0; j < ALL_EDIDS[i].list_size; j++) {
+			if (strncmp(ALL_EDIDS[i].edid_list[j].name, name, EDID_NAME_MAX_LEN) == 0)
+				return edid_from_monitor_edid(&ALL_EDIDS[i].edid_list[j]);
+		}
+	}
+
+	return NULL;
+}
diff --git a/lib/monitor_edids/monitor_edids_helper.h b/lib/monitor_edids/monitor_edids_helper.h
index e5069868683d..6d9e3fc89592 100644
--- a/lib/monitor_edids/monitor_edids_helper.h
+++ b/lib/monitor_edids/monitor_edids_helper.h
@@ -34,5 +34,6 @@ void free_chamelium_edid_from_monitor_edid(struct chamelium_edid *edid);
 
 struct edid *edid_from_monitor_edid(const monitor_edid *monitor_edid);
 struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count, bool four_k);
+struct edid *get_edid_by_name(const char *name);
 
 #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_ */

-- 
2.52.0

