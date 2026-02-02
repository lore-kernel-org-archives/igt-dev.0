Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6121DE7DEF2
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:32:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1138010E4E7;
	Mon,  2 Feb 2026 14:32:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="B3DwtNOn";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB63610E4F6
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 60098C237F5;
 Mon,  2 Feb 2026 14:32:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9790160767;
 Mon,  2 Feb 2026 14:32:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3D8A6119A88F9; Mon,  2 Feb 2026 15:32:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042772; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=SfdsS9dXq4RbH6iAV4jGPeXqcQ6jHKlbIj/jtdvr2i8=;
 b=B3DwtNOnli+HLw9RcER2toe0CxESx2ZqdIidHSM5rOopT0hqxHF4wc8Jbe7LBU1jqUmfaK
 92ZuTIdjVdR7fyv9FVse+cCiAz5sMM2qzWJPK/Th3k/MyU5xI3B+KDGvP4un4wGJXbGUlF
 qZVYr/4tL/gd4CaDk9mDvkVxsD8hZ5SVmHDG8dioXx6egtRBlQ8yBe0tBrIE4sMwdRPi6k
 /HarCraYcATEUkRVOW9NS40M12IGnEXZ7mtHw14kCPjLL35mAOyRH7IzXk1btgL+hIMlBJ
 RgO6DLr6R4ZgrlaHl/aPJjVFasWBGuAPLZZHRMvNhB+LtzMTUSetyvguvi8tQg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:33:08 +0100
Subject: [PATCH i-g-t v6 29/48] lib/unigraf: Add connector and EDID
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-29-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7429;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=ECkuj34uCXxQEmU7mnhxp+2r1axp3horHqzGf7vSfWE=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWS3GmPpY4LhY4ENsPulGGOubWzQXBbKUbVA
 bO9h7qFcDyJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1khsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJJ/w/+NH6SdNqIon4MuMy5dEakAOo8zJtL90A
 BS+ZHyJD2wdziwobfxww3iXyehHxF4MKHyakSya7b8RNZc7ETCS6K8+5EIGyK5c+q3GzAWYuhfR
 qjndwHdsC3ljV5JPj/XX3uqW5YaIbpy7pInRL3Aok6x5l/3nNdaxlat34zKS06aDqQSkTozgkpg
 322YbOJ3N28smZkx76BYqofP06236FDRf6tbY8NySABoSsWZKgwEWSjCVrWqLfKRUPAaXy73Uyt
 tq+tsPPE5RL3Bp+fzRyfIC8U2EcqlmUd9Fw/wjrntzV3e43gSu6Qm7h/gziWyoqRJ7lHKxBkcjM
 3FFmJKqDKVwONeOlRY1BAkdTPpmfGocu84qxP0NLPj1GQwHOUGU6PEHO+uZYB2u3TNlEbJRXVDf
 eYbbw1c71eAbAKW+rh9TZa20XgZGhe+aNhjdFwItxzzUP9nckac8W8H2A3q1Vanhd6T7uWfUiLt
 oPFzVepXw/KK5feAnWn0c72OmhrYQ2bp5h4BJDcVRks89Z+cWwgAruPjslXmCmUdmE07CWjke41
 Cgc6+Nu1eTykK1y2Qw5+IGDe7Or+g8X00nVMWkQOa30KWKx2Og9dfPBd/a3HvyIZq16d5rlszrW
 21GMhKyZnvW2g6r+1GMNCgqwWEz4g2RdHU5bL4lvr4Byu8e45le4=
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

As multiple connectors can be present on the DUT, add a configuration to
tell which connector is used by the Unigraf and which EDID to use on the
Unigraf.

Complete list of EDID name supported can be found in
lib/monitor_edids/{dp,hdmi}_edids.h

The configuration will look like:

[Unigraf]
Device=UCD-500 [2434C620]
Role=DisplayPort Source and Sink
Input=DP RX
Connector=DP-4
EDID=DEL_16543_DELL_P2314T_DP

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 128 +++++++++++++++++++++++++++++++++++++++++++++++++-
 lib/unigraf/unigraf.h |   3 ++
 2 files changed, 129 insertions(+), 2 deletions(-)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 59a4720e0112..bed65b0db247 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -6,7 +6,10 @@
 #include "unigraf.h"
 #include "TSI_types.h"
 #include "TSI.h"
+#include "igt_edid.h"
+#include "igt_kms.h"
 #include "igt_rc.h"
+#include "monitor_edids/monitor_edids_helper.h"
 
 #define unigraf_debug(fmt, ...)	igt_debug("TSI:%p: " fmt, unigraf_device, ##__VA_ARGS__)
 
@@ -39,6 +42,16 @@ static char *unigraf_connector_name;
  */
 #define UNIGRAF_CONFIG_INPUT_NAME "Input"
 
+/**
+ * UNIGRAF_CONFIG_CONNECTOR_NAME - Key of the connector name in the configuration file
+ */
+#define UNIGRAF_CONFIG_CONNECTOR_NAME "Connector"
+
+/**
+ * UNIGRAF_CONFIG_EDID_NAME - Key of the EDID name in the configuration file
+ */
+#define UNIGRAF_CONFIG_EDID_NAME "EDID"
+
 /**
  * UNIGRAF_DEFAULT_ROLE_NAME - Default role name to search on the unigraf device
  */
@@ -200,6 +213,82 @@ static int unigraf_find_input(const char *request)
 	return chosen_input;
 }
 
+static void unigraf_load_default_edid(void)
+{
+	struct edid *edid = get_edid_by_name(unigraf_default_edid);
+
+	if (edid) {
+		for (int i = unigraf_get_mst_stream_max_count(); i > 0; i--)
+			unigraf_write_edid(i - 1, edid, edid_get_size(edid));
+	} else {
+		igt_warn("Impossible to find an edid named \"%s\"", unigraf_default_edid);
+		list_edid_names(IGT_LOG_WARN);
+	}
+}
+
+static void unigraf_autodetect_connector(int drm_fd)
+{
+	int newly_connected_count, already_connected_count, diff_len;
+	uint32_t *newly_connected = NULL, *already_connected = NULL;
+	drmModeConnectorPtr connector;
+	uint32_t *diff = NULL;
+
+	igt_assert(drm_fd);
+	unigraf_set_sst();
+	unigraf_hpd_deassert();
+
+	/*
+	 * Hard sleep is required here as we don't know how long it will take for the device under
+	 * test to properly detect the port disconnection.
+	 */
+	sleep(igt_default_display_detect_timeout());
+
+	already_connected_count = igt_get_connected_connectors(drm_fd, &already_connected);
+
+	unigraf_hpd_assert();
+
+	newly_connected_count = kms_wait_for_new_connectors(&newly_connected,
+							    already_connected,
+							    already_connected_count,
+							    drm_fd);
+
+	diff_len = get_list_diff(newly_connected, newly_connected_count,
+				 already_connected, already_connected_count, &diff);
+
+	if (diff_len == 0) {
+		unigraf_debug("No newly connected connector, assuming that the unigraf is not connected.\n");
+	} else if (diff_len > 1) {
+		unigraf_debug("More than one new connectors connected, this is not supported by autodetection.\n");
+	} else {
+		unigraf_debug("Found one connector (%d) connected to the Unigraf\n", diff[0]);
+		connector = drmModeGetConnector(drm_fd, diff[0]);
+		igt_assert(connector);
+		igt_assert(asprintf(&unigraf_connector_name, "%s-%u",
+				    kmstest_connector_type_str(connector->connector_type),
+				    connector->connector_type_id) != -1);
+		drmModeFreeConnector(connector);
+	}
+
+	free(already_connected);
+	free(newly_connected);
+	free(diff);
+}
+
+/**
+ * unigraf_get_connector() - Get a DRM connector for the Unigraf device
+ * @drm_fd: DRM file descriptor
+ *
+ * Returns: A pointer to the drmModeConnector connected to the unigraf device,
+ * or NULL if the operation failed. The caller is responsible for freeing this
+ * pointer with drmModeFreeConnector().
+ */
+drmModeConnectorPtr unigraf_get_connector(int drm_fd)
+{
+	if (!unigraf_connector_name)
+		unigraf_autodetect_connector(drm_fd);
+	return igt_get_connector_from_name(drm_fd, unigraf_connector_name);
+}
+
 /**
  * unigraf_open_device() - Search and open a device.
  * @drm_fd: File descriptor of the currently used drm device
@@ -216,6 +305,7 @@ bool unigraf_open_device(int drm_fd)
 	char *cfg_device = NULL;
 	char *cfg_role = NULL;
 	char *cfg_input = NULL;
+	char *cfg_edid_name = NULL;
 	int device_count;
 	int chosen_device;
 	int chosen_role;
@@ -224,7 +314,7 @@ bool unigraf_open_device(int drm_fd)
 	assert(igt_can_fail());
 
 	if (unigraf_device)
-		return true;
+		return unigraf_connector_name != NULL;
 
 	unigraf_init();
 
@@ -244,6 +334,7 @@ bool unigraf_open_device(int drm_fd)
 		cfg_device = NULL;
 		cfg_role = NULL;
 		cfg_input = NULL;
+		cfg_edid_name = NULL;
 		unigraf_connector_name = NULL;
 	} else {
 		cfg_device = g_key_file_get_string(igt_key_file, cfg_group,
@@ -268,6 +359,23 @@ bool unigraf_open_device(int drm_fd)
 			unigraf_debug("No input name configured.\n");
 			cfg_input = NULL;
 		}
+
+		cfg_error = NULL;
+		unigraf_connector_name = g_key_file_get_string(igt_key_file, cfg_group,
+							       UNIGRAF_CONFIG_CONNECTOR_NAME,
+							       &cfg_error);
+		if (cfg_error) {
+			unigraf_debug("No connector name configured, will autodetect.\n");
+			unigraf_connector_name = NULL;
+		}
+
+		cfg_error = NULL;
+		cfg_edid_name = g_key_file_get_string(igt_key_file, cfg_group,
+						      UNIGRAF_CONFIG_EDID_NAME, &cfg_error);
+		if (cfg_error) {
+			unigraf_debug("No default EDID set, use IGT default.\n");
+			cfg_edid_name = NULL;
+		}
 	}
 
 	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));
@@ -334,9 +442,22 @@ bool unigraf_open_device(int drm_fd)
 	unigraf_assert(TSIX_VIN_Select(unigraf_device, chosen_input));
 	unigraf_assert(TSIX_VIN_Enable(unigraf_device, chosen_input));
 
+	if (!cfg_edid_name)
+		cfg_edid_name = strdup("DEL_16543_DELL_P2314T_DP");
+
+	unigraf_default_edid = cfg_edid_name;
+
+	if (!unigraf_connector_name) {
+		unigraf_hpd_deassert();
+		unigraf_set_sst();
+		unigraf_hpd_assert();
+		sleep(1);
+		unigraf_autodetect_connector(drm_fd);
+	}
+
 	unigraf_reset();
 
-	return true;
+	return unigraf_connector_name != NULL;
 }
 
 /**
@@ -362,6 +483,9 @@ void unigraf_reset(void)
 	unigraf_plug();
 	unigraf_set_mst_stream_count(1);
 	unigraf_set_sst();
+	unigraf_load_default_edid();
+	unigraf_hpd_assert();
+	sleep(1);
 }
 
 /**
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 0d200b1ec520..80c0f3b92db0 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -5,6 +5,7 @@
 
 #include <stdbool.h>
 #include <stdint.h>
+#include <xf86drmMode.h>
 
 /**
  * unigraf_assert: Helper macro to assert a TSI return value and retrieve a detailed error message.
@@ -36,6 +37,8 @@ void unigraf_require_device(int drm_fd);
 
 void unigraf_reset(void);
 
+drmModeConnectorPtr unigraf_get_connector(int drm_fd);
+
 struct edid *unigraf_read_edid(uint32_t stream, uint32_t *edid_size);
 
 void unigraf_write_edid(uint32_t stream, const struct edid *edid, uint32_t edid_size);

-- 
2.52.0

