Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EA7C3DA49
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:34:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC4910E5AC;
	Tue,  9 Jul 2024 15:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="coKNjtLt";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DE810E5AA
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:34:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CC58C20013;
 Tue,  9 Jul 2024 15:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HTUZkf8kNYw7VUKNqNz3Vs/pTH9gjMRGx8JmyCTLRsU=;
 b=coKNjtLtjTtRnh9UVnhBNr+N9IVL/wuVev11487SwtjUke2FMyA1/huk6oZ+RO7+YfDxeu
 Du4/b/k2mRhskOp9cGwg/wNbp9xY0C5sSZchGpJygflyg3xDimVQPrW6owB1wo1QcwKOTS
 fJR94DN4458VjgwkoyEe7MRarJXOlpJC51tHfi4e8fiJZlf5l1VcSb3E+q1I1pku+Tv9iC
 PHuCJYj+lovI9uZkQddJWmzff5Pfmqc/jyqGGO2R/M6Jspp+YybnlHcC9+3F+jdEGmE/Oa
 xWb8IeCRKgkOdEyLoboqCbdF2kmGVz7BE8jJB8zi+A9GQ3sPJVDzItsPzinhrA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:22 +0200
Subject: [PATCH i-g-t v2 06/39] lib/monitor_edids: Add helper functions for
 using monitor_edid objects
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-6-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3725;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=t9+h2+Sc+5WWCZkZM9T/PCSD9qItEfI/7ctnHOnYnzQ=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViWAv0b5u41g1T8aNZFNfOqZHhhZe4uRic94
 fJhbvQNKaaJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YlgAKCRAgrS7GWxAs
 4pPKD/9GUzx301HQstFUWKmWGntkLVlgWT/99+7DKRDwxwnwzxt6hQ3+A3oIWDloUHGmMVUvD37
 s9qEnHLSog1qLFGS5O90QkY5oao4WBtUurRLggU/RsOKarhxJf274hg7zH+W2cLXLshCC6G4CDr
 dCObkZAdFeuwstpORu6ovcdC+90yKmEFlnK+hbmwOEsUrjFdLARpSvgiizn8Fr5KuOKE8aY1kzT
 SXCN+tCkVgOIsV6Ov5jn7YuAv5h8TUOcAkMZ/+boBteO8ruBd1Ry2FoAE4IGBY99Zp6Fe8NKWsw
 YSIKekwDllE2kWP4wfOnErQ+q1Ogg9DJWrRrXX/UERORCa605NW16eS4yngNpC/KaVoLCP5xB6B
 iYwl0SxeFCEdXozeYyC3P+kYeptpUfaI3e82kAGMolUzoXCg8Uji+HfdpzSCy8Aptuno3qhUtB6
 EcnZbOAGP4/4PAAMa3nWXTOfGmhTULnPQdRhjx2NoKs6zjn6o1Uhf45cqzyz2cmVEut3ZDPLBYA
 qFkekDIiWI3n4ZbXOyADi+H5Y4EUukt1fc9p+wqw4J6Ig3Uz2UfDagb5WPYqHu1XAoUmImZs4yV
 pPSwrNeLTNu8pjpcwdKgIgpd9VI6w8Gnj950VOJXlrTXHxasQ8Gk4AOiocRQj6qWWyIYpehh/6n
 eAYZ+0sZ8xGokFQ==
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
 lib/monitor_edids/monitor_edids_helper.c | 61 +++++++++++++++++++++++++++++++-
 lib/monitor_edids/monitor_edids_helper.h |  5 +++
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/lib/monitor_edids/monitor_edids_helper.c b/lib/monitor_edids/monitor_edids_helper.c
index 1cbf1c22f0bb..0e0c2a9badcf 100644
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
index 05679f0897f3..2ec7aee5f13f 100644
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
 
+struct edid *edid_from_monitor_edid(const monitor_edid *monitor_edid);
+struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t *count, bool four_k);
+
 #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_ */
\ No newline at end of file

-- 
2.44.2

