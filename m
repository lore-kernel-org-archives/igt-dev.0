Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635DEC27C5E
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 14:30:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED9C10E620;
	Wed,  5 Jun 2024 14:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="MnXhDII7";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B0F10E65A
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 14:30:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 428F740017;
 Wed,  5 Jun 2024 14:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1717597823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JUutTe7whA9FSnBjgmXRvjz844RkAxRQCT+tXclAFWM=;
 b=MnXhDII7Z2poddwc3C3V22jBxeNoLOH0ly/VH2yJD8JTSIIC/+mY88GcwT3ZTIf/WgGFXU
 9l+cJg/cC9m4RqaFbgGumJgOLeCcyImiAYQZ/TMqP65t06MbiD/GEGDHUQWQkpONT3nvHW
 zmjqpZGZSPBhEr8lfXzIn7szMNuphQTmstP5uxKLhjRX+bR9SW1HpzEM/VMBB6unkGx5jM
 /4RN48Uw9C3Tzp8YMjxyN8aT5DdYQ79GWXijY4K5anNgfimpP7Y2IRDYhTr02hIYvI+Clz
 DTTna+wyS+ndsmbWFCx6oTUeNWMCCnaJKayH5atXBTmz1L36NnbiC5pbDg9uxA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 05 Jun 2024 16:30:25 +0200
Subject: [PATCH i-g-t RFC 13/13] tests/chamelium: Add MST test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-dev-remove-static-ports-v1-13-665f25b7a4db@bootlin.com>
References: <20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com>
In-Reply-To: <20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4025;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=ChejISPnXJGCPCQg+iKBvEjPrEQT3wqVfrPY3soX/Us=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmYHZ5KZMik8LMPkHFA+iK/TyzGH+NNGvD3JbpM
 DgxeqTJwB+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZmB2eQAKCRAgrS7GWxAs
 4s8kD/46Xz2LIhb27lHg87QC2Wrbn9w/N0CbtyAAfYnyBw++1JBQJsZdAIZG0aRzeWqDNwY1gC6
 Ss0vmRnDTnyjpFV2Km33suRM2G7MnxoabFLPVgLDfILqh8haGmtTjAwVQAKglHHVyMeZtEnw8iN
 a/UAbPd3LeDZY1UuUGJ5UTRtVXN8corGurt/5tC9JvAXHm81y36fHZ8reMaOg212sxflQtOe3u2
 0PYaUPKpPfLzAMaF2sp7VJLUEhPQZKHVPHLbJLwtDoE4TtX6xuC5ete+W4FhrWoyhkNzpHOXScy
 2db495lsn8lZZbvxXLC4ALDWwlVU/v+YW/VmzBuTF5XHGDzjGLHtQueikS7ob+WXQiiJXR8C4WA
 ozi5k1pxNeqDkzLRR5Hj63cQgZEnc713XuMSjMPjcCHLW/dANVPd9cWhR0NZ+cCj7zldl/xXXsI
 bdkSKVEgc0ihBC+u2++mwo4Ag1x2zR8v/T+I4wgEz4OtK8CIOxsFm16czY+tGzqvWoiTb/aQJKH
 2HeM2+MEJ/ba+3Crb07wVzxaP086REU+VUN0zUBXa7M+3I3Lye3OKzfoVkCv2U0TB/M7U5YEzcO
 HjMsumYWpOTrynKVcZHvvRaDAksHAP9+NjJqV2V0dwHLLMxukWpr4ajYb5m4l81MEgRFPVEOGLt
 2cDDocZD63eFH0A==
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

Introduce a test to check EDID on MST ports. This plug all the children in
the chamelium and apply a different EDID for each.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/chamelium/v3/kms_chamelium_v3_edid.c | 96 ++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/tests/chamelium/v3/kms_chamelium_v3_edid.c b/tests/chamelium/v3/kms_chamelium_v3_edid.c
index efd53b392f4f..b1685c1f2569 100644
--- a/tests/chamelium/v3/kms_chamelium_v3_edid.c
+++ b/tests/chamelium/v3/kms_chamelium_v3_edid.c
@@ -193,6 +193,82 @@ static void test_suspend_resume_edid_change(int drm_fd, struct igt_chamelium_rpc
 	collect_and_compare_edid(drm_fd, port_mapping, igt_kms_get_alt_edid());
 }
 
+static void edid_mst(int drm_fd, struct igt_chamelium_rpc *chamelium, chamelium_port_id port_id)
+{
+	const struct edid *edid = igt_kms_get_base_edid();
+	chamelium_port_id *children_port_ids;
+	int edid_id;
+	int children_port_count = chamelium_get_children_rpc(chamelium, port_id,
+							     &children_port_ids);
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
+	chamelium_reset_rpc(chamelium);
+
+	edid_id = chamelium_create_edid_rpc(chamelium, modified_edids[0]);
+	igt_assert(edid_id);
+	chamelium_apply_edid_rpc(chamelium, port_id, edid_id);
+
+	for (int i = 0; i < children_port_count; i++) {
+		edid_id = chamelium_create_edid_rpc(chamelium, modified_edids[i + 1]);
+		igt_assert(edid_id);
+		chamelium_apply_edid_rpc(chamelium, children_port_ids[i], edid_id);
+	}
+
+	chamelium_plug_with_children_rpc(chamelium, port_id, children_port_ids,
+					 children_port_count);
+	drmModeResPtr res = drmModeGetResources(drm_fd);
+
+	drmModeFreeResources(res);
+	sleep(3);
+	res = drmModeGetResources(drm_fd);
+	for (int i = 0; i <= children_port_count; i++) {
+		bool found = false;
+
+		for (int j = 0; j < res->count_connectors; j++) {
+			drmModeConnectorPtr connector = drmModeGetConnector(drm_fd,
+									    res->connectors[j]);
+			uint64_t edid_blob_id;
+
+			igt_assert(kmstest_get_property(drm_fd, connector->connector_id,
+							DRM_MODE_OBJECT_CONNECTOR, "EDID", NULL,
+							&edid_blob_id, NULL));
+			if (edid_blob_id != 0) {
+				drmModePropertyBlobPtr edid_blob = drmModeGetPropertyBlob(drm_fd,
+											  edid_blob_id);
+
+				igt_assert(edid_blob);
+
+				if (memcmp(modified_edids[i], edid_blob->data,
+					   edid_get_size(modified_edids[i])) == 0)
+					found = true;
+			}
+
+			drmModeFreeConnector(connector);
+		}
+
+		igt_assert_f(found, "No connector were found with the correct EDID.\n");
+
+		free(modified_edids[i]);
+	}
+
+	drmModeFreeResources(res);
+	free(modified_edids);
+}
+
 
 igt_main {
 	struct igt_chamelium_rpc *chamelium;
@@ -316,6 +392,26 @@ igt_main {
 		}
 	}
 
+	igt_describe("Check if hotplug during sleeping are correctly handled");
+	igt_subtest_with_dynamic("DP-MST-edid-read") {
+		chamelium_port_id *port_ids;
+		int port_count;
+
+		port_count = chamelium_get_supported_ports_rpc(chamelium, &port_ids);
+		for (int j = 0; j < port_count; j++) {
+			if (chamelium_is_mst_rpc(chamelium, port_ids[j])) {
+				igt_dynamic_f("port-%d", port_ids[j]) {
+					char *name;
+
+					name = chamelium_get_port_name_rpc(chamelium, port_ids[j]);
+					igt_info("Testing port %s\n", name);
+					free(name);
+
+					edid_mst(drm_fd, chamelium, port_ids[j]);
+				}
+			}
+		}
+	}
 	igt_fixture {
 		chamelium_rpc_uninit(chamelium);
 		drm_close_driver(drm_fd);

-- 
2.43.2

