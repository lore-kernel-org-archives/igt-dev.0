Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F91DE7719D
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 18:05:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2776010E50F;
	Fri, 10 Jan 2025 18:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="iTv1d17n";
	dkim-atps=neutral
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA3310E517
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 18:05:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A81CFF80A;
 Fri, 10 Jan 2025 18:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736532349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+jZDGgzUVXgg9UyUCFZqH4AOaju+kI9TvsRXuCLZpMA=;
 b=iTv1d17n7ID5yLzzo1tVAkr6WkTLDBiNIhoyrQlrTu3CKou0KGNP1E2I8JpBkH/x78v+ZU
 UALM6yWaLka9HPrLET5xqByY5b71EOiLrpIOFwtvlxZpLqCanTuZHTINMufGQ/dRTwK/Po
 bsm+WyLHuWJzO3JnPLNvyugak3zG+hm1vyCpdVxXTuX5jQumsn2EcTfGI3s08Oks3PJWuQ
 92kDn8Zlfqz09sQq/RsiVisnh7nDebnEoTEm/J5maWsY2bzDUA6nJ5CPq+ZMhHpbzh7VN1
 LBzE/H5U4f2F7JNzu9fzQIvdnEky2evWZtiI6yf+Qkvbv4HXeaVWx3NXrQf1xg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 10 Jan 2025 19:05:41 +0100
Subject: [PATCH i-g-t v4 1/5] lib/monitor_edids: Add helper functions for
 using monitor_edid objects
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-b4-cv3-02-monitor-edids-v4-1-aef77d3e0f50@bootlin.com>
References: <20250110-b4-cv3-02-monitor-edids-v4-0-aef77d3e0f50@bootlin.com>
In-Reply-To: <20250110-b4-cv3-02-monitor-edids-v4-0-aef77d3e0f50@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5675;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=hD5nFtn9uGgcBFObf8vDs9vGuPYJCh9/oYlCLsJq34c=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBngWF5F+fIWRcq80bb1qGj65Jtxl2UeJ4gC3j8Y
 kgjCcOE4s6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4FheQAKCRAgrS7GWxAs
 4oBLD/48M73JFUAjl3NKEkAQuKfyEzYmTTwlCpiT4RW2cPRJo3i91NQa3z8BkFEbnnxGXjnL6bx
 joC2kYi5y5uVcJUWiFnvye2/ZXmh3GNEkKxAXASwzftx+ilStkbE4vE9WQWe1WYvyGViq0k8f8F
 iD7rYNLeWg5AzyQKaF79y4hEGDyDoHgbl+Yiedbp+CVHKjINkomlXS1mfqPT9GuxtcOVryPEE2O
 dxHX8o1KErFEFE0Iabf2XOcCJ+hVddNFkkAEzO9tDnC3p+dKA5++GivWLkkS9K5+9bMqDl+3Lhw
 3FO1zQyi29rJW67OBeBVymwhSh7Rj9/m0lTQpNFfZHDcin04C90uKpy9+PlGPCk4xaRBQ+wpbUs
 JSvZtPw9zLNmCsBHqwog94wcdTMcCFtfjm89wkTAZ5rmWh4mdxZLxuLJmUUxRvT4ZQ8U4bBNgTr
 Z/MQjR3Kz/dfs2EI0fRzm/e/L97rzrgs10r9wwZxqnSupLpSmV4+d4WmuCRvPzur7YbzWevrAW0
 fEJWlQz5h3RGNW1Dqf+q00/vIZlAdqdrRWfFC5J0uTOgngttnR6m5hQ/ph9Mw7LDXX0tR9XG+ww
 brPT71hK+GnHEZy6zJvPyLHRs37Q84CMmXkClCvHIwv+MpXc6wwrXXipnrCBNC0utnELQX1u7ih
 PljUmdRKJC7lpqQ==
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

Introduce the functions edid_from_monitor_edid() and
get_edids_for_connector_type(). The former converts a monitor_edid object
to a struct edid, which can then be utilized by igt_kms helpers. The
latter returns a list of monitor_edid objects for a specific connector
with certain characteristics

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/monitor_edids/dp_edids.h             |  3 ++
 lib/monitor_edids/hdmi_edids.h           |  3 ++
 lib/monitor_edids/monitor_edids_helper.c | 80 ++++++++++++++++++++++++++++++++
 lib/monitor_edids/monitor_edids_helper.h |  7 ++-
 4 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/lib/monitor_edids/dp_edids.h b/lib/monitor_edids/dp_edids.h
index 144907558be1faa306b646ce3b47b24c13050968..07793381257e0082a1fa7b4321fcef7e5aeaa5a9 100644
--- a/lib/monitor_edids/dp_edids.h
+++ b/lib/monitor_edids/dp_edids.h
@@ -194,4 +194,7 @@ monitor_edid DP_EDIDS_NON_4K[] = {
 
  };
 
+#define DP_EDIDS_4K_COUNT ARRAY_SIZE(DP_EDIDS_4K)
+#define DP_EDIDS_NON_4K_COUNT ARRAY_SIZE(DP_EDIDS_NON_4K)
+
 #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_DP_EDIDS_H_ */
diff --git a/lib/monitor_edids/hdmi_edids.h b/lib/monitor_edids/hdmi_edids.h
index f6cfe82ff6e1c4419160bcdcc851a5e28eb08726..3984241775c3d8e0f39732bdc41cb44f491ce62b 100644
--- a/lib/monitor_edids/hdmi_edids.h
+++ b/lib/monitor_edids/hdmi_edids.h
@@ -604,4 +604,7 @@ monitor_edid HDMI_EDIDS_NON_4K[] = {
 		  "1620582c2500baac4200009e0000006b" },
 };
 
+#define HDMI_EDIDS_4K_COUNT ARRAY_SIZE(HDMI_EDIDS_4K)
+#define HDMI_EDIDS_NON_4K_COUNT ARRAY_SIZE(HDMI_EDIDS_NON_4K)
+
 #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_HDMI_EDIDS_H_ */
diff --git a/lib/monitor_edids/monitor_edids_helper.c b/lib/monitor_edids/monitor_edids_helper.c
index 1cbf1c22f0bbc5fb4047ce42bde2042ec8170efb..6043e7a084b320263f1c0525369aaa59a5d32bcc 100644
--- a/lib/monitor_edids/monitor_edids_helper.c
+++ b/lib/monitor_edids/monitor_edids_helper.c
@@ -15,6 +15,10 @@
 #include <assert.h>
 
 #include "igt_core.h"
+#include "igt_edid.h"
+#include "dp_edids.h"
+#include "drmtest.h"
+#include "hdmi_edids.h"
 
 static uint8_t convert_hex_char_to_byte(char c)
 {
@@ -90,3 +94,79 @@ void free_chamelium_edid_from_monitor_edid(struct chamelium_edid *edid)
 	free(edid);
 	edid = NULL;
 }
+
+/**
+ * edid_from_monitor_edid:
+ * @mon_edid: Monitor EDID to convert
+ *
+ * Get a struct edid from a monitor_edid. This returns a pointer to a newly allocated struct edid.
+ * The caller is in charge to free this pointer when required.
+ */
+struct edid *edid_from_monitor_edid(const monitor_edid *mon_edid)
+{
+	uint8_t *raw_edid;
+	size_t edid_size;
+	int i;
+
+	edid_size = strlen(mon_edid->edid) / 2; /* each ascii is a nibble. */
+	raw_edid = malloc(edid_size);
+	igt_assert(raw_edid);
+
+	for (i = 0; i < edid_size; i++) {
+		raw_edid[i] = convert_hex_char_to_byte(mon_edid->edid[i * 2]) << 4 |
+			      convert_hex_char_to_byte(mon_edid->edid[i * 2 + 1]);
+	}
+
+	if (edid_get_size((struct edid *)raw_edid) > edid_size) {
+		uint8_t *new_edid;
+
+		igt_debug("The edid size stored in the raw edid is longer than the edid stored in the table.");
+		new_edid = realloc(raw_edid, edid_get_size((struct edid *)raw_edid));
+		igt_assert(new_edid);
+		raw_edid = new_edid;
+	}
+
+	return (struct edid *)raw_edid;
+}
+
+/**
+ * get_edids_for_connector_type:
+ * @type: The connector type to get the EDIDs from
+ * @count: Used to store the number of EDIDs in the returned list
+ * @four_k: Use true to fetch 4k EDIDs, false to fetch non-4k EDIDs
+ *
+ * Get the list of EDIDS for a specific connector type. This returns a pointer to a static list,
+ * so no need to free the pointer.
+ */
+struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count, bool four_k)
+{
+	if (four_k) {
+		switch (type) {
+		case DRM_MODE_CONNECTOR_DisplayPort:
+			*count = DP_EDIDS_4K_COUNT;
+			return DP_EDIDS_4K;
+		case DRM_MODE_CONNECTOR_HDMIA:
+			*count = HDMI_EDIDS_4K_COUNT;
+			return HDMI_EDIDS_4K;
+		default:
+			*count = 0;
+			igt_debug("No 4k EDID for the connector %s\n",
+				  kmstest_connector_type_str(type));
+			return NULL;
+		}
+	} else {
+		switch (type) {
+		case DRM_MODE_CONNECTOR_DisplayPort:
+			*count = DP_EDIDS_NON_4K_COUNT;
+			return DP_EDIDS_NON_4K;
+		case DRM_MODE_CONNECTOR_HDMIA:
+			*count = HDMI_EDIDS_NON_4K_COUNT;
+			return HDMI_EDIDS_NON_4K;
+		default:
+			*count = 0;
+			igt_debug("No EDID for the connector %s\n",
+				  kmstest_connector_type_str(type));
+			return NULL;
+		}
+	}
+}
diff --git a/lib/monitor_edids/monitor_edids_helper.h b/lib/monitor_edids/monitor_edids_helper.h
index 05679f0897f3d0618d656cc071b565b48d31da28..e5069868683d97053d8e66666e83692f1b733db3 100644
--- a/lib/monitor_edids/monitor_edids_helper.h
+++ b/lib/monitor_edids/monitor_edids_helper.h
@@ -12,6 +12,8 @@
 #define TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_
 
 #include <stdint.h>
+#include <stddef.h>
+#include <stdbool.h>
 
 #include "igt_chamelium.h"
 
@@ -30,4 +32,7 @@ get_chameleon_edid_from_monitor_edid(struct chamelium *chamelium,
 				     const monitor_edid *edid);
 void free_chamelium_edid_from_monitor_edid(struct chamelium_edid *edid);
 
-#endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_ */
\ No newline at end of file
+struct edid *edid_from_monitor_edid(const monitor_edid *monitor_edid);
+struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count, bool four_k);
+
+#endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_ */

-- 
2.47.1

