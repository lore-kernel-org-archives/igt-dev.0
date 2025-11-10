Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB2FCCF9E3
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:39:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FE010E3BD;
	Mon, 10 Nov 2025 13:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="eqSOdlAC";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6501410E3BE
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 4D26B4E41608;
 Mon, 10 Nov 2025 13:39:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 13A93606F5;
 Mon, 10 Nov 2025 13:39:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5349110371907; Mon, 10 Nov 2025 14:39:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762781986; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=W7jY1WCwZy8Sa7MBBxUTXJaY9APeMDX32425bHvb5qs=;
 b=eqSOdlACG4CIE0Mm7nXWQn60uOVIDnZynsVqf7lT/ug9EuyAtAKc/tE37njOP3qVGeYIML
 Z7GiJsSMYW6u+Zu5jN9L5eg1JiMsovNErB3PlJEOBJmDhiFpIdpV1tBUpLb/Gl9TgbBSic
 JEWaLbHr+7ADFMdKzCtOyPzmVHEkovVizdXcaUQhuuBQ7H48Q0dsE6Ea897FABl5r11HYJ
 NGGMQ9R5XOUxrYYf97nHWGBxeRl1WV8SFopfSwc0/WmhVJxHlP/rt5UwMOk9iDuw9LQ9mN
 lmzdMW4t1oK10CJPPNTeJyeklZdtLrOPb2fI3n888lnZt+qYZqfzfi27ZNk+tA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:16 +0000
Subject: [PATCH i-g-t v4 14/46] lib/monitor_edids: Add helper functions for
 using monitor_edid objects
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-14-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5451;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=1OqXZqD5sPVKVEzaYaRM8inlLBS46JJ0SwHjYQOgFRg=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesOAZIKudIr8VJBGGTDeiz2RacvGIke4yVXI
 Qk4ezg2eiqJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrDgAKCRAgrS7GWxAs
 4sUXD/wKzQDFmPvDqFHpOFKrsJuOtaTpw/jeOiCmbRfed/2vJ7nQ0JcXf+pKS3Q5lz1tHz/2hPl
 LbysfstfczEbCtpXHF2hPGrD9UpjFNZeUpZcppt3CXXy9r1ObLAFrmsC5FusMBcCZm0WRr8juvk
 btyxPZ4/EgS7Jrt6uEmhvus6ou9OolKEgH/7eqZe4Op1bfpnoNrlWsb+peRjanSCnnRhK7Gh9F9
 c7bY4VyFC8Uo6vFOXVESwFw/npTQky1PxU4TxaxVxD4dMafxDajDZVw8VpCYB4ubdYYDo0wSoCI
 gF+hNVo8tC14pMDUtI0Bf/9+uWtW3Q8B+jSPHkSbQNtt7ewa/fpn6JX3DpbSZf3XwrCBXDiMDhe
 zySWxQ9bbTh4IMPUn72MO4SPc0ZO0MEZJThz2zA84pidvQ3Dw6l0Sk55Cc7O4LCd0zr2x6dvQB7
 YHZjHGDryKDkwLleFfdZm5TaBW+RyzDRFaZTHELNQKU6FuQjE5MFHMihLVeaBR5OyGgu+jeIxZw
 dbwVr8sHaWUJK8kV0FrP+KnSZFn65K1Dcy8rvusd8EVNvhhXPKzVl1IqL2N3xz2FLafUqM90JUC
 M1r7YP3DeEQ6pm5wlvVEiR113M8y+XIr9LoCi+JCoGUEP5EOdv84rHkE/gRGorMVpOwXEHVoEz/
 YGyEsGHKWQT6tbw==
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
index 144907558be1..07793381257e 100644
--- a/lib/monitor_edids/dp_edids.h
+++ b/lib/monitor_edids/dp_edids.h
@@ -194,4 +194,7 @@ monitor_edid DP_EDIDS_NON_4K[] = {
 
  };
 
+#define DP_EDIDS_4K_COUNT ARRAY_SIZE(DP_EDIDS_4K)
+#define DP_EDIDS_NON_4K_COUNT ARRAY_SIZE(DP_EDIDS_NON_4K)
+
 #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_DP_EDIDS_H_ */
diff --git a/lib/monitor_edids/hdmi_edids.h b/lib/monitor_edids/hdmi_edids.h
index f6cfe82ff6e1..3984241775c3 100644
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
index 1cbf1c22f0bb..6043e7a084b3 100644
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
index 05679f0897f3..e5069868683d 100644
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
2.51.0

