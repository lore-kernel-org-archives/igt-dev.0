Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10095E69174
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 15:51:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C345710EBEA;
	Fri, 22 Nov 2024 15:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="cguv1+fv";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91BFF10EBE0
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 15:51:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 738042000A;
 Fri, 22 Nov 2024 15:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732290702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Opz6a1uZOI8vIaQwAbc6SV04h4TvVV8+C+MTEeOWNck=;
 b=cguv1+fvIg4pPMYeM22AclEIQPDynbWk5Ns3ccJbFbB4xyvaS+gSY5WTe8IPO1GkVLVMpT
 MSoKE4/xKaFS/hcvukxT0wilp9lLoM11mBX4qluabv+1zpSclap77ffepqNITn1tVUxQRL
 RLTs1iS/yNe3cB67xZAuib8MS0qVMPJnqrpQkbM701PJxCr8YtuNEO/XcxIZgqLglVcy0t
 Z9HAc3KzDeYH35bOUiyT5N5pYTaoIwriphBvrfARX9hOSQaPH2MUbCf4MZzBprevrQXu+j
 kjcZb+k0sG+4Ibkff1kTwT50MKBOAxxcgb2TrCX3JhtRDe+QTAbfcXHqk0S8WA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 16:51:35 +0100
Subject: [PATCH i-g-t v3 2/5] lib/monitor_edids: Add helper to get an EDID
 by its name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-b4-cv3-02-monitor-edids-v3-2-1798f58167ef@bootlin.com>
References: <20241122-b4-cv3-02-monitor-edids-v3-0-1798f58167ef@bootlin.com>
In-Reply-To: <20241122-b4-cv3-02-monitor-edids-v3-0-1798f58167ef@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, nicolejadeyee@google.com, 
 seanpaul@google.com, jeremie.dautheribes@bootlin.com, markyacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2355;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=uUTMU650asprNMwDcNo4F86BamLnnBkyRDRUhHSV8fk=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQKiJ+Trr5xnpczQy1oLwCcxS7RX/MDDaWtpET
 5F/tVBmpSyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0CoiQAKCRAgrS7GWxAs
 4j9+EACql+08t9DZOXlSsasdeayADfkKkaUMfk48NQKwD6aeJYIB/3e5zi/65ARadLhYPgf8H7n
 GiVsDsMsHv0i7htZphdAufU3y1gpGNUvP1H4o9VUCBNDh3Co9PBrlqnWmL3GH2ccqH0z06wfd8m
 OFcxZ/x6rjO3YAO4jj/SXGRaiKEQ1iQjSVMxLVYasUn7XsrZk0WW8X12fGyI4UZnznjBrOotEGE
 byMkN0OHFuZfoeWPCS7RqD8wQGq29o+rjbpoQ0sYvnEuaXkumCZJjyt24hSFmMOsgzams6M9bUY
 brhI95jQWPOKVhI3H80IxAG2meaZ4y64BqT2x+yo20uwY08rq9xAXw48guNQYtpGnF9Z6R7H20e
 U6Jl+DHdN6pYDUpKge6BN7UYz/UQidvWAuW5BnM0iGpmnTnwR1UmdCdiJzhQPCEwAep+V/3s52q
 aOqjyxjdynJ+1lAUOOnVvXLMlmq33KsSSsz9crG2EShpoqDj4VmmmmpnQUJCXEmaS/ssf5R+EGL
 U3Bt9aJA7vCM2m5ilMi6p03r+qkfG6erms25uzhFmN9efh3lf7/EhXeRJVkEM0UofN5Kqb3Aa9H
 zyAaLy0SMt7dW0HXH2HHXsXWnseOLrGb7MqEJAHyoEk8LuhdxcbA7e4unRkVQIIOpkHqRsTjO1+
 NxdAmRy7oz73XBQ==
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

For testing specific EDID, it is useful to be able to retrieve an EDID by
a verbose name.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/monitor_edids/monitor_edids_helper.c | 28 ++++++++++++++++++++++++++++
 lib/monitor_edids/monitor_edids_helper.h |  1 +
 2 files changed, 29 insertions(+)

diff --git a/lib/monitor_edids/monitor_edids_helper.c b/lib/monitor_edids/monitor_edids_helper.c
index a7a945659f751be99ecd9d55f9b7307df256d543..4d739937ede1e8f09eb6e8bf225f047d5c3dfd04 100644
--- a/lib/monitor_edids/monitor_edids_helper.c
+++ b/lib/monitor_edids/monitor_edids_helper.c
@@ -19,6 +19,16 @@
 #include "dp_edids.h"
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
@@ -167,3 +177,21 @@ struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count,
 		}
 	}
 }
+
+/*
+ * get_edid_by_name() - Return the struct associated with a specific
+ *                      name
+ * @name: Name to search in available EDIDs
+ * Returns NULL if no edid are found
+ */
+struct edid *get_edid_by_name(char *name)
+{
+	for (int i = 0; i < ARRAY_SIZE(ALL_EDIDS); i++) {
+		for (int j = 0; j < ALL_EDIDS[i].list_size; j++) {
+			if (strcmp(ALL_EDIDS[i].edid_list[j].name, name) == 0)
+				return edid_from_monitor_edid(&ALL_EDIDS[i].edid_list[j]);
+		}
+	}
+
+	return NULL;
+}
diff --git a/lib/monitor_edids/monitor_edids_helper.h b/lib/monitor_edids/monitor_edids_helper.h
index e5069868683d97053d8e66666e83692f1b733db3..a45dca870eb20f66c9472be6643019d23bc18b9a 100644
--- a/lib/monitor_edids/monitor_edids_helper.h
+++ b/lib/monitor_edids/monitor_edids_helper.h
@@ -34,5 +34,6 @@ void free_chamelium_edid_from_monitor_edid(struct chamelium_edid *edid);
 
 struct edid *edid_from_monitor_edid(const monitor_edid *monitor_edid);
 struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count, bool four_k);
+struct edid *get_edid_by_name(char *name);
 
 #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_ */

-- 
2.47.0

