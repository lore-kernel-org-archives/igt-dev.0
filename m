Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DE0CCF9E3
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:40:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9E610E3B9;
	Mon, 10 Nov 2025 13:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="T+IaGIDz";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69DB410E3B9
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:40:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 546CC4E41608;
 Mon, 10 Nov 2025 13:39:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2C08C606F5;
 Mon, 10 Nov 2025 13:39:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 40D951037188A; Mon, 10 Nov 2025 14:39:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762781998; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=+8E2v68A4MExtyzqrTRGnIbKnXuEdX23VigGYPpZt6M=;
 b=T+IaGIDznSmZYv14WNBGUX2EzcL4DLaD9sTMYJJ2EGHwQ9dEWFBN0ll3PU156A4o4yVzYC
 cr6S39eWUy4ZsANvvwKQY+oNmsTTAGD5wr80W5Kuex/x7WBRVF60gR1J9b7awhGwdfwQ23
 KZOIJyhMCFiVOwfzuW1bT4fqpJsn6+yHpMBzUQao8CUyA/OY9tHXiDErjVA9htMCwIvq1X
 l3cwBx+heSH4tttmDN0WKQiZWj1zph5J4ySaG4UIURNsMuVf/nPC79xTp+lk2IeFz/EHt9
 01IAZuaJsr3+VvuIg7EwBRNXYUtSMH68hKUSQYthjXx0GilWkBXTrxi6N3zQIQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:32 +0000
Subject: [PATCH i-g-t v4 30/46] tests/unigraf: Add basic unigraf tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-30-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5073;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=qX/vTYsC+gmAfi26Qyy+0cFivVrTOSYWel98GfjQyhE=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesRBlGV11W/+RyFuy1UcHgonJ+Pnjr5U4oOo
 QEPTg/u8SGJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrEQAKCRAgrS7GWxAs
 4gT3D/9RFawsT5iBPBtSWVUH2wn3kxH3A8W/RwxVay++8LvJkGSvVuZHbhJ4tCme0W+b3rJ37BW
 l77950qszxgJuM4/MGVtXXw7jT9/JajyAtqOwtfl9+y6ARvn6ZO9pUV293m4/wuDIGWqaK14Xgg
 8Pz1FLlAlWQQKLYeb+O5+heh8gtItzwOEHHYMMSIqNm3lgTJnrKCKNdrjxeSPzY3K1EZ+dTXS3g
 P222IO39HD7qo8tfaYuxUikJaLhRa5RAZmQ7h5FXiQIN8bJF4pg9Yohtf4DmY9Mt3eQ4xTwfHAL
 MitORjX2sSf1b6tuHqCBj1GZgSw5lx5MUjsnPVmilL1vsr/JvKCc17VAYp9rprJ6+Fa1cU+djGP
 8TV0hXBpdgw7gaQs2fwayBazGxBR+C3Bqcl0eQuoCfcsa00wBmH2VUwpZOlFNw/cQfsbtSJz+YZ
 bF9ppRFJZe3Vdtv3O3VwUbnK5FA7iBq7tMBwAZKNg68Gz0ilO8YfXNqUqKSCrjz3YIcZ8ALOTBP
 x4GlXHEhyp339UKedSiD7roUbKdfVEsg9RY3XjmZiD1+ONsgkzhGlIi9SJB009txe7C6vv5Vcw6
 6n8EqlsQLeMNmbmEc6R36m2GVF0nMXbjjqzbQYFndRsZvZusj/lo+AKBoVT6yWyAJO7K19A8Hcq
 iJ2V8ZMkNMt5RgQ==
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

Adds two tests to validate unigraf communication.

unigraf-connected checks if the device is connected and if the EDID is
properly applied.

ungiraf-disconnect checks if the device can be connected/reconnected using
SST and MST configurations.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/meson.build                    |   4 ++
 tests/unigraf/meson.build            |  12 ++++
 tests/unigraf/unigraf_connectivity.c | 123 +++++++++++++++++++++++++++++++++++
 3 files changed, 139 insertions(+)

diff --git a/tests/meson.build b/tests/meson.build
index 9736f2338507..30bad12a904d 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -463,6 +463,10 @@ foreach prog : intel_progs
 	endif
 endforeach
 
+if libtsi.found()
+	subdir('unigraf')
+endif
+
 if chamelium.found()
 	foreach prog : chamelium_progs
 		testexe = executable(prog,
diff --git a/tests/unigraf/meson.build b/tests/unigraf/meson.build
new file mode 100644
index 000000000000..4ef8c32151e4
--- /dev/null
+++ b/tests/unigraf/meson.build
@@ -0,0 +1,12 @@
+unigraf_progs = [
+	'unigraf_connectivity',
+]
+
+foreach prog : unigraf_progs
+	test_executables += executable(prog, prog + '.c',
+				       dependencies : test_deps,
+				       install_dir : unigrafdir,
+				       install_rpath : unigraf_rpathdir,
+				       install : true)
+	test_list += join_paths('unigraf', prog)
+endforeach
diff --git a/tests/unigraf/unigraf_connectivity.c b/tests/unigraf/unigraf_connectivity.c
new file mode 100644
index 000000000000..38b777a89228
--- /dev/null
+++ b/tests/unigraf/unigraf_connectivity.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: MIT
+
+#include <stdint.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <xf86drmMode.h>
+
+#include "drmtest.h"
+#include "igt_aux.h"
+#include "igt_core.h"
+#include "igt_kms.h"
+#include "unigraf/unigraf.h"
+
+/**
+ * TEST: unigraf connectivity
+ * Category: Core
+ * Description: Testing connectivity with a unigraf device
+ *
+ * SUBTEST: unigraf-open
+ * Description: Make sure that a unigraf device can be accessed
+ *
+ * SUBTEST: unigraf-connected
+ * Description: Make sure that the unigraf device is connected to the DUT
+ */
+
+IGT_TEST_DESCRIPTION("Test basic unigraf connectivity");
+igt_main
+{
+	int drm_fd;
+
+	igt_fixture {
+		drm_fd = drm_open_driver_master(DRIVER_ANY);
+	}
+
+	igt_describe("Make sure that the unigraf device is connected to the DUT");
+	igt_subtest("unigraf-connected") {
+		drmModePropertyBlobPtr edid_blob = NULL;
+		struct igt_display display;
+		uint64_t edid_blob_id;
+		igt_output_t *output;
+		uint32_t unigraf_edid_len;
+		void *unigraf_edid;
+		bool found = false;
+
+		unigraf_require_device(drm_fd);
+		unigraf_hpd_deassert();
+		sleep(1);
+		unigraf_set_sst();
+		unigraf_hpd_assert();
+
+		sleep(5);
+
+		igt_display_require(&display, drm_fd);
+		sleep(5);
+
+		unigraf_edid = unigraf_read_edid(0, &unigraf_edid_len);
+
+		for_each_connected_output(&display, output) {
+			if (output->config.connector->connector_type ==
+			    DRM_MODE_CONNECTOR_DisplayPort) {
+				igt_assert(kmstest_get_property(drm_fd,
+								output->config.connector->connector_id,
+								DRM_MODE_OBJECT_CONNECTOR, "EDID",
+								NULL, &edid_blob_id, NULL));
+				edid_blob = drmModeGetPropertyBlob(drm_fd, edid_blob_id);
+				if (!edid_blob)
+					continue;
+
+				found |= memcmp(unigraf_edid, edid_blob->data,
+						min(edid_blob->length, unigraf_edid_len)) == 0;
+
+				drmModeFreePropertyBlob(edid_blob);
+			}
+		}
+		igt_assert_f(found, "No output with the correct EDID was found\n");
+
+		free(unigraf_edid);
+	}
+
+	igt_describe("Make sure that the unigraf device can be deconnected/reconnected");
+	igt_subtest("ungiraf-disconnect") {
+		int newly_connected_count, already_connected_count, diff_len;
+		uint32_t *newly_connected = NULL, *already_connected = NULL, *diff = NULL;
+		int max_count;
+
+		unigraf_require_device(drm_fd);
+		max_count = unigraf_get_mst_stream_max_count();
+
+		unigraf_hpd_deassert();
+
+		already_connected_count = igt_get_connected_connectors(drm_fd, &already_connected);
+
+		igt_debug("Already connected count: %d\n", already_connected_count);
+
+		// i = 0 is SST
+		for (int i = 0; i <= max_count; i++) {
+			unigraf_hpd_deassert();
+
+			sleep(1);
+			unigraf_set_mst_stream_count(max(i, 1));
+			if (i == 0)
+				unigraf_set_sst();
+			else
+				unigraf_set_mst();
+
+			unigraf_hpd_assert();
+
+			sleep(5);
+
+			newly_connected_count = kms_wait_for_new_connectors(&newly_connected,
+									    already_connected,
+									    already_connected_count,
+									    drm_fd);
+
+			diff_len = get_list_diff(newly_connected, newly_connected_count,
+						 already_connected, already_connected_count, &diff);
+
+			igt_assert_f(diff_len == max(i, 1),
+				     "Invalid connected connector count, expected %d found %d\n",
+				     max(i, 1), diff_len);
+		}
+	}
+}

-- 
2.51.0

