Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E184FCCF9E3
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:40:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891BC10E3C2;
	Mon, 10 Nov 2025 13:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="dNKGZ9B2";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A2110E3C7
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 95CB04E41609
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6C750606F5;
 Mon, 10 Nov 2025 13:39:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 557D8103716B2; Mon, 10 Nov 2025 14:39:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762781998; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=wUcV8oo5AZ5Z3nt0LMr9mzcPIRA0PypDn+mYZhwRq78=;
 b=dNKGZ9B2ziCpcM9Csk6bcQ8C8YXviDrDP3gocQ0LlfGg/29IB0X/FLDeRmQjtyLEX5vgp0
 3tHOwG3KMpKKEFufbjpwTyR7lFjAr2clKTRKMlfBdwzHcGtxaSjCGVXUsAMYuE2EFVBq0K
 HPtwg/D7gziaVYLMCyhzh53v8yXIIn0IuzgK2w2RUu3lhkB8dLvbXaZsAEMijT9kqlusgN
 WFYKmu1+63NgymPFN5yqxBwknpY2QLlITh39tAoLQoIsERhSRR3c4YHGVU86I5GzpbW0wA
 T1Oh1ueJTNdkptRq6CQVHRRcyjOO9Y+vpiJPgjXfUrwi6XifndWf8O4ftDa20A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:31 +0000
Subject: [PATCH i-g-t v4 29/46] lib/unigraf: Add connector configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-29-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7250;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=QtJGFjPZPUkDZMqyYaD3p+xI5P027LVA0SxW/0x21kg=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesRlrPMOX0Yg/rr36UzpT3ErOAb1giQFursC
 kRkcWHs3mOJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrEQAKCRAgrS7GWxAs
 4voiEACQNMWh+MHsyUdp+RfQvnlkIkRKJBnIMUnS0KBwepN5UNLOubGS1mFgjb5HvB5eOLLnUgD
 EtgQmyOL0fVyGcUptbSaqAoMJ5bwmiwkp++MAoB0Y0jICR0S47u5dKU1n9QuSN716JlM01Vi45J
 SodYLEzvY5xQZ0PvWqxAtxrijdYbiqd8kGwDCKJkUTt5TdKBGRmLyUuaukk2GUw8i3H8xfz0uor
 Oc1F8xC1BaWKQQcYNtzMyIaFtwnz2LD6kBQpSOWbOsS4QhmdDabz8i7un92tElwQpJDmLz605AG
 8Lj4c+9G8X2cFPFEP9wF6M+kOLxSqAHm0iViA+yAIQOi/lS9sOujG6Wgh0ObaWZrRchJQ46m0hL
 RaNniOdSGflaPJdbWmltRid7APAW01D3jrGRRRo0AQwuIFk4C0glny6zrJDQRyU1c7wCh+sa4S+
 DtsIyBZaJbDts2nW9w1T7KJ8baLxeHgFJ8TgHLWUlYvTAdvl9CVcRYRnWdi+U7Y5JRXeB1LFqQv
 F0yAtK+5BgOH+cwNoZLsYepiDBo5T0KwQSSCCeTM04fSzbOsGUPwZReEZ29oixFgVO91R1ZxYZV
 VZ1kyr0CRERvAGqs7wrSabDtQxqo6fMH7hEcWNEsse0Na4TjUziIhwFy6+5yjRGhrMGAZR5tfM4
 dv5TRb58HGphsyw==
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
tell which connector is used by the Unigraf.

The configuration will look like:

[Unigraf]
Device=UCD-500 [2434C620]
Role=DisplayPort Source and Sink
Input=DP RX
Connector=DP-4

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 120 +++++++++++++++++++++++++++++++++++++++++++++++++-
 lib/unigraf/unigraf.h |  11 +++++
 2 files changed, 129 insertions(+), 2 deletions(-)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 2229202ea868..596fd6db39d0 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -10,7 +10,10 @@
 #include "unigraf.h"
 #include "TSI_types.h"
 #include "TSI.h"
+#include "igt_edid.h"
+#include "igt_kms.h"
 #include "igt_rc.h"
+#include "monitor_edids/monitor_edids_helper.h"
 
 #define unigraf_debug(fmt, ...)	igt_debug("TSI:%p: " fmt, unigraf_device, ##__VA_ARGS__)
 
@@ -44,6 +47,16 @@ static char *unigraf_connector_name;
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
@@ -204,6 +217,74 @@ static int unigraf_find_input(const char *request)
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
+drmModeConnectorPtr unigraf_get_connector(int drm_fd)
+{
+	if (!unigraf_connector_name)
+		unigraf_autodetect_connector(drm_fd);
+	return igt_get_connector_from_name(drm_fd, unigraf_connector_name);
+}
+
 bool unigraf_open_device(int drm_fd)
 {
 	TSI_RESULT r;
@@ -212,6 +293,7 @@ bool unigraf_open_device(int drm_fd)
 	char *cfg_device = NULL;
 	char *cfg_role = NULL;
 	char *cfg_input = NULL;
+	char *cfg_edid_name = NULL;
 	int device_count;
 	int chosen_device;
 	int chosen_role;
@@ -220,7 +302,7 @@ bool unigraf_open_device(int drm_fd)
 	assert(igt_can_fail());
 
 	if (unigraf_device)
-		return true;
+		return unigraf_connector_name != NULL;
 
 	unigraf_init();
 
@@ -240,6 +322,7 @@ bool unigraf_open_device(int drm_fd)
 		cfg_device = NULL;
 		cfg_role = NULL;
 		cfg_input = NULL;
+		cfg_edid_name = NULL;
 		unigraf_connector_name = NULL;
 	} else {
 		cfg_device = g_key_file_get_string(igt_key_file, cfg_group,
@@ -264,6 +347,23 @@ bool unigraf_open_device(int drm_fd)
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
@@ -330,9 +430,22 @@ bool unigraf_open_device(int drm_fd)
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
 
 void unigraf_require_device(int drm_fd)
@@ -345,6 +458,9 @@ void unigraf_reset(void)
 	unigraf_plug();
 	unigraf_set_mst_stream_count(1);
 	unigraf_set_sst();
+	unigraf_load_default_edid();
+	unigraf_hpd_assert();
+	sleep(1);
 }
 
 struct edid *unigraf_read_edid(uint32_t stream, uint32_t *edid_size)
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 983a21bbd61b..ca459949dade 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -5,6 +5,7 @@
 
 #include <stdbool.h>
 #include <stdint.h>
+#include <xf86drmMode.h>
 
 /**
  * unigraf_assert: Helper macro to assert a TSI return value and retrieve a detailed error message.
@@ -57,6 +58,16 @@ void unigraf_require_device(int drm_fd);
  */
 void unigraf_reset(void);
 
+/**
+ * unigraf_get_connector() - Get a DRM connector for the Unigraf device
+ * @drm_fd: DRM file descriptor
+ *
+ * Returns: A pointer to the drmModeConnector connected to the unigraf device,
+ * or NULL if the operation failed. The caller is responsible for freeing this
+ * pointer with drmModeFreeConnector().
+ */
+drmModeConnectorPtr unigraf_get_connector(int drm_fd);
+
 /**
  * unigraf_read_edid() - Read the EDID from the specified input
  * @dev: The device handle

-- 
2.51.0

