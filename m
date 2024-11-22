Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7661DE6916C
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 15:51:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DBB410EBE0;
	Fri, 22 Nov 2024 15:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="bjmkXDlu";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B674C10EBE7
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 15:51:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B5A1B2000B;
 Fri, 22 Nov 2024 15:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732290701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x0TAelbviFE+ez9e86Csl+7j8Ca8ywWtBoluiQbDoFY=;
 b=bjmkXDlu0sEKA2lN8NPaRd5P7ShWP65doC8Zk+2rfQjCSkY9oHw51L4dj0eNOdM9iFd1g0
 NomjmQtwxjcCI1rSI42ycS5g2SdKRjnDNf0FCCoeNLRBrrx2ybzo9/3MHH+nyi6SZL+/ho
 og5EwNw1J4ynVW1JqbpiTB2ooh0bwcN5w8ERAWZ4n3ztBBQHsLJ2LO2ULcbfme7rwdE4Gn
 4hI9egtwEnm6pbnx0Hj953/q7bTVrOiNcfGp9nUIF3hx4mUEBu1mVH9lo40QABjgf/b7ej
 E1p+6etwhQe/8TaRUnfwX4XBtLwoCvghR3D4myilgokcPzJSyonMKwut8rSU4A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 16:51:34 +0100
Subject: [PATCH i-g-t v3 1/5] lib/monitor_edids: Add helper functions for
 using monitor_edid objects
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-b4-cv3-02-monitor-edids-v3-1-1798f58167ef@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5957;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=usY50Lp+MNn6CJaTIv3lgaXjcBnZmENr6LyEOjRihm4=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQKiJReo3CFOOzsP2XJ6QFIztuHt58QM6btGFY
 X82DHVNVqmJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0CoiQAKCRAgrS7GWxAs
 4m+JD/9s/JCjdlkbVc13SWxi7NEZq91+2POq9XSqVVH0I577ECQaz4RQCD1WxM1Ive0JC7pQSqE
 SETYH/gwZoqwdkJzUJ6Jin3XE2hU8mZv0gxT8TJfN0fpiRjCWr3OkdYy+qfK3Wij7827pR8QtY/
 g4ZF3jf3FBc3IvUfiAWQBF91UdyPx5rGTxBwzGtvzWJHfcd4qDXv5lz7n1qxPS077W+hH+ViBU5
 C8xWleyaO1oHxCFTpu0ElDsd6r5O+H09DROFZx0fEyB4qj4ocPfKZkT0QajqH6YmWhGAAIe3ssU
 j0JFxE76q5eMOK6M0LHb/7B9guD1kQVV3gGpi2mdeFMpOMzgbnBc/9hpcsP9UFiTGzJc6wULS/+
 7u0+EYjKeZ7PXDq1y4UkJQmsjRPvElVhHqPW5pxKF3PaHkOP44Gbze03pkCya5NAokY/Kf+oJ/r
 3GUApCNX0O8mLqLONyUHi+hbwH741eqlsfGvr7fPtcj8rOUj+Z4E/qVsDGh5Ho4DMVedmwPbQZR
 V8jJxXdp/gVhknl3hPYrzUIBbzWj24gtWTdE2nDtNLbeRvL0QA2MnSy+7+0eFSU5BpzzCjil96V
 UltQ+aRFxsrYHka+TOsNd5lyd7LLf0jCxRKu0AzYDZahgHryrUqrdcGThHF/H5iabgIyS5XDJet
 cgvePh14mrKknfw==
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
 lib/monitor_edids/dp_edids.h             |  4 ++
 lib/monitor_edids/hdmi_edids.h           |  4 ++
 lib/monitor_edids/monitor_edids_helper.c | 77 ++++++++++++++++++++++++++++++++
 lib/monitor_edids/monitor_edids_helper.h |  7 ++-
 4 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/lib/monitor_edids/dp_edids.h b/lib/monitor_edids/dp_edids.h
index 144907558be1faa306b646ce3b47b24c13050968..8192520c89e61d3d38c508ca97a61040cea4ba90 100644
--- a/lib/monitor_edids/dp_edids.h
+++ b/lib/monitor_edids/dp_edids.h
@@ -12,6 +12,7 @@
 #ifndef TESTS_CHAMELIUM_MONITOR_EDIDS_DP_EDIDS_H_
 #define TESTS_CHAMELIUM_MONITOR_EDIDS_DP_EDIDS_H_
 
+#include "drmtest.h"
 #include "monitor_edids_helper.h"
 
 monitor_edid DP_EDIDS_4K[] = {
@@ -194,4 +195,7 @@ monitor_edid DP_EDIDS_NON_4K[] = {
 
  };
 
+#define DP_EDIDS_4K_COUNT = ARRAY_SIZE(DP_EDIDS_4K);
+#define DP_EDIDS_NON_4K_COUNT = ARRAY_SIZE(DP_EDIDS_NON_4K);
+
 #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_DP_EDIDS_H_ */
diff --git a/lib/monitor_edids/hdmi_edids.h b/lib/monitor_edids/hdmi_edids.h
index f6cfe82ff6e1c4419160bcdcc851a5e28eb08726..23ac04d94b6f672572e34b8059ff1b47d0730839 100644
--- a/lib/monitor_edids/hdmi_edids.h
+++ b/lib/monitor_edids/hdmi_edids.h
@@ -12,6 +12,7 @@
 #ifndef TESTS_CHAMELIUM_MONITOR_EDIDS_HDMI_EDIDS_H_
 #define TESTS_CHAMELIUM_MONITOR_EDIDS_HDMI_EDIDS_H_
 
+#include "drmtest.h"
 #include "monitor_edids_helper.h"
 
 monitor_edid HDMI_EDIDS_4K[] = {
@@ -604,4 +605,7 @@ monitor_edid HDMI_EDIDS_NON_4K[] = {
 		  "1620582c2500baac4200009e0000006b" },
 };
 
+#define HDMI_EDIDS_4K_COUNT = ARRAY_SIZE(HDMI_EDIDS_4K);
+#define HDMI_EDIDS_NON_4K_COUNT = ARRAY_SIZE(HDMI_EDIDS_NON_4K);
+
 #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_HDMI_EDIDS_H_ */
diff --git a/lib/monitor_edids/monitor_edids_helper.c b/lib/monitor_edids/monitor_edids_helper.c
index 1cbf1c22f0bbc5fb4047ce42bde2042ec8170efb..a7a945659f751be99ecd9d55f9b7307df256d543 100644
--- a/lib/monitor_edids/monitor_edids_helper.c
+++ b/lib/monitor_edids/monitor_edids_helper.c
@@ -15,6 +15,9 @@
 #include <assert.h>
 
 #include "igt_core.h"
+#include "igt_edid.h"
+#include "dp_edids.h"
+#include "hdmi_edids.h"
 
 static uint8_t convert_hex_char_to_byte(char c)
 {
@@ -90,3 +93,77 @@ void free_chamelium_edid_from_monitor_edid(struct chamelium_edid *edid)
 	free(edid);
 	edid = NULL;
 }
+
+/*
+ * edid_from_monitor_edid() - Get a struct edid from a monitor_edid
+ * @mon_edid: Monitor EDId to convert
+ *
+ * The caller must free the returned pointer
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
+		igt_debug("The edid size stored in the raw edid is shorter than the edid stored in the table.");
+		new_edid = realloc(raw_edid, edid_get_size((struct edid *)raw_edid));
+		igt_assert(new_edid);
+		raw_edid = new_edid;
+	}
+
+	return (struct edid *)raw_edid;
+}
+
+/*
+ * get_edids_for_connector_type() - Get the list of EDIDS for a
+ * specific connector type.
+ *
+ * @type: The connector type to get the EDIDs from
+ * @count: Used to store the number of EDIDs in the returned list
+ * @four_k: Use true to fetch 4k EDIDs, false to fetch non-4k EDIDs
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
2.47.0

