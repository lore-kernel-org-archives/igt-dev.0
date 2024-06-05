Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A04C27C6D
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 14:30:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6314010E7CD;
	Wed,  5 Jun 2024 14:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hUkFbFqD";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67FC10E7AC
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 14:30:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5856040014;
 Wed,  5 Jun 2024 14:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1717597821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cCVmgfJjJs6Bb2uJXXKgMQFemNoXr3kXBXzbFPkqhq4=;
 b=hUkFbFqDeCPUSodNsqvVzNO/CmUaQI6l8zm1QEtd4P2ZyaO3drtoGd4VGipY5B43mXxfVT
 /I+M03SVXk6Ypa/h8P8cGtkRe9fh6bScDmjZG9v0COUpNbYUJt/gj+ZyjvJmYv/yiB/ayE
 6/72FsZgAsLTSPVAGH0DnNmVNbUdfoOUOIGWFpoZhRKirxbmzfZy/OaAv6ObD94sBGehO4
 KRiLYsz4gQDZcPOw/+H50NIKnHSzVMPTnFi9b1p99YD09hR9OIyFmV/GT5ibgyRhDsf2IS
 rt9iAtKcujeKoEE70vSrbZUwfeFZ16Ay7O19eQ0N5FOEER60SY82W67E0U4Zbw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 05 Jun 2024 16:30:20 +0200
Subject: [PATCH i-g-t RFC 08/13] lib/monitor_edids: Introduce helpers to
 get EDID from a monitor EDID
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-dev-remove-static-ports-v1-8-665f25b7a4db@bootlin.com>
References: <20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com>
In-Reply-To: <20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3357;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=a7AnJsUu/M4Ge70cO69Mhq9PWE/F6TLKi/1aQGQgUR8=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmYHZ4SMLW5Lv8U1dQZKfDCg71OApXvGNoCMRJr
 kwqPRtzJ7iJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZmB2eAAKCRAgrS7GWxAs
 4qluD/9YrKo3pTOZY+bpxrHnb/hOJ2MjwW50JTbzhl+2o2Nz6R2M+a0D6VQvsrlfjbUJLxPRkvu
 8TRSEvFWXm5tDGdO0JkKAdtk/yCPgdGnUc/OMUFUZ+PSGc8Vd9gOINN67bZ/FGjHdrQEGsmmdpB
 s5okVdAuRwCT03QnEvfqEtRwmg5GWOah+lH254dkw5PnyQzcYBAsXq66KtrJzXTljDE211MC8T5
 L28xNKwn4eAKYGDyidUJVVxaQHKWCJDTONSqEhEUw9u6xu+Ku0WKLUUNhQBGaLHn/mdO2sO6KzU
 XY18NijZV0oRD0RYh3/T/P/prBgn2pxo2LNF84UKQr7BR9RYoUQPb15XjGJXMCZOSmWw9kBy1ou
 ZOUrJd6/cMXitwBYrcW5yKQSCTAJFPLyfI8wB9KNxKNzIFIAsB249aca50d/yBw6POYnlU0jtZ4
 0Cacj1Rl/R0W2oFW8TGY5x+pPNoVRQNZtkChbqVBYDnDtWYxdvPllmhnV821eEoOEBJ5TQIye4X
 RUEI01qT4Q9WeNcN4gj5dyHGQEOR8TEjqA1sMkLVaIzOz7Vx9NQIyLTsbyit8Qy+450Cz3UVNby
 ARIxheQFCDYp1g/4jK1AuSaljmKWrFKZRj7B9NyVniQUeCZqmz/Cc0ewQufa3S7BPWMVEWUGpmN
 lFnohFEn13J/Pwg==
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

Add two helpers around monitor_edid list: extracting an edid and edid list
for a specific connector type

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/monitor_edids/monitor_edids_helper.c | 61 +++++++++++++++++++++++++++++++-
 lib/monitor_edids/monitor_edids_helper.h |  3 ++
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/lib/monitor_edids/monitor_edids_helper.c b/lib/monitor_edids/monitor_edids_helper.c
index 1cbf1c22f0bb..cbd6d6fd54db 100644
--- a/lib/monitor_edids/monitor_edids_helper.c
+++ b/lib/monitor_edids/monitor_edids_helper.c
@@ -14,7 +14,10 @@
 #include <string.h>
 #include <assert.h>
 
-#include "igt_core.h"
+#include "igt.h"
+#include "igt_edid.h"
+#include "dp_edids.h"
+#include "hdmi_edids.h"
 
 static uint8_t convert_hex_char_to_byte(char c)
 {
@@ -90,3 +93,59 @@ void free_chamelium_edid_from_monitor_edid(struct chamelium_edid *edid)
 	free(edid);
 	edid = NULL;
 }
+
+struct edid *edid_from_monitor_edid(const monitor_edid *monitor_edid)
+{
+	uint8_t *raw_edid;
+	size_t edid_size;
+	int i;
+
+	edid_size = strlen(monitor_edid->edid) / 2; /* each ascii is a nibble. */
+	raw_edid = malloc(edid_size);
+	igt_assert(raw_edid);
+
+	for (i = 0; i < edid_size; i++) {
+		raw_edid[i] = convert_hex_char_to_byte(monitor_edid->edid[i * 2]) << 4 |
+			      convert_hex_char_to_byte(monitor_edid->edid[i * 2 + 1]);
+	}
+
+	if (edid_get_size((struct edid *)raw_edid) > edid_size) {
+		uint8_t *new_edid;
+
+		igt_warn("The edid size stored in the raw edid is shorter than the edid stored in the table.");
+		new_edid = realloc(raw_edid, edid_get_size((struct edid *)raw_edid));
+		igt_assert(new_edid);
+		raw_edid = new_edid;
+	}
+
+	return (struct edid *)raw_edid;
+}
+
+struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count, bool four_k)
+{
+	if (four_k) {
+		switch (type) {
+		case DRM_MODE_CONNECTOR_DisplayPort:
+			*count = ARRAY_SIZE(DP_EDIDS_4K);
+			return DP_EDIDS_4K;
+		case DRM_MODE_CONNECTOR_HDMIA:
+			*count = ARRAY_SIZE(HDMI_EDIDS_4K);
+			return HDMI_EDIDS_4K;
+		default:
+			igt_assert_f(0, "No 4k EDID for the connector %s\n",
+				     kmstest_connector_type_str(type));
+		}
+	} else {
+		switch (type) {
+		case DRM_MODE_CONNECTOR_DisplayPort:
+			*count = ARRAY_SIZE(DP_EDIDS_NON_4K);
+			return DP_EDIDS_NON_4K;
+		case DRM_MODE_CONNECTOR_HDMIA:
+			*count = ARRAY_SIZE(HDMI_EDIDS_NON_4K);
+			return HDMI_EDIDS_NON_4K;
+		default:
+			igt_assert_f(0, "No EDID for the connector %s\n",
+				     kmstest_connector_type_str(type));
+		}
+	}
+}
diff --git a/lib/monitor_edids/monitor_edids_helper.h b/lib/monitor_edids/monitor_edids_helper.h
index 63a183409293..ff5672058816 100644
--- a/lib/monitor_edids/monitor_edids_helper.h
+++ b/lib/monitor_edids/monitor_edids_helper.h
@@ -30,4 +30,7 @@ get_chameleon_edid_from_monitor_edid(struct chamelium *chamelium,
 				     const monitor_edid *edid);
 void free_chamelium_edid_from_monitor_edid(struct chamelium_edid *edid);
 
+struct edid *edid_from_monitor_edid(const monitor_edid *monitor_edid);
+struct monitor_edid *get_edid_for_connector_type(uint32_t type, size_t *count, bool four_k);
+
 #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_ */
\ No newline at end of file

-- 
2.43.2

