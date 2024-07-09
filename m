Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B20C3DA49
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:35:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDF910E5BE;
	Tue,  9 Jul 2024 15:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="HTaz1qlN";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9B810E5BE
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:35:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D36BA20018;
 Tue,  9 Jul 2024 15:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mRZpk2oRq0AIAjSRqHKk59KEmaJ8wNZQcqFm91FlnCc=;
 b=HTaz1qlNNRkeaV3kzAkOtyYndpdS8BX8fR8rjtPy+zjC8fpAnQIwnki3YjJNHY0gmnPTMQ
 6WWK5zp3HI14tTsjfkIW/2c+MeMdpj6j7YI34yY7T3jEQrMbFj32Mdw33ZYj2Y0tGZstBi
 UOJ0UrH6XP5HQATTf/KHRw4iZHx1EEJWoqTY+NjabxnJfICcUVskX04LMcr5vdobA2LbjK
 bx2dB/psOmrkW3oT9sZRwgrsHQMzyyOAk4D0aOxSeuaO1mQ/eByM0AoLNWXti4tnI9d6VR
 RLFasxPwJ7vKNwEGJVxV9XE7WXykmuq9Cs1NuUOhh2dNayxGgWpFN4zFLW4GIQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:47 +0200
Subject: [PATCH i-g-t v2 31/39] tests/chamelium/v3: Implement basic EDID
 handling test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-31-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4115;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=9IEK/0HJ4+yzA+JssR6c3PqurcrB786RfaaAt+UP7Bw=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjVia3XClNBu5l0YAJ4GMdahyBfcm8Z4lUjj21
 gdfrnkFYlaJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YmgAKCRAgrS7GWxAs
 4kwCEAC1w40fL/rIfv6RXbq8Qw1+pl+JatLYkCeBYRxAf9Hbk/WREf1xphTWe7O8pNzQAOj3daR
 YhpICFJT+DEMxnR3b11IjJAfDXzM6djyodALofW8rFv4fp9ovoHydS15mxBRI+kgX7C5f7dClZ1
 fxhlVQkptoUvKVGEs3k2jy87hA28p3mfV8pOi79cdEOIaOEagmF6bFIKzMzXeQo1T2EIvSqTHsL
 gK9nqr7IIbNslksknDnI0COrwkUYMZJUVlLEGpiFJcF41Ls68usUYZETTFpVhRXsavWlp1zw8il
 BvJqsefFFsZB0sDIOStnA75J5jcbHmoZb+JtJLJqvVoEMOnrTIzRaHsPgyac/NWdoG0YL6Ebm8v
 OSspUg8omFaUYNz89qiWFOIxvvfLhvXZMQ3DwcxITd/3Rq0jQupEvtvWqaQJ3x1RQoXpM3ghVs8
 Fz0SQwppJVPAjSzCJKEd3/40fIfQyJADzmduYtQ3z2Pw5IgyIpey2HrMQMh5G6hxBvqzUP6ITqv
 d4Yyo1X6MP3RBAoWG6UhqSe8CEwlHXCKoiCYnEq3sjW+5zug7yvhih7ge2gThtefTgKyx1HGI2c
 KZGpEYiASO/ySfAusXMcHUHnN299M7tB3GClrbJuPymGQE6UOTPlFKf5u2UbSOQd1dOiSrmZHRn
 PEpVRIuHFXpJJJw==
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

This commit introduces a new Chamelium v3 test to validate the proper
handling of EDID data. The test uploads a custom EDID to the Chamelium and
then confirms that the EDID data can be accurately read back from the
kernel.

This test is adapted from the v2 version.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/chamelium/v3/kms_chamelium_v3_edid.c | 95 ++++++++++++++++++++++++++++++
 tests/meson.build                          |  1 +
 2 files changed, 96 insertions(+)

diff --git a/tests/chamelium/v3/kms_chamelium_v3_edid.c b/tests/chamelium/v3/kms_chamelium_v3_edid.c
new file mode 100644
index 000000000000..b8d750ad771d
--- /dev/null
+++ b/tests/chamelium/v3/kms_chamelium_v3_edid.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: MIT
+
+#include <igt.h>
+#include "chamelium/v3/igt_chamelium.h"
+
+static void collect_and_compare_edid(int drm_fd,
+				     const struct chamelium_v3_port_mapping *port_mapping,
+				     const struct edid *edid)
+{
+	drmModePropertyBlobPtr edid_blob = NULL;
+	uint64_t edid_blob_id;
+
+	uint32_t connector_id = chamelium_v3_port_mapping_get_connector_id(port_mapping, drm_fd);
+
+	/* Force refresh of properties */
+	drmModeFreeConnector(drmModeGetConnector(drm_fd, connector_id));
+	igt_assert(kmstest_get_property(drm_fd, connector_id,
+					DRM_MODE_OBJECT_CONNECTOR, "EDID", NULL,
+					&edid_blob_id, NULL));
+	igt_assert(edid_blob_id);
+	edid_blob = drmModeGetPropertyBlob(drm_fd, edid_blob_id);
+	igt_assert(edid_blob);
+	igt_assert(memcmp(edid, edid_blob->data, edid_get_size(edid)) == 0);
+
+	drmModeFreePropertyBlob(edid_blob);
+}
+
+static void upload_and_read_edid(int drm_fd, struct igt_chamelium_v3 *chamelium,
+				 const struct chamelium_v3_port_mapping *port_mapping,
+				 const struct edid *edid)
+{
+	uint32_t connector_id;
+
+	int edid_id;
+
+	chamelium_v3_reset(chamelium);
+	edid_id = chamelium_v3_create_edid(chamelium, edid);
+	chamelium_v3_apply_edid(chamelium, port_mapping->port_id, edid_id);
+	chamelium_v3_plug(chamelium, port_mapping->port_id);
+
+	connector_id = chamelium_v3_port_mapping_get_connector_id(port_mapping, drm_fd);
+	igt_assert(igt_wait_for_connector_status(drm_fd, connector_id, 10.0,
+						 DRM_MODE_CONNECTED));
+
+	collect_and_compare_edid(drm_fd, port_mapping, edid);
+}
+
+static void igt_custom_edid_type_read(int drm_fd, struct igt_chamelium_v3 *chamelium,
+				      struct chamelium_v3_port_mapping *port_mapping,
+				      enum igt_custom_edid_type edid)
+{
+	upload_and_read_edid(drm_fd, chamelium, port_mapping, igt_kms_get_custom_edid(edid));
+}
+
+igt_main
+{
+	struct igt_chamelium_v3 *chamelium;
+	int drm_fd;
+
+	igt_fixture {
+		chamelium = chamelium_v3_init_from_config();
+		igt_assert(chamelium);
+		drm_fd = drm_open_driver(DRIVER_ANY);
+		igt_assert(drm_fd);
+		chamelium_v3_fill_port_mapping(chamelium, drm_fd);
+	}
+
+	igt_describe("Read basic EDID from the chamelium.");
+	igt_subtest_with_dynamic("edid-read-basic") {
+		struct chamelium_v3_port_mapping *port, *tmp;
+
+		igt_list_for_each_entry_safe(port, tmp, chamelium_v3_get_port_mapping(chamelium),
+					     link) {
+			igt_dynamic_f("port-%d", port->port_id) {
+				char *name;
+
+				igt_require(!chamelium_v3_is_mst(chamelium, port->port_id));
+
+				name = chamelium_v3_get_port_name(chamelium, port->port_id);
+				igt_info("Testing port %s (%s)\n", port->connector_name, name);
+				free(name);
+
+				igt_custom_edid_type_read(drm_fd, chamelium, port,
+							  IGT_CUSTOM_EDID_BASE);
+				igt_custom_edid_type_read(drm_fd, chamelium, port,
+							  IGT_CUSTOM_EDID_ALT);
+			}
+		}
+	}
+
+	igt_fixture {
+		chamelium_v3_uninit(chamelium);
+		drm_close_driver(drm_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index e36ae9b18ffc..ebaf1cb9ebb2 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -326,6 +326,7 @@ chamelium_v2_progs = [
 
 chamelium_v3_progs = [
 	'kms_chamelium_v3_basic',
+	'kms_chamelium_v3_edid',
 ]
 
 test_deps = [ igt_deps ]

-- 
2.44.2

