Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B8FE7DEEE
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:32:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672B810E4F1;
	Mon,  2 Feb 2026 14:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="jy86PVXF";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE64710E4F6
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 6BF7DC237F3;
 Mon,  2 Feb 2026 14:32:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A1C6960767;
 Mon,  2 Feb 2026 14:32:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4C827119A88EE; Mon,  2 Feb 2026 15:32:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042774; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Tcb3GMjvH6IVSpdzCQi30Mawi1Fxpp+GBY0t7NqelTc=;
 b=jy86PVXFby03xPiHiQ1PkF7yZQlUlurEYz3NXqx+qB5qzsIfpzztFJTPskfRJIU93k6CKX
 uMyYzRF785JTF9ylakufHFTWdS2NytKcGtmuv5aCSVpLzx2pMdoibWnr8zgo/ZIq9axpRS
 lL5ccCmACpljY4TCAaqy2o6LuWMx1KuYDp9DhS8p5gaacptLb9Pu9HQ/XKYCqWouaVbb9U
 0oDDe/aFrw1dAY7/6BtMEMEhuIYKw8vtNGGoZqDAxgkO4lbkjR468/p/khxYT9e5DMC6Em
 7w3bwu/XC0NmtjK4dCB4QiMc/PdofXzBNgiANoToVULfwGOMPPgOBf0FxBi8LQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:33:09 +0100
Subject: [PATCH i-g-t v6 30/48] tests/unigraf: Add basic unigraf tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-30-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5374;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=D4B+QeWOk4CoyHtkCZBkTjYHTyk0YeyOLIxa4Dnnk78=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWSb62JbUiJuwO+Mo8TcVV6YaGiey0x96dGw
 wLSnWmcaXeJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1khsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKyyQ//VKTK1xNQFVSRLdVmMHKXCz3dsBwemYb
 MdlAlM6GWuzeHdv2sAn+qCFBZ72kseONtxxmQvZVvwzltAZ3wDDJLkWPO89q/psGikNulADVBYw
 gkIjt1vb5npOsvaY0M5Wh0F/Do6znIiVTT6M7zbpKLZfcV3ANmOY6oSnSVKitkj7nSbdZl9R8nS
 SwnJNJU3hvkN97QWf+iHl+T4kwQiHXqR+xOkQUY1R1FFpoegaONPpAQsF7KiwzMdYPyi/xyvFE2
 CXlff+gcovhicSTQz6ThJX9nSkz7iEiDbpg5sA0rqHTdvheMs6cdcsVSyveZiXYGgG6RkQ6PVlx
 NpAjqiIpUM3eWdjbBXW+c8gJYJbNhA7me885UmD+3ikVCFLxFn2DlRjtD5UYPYA6qjFyKhT8NWs
 IrIz/QUjAdVr2ilH1mxMh/LqbEWcq+ungHDJtLk4faMCydXqRxIGnjfbvFq4uOhvDV1QzeC+zdG
 iyo93bDWFpcAopGXA3g32sNUSCdTgsywywCTD+G3/6x2jd9PPXHMn1Fnt0E7Hw9BsUz9Ew7jYmG
 O7bqzwHbL4N/oOY0aLr0ICZACUjiQCuBJ1nAFgoTkwVvJEsFh9EwlyPiKxNfjtR3EnLC85ZjufJ
 P3Q+Y5HJ0dI7NzPQH3uMPEFXeCN9+uvLMyKgRL6T6OuFZVWsFoDo=
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
index ef4edaa0d3b3..66213ad35274 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -471,6 +471,10 @@ foreach prog : intel_progs
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

