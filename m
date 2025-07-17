Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DD7C83F3D
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 18:46:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4150A10E88C;
	Thu, 17 Jul 2025 18:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="oAmv32EP";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF9310E15A
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 18:46:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1EB12441C4;
 Thu, 17 Jul 2025 18:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752778006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zP7XyAabvnA0WKL6DT82ZGTq+mwbnHeEMZiQj0scA3U=;
 b=oAmv32EPxJ8FZbp8ddfXVNpixb/fufHyCRNnDRIZEjQBBr9OoVszfGXfGZL5kBGVbNt94H
 mHe4UzDO6fioWoa0kanWM4l1Yd+eR4SS43RiZVKeQXDCPPhdEgnKdFBkUz7uu5Fwf5Ph00
 IDXzPLBPUxAYmeBXNpfcXWDPgT+24P9Q2WjBuw3DnSE0PWeuT8kBVCMFnxhcZucBQHNTIb
 7695jyvcdfiA7mcTrbBLM2D4oLiSDGTHhFfQgvglRN28gBwrVzMSB6YwmvcWLfCTF/cev1
 MEsiRAAolEnq0aOEXutu/YgaSEKmYdWvOqzQTyo/c2ZKlyN3h8Gcv6Ant0w21g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 17 Jul 2025 20:46:43 +0200
Subject: [PATCH i-g-t v2 23/26] tests/unigraf: Add basic unigraf tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-unigraf-integration-v2-23-77dc329e584c@bootlin.com>
References: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
In-Reply-To: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, mark.yacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6201;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=6rhsTC6MCZ2H0Q4DnBDQA4pYttU1wJgG7uYOi2qUOgc=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoeUUOrvxsPP+AqokgImVm0mD/1I//qbavogJbN
 JzvHJHuclGJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaHlFDgAKCRAgrS7GWxAs
 4s3PEAC1O49pLPh0sO8K9ZN5A2sENJbrnod49+Dj+sSZ3gu2eMpTuzx+TBwLnBd1ONdflUH6o4p
 M0NuhK1lLpoXn2Xcagk5rGwAcy+Bpxv9vOAwFFkwrhcf75qUM5zjgzLjDZcv6B1XvlmGWfEumES
 cDFRWfcXLD7j2VwpCe6zM+llxMOlJrK0YtQPqWRzULYMxkUACRJIk8FOJfj5nrcc3wEz2r56Sxs
 ZV/I632rJWAO+AtSNy7wvm38xX10hjCo8dfYX38V3W0U1+S3EzrEm9yNIpVh2z5M54MuUhezpf4
 yHei98+Qbz0tdgUrANZCFqSoQcrCwSoAsmIu08Jw9tYoyQvsZz4tsERnbxvcDN4JkOkY7rKucD5
 fjejZYMEOU155QFMtHebSfCRR7EfSej/+Ghbnpn+EGiMcgLmQZQVAelP+M0dMLa1w2vtPhBcM3g
 9BkHPAqlmv+e5pG+PG8Sxqv6zCgWOwF91di9RhgISRhqpS+Txu/xFOinrmgbt3QKqCaNvCBouKI
 9ewDAMt4xm/M+17WBoTaiqKrI9141VFWJNl/swJMuRktaAfjW7U8Gl9bXNtIroMjmYxn/UDvfWU
 70gsfnWActMRsiAGY2a0c7CK+y/pgH5Uh8dmENwrq+ZpWO2v6o1i/jH1lpFWlhnhYt6FQoqac88
 LRxNCPWKoaSOilw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeiudefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehtdejtddtteeiiefgleejkeetteevhfdukeegleffjeehgeeivefhgeduffdvvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrieejngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepihhgthdquggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrrhhkrdihrggtohhusgesghhoohhglhgvrdgtohhm
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

Adds two tests to validate unigraf communication.

unigraf-connected checks if the device is connected and if the EDID is
properly applied.

ungiraf-disconnect checks if the device can be connected/reconnected using
SST and MST configurations.
---
 lib/igt_kms.c                        |   9 +--
 tests/meson.build                    |   4 ++
 tests/unigraf/meson.build            |  12 ++++
 tests/unigraf/unigraf_connectivity.c | 126 +++++++++++++++++++++++++++++++++++
 4 files changed, 145 insertions(+), 6 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 95ad7885a7dc284031e2f0fda2b0655474f295d2..8d8d4da593e60a1072305c4a04a4d430798a3379 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -65,6 +65,9 @@
 #ifdef HAVE_CHAMELIUM
 #include "igt_chamelium.h"
 #endif
+#ifdef HAVE_UNIGRAF
+#include "unigraf/unigraf.h"
+#endif
 
 /**
  * SECTION:igt_kms
@@ -2926,12 +2929,6 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	int i;
 	bool is_intel_dev;
 
-#ifdef HAVE_UNIGRAF
-	if (unigraf_open_device()) {
-		sleep(1);
-	}
-#endif
-
 	memset(display, 0, sizeof(igt_display_t));
 
 	LOG_INDENT(display, "init");
diff --git a/tests/meson.build b/tests/meson.build
index 55bcf57ec58b2903fcf77e629901f9ed450981da..87dd3cc6dff62b73273e90122db0bbc14cdadb4c 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -454,6 +454,10 @@ foreach prog : intel_progs
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
index 0000000000000000000000000000000000000000..68fb52cccf6ccb7921a64c0dc6f1652318aed957
--- /dev/null
+++ b/tests/unigraf/unigraf_connectivity.c
@@ -0,0 +1,126 @@
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
+		unigraf_require_device();
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
+			igt_info("%s:%d:%s: %s\n", __FILE_NAME__, __LINE__, __FUNCTION__, output->name);
+			if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) {
+				igt_assert(kmstest_get_property(drm_fd, output->config.connector->connector_id,
+								DRM_MODE_OBJECT_CONNECTOR, "EDID", NULL,
+								&edid_blob_id, NULL));
+				edid_blob = drmModeGetPropertyBlob(drm_fd, edid_blob_id);
+				if (!edid_blob)
+					continue;
+
+				found |= memcmp(unigraf_edid, edid_blob->data, min(edid_blob->length, unigraf_edid_len)) == 0;
+
+				drmModeFreePropertyBlob(edid_blob);
+			}
+			igt_info("%s:%d:%s\n", __FILE_NAME__, __LINE__, __FUNCTION__);
+		}
+		igt_assert_f(found, "No output with the correct EDID was found\n");
+
+		free(unigraf_edid);
+	}
+
+	igt_describe("Make sure that the unigraf device can be deconnected/reconnected");
+	igt_subtest("ungiraf-disconnect") {
+		unigraf_require_device();
+		int newly_connected_count, already_connected_count, diff_len;
+		uint32_t *newly_connected = NULL, *already_connected = NULL, *diff = NULL;
+
+		int max_count = unigraf_get_mst_stream_max_count();
+
+		unigraf_hpd_deassert();
+
+		already_connected_count = igt_get_connected_connectors(drm_fd, &already_connected);
+
+		igt_debug("Already connected count: %d\n", already_connected_count);
+
+		// i = 0 is SST
+		for(int i = 0; i <= max_count; i++) {
+			// system("echo '89' && (modetest -c | grep connected)");
+			unigraf_hpd_deassert();
+
+			sleep(1);
+
+			unigraf_set_mst_stream_count(max(i, 1));
+			if (i == 0)
+				unigraf_set_sst();
+			else
+				unigraf_set_mst();
+
+			unigraf_hpd_assert();
+
+			/*
+			 * Hard sleep is required here as we don't know how long it will take for the device under
+			 * test to properly detect the port disconnection.
+			 */
+
+			sleep(5);
+
+			newly_connected_count = kms_wait_for_new_connectors(&newly_connected,
+										     already_connected,
+										     already_connected_count,
+										     drm_fd);
+
+			diff_len = get_list_diff(newly_connected, newly_connected_count,
+						 already_connected, already_connected_count, &diff);
+
+			igt_assert_f(diff_len == max(i, 1), "Invalid connected connector count, expected %d found %d\n", max(i, 1), diff_len);
+		}
+	}
+}

-- 
2.50.0

