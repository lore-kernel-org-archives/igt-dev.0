Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D2EC3DA4E
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB40010E5CE;
	Tue,  9 Jul 2024 15:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="iSWUvEfx";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E220310E5C7
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:35:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 411902001C;
 Tue,  9 Jul 2024 15:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bKIJzkgeG7s/ua8+kjheeBJAbhJLbqZr8/PLU63ByV0=;
 b=iSWUvEfxj57F7VOss9R6LJNu9bKn0m1iw3a76SGN9FBKnD+0Uepk6Fv+A00JovlnLrCgzO
 F4ofxoCO5X62/8nyz3OO6h9pDdrXIO+G+GqxFkMn+R/SOVFIGHnDryESqZkV7sLcUQCAe8
 IJ2W+JC9m/4rai/s4Vzi6m6jI6c/xCip1KrU0KXB6ZcnfUGOeSjCzagxX5WOOd1J9ZxQrz
 eJ5dM3hoLS8DNxr8ReBw2bP4k4ykff3guUKyP5w0PkVWFEaxSFEbq0t9517e3PoDo2YBmU
 oHdHOxK1HBDYh5g9aEny1TNAOGlapYK4JF74SZlB1gyge2WyURuowybU9LCN2Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:48 +0200
Subject: [PATCH i-g-t v2 32/39] tests/chamelium/v3: Implement 4K EDID
 stress test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-32-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2793;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=YO9oQ9jGYXWs05UU2XcUBT1h/KbKhm8LIfpvYAQg0B8=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViaWs5ChIh7CWNWxHq1YeNFGUWvqDUZpX5fy
 d1jhV7qEMCJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YmgAKCRAgrS7GWxAs
 4rPuEACpOCOKWmtGGY6u5X+SIYSLySxHKNAP/XrOmG9O+tuHTu355TnDPzByyqXloAPH47Ruxv4
 5k1wSu8F9PYbQkPWF8sRTkkxTTSS/62eEKAqmogU1tfVfge4vevSW2+gMGNBDdRyUX2ZMGWC5O6
 X0iloLn41YvUkaQ3oTuKfcI6osp1uJliWStNEWgagYR+CZc5bL8Abs8Y0XcX7QT+TNTzITeLxQG
 Ax1/tD0eXUjzZcc6+jULMYl017byuCtrrbrYA8aMiBINzvjcxkvkI6K26nMey6KjkujvPZZzj4+
 V6lNnPclPdyYjkHBX8Syfsc2dvwn0mzGCJ3epnrO5Lp+y19EZuxgr9AJeq3/byTKR6pHBTdKMTT
 k6qf3vdePuWG1suggpvG/gJrPFO41t2onAgHKnsTBbbRTf8oLabjkd5CGXACswmpBApMVmn/m0c
 MVSkHTWIGIXST6qHAX3brzebDtq1Fz9RnfQC6SSaK7t9Uhlgfzgk2gO1kkIjhkXhCxGAzdRGDVS
 2QbD8Pc1r7kCAmp6HiycOlqzFpQIIGNUWHs/+cfoSR+XgK0sNJZ8ENrHAPKm/FG3rLcJKGnOBHQ
 lbfeRUdKRephNV9cXcTIg/a1jdlyQP0jdRGCqRrPtOomMKHWFDidRdaQy8lpg9BaDACnYzmduKi
 zeoX1XTlMjDUyqA==
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

This commit introduces helper functions to utilize monitor EDIDs and
upload them to the Chamelium.

The existing EDID test has been enhanced to also test 4K screens. The
current EDID database includes entries for HDMI and DP ports.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/chamelium/v3/kms_chamelium_v3_edid.c | 46 ++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/tests/chamelium/v3/kms_chamelium_v3_edid.c b/tests/chamelium/v3/kms_chamelium_v3_edid.c
index b8d750ad771d..deef04d97bec 100644
--- a/tests/chamelium/v3/kms_chamelium_v3_edid.c
+++ b/tests/chamelium/v3/kms_chamelium_v3_edid.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: MIT
 
 #include <igt.h>
+
+#include "monitor_edids/monitor_edids_helper.h"
 #include "chamelium/v3/igt_chamelium.h"
 
 static void collect_and_compare_edid(int drm_fd,
@@ -52,6 +54,21 @@ static void igt_custom_edid_type_read(int drm_fd, struct igt_chamelium_v3 *chame
 	upload_and_read_edid(drm_fd, chamelium, port_mapping, igt_kms_get_custom_edid(edid));
 }
 
+static void edid_stress_resolution(int drm_fd, struct igt_chamelium_v3 *chamelium,
+				   struct chamelium_v3_port_mapping *port_mapping,
+				   monitor_edid edids_list[],
+				   size_t edids_list_len)
+{
+	for (int i = 0; i < edids_list_len; i++) {
+		struct edid *edid = edid_from_monitor_edid(&edids_list[i]);
+
+		igt_info("Testing out the EDID for %s\n",
+			 monitor_edid_get_name(&edids_list[i]));
+		upload_and_read_edid(drm_fd, chamelium, port_mapping, edid);
+		free(edid);
+	}
+}
+
 igt_main
 {
 	struct igt_chamelium_v3 *chamelium;
@@ -88,6 +105,35 @@ igt_main
 		}
 	}
 
+	igt_describe("Read many different 4k EDID from the chamelium");
+	igt_subtest_with_dynamic("edid-stress-4k") {
+		struct chamelium_v3_port_mapping *port, *tmp;
+
+		igt_list_for_each_entry_safe(port, tmp, chamelium_v3_get_port_mapping(chamelium),
+					     link) {
+			igt_dynamic_f("port-%d", port->port_id) {
+				drmModeConnectorPtr connector;
+				size_t edid_count = 0;
+				char *name;
+
+				igt_require(!chamelium_v3_is_mst(chamelium, port->port_id));
+
+				name = chamelium_v3_get_port_name(chamelium, port->port_id);
+				igt_info("Testing port %s (%s)\n", port->connector_name, name);
+				free(name);
+
+				connector = chamelium_v3_port_mapping_get_connector(port, drm_fd);
+				igt_assert(connector);
+				edid_stress_resolution(drm_fd, chamelium, port,
+						       get_edids_for_connector_type(connector->connector_type,
+										    &edid_count,
+										    true),
+						       edid_count);
+				drmModeFreeConnector(connector);
+			}
+		}
+	}
+
 	igt_fixture {
 		chamelium_v3_uninit(chamelium);
 		drm_close_driver(drm_fd);

-- 
2.44.2

