Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE7EF4644A
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:26:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7AB10E262;
	Mon, 16 Mar 2026 10:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="HdMPMH5+";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE88B10E252
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 2C614C40404
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A32EE5FC4A;
 Mon, 16 Mar 2026 10:24:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AF83810369EE3; Mon, 16 Mar 2026 11:24:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656654; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=gRytbQ4MVTygcDBlLkcEsHaD/jQLaFDhDzhkD/bfPqM=;
 b=HdMPMH5+dmsNWxCXPEZwEBq6FhGWVhfWpOnSewRtTbfn6zax7oCRObbHvkfrryAYuOxTYk
 rFbSL7hYIT2sfn95I67AltlGbvAFGFIU6PTFaK8Ok75mZZGQV7yLA4XAwpAhDnrUL+InAH
 qAQbGz7JGiOjs5Cmqx9jRMUAaJRVnHSVZoxhdwGwNky1TT6jauoPC/Eb1FFRO8jFsjLalz
 QEyb57UwXP7Xx1kBZzfXsyotGfN6Jpes4dPkuisMFjToDYZZq/mbPcq7DcpcrdB5SF44S5
 l7MVfWsm4NsysZipJY5v07Hw0ac8QjaVZ7X2J9pE4UUMauesi0yu3VywL1zEqQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:39 +0100
Subject: [PATCH i-g-t v8 31/49] tests/unigraf: Add basic unigraf tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260316-unigraf-integration-v8-31-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5846;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=JPJOg38+ajr+rg6hD2ou/TLsJh3TjzmhsxDurgBxjaE=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pS4Krk3z91h3oYsPEnbt3rL3g/hXkvCvRUM
 ejgJjOswcyJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaUhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKaMg//RBCOd4ddtjH2gQcbsv7kaQ9MSbMTepM
 wJCRSKiFSFxjJPtA9AWGh6p9Y80EdmOsC6aqjn1awzIO8jJ8976ZDmNZ51F6H9IVZM1jRlS/sVE
 XuGXyvpQbtvnp2pUElLTtbwwg93c0qCEpHOPF+kyijJwv0C4MvoJMcQJCLh0rHyk7dmJA6clMfn
 1kHT06CKcoQuahDQKHNTnO1p1UpwB3iSqoIRIdJGogN0YYTFbD3G99crXOwZfvyJO2nRrRuwDPB
 UnOKRP16MtzYGrYtESAM3Y/3QwP4sBUWx6uySts/W+gkmD6/bwHsIco5S4HbY6ShUWY0IRQ05QJ
 MSc/2AQPa6HDx0HsFbHn8iPlLoJFXdz3uz7CeECqL+PSfZUOqGxFDePBy1krWwfOFB9knnr7WIh
 Sh53CE+jzR17BU6XAdh3V7WoNKaXZU2pmizmC2iWc/urbGAb966zFd+4O5TPQ1AqKzdHADJ3uDE
 7aa0oVqBvwXeWuBZ+0+WyWB2/W3k7pozq4Ekx1tig32EAzwTSRPWHrFK6DyEoMUXIJj4p6qBLkZ
 LK5CSO0DtnjidgWFjSyLTiCM6PkOfSq1kCY18j3IWfG8CS/si3fG6ADB49oqVDt7iU27QJjIgLm
 RplmIkxuBoCBjNlOwNNrV3qz/h5TSEK3sPBpexx6I93S8iG+VDjQ=
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

unigraf-connect checks if the device is connected and if the EDID is
properly applied.

ungiraf-reconnect checks if the device can be connected/reconnected
using SST and MST configurations.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/meson.build                    |   4 +
 tests/unigraf/meson.build            |  12 +++
 tests/unigraf/unigraf_connectivity.c | 138 +++++++++++++++++++++++++++++++++++
 3 files changed, 154 insertions(+)

diff --git a/tests/meson.build b/tests/meson.build
index cecb4a8ae34a..4d3399d0eff4 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -475,6 +475,10 @@ foreach prog : intel_progs
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
index 000000000000..b35149a4de9a
--- /dev/null
+++ b/tests/unigraf/unigraf_connectivity.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Google
+ *
+ * Authors:
+ *   Louis Chauvet <louis.chauvet@bootlin.com>
+ */
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
+ * SUBTEST: unigraf-connect-edid
+ * Description: Verify that the unigraf device is properly connected to the DUT
+ *              and that the correct EDID is detected and read.
+ *
+ * SUBTEST: unigraf-connect-mst
+ * Description: Ensure that the DUT can correctly detect and handle the unigraf device
+ *              when it is configured to operate in MST mode.
+ */
+
+IGT_TEST_DESCRIPTION("Test basic unigraf connectivity");
+int igt_main()
+{
+	int drm_fd;
+
+	igt_fixture() {
+		drm_fd = drm_open_driver_master(DRIVER_ANY);
+	}
+
+	igt_describe("Make sure that the unigraf device is connected to the DUT and EDID is properly detected");
+	igt_subtest("unigraf-connect-edid") {
+		drmModePropertyBlobPtr edid_blob = NULL;
+		struct igt_display display;
+		uint64_t edid_blob_id;
+		igt_output_t *output;
+		uint32_t unigraf_edid_len;
+		void *unigraf_edid;
+		bool found = false;
+
+		/*
+		 * Sleep are required to allow hardware to configure/detect the current
+		 * configuration
+		 */
+		unigraf_require_device(drm_fd);
+		unigraf_hpd_deassert();
+		sleep(igt_default_display_detect_timeout());
+		unigraf_set_sst();
+		unigraf_hpd_assert();
+		sleep(igt_default_display_detect_timeout());
+		igt_display_require(&display, drm_fd);
+		sleep(igt_default_display_detect_timeout());
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
+				if (!memcmp(unigraf_edid, edid_blob->data,
+					    min(edid_blob->length, unigraf_edid_len)))
+					found = true;
+
+				drmModeFreePropertyBlob(edid_blob);
+
+				if (found)
+					break;
+			}
+		}
+		igt_assert_f(found, "No output with the correct EDID was found\n");
+
+		free(unigraf_edid);
+	}
+
+	igt_describe("Make sure that the unigraf device can be used as a MST device");
+	igt_subtest("unigraf-connect-mst") {
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
+		// i = 0 is SST so we need to process max_count + 1 streams
+		for (int i = 0; i <= max_count; i++) {
+			unigraf_hpd_deassert();
+			// Let the hardware detect the new state
+			sleep(igt_default_display_detect_timeout());
+
+			unigraf_set_mst_stream_count(max(i, 1));
+			if (!i)
+				unigraf_set_sst();
+			else
+				unigraf_set_mst();
+
+			unigraf_hpd_assert();
+			// Let the hardware detect the new state
+			sleep(igt_default_display_detect_timeout());
+
+			newly_connected_count = kms_wait_for_new_connectors(&newly_connected,
+									    already_connected,
+									    already_connected_count,
+									    drm_fd);
+
+			diff_len = get_array_diff(newly_connected, newly_connected_count,
+						  already_connected, already_connected_count, &diff);
+
+			igt_assert_f(diff_len == max(i, 1),
+				     "Invalid connected connector count, expected %d found %d\n",
+				     max(i, 1), diff_len);
+		}
+	}
+}

-- 
2.52.0

