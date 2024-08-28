Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65644C636EE
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 17:27:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C4210E3DB;
	Wed, 28 Aug 2024 17:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="mjNfUFeF";
	dkim-atps=neutral
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91B110E3DB
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 17:27:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DAEA4240007;
 Wed, 28 Aug 2024 17:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724866022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HTUZkf8kNYw7VUKNqNz3Vs/pTH9gjMRGx8JmyCTLRsU=;
 b=mjNfUFeFricTym7vuYasDi8Y4qVrOmoODGD4Lacdl67luaZsBIcgfIkadU2WSbSBH4OQ6i
 UHA5XujAhGTDhjJUBp91gacwKcab+A/+bx/Y9SBF3JeaSnXihRgXJ3GNMf89HPQwtu30UH
 HTkeL3ftVFhyj5Z+OsEX0thdFx1a2FsnkQt2kNUkb4aqufQE4aE4xH+/+El22zwY6SCGE1
 OPS0QaB1nws8g8XQMpVmJPt4vrA2qAJTXNhX0uLKpIphq4cdulDtfZWFemPCkA8grg9C+T
 6oGBK6KSjtJLuof2QQfGHxV5rveBKhwptzuXZGI51eDb74oLOxFyUv5SmjpNMA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Aug 2024 19:26:35 +0200
Subject: [PATCH i-g-t 1/5] lib/monitor_edids: Add helper functions for
 using monitor_edid objects
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-b4-cv3-02-monitor-edids-v1-1-29c846bcf251@bootlin.com>
References: <20240828-b4-cv3-02-monitor-edids-v1-0-29c846bcf251@bootlin.com>
In-Reply-To: <20240828-b4-cv3-02-monitor-edids-v1-0-29c846bcf251@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3725;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=t9+h2+Sc+5WWCZkZM9T/PCSD9qItEfI/7ctnHOnYnzQ=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmz13jDINl+vVC3AFGsp70RUCaSJaaHnG7Vvqbl
 vnNkkdGV0SJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZs9d4wAKCRAgrS7GWxAs
 4lRoD/9SaHkUSRj4QKXkgqPIlsj0gZgsNaXDO64mslGRpRkGL+uN8kMO+0b3Q3N8aPCp83fWWqf
 MiQt4BLpJVEolKiwyboU2OTj92/HrF1Ac3moQDyU6n2CyxTaX6O9LT+iwKTCUK5D4BLn+jpUoBk
 ks/vaSfxiTeAHYOGq4CNXyKwFkGBE6L5HO5mv+a+ELd4alQ5wMRL7XFlQxU+fOd2Xt+3b+fsw/4
 o/ujy03LJaID6nEAKSlzYnuu2VGwS8MysESKQE2J0NXntFuJDVamr7YOP2vs/O5foT7An1eQ0Ik
 Rj4mmOBPtvdLEA9+d543IyWSwagglQYWI19xClq1VvMye0CXDLoOW8u1K06b6NVGFdC+rnFcOV2
 7HbZFtMsGxG6IZk4b+dUkelXgk1od/2zJvaqE354iQmpvPegwkSQG87e2g4KgzBTQmh1fQhFqas
 kwjbOXbvC6vWgZUlUj6BmR2tPK5ismSdVDEw4faeybfyNOiJL61yZzL62oBetkf1QtWVEbbBEpo
 xleMliGUtP/pMk92NdmS6i+1b2F/4J8tAtkrvmHcwLYzPJ12mADjB7/Dxnub08eIZ9Msv0Ridpb
 PTWuM/FgrsAsEjexlre4B+9LhSspVCuGR/nNd/+HYhItyV9etOpmnqaiLfRj+/mBj31DQZ1/MmJ
 0jj5BGusf6GdZcA==
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

