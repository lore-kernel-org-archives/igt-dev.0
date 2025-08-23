Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD025CA0EEB
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 02:20:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7915E10E327;
	Sat, 23 Aug 2025 02:20:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fcFnnHDW";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB2E10E193
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:20:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 00ABB4E40C34;
 Sat, 23 Aug 2025 02:11:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CE33B606A7;
 Sat, 23 Aug 2025 02:11:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2FFE81C22D382; 
 Sat, 23 Aug 2025 04:11:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755915105; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=zwsc+sqpk+vCeFFICOGbWSzwueafbjLnThRhLR6lkg0=;
 b=fcFnnHDWYtuHjzVa9aGjLllKAL1QJT20suz1RyVW+DjWl2R6K0xPSFyAU0mbuzp229E98r
 yQRMHW69rfhiSpX7X4EXCuWxT4YuArrodlBAdjZdDoMqrgDml8odpd+Ye1+WapMMnGuqMk
 9PUeQkk4sAmQ19hpZ2JO1+Psd+fHdVuIM+2RguezjIf8Tk+UoqO45T6MR3XvKqkmMcZEEa
 fJK2S4C7HLYib3NjGv/Nhzj+jTY79VgCiYH/jg+MIEtyrfZekI52TtU3FSeGTPreXI8Yil
 WT2ffgCWb4kli7yWQTefl4aas3mRMgAIWpBIiscwsCu7PhhxJirfIu41PblxIw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 23 Aug 2025 04:11:27 +0200
Subject: [PATCH i-g-t v3 07/29] lib/monitor_edids: Add helper functions for
 using monitor_edid objects
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-unigraf-integration-v3-7-cdc36d5fab4c@bootlin.com>
References: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
In-Reply-To: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5675;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=7Zukm1/sr+BZr3vDW+XqxhAwWy4aSx4g/mCF/2fqvXM=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoqSNTc/C1larsFAaurdvQP6MUUd24k5K442kaO
 Ji44NgpUdKJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaKkjUwAKCRAgrS7GWxAs
 4hiYEACj9Sik/nzOdH53MsFxyz2bQcqwPR5aqNBFuA5B+RdhS1XpdYaHQCDzT1jXiHtXGMFm9Sr
 c9xTeLtEL715cLwOeFlvHcIkDPX1zAHDR8Qz1ZZWb5VtoKMMe5mYoBE1n2cZbJLcZ2Q+lqnRYNn
 CPnHOtpzI3Vy/y5ifOJNMTaWAEXEUJfxNWj9+5RgRXfMSqiq0jtttmp5ONe5qzZvuWLtKgJu0Oz
 mGEIX/XnVaasCsDjN/lwVnk9D1sMrzEjmgcRmNdHSGi7verJQMy2fCxOoZJBb1GoNf2msaybwJy
 VmVYV3Zn78KEYJ5/RrAOnzXBj6efrUtKdknRpp54YOZ1QkwP7khU+HmHejZ8Cus8N40EJmjKpD0
 aK0yw9eCwd4vCC1KySEtq/WAUvLYBxpVbzZoG3REVmxsvL185nehleOOsnAwwOoOsjVIHQy9HCQ
 CoZdr6lV5isBYJjP2+56jD6O6pDs7Io67x3zA/bakh4Uy3eAjY6610wO7OUBfT3AYfpyOqRy8zw
 X4/a4LB/ha/yQDdKoKc5jIuRb4Fa54AFokKZs5zxeNNrQPyB497js2vIiWmmWixd/u2mV4r2GFr
 MX5dBYwD2wWjKjtTUBBb6V33Nv3U1A8OSspYNjOAFa0u3icEXjxeUvPhzc2rVt133DmnpfVVYFh
 LTO+d3CdU2a1ayQ==
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
2.50.1

