Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBF6D2C54A
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 12:53:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0CC410E680;
	Tue, 22 Oct 2024 12:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="aE6h79C3";
	dkim-atps=neutral
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8548710E67E
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 12:53:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7163360010;
 Tue, 22 Oct 2024 12:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1729601605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4LM8DfBrpe1Npt+hA529n0P+Zz09EXWM+MMPTXoedlI=;
 b=aE6h79C3mzbmQJkn8Q+5fM1wVWhPwTXbl9E6A1uBgsvdrIGoEb576A+cpKGLnW3IcZXgE1
 mA5b3ddEznOBq1LHuBNfDqkWrKLAjImJaChMoEJVHmALoqzP769zPds3NEIM7RZ1U//7cp
 ZGsyhI2CSUtc2FdS3DHE2mJskVxiaMi4Z7UZrMPgakAH85tcgCEXXhJAQtJkm/G1/M3Vbn
 S+6Z4lE9REgLwTNKK/smPtqUcsSQqEfOhfq8QnZzirG+lU9Vbm5T9R+fcu699BUZ/0CHKu
 jabNJT11Ppm3CjUfSlr3U4pSs80P/KaM95jpO1z2uFjZbc51lOCveBJ4Dseohw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 22 Oct 2024 14:53:10 +0200
Subject: [PATCH i-g-t v2 1/5] lib/monitor_edids: Add helper functions for
 using monitor_edid objects
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-b4-cv3-02-monitor-edids-v2-1-7634786c21e6@bootlin.com>
References: <20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com>
In-Reply-To: <20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, nicolejadeyee@google.com, 
 seanpaul@google.com, jeremie.dautheribes@bootlin.com, markyacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3725;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=17X1R7yf/tXw+SEDzjlA1dUAIMBhRwTG3yb7XkJfGDc=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnF6BBZ8rEM+BkybI15adegPRpUi8az/f53CHBt
 jT5la3eLmyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZxegQQAKCRAgrS7GWxAs
 4rlnEACej4cDzIStTNHhVrBMPrJlnYDm7rRbDhLs133TyLFqxwNHmZF/E7gd32/9HukyjJkIvA+
 yjoM50Xbm9++N1/BoT3zKVuCrsrK2qh4nfwwCkwFfgasJB2WlKc0wbjtSmRhA1gshprZHsZAQPC
 0x9pZ+PZ2Cg05aNbTgp9h8Aslnp/LGbG0EeFQ++ct+pqPuxgLOCYRnbjsnR680BrPqAa58Hg0bi
 kUhf4KmUfx1ugnVK3h0SHsh+C80DnNBE4rUMnqmogrvB9j6jLca051U1BGw7dg2/3NxLszCvrfu
 afQENuVOu56MB9El94ZJZ3s88Njk+z3WN4jsefsHPPxXIp/sVO8o6RcPnSvM0gwhgYrGt1ncWK8
 bqmNuYnxkY/XWpI68CCfFpoLGK11OYuc3TZNN3IBhwpftP3W/WyBqTpp1PQpTfr+xTLYjgMNEoV
 eETxQwZRBw2hOwEjWgmY8g4cmBCblEBxrMKcymh7lnt+Wcij7qHVgO/aQjgSo399ttc8TX8uiH1
 ffYR91AFmNSfJny+m2i2SvJSkZKmbwOtzqUSZflIHCZVXuIUdj0VYAKsGik4qgQQLctwpBAmbgG
 yaF0BHn5JUSSN5B8SOq/FzRHlXGD4IJM/q4zUdF1x4CzBLwTpinJI9bHuj11Qemm8SQ+6QHoV2R
 xVbvdYdxq8ODwoA==
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
2.46.2

