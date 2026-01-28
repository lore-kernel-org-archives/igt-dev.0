Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D46D25B61
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:14:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E8210E6DB;
	Wed, 28 Jan 2026 13:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Jr8DUnHn";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B06B10E6E4
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4B9681A2AC0;
 Wed, 28 Jan 2026 13:14:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 236466071F;
 Wed, 28 Jan 2026 13:14:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 44D2E119A882A; Wed, 28 Jan 2026 14:14:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606092; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=WMUusUfvSaO9FH12e2XcJal4HQCxHvbnnj7ZeqfegbA=;
 b=Jr8DUnHnIjcI2G/Qz+jnpGFyRH945GYobyi4S7mWvOut8LXknCmh9lZ+2dmYbwAg2m+Bvx
 x8WXn9rn2J8/ShYX7XTOxzRlpsG3SUH7uhZxI8RWBboFFYJbYBdDwRe9NDztKrT6Ha/8QV
 Iiddp2X92cF7kX12niJBEruHm1R6UCfpODQI+15/T4TqYCztR9qVu+ikmtRWVtDPYx9GkS
 pVqfta6Qv4Q+56Lv6FBEKQOO3K4i6vIObo2b7wLvqtdYPIozvKyNbW2zzsb45dWFI33PKt
 u81BuRvyKR0+Cmtp8ezyjPDx74UkMoFyNN+uEDb2EvYNCYs9JIFnxrjPY/DjCg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:15:01 +0100
Subject: [PATCH i-g-t v5 30/48] tests/unigraf: Add basic unigraf tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-30-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5374;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=CtrwGkreYDUN8Qd5KLV/xKBSt29/rUEQC0Wm1KKpQaw=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvLreOpjSDMlMGPrZdUfFCq2J4BNKEkBAWv2
 eyiWmf/NHyJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLyxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIzaw//U9wQTW118u88ZdiDZAunx35vj/kaBk7
 SqEL0W6E4yCTJJD2S7yV3flB+JNx6y/yx05WbqUKGLiL86/zjMfgsse/rUtJB1MwymhPn9Qs0Pd
 U8JjLqbo6rXhwMj2N55ggCrLZ/ArofgQPoL/2DVUt7C6LQymAmvvUaXr27TgCqiiXVAAWjXpv2D
 hK5ORi0asTXEv5EmAI399v8Dqc0Mt74ZOrTluDAue7E1RJFPZ79XgIuq1nCarJ36y2ZTLKgn0az
 Inh9cWGku6R655UNArXFw+r1iRgacMffFRoHHlT0akfOIkf9fXjTYrA8+k3uH/n52eCBLYJOdvX
 SOYGKTE42i9hlDXy3THiGwXNSdSDWOg+U6oMiDZ3UH3lhbfNCvO0JbuqyDJmm+rJ3V83+/xJfhC
 /C0zIASm9AFGzEdUkKI3hfKTvgipigUpUCZBM/u7UaO3lt/DDlUEUfsLbBj/B5ywLZdFpDiMYkA
 CkW8nX484kLc3TD6TJg3wNPlslGu422yVLikEUULG6D2zR38YesUE0HpoJG4MFaRLJ/i1M/YogV
 KYoOKPDsYhCLLsnqe8xfWbGlWu+boHEQ865zAxG75qePXnubQIT8awZHbgGD/p4UaNj67LLYQW3
 oGxCFgvTczZy0lVPSmxcmXpv3JqtZc+Tj20RhiyX+W+xnvSm02q4=
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
 tests/meson.build                    |   4 ++
 tests/unigraf/meson.build            |  12 ++++
 tests/unigraf/unigraf_connectivity.c | 129 +++++++++++++++++++++++++++++++++++
 3 files changed, 145 insertions(+)

diff --git a/tests/meson.build b/tests/meson.build
index 0ad728b8733d..f0826458ff55 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -470,6 +470,10 @@ foreach prog : intel_progs
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
index 000000000000..be7c428a63fc
--- /dev/null
+++ b/tests/unigraf/unigraf_connectivity.c
@@ -0,0 +1,129 @@
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
+				if (memcmp(unigraf_edid, edid_blob->data,
+					   min(edid_blob->length, unigraf_edid_len)) == 0)
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
+	igt_subtest("ungiraf-connect-mst") {
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
2.52.0

