Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4ECA10F92E3
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:15:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88DF510ECF8;
	Tue, 31 Mar 2026 17:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="nN4NAPUL";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BA110EC39
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id BDDB3C59957
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2656D6029D;
 Tue, 31 Mar 2026 17:11:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3FAEE104504A9; 
 Tue, 31 Mar 2026 19:11:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977063; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=4cYPnVniSqdMydoIExrLLXOWFts8uqC9+HZKuZcerms=;
 b=nN4NAPUL+6W4GxubwtAwFLX7pW4PwtdGtMh3Fi2hufz8pdgs4F2q0xCfq29KXVa/Ti7nvj
 N5xqUDzoofB21Q8g9kvLESpGkwz+J4eip/RvAg7124lqH4EUFViMAKVAcKWjkHhR/4hn1k
 pGhNd44tD8cEtfUILgugloyWOwCUFV5lzQ39aqXmFdOu2BDX+ap81orSR8Z0jOQoGsU5RV
 oKbQmuere4cBHk3c079ffySILMDvmpqgG+cRNHGhVGvraqgbSfm420x2jQXLhNPNPbtdKu
 Q7SKRUcwwxdJBxmTDSB+/w37v6uJso0vFGIpvXsPdS/f036JrUtALn8WYcQa9A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:33 +0200
Subject: [PATCH i-g-t v10 16/49] lib/monitor_edids: Add helper to get an
 EDID by its name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-16-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2492;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=FhxwpMf8xhEmuKmHmmmcbTmDLH+jv/88caE7kToynGo=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzAA9Mk4Iqilw1WkiA8VHI5YwOQkONbG5cRzKu
 06lKDDsYsiJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAPRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKDRw/+MZy9DZGhkypWi/oldlJbNbSYiXmlwR5
 N8Sd48a9B9RyeoraE6EcWM+ZXD8w3feFx3sXVmWoRcyQAG0a1ON5gJ13rvTN6isRhhJTGaULsvy
 +dXahcGuL7GtNyjTmLq4cxnWFHd9C5XZ5Z6xuiSgOmsxwjS9BdZThAjKOB31MUITLvnD1G6HInl
 y0dDITK5Qb4pZkhde/tbBCnaosQhXOLkzTqLI+Wj6COTnmJQO4ECySwFmpc3VV6OOI4zZ5lQzkF
 HsvW9vCg07I4957D0zZB1fcoYODZJxXf1mNSdyQBdULbOGz9C2hI0YfOo5U0Jm1xCds+EQnMGKY
 VK4GDC303nGCiqyH/9IzVNrAPDG0fkiy///LlTQ13WkPoRst3+o7kebDJCUbPXN3xAf8Q6ylliw
 Dm+fWbOsN+NaEKkE64Y+hb4pXRTPB+FbJ+lwhxiJZhwm0wvvd7mO43KlP5Jv5XsrRAbAzAoCqar
 c/DUsQMAMxSvt2JKJIO6acrf+3DqIitComIM43y9MLtpS8AuVWZmyUZlkkgLWjXlcmVueY0FKrL
 Ai7UCwobEzhahMXdIWSGOiUcZvwuAXUeDlR1kW/J4ebcsc/1dpMWwfzEy1h5dkz+pzUVHS1p5HL
 +KYfc8DzSPSXG+axvp8xqhdcBDpGBUXW1eSUSFH3g4YnlizbQuVY=
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
index 9cb9c7e1a665..e2ad7dbd4185 100644
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
@@ -170,3 +180,23 @@ const struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *c
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
index f5f6f6824411..e76fed2cb4b9 100644
--- a/lib/monitor_edids/monitor_edids_helper.h
+++ b/lib/monitor_edids/monitor_edids_helper.h
@@ -34,5 +34,6 @@ void free_chamelium_edid_from_monitor_edid(struct chamelium_edid *edid);
 
 struct edid *edid_from_monitor_edid(const monitor_edid *monitor_edid);
 const struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count, bool four_k);
+struct edid *get_edid_by_name(const char *name);
 
 #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_ */

-- 
2.52.0

