Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B47C27C53
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 14:30:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E92A10E2B0;
	Wed,  5 Jun 2024 14:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="O0tianE9";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79AE10E7CD
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 14:30:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B24B440015;
 Wed,  5 Jun 2024 14:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1717597822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HvaWAf7KbsLgnnIJCxUJgVyJi/PY7o+h4NWbdI8baJg=;
 b=O0tianE9kEHZTxVHFzdaRdGfhFjGSg6NdpXuo8m3VKh6TnVGYhE3RDVILlmADW4vZ+SWfh
 AnITYWGSr36IoHCxFDw1WsojzPI1UQrV6CPVH69HSjGEpkRJTYYIccdjH36hifnok0VL2Y
 dr+E+yrQZRwKZszEKwoz03Vz6KQkpbdpjcyO9/V6qZkA20tHZcsxAXUrqXJ3qN9QfZhwWU
 umNRHqWPtyKuVwjdNP5YCUMVCKtxG4kkY948DSs06zm8HSJ9RwHAovUtLOjzzQ3epp/puf
 vrbvPbnCBhzDwXZ6fb3zLsFPLqetfG/sC+UW9sqyeS+yS0Sy1IlhspRj7kKpVg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 05 Jun 2024 16:30:21 +0200
Subject: [PATCH i-g-t RFC 09/13] tests/chamelium: Introduce 4k stress edid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-dev-remove-static-ports-v1-9-665f25b7a4db@bootlin.com>
References: <20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com>
In-Reply-To: <20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2697;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=LbVHQvGrQ03yuvyJFtmYZky4gyk8eOzEoguXj65p5Vk=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmYHZ4zLl3XmEnb5XPfL7Imi5zXIbilfoUrvDoR
 CCqStHS6WiJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZmB2eAAKCRAgrS7GWxAs
 4uozEACtz8r2aBYl29AodEd2Ib1cA7NVx1MCWHy6OxcOoJ3lHbOA6b/m8IJLmflo08YCh/4wBPG
 SS+qC+icMR0o/ZLYZ+06vkkC/9/vBVzzJz9DFLQ7aPVAfCdZagVfX7VtHbpzGWUcMO36S++B1Du
 hL2KjRXolvNeD+nhyIIjcbe+SnsVBVYHu3OS47+sfskV0xOa+2s9TDi1zmfLpmt7EpvyDvtx0jn
 im5z45PlB71SdeyDrsH8iXCMztdLQzuvBISeYCJBMSH9/OyS8JCvmgCxi2wvkJma4y3ybC/NRU7
 nnvht4cyuVenlBxJOi40IU6mG7K92+MgwN/gwb8yTts2AuAoAQPgZA9fGLvtjzjSG4qciK3BzHg
 DPDgkgDmHatUnk1r1nVha0FJzly4+Sm9DRIiNTVRqKd9JymqoNxOs8W1pLTi78SONGEnhvCsRsJ
 MP4IVOmNFLvB3vGZSP/GCc7YANh7DgwsQPyIaZ4J2Seg8vU8BoAcBhVcKtBc7bVzyTqUIZFfYQr
 oSff0mz9PGcPkBb6ZopvxEhVgfQVKAdnKs09XKKq1oSTke9lqHePewcv85X+v8g6qClrRsdcm1X
 cf2nhipIpmn06TXGcCbDK/VX5yWq54glPu38NRLPWX09oKB+kSx63WLK4EHPvj/OvGDZ1TOu2FO
 ml1uB4MJxBL2W5g==
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

Introduce some helpers to uses monitor edid and upload them to the
chamelium.

Complement the EDID test to also test 4k screens. The current database
contains EDID for HDMI and DP ports.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/chamelium/v3/kms_chamelium_v3_edid.c | 45 ++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/tests/chamelium/v3/kms_chamelium_v3_edid.c b/tests/chamelium/v3/kms_chamelium_v3_edid.c
index acf62ba78a32..76bdddd81174 100644
--- a/tests/chamelium/v3/kms_chamelium_v3_edid.c
+++ b/tests/chamelium/v3/kms_chamelium_v3_edid.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: MIT
 
 #include <igt.h>
+#include "monitor_edids/monitor_edids_helper.h"
 #include "chamelium/v3/igt_chamelium.h"
 
 static void collect_and_compare_edid(int drm_fd,
@@ -54,6 +55,22 @@ static void igt_custom_edid_type_read(int drm_fd, struct igt_chamelium_rpc *cham
 	upload_and_read_edid(drm_fd, chamelium, port_mapping, igt_kms_get_custom_edid(edid));
 }
 
+static void edid_stress_resolution(int drm_fd, struct igt_chamelium_rpc *chamelium,
+				   struct chamelium_rpc_port_mapping *port_mapping,
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
+
 igt_main {
 	struct igt_chamelium_rpc *chamelium;
 	int drm_fd;
@@ -86,6 +103,34 @@ igt_main {
 		}
 	}
 
+	igt_describe("Read many different 4k EDID from the chamelium");
+	igt_subtest_with_dynamic("edid-stress-4k") {
+		struct chamelium_rpc_port_mapping *port, *tmp;
+
+		igt_list_for_each_entry_safe(port, tmp, chamelium_rpc_get_port_mapping(chamelium),
+					     link) {
+			igt_dynamic_f("port-%d", port->port_id) {
+				drmModeConnectorPtr connector;
+				size_t edid_count;
+				char *name;
+
+				name = chamelium_get_port_name_rpc(chamelium, port->port_id);
+				igt_info("Testing port %s (%s)\n", port->connector_name, name);
+				free(name);
+
+				connector = chamelium_rpc_port_mapping_get_connector(port, drm_fd);
+				igt_assert(connector);
+				edid_stress_resolution(drm_fd, chamelium, port,
+						       get_edid_for_connector_type(connector->connector_type,
+										   &edid_count,
+										   true),
+						       edid_count);
+
+				drmModeFreeConnector(connector);
+			}
+		}
+	}
+
 	igt_fixture {
 		chamelium_rpc_uninit(chamelium);
 		drm_close_driver(drm_fd);

-- 
2.43.2

