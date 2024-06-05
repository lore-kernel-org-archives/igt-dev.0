Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEE7C27C65
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 14:30:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FAB10E277;
	Wed,  5 Jun 2024 14:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="bn6zmsUz";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C617910E6FC
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 14:30:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F16E040003;
 Wed,  5 Jun 2024 14:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1717597821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/5Ggvoe8i75n+BKK64f99IlKekVQbML6fM0TJNmgKCc=;
 b=bn6zmsUzuSL6P6m8+q0jm8lW4wioOQlOj2HPorCuhKABuhXWXlA4cvk7PFH4WfeCpq+2nK
 JUFisy98jHv6GSERIO8TJRVk1+LXWlelwr7Kz2sJ4rbLW+/6mWmZvfp0Zm67bfLNyYtJQD
 OyQlR5CTDELpvZrToNdxR3TCCdHQNeGIHCiayuwJBur46g4KVh0rIjFjdb3ddRA8JMiHib
 oAfW34ZiPgThH7CWP3i4L7puEO21GQ2K4yZeBDz1DL7N1Danz2X2cscbgVWzFwDE8TNO3x
 PKSroCj1AW1yNpMuhqq2vA6YFGYGQ/mhLlV/deE1zf5nqbce7pS7Np4fdK1Fow==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 05 Jun 2024 16:30:19 +0200
Subject: [PATCH i-g-t RFC 07/13] tests/chamelium: Introduce basic edid test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-dev-remove-static-ports-v1-7-665f25b7a4db@bootlin.com>
References: <20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com>
In-Reply-To: <20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4128;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=dfjpHaxWrVUkl2ZUU+bX0XIDqxbeTd0drRyoep8dY6w=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmYHZ4/KJHRZGZoYztmRyF8yKme84c1c1D+vKnE
 IA4cRwxuHuJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZmB2eAAKCRAgrS7GWxAs
 4j1vD/oCA4pirUSvRh1DlmTqNUA3BbRnXbVFq5yfVMUhyXLSzCWGL2KEY9rMtsuiLst//4t0kqq
 4JjNN+FpbQW5hOtRRiGIyhJVj62hJL1J00dcm/6vr49dBT+kWKwBZEMTAKkIty2GvPw6u1uYfeK
 8SCDOGqH6FjLzi6cMrJLgkP4ruqoM6w7hk8nf34qhe+vZ9oSotujB/wVSikBJ/atIGc+A6Y7VYc
 0qGxebP/Iw+WAxEXvq1JdY254tE/+ykucYp7pljjxroNoEgxlPz1X0W6YZMOwoCUiPnM2ljSyif
 jbZ5lv6MVeQkVMa+wylds7AoxahDpI75NO3P9ta29yzFKXeEfr6OzRVdGlURUTF1k6hYUdo6sXj
 UgSFTCm4ELz7d1KcjTQY6TivHlBxiaJyrKc2Dh6USKXOJhrJUi6N+gW7hfXBPemTqCx6w+hdpj1
 r7yeUZ/yLZowyy7wR4BR+QfTVHAfNgtTTammk5niNrmobpuis2UkpdXgBFiubfq4/8fLs5bdreS
 I0Mx7LnAEsQa8MQErpYND9G4B7kTjrZFB86Toy9Jlpge/YRPxOgwt2hKU8I878wb4eGUAWDbyqx
 6vCaG/O08+Xn4oNgAC7R9+wY+nJLOgO82z0oC8P70hUeIMfMKt+ZIRf0PUu0LpfXDIXb2aAMHWg
 Xb5CQiRyWgK2Q0g==
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

This commit adds a new Chamelium v3 test that verifies the correct
handling of EDID data. The test uploads a custom EDID to the Chamelium and
then verifies that the EDID data can be read back from the kernel.

This test is inspired from the v2 version.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/chamelium/v3/kms_chamelium_v3_edid.c | 93 ++++++++++++++++++++++++++++++
 tests/meson.build                          |  1 +
 2 files changed, 94 insertions(+)

diff --git a/tests/chamelium/v3/kms_chamelium_v3_edid.c b/tests/chamelium/v3/kms_chamelium_v3_edid.c
new file mode 100644
index 000000000000..acf62ba78a32
--- /dev/null
+++ b/tests/chamelium/v3/kms_chamelium_v3_edid.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: MIT
+
+#include <igt.h>
+#include "chamelium/v3/igt_chamelium.h"
+
+static void collect_and_compare_edid(int drm_fd,
+				     const struct chamelium_rpc_port_mapping *port_mapping,
+				     const struct edid *edid)
+{
+	drmModePropertyBlobPtr edid_blob = NULL;
+	drmModeConnector *connector;
+	uint64_t edid_blob_id;
+
+	connector = chamelium_rpc_port_mapping_get_connector(port_mapping, drm_fd);
+	igt_assert(kmstest_get_property(drm_fd, connector->connector_id,
+					DRM_MODE_OBJECT_CONNECTOR, "EDID", NULL,
+					&edid_blob_id, NULL));
+	igt_assert(edid_blob_id != 0);
+	edid_blob = drmModeGetPropertyBlob(drm_fd, edid_blob_id);
+	igt_assert(edid_blob);
+
+	igt_assert(memcmp(edid, edid_blob->data, edid_get_size(edid)) == 0);
+
+	drmModeFreePropertyBlob(edid_blob);
+	drmModeFreeConnector(connector);
+}
+
+static void upload_and_read_edid(int drm_fd, struct igt_chamelium_rpc *chamelium,
+				 const struct chamelium_rpc_port_mapping *port_mapping,
+				 const struct edid *edid)
+{
+	drmModePropertyBlobPtr edid_blob = NULL;
+	drmModeConnector *connector;
+	uint64_t edid_blob_id;
+	int edid_id;
+
+	chamelium_reset_rpc(chamelium);
+	edid_id = chamelium_create_edid_rpc(chamelium, edid);
+	chamelium_apply_edid_rpc(chamelium, port_mapping->port_id, edid_id);
+	chamelium_plug_rpc(chamelium, port_mapping->port_id);
+
+	connector = chamelium_rpc_port_mapping_get_connector(port_mapping, drm_fd);
+	assert(igt_wait_for_connector_status(drm_fd, connector->connector_id, 10.0,
+					     DRM_MODE_CONNECTED));
+	drmModeFreeConnector(connector);
+
+	collect_and_compare_edid(drm_fd, port_mapping, edid);
+}
+
+static void igt_custom_edid_type_read(int drm_fd, struct igt_chamelium_rpc *chamelium,
+				      struct chamelium_rpc_port_mapping *port_mapping,
+				      enum igt_custom_edid_type edid)
+{
+	upload_and_read_edid(drm_fd, chamelium, port_mapping, igt_kms_get_custom_edid(edid));
+}
+
+igt_main {
+	struct igt_chamelium_rpc *chamelium;
+	int drm_fd;
+
+	igt_fixture {
+		chamelium = chamelium_rpc_init_from_config();
+		igt_assert(chamelium);
+		drm_fd = drm_open_driver_master(DRIVER_ANY);
+		igt_assert(drm_fd);
+		chamelium_rpc_fill_port_mapping(chamelium, drm_fd);
+	}
+
+	igt_describe("Read basic EDID from the chamelium.");
+	igt_subtest_with_dynamic("edid-read-basic") {
+		struct chamelium_rpc_port_mapping *port, *tmp;
+
+		igt_list_for_each_entry_safe(port, tmp, chamelium_rpc_get_port_mapping(chamelium),
+					     link) {
+			igt_dynamic_f("port-%d", port->port_id) {
+				char *name;
+
+				name = chamelium_get_port_name_rpc(chamelium, port->port_id);
+				igt_info("Testing port %s (%s)\n", port->connector_name, name);
+				free(name);
+				igt_custom_edid_type_read(drm_fd, chamelium, port,
+							  IGT_CUSTOM_EDID_BASE);
+				igt_custom_edid_type_read(drm_fd, chamelium, port,
+							  IGT_CUSTOM_EDID_ALT);
+			}
+		}
+	}
+
+	igt_fixture {
+		chamelium_rpc_uninit(chamelium);
+		drm_close_driver(drm_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 51396548eec9..c37180eb3d3d 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -336,6 +336,7 @@ chamelium_v2_progs = [
 
 chamelium_v3_progs = [
 	'kms_chamelium_v3_basic',
+	'kms_chamelium_v3_edid',
 ]
 
 test_deps = [ igt_deps ]

-- 
2.43.2

