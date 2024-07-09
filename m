Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06F7C3DA41
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:35:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A1D10E5D2;
	Tue,  9 Jul 2024 15:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Uxr2UQXN";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326FE10E5C0
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:35:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A779620010;
 Tue,  9 Jul 2024 15:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9iLdbcaX83bzc+WhrzNb3+OUwT8KIY9uztI5JvL6ReQ=;
 b=Uxr2UQXNqYgSWWL90ngyb5E2ETyvZQcOeeNyx2+pODXzwzSK4qRYDLw9AyoHQ4V96lmPXm
 WOWxcwIi6NFZGROdDaWFMu2tIFAU2RaY0y/UzjUVIDDdX4Knwedcoqx5IxE2rhXDmamgN7
 sOUwKsKGp1HLZ8yVnUl2TysKpd6SKbmsDqpVWtI2n56MNv8f2W1jeh/27k29iAD/HfuuS8
 /GvbnQRoYUMvptoPYaQ9pR0cPK0+/320GYqLgiQNQFSXnRmikIU4a62FUGXH1jYuxa6kKo
 QUSNTuZKmRXqn2vkVd14djT/05J3mCG36T0ZWLpdJFxug111kTR2Q/YA9QQKEw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:54 +0200
Subject: [PATCH i-g-t v2 38/39] tests/chamelium/v3: Add MST EDID reading test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-38-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3901;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=GZgECYoO17zsIwTWLY4nFc/5USeIYbN0PNDXhT0vngw=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjVia3qPfOwNDcYpwOXswpFHPnRSGgUNME7itm
 de+QQCrEgWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YmgAKCRAgrS7GWxAs
 4rFTD/wLPFMl3Qsb3khKDw7DNPgv7DCiEy4rd+aopeIOvlUoCEZjPno2vMqNvg3xGmYQ/rHsy9A
 WhA/18yE2LtgARVU9hK/h6F6gl9eBnUAzM7W3PYWIbw67Vs/12kccJ0RFxLDPDs1vd2X7ETJJlZ
 H+uFB3hPOJ2tZUjmGj1CI1HHDHGwQDOT6wiEZ9gQoPmn6EX0t6E+X3UsnWGGfBWAGqGcblHJwZP
 VDSDT1c6RiidUBBVsXCQ+5Lc0kBU1p28ZnEJ0yCYGubRk6P7z/1yJzTFgL3oHcbgxT8UyzVEruI
 U1eKgQ3x5u0JNOuVD/h2T+JBPGba+VuPasje3z1blROWnhVLribIDK34HPKUzESAi2k43ZLjL4P
 QmZAQ8abrdiCl73WOP+tisWrSnJr5JeZLZXM3ISRLH3KmRB0M3+7S61nZhSUvC12SgB6BnHpiLX
 NNFgxY9V9EbSGE89oic1M8HUc4PR80K+7T7DofrlR00hlP0XXZX1xQE+lSf3amQR36wsGPVvRxG
 Ruv8esYjN0wg3TD7iVqpq6P3ABUjAu+KWKnEMYDyywuo2h0dpdh2iJUrnBw8d1ID8fAwuxXJXNc
 KfKuuz11LdYs9zEc7R51emjvifNFL5wmLtdgQ5qeq1d1vSFaBl0eUTqNGWAsTF/SMs/zCOvWfaV
 GCfRUrbYMQJ3W+w==
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

This commit introduces a new test for the Chameleon V3 display adapter to
ensure that EDID is correctly read from MST ports.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/chamelium/v3/kms_chamelium_v3_edid.c | 86 ++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/tests/chamelium/v3/kms_chamelium_v3_edid.c b/tests/chamelium/v3/kms_chamelium_v3_edid.c
index a73875214915..51dcdcb9e892 100644
--- a/tests/chamelium/v3/kms_chamelium_v3_edid.c
+++ b/tests/chamelium/v3/kms_chamelium_v3_edid.c
@@ -190,6 +190,70 @@ static void test_suspend_resume_edid_change(int drm_fd, struct igt_chamelium_v3
 	collect_and_compare_edid(drm_fd, port_mapping, igt_kms_get_alt_edid());
 }
 
+static void edid_mst(int drm_fd, struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id)
+{
+	const struct edid *edid = igt_kms_get_base_edid();
+	chamelium_v3_port_id *children_port_ids;
+	struct chamelium_v3_port_mapping *chamelium_port_mapping;
+	drmModeResPtr res;
+	int edid_id;
+	int children_port_count = chamelium_v3_get_children(chamelium, port_id,
+							    &children_port_ids);
+
+	struct edid **modified_edids;
+
+	modified_edids = calloc(children_port_count + 1, sizeof(*modified_edids));
+	igt_assert(modified_edids);
+
+	for (int i = 0; i <= children_port_count; i++) {
+		modified_edids[i] = malloc(edid_get_size(edid));
+		memcpy(modified_edids[i], edid, edid_get_size(edid));
+		modified_edids[i]->serial[0] = i;
+		modified_edids[i]->serial[1] = i;
+		modified_edids[i]->serial[2] = i;
+		modified_edids[i]->serial[3] = i;
+		edid_update_checksum(modified_edids[i]);
+	}
+
+	chamelium_v3_reset(chamelium);
+
+	edid_id = chamelium_v3_create_edid(chamelium, modified_edids[0]);
+	igt_assert(edid_id);
+	chamelium_v3_apply_edid(chamelium, port_id, edid_id);
+
+	for (int i = 0; i < children_port_count; i++) {
+		edid_id = chamelium_v3_create_edid(chamelium, modified_edids[i + 1]);
+		igt_assert(edid_id);
+		chamelium_v3_apply_edid(chamelium, children_port_ids[i], edid_id);
+	}
+
+	chamelium_v3_plug_with_children(chamelium, port_id, children_port_ids,
+					children_port_count);
+	sleep(3);
+
+	res = drmModeGetResources(drm_fd);
+
+	chamelium_port_mapping = chamelium_v3_get_port_mapping_for_chamelium_port_id(chamelium,
+										     port_id);
+	igt_assert(chamelium_port_mapping);
+	igt_assert(chamelium_port_mapping->mst_path);
+	collect_and_compare_edid(drm_fd, chamelium_port_mapping, modified_edids[0]);
+	free(modified_edids[0]);
+
+	for (int i = 0; i < children_port_count; i++) {
+		chamelium_port_mapping = chamelium_v3_get_port_mapping_for_chamelium_port_id(chamelium,
+											     children_port_ids[i]);
+		igt_assert(chamelium_port_mapping);
+		igt_assert(chamelium_port_mapping->mst_path);
+		collect_and_compare_edid(drm_fd, chamelium_port_mapping, modified_edids[i + 1]);
+		free(modified_edids[i + 1]);
+	}
+
+	drmModeFreeResources(res);
+	free(modified_edids);
+	free(children_port_ids);
+}
+
 igt_main
 {
 	struct igt_chamelium_v3 *chamelium;
@@ -326,6 +390,28 @@ igt_main
 		}
 	}
 
+	igt_describe("Check if hotplug during sleeping are correctly handled");
+	igt_subtest_with_dynamic("DP-MST-edid-read") {
+		chamelium_v3_port_id *port_ids;
+		int port_count;
+
+		port_count = chamelium_v3_get_supported_ports(chamelium, &port_ids);
+		for (int j = 0; j < port_count; j++) {
+			igt_dynamic_f("port-%d", port_ids[j]) {
+				char *name;
+
+				igt_require(chamelium_v3_is_mst(chamelium, port_ids[j]));
+
+				name = chamelium_v3_get_port_name(chamelium, port_ids[j]);
+				igt_info("Testing port %s\n", name);
+				free(name);
+
+				edid_mst(drm_fd, chamelium, port_ids[j]);
+			}
+		}
+		free(port_ids);
+	}
+
 	igt_fixture {
 		chamelium_v3_uninit(chamelium);
 		drm_close_driver(drm_fd);

-- 
2.44.2

