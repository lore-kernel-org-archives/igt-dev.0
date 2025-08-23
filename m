Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4708CA0EEB
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 02:20:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8821410E31D;
	Sat, 23 Aug 2025 02:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="TErVsVfK";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A119410E2A5
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:20:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 56FD14E40C3F
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:12:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 30FC9606A7;
 Sat, 23 Aug 2025 02:12:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6EDF01C22CD91; 
 Sat, 23 Aug 2025 04:12:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755915121; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=9F7aHVCbljn7wF+Qh4UAi85O75jB+YaKhWtbReT1r/g=;
 b=TErVsVfKPdUJrgWkDyXybksKjNYEYqlSZXMcsqZhGvlrzUbjYtaNBuYdxvEP4KaQ6HL3ZQ
 GZzoc46gHEIUnW7Vcd8LZQEj2vQp+H0almdU9YMcKBP9LY0xSEpSTn8NNoLqBLGAIljDMM
 F7jJXm41pZE7OSG0LNrfivMQSovqnurgO4SZxeStzCVgbk/dAt7+PfqOZuDRCywV5CfweM
 nEuJy7UoqeQPvn3PwL9h5GJA8cN4dN7o0XwTGQB/BD/CYCfX/IP5VP6w/otAWMtndBvqhg
 AxlvSUQLG6z8ZJ6igROfw0/+iunJO9Vuj/506aHnt2svc8ibbatIRJniZGdT8w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 23 Aug 2025 04:11:44 +0200
Subject: [PATCH i-g-t v3 24/29] tests/unigraf: Add basic unigraf tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-unigraf-integration-v3-24-cdc36d5fab4c@bootlin.com>
References: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
In-Reply-To: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5233;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=0WoJUjlNpTOkUVAg62zxyZNzh3McX3fJJmud/uC/a7c=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoqSNXvnKaIG0J2NBdX0koxKyuOtm+FCI46QgKJ
 0Xme3imiR6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaKkjVwAKCRAgrS7GWxAs
 4udUD/4uNr05aOqd4MnioR+FaZnBO38J4/LGBZP3NBR07i4Y3E631ATQPPcG0BhH7tyxlQ1H9h6
 nn2Y4flny/NRoP+SjjKY0uOcExT9klxoiSs+nA+1esI4WMHsxHvQbNTDZXIVUsbSztzTIMr06Ud
 xDvIGcRcVQ3mDJjT+Xwo+aa71tpDRVCO3fwownTr6fTHrkkVvZXTObMA5B88BvRDAWJW74wmZ0I
 fG013hJEDvVRXUUAUDgM3JXwrZzWDFu2x95ljIUTWEzzHsU9TPSQHJVuh2iGRn/VHuxmcQO8uk1
 1ScQ1s8DltnMG0N6U82SzEZRFFClbOb4yerfVSV/FvQkScdLlr+nUcmGg5v1AxXWQu8IUoTke7J
 XdcwcWSqk4aS9Q6W/sDsWZp39OZsAGD0UhiE1R5JPRE2ALVIe/Z6kWzX0D2I3bx5/m0s2N0/H/e
 q6FW3LQ717iwUtEDUneGksDrSMYAdeloZT3E4yLZjyfnpD51j5khV6dPo5jijLoTS0jbARalYsW
 Ud0MVoPu2DZsdql85RPL93un0Sb0CIYA/r3CdKfMbfxqJAxt0PB2/imSIoE90IGCGUVFZ6Rfn2D
 DXDjsejD/jMpPqB4YrHoAUPBJwCbIFbJNvNjFM87nT2UIuKFbC97pOjuU6PYQZPiQ7UPoAlQ6C9
 dXE93B66fIiJEKg==
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
index 5c01c64e9268897258e66029a068aaba01d8f85f..17cf358f171f04ed044ea6a1cf030e67b2e0eb60 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -458,6 +458,10 @@ foreach prog : intel_progs
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
index 0000000000000000000000000000000000000000..4ef8c32151e4368cf20d1b2b6bbf4228240fa3ef
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
index 0000000000000000000000000000000000000000..adb5001d10b604531e35943604ac8d531ce11760
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
+		bool found;
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
2.50.1

