Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4D6F4644A
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:26:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FD710E262;
	Mon, 16 Mar 2026 10:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="V6fmzwBo";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF8A10E25A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 073FB4E42627
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D23145FC4A;
 Mon, 16 Mar 2026 10:24:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D8E5810369E67; Mon, 16 Mar 2026 11:24:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656653; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=1kU5nSX6DeAveNlogfLyjT01pPr273EUcMgSX2Y4qZM=;
 b=V6fmzwBoqbVbgzQXdp2UkuaDeyegxPymu2qIbfZUNFkBVtlgwlnD4GssLL1jdEwahYAydH
 p5Snae6GiAQMqBTjUN7LY7U/qRrUyh+SV/NC8HmUkVg0mw3gdi8i7WYs+wCQ4f7lxLsZof
 bnXPZ7G2MqjHHwZeQzvhO0oemarjOeWPc5TP7QPNjzbkmO9LcNuMs4g3p62AjRwOhTvhHh
 WXTPlBcmGfoSmUnRIBWqm1dpMa25yv9r/8/ToiFdbFFaQsME6HikBvkGyfZ7Ui4yd0PweZ
 Z6a9XacZ3ortsM+uB588Lz0+3W/FzD8XkPrilJV/63eEUqMEzfnAa2/I0h2hfA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:38 +0100
Subject: [PATCH i-g-t v8 30/49] lib/unigraf: Add connector and EDID
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-30-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7222;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Sd1bFqoAj48yVw/mRr7xh/ez6AATPGoN38Hn5bbC9V0=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pS97CVeCOayzT4Vij5WeBcUMjpzmUDW/JyU
 FRsS6FpiG+JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaUhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIFLA//eigckpc/z2KFpWJTxUZnoy8Wr/2dPWQ
 bMxyjflSztH2dseAUByX7tcxpfoTf5c/345l9Dsq1N3bDDwR+U9CljWHJMbFaM0JdfhTAk3RIpF
 58Rotc4TS+OFLZij26cyWZSJc33P5Xd4WjZMiTAAAvb5ap6QTLWYSr7xTiM86ILdzDF9QacY3wl
 dfe7QBKjduAQrXvODlc2wUlgmB8nbqmOul2EnTRr+75r7WIiSwy3FGvxCFhRJdr6erbYhjxmbJB
 n95C6wNTj2sTvIGCc3kfUYy859S5BmE3Qm0Yauwgcdg7ZYuuWoKt8eGhZnwujHPBoB2VY7XjoRA
 3QtxT5/3GRlbDuvUD3MNaBzWBjbScFm8Zupv1SFc7qXGpLXJD+HUnD9mBXZu8f8UyqAUJxBkHDt
 8CQaNdgPHSK5MEaUiFlrfejw0exaQIHO6UpXimULpGBGz4+BuBumsjx9MjrM4MP5UkJbOYkoMGy
 i0fIbp3LjD0vANd1E3MgDF31hwqBoOePF+8nuAEPNc/Kh3CjOTmvPdOd94TSZOOJl/QxwCD2zs/
 IzrRx6L2zdeuD0XkSN+STwOZ+v6PmVgGlnMBU+iCDgstTISPy9qlWO64waU7EJE7Cq38bSsbWvq
 ANrXlirq12U+1Wy4U2h5wXL9G1L9ODkVLGvSmnNhJPcFug5JRkT0=
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

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 126 +++++++++++++++++++++++++++++++++++++++++++++++++-
 lib/unigraf/unigraf.h |   3 ++
 2 files changed, 127 insertions(+), 2 deletions(-)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index d06da6742e95..6e70df288cbe 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -13,7 +13,10 @@
 #include "unigraf.h"
 #include "TSI.h"
 #include "TSI_types.h"
+#include "igt_edid.h"
+#include "igt_kms.h"
 #include "igt_rc.h"
+#include "monitor_edids/monitor_edids_helper.h"
 
 #define unigraf_debug(fmt, ...)	igt_debug("TSI:%p: " fmt, unigraf_device, ##__VA_ARGS__)
 
@@ -46,6 +49,16 @@ static char *unigraf_connector_name;
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
@@ -204,6 +217,83 @@ static int unigraf_find_input(const char *request)
 	return -ENODEV;
 }
 
+static void unigraf_load_default_edid(void)
+{
+	struct edid *edid = get_edid_by_name(unigraf_default_edid);
+
+	if (!edid) {
+		igt_warn("Impossible to find an edid named \"%s\"", unigraf_default_edid);
+		list_edid_names(IGT_LOG_WARN);
+		return;
+	}
+
+	for (int i = unigraf_get_mst_stream_max_count(); i > 0; i--)
+		unigraf_write_edid(i - 1, edid, edid_get_size(edid));
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
+	diff_len = get_array_diff(newly_connected, newly_connected_count,
+				  already_connected, already_connected_count, &diff);
+
+	if (!diff_len) {
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
@@ -219,6 +309,7 @@ bool unigraf_open_device(int drm_fd)
 	char *cfg_device = NULL;
 	char *cfg_role = NULL;
 	char *cfg_input = NULL;
+	char *cfg_edid_name = NULL;
 	int device_count;
 	int chosen_device = 0;
 	int chosen_role;
@@ -227,7 +318,7 @@ bool unigraf_open_device(int drm_fd)
 	assert(igt_can_fail());
 
 	if (unigraf_device)
-		return true;
+		return unigraf_connector_name != NULL;
 
 	unigraf_init();
 
@@ -254,6 +345,23 @@ bool unigraf_open_device(int drm_fd)
 			unigraf_debug("No input name configured.\n");
 			cfg_input = NULL;
 		}
+
+		cfg_error = NULL;
+		unigraf_connector_name = g_key_file_get_string(igt_key_file, UNIGRAF_CONFIG_GROUP,
+							       UNIGRAF_CONFIG_CONNECTOR_NAME,
+							       &cfg_error);
+		if (cfg_error) {
+			unigraf_debug("No connector name configured, will autodetect.\n");
+			unigraf_connector_name = NULL;
+		}
+
+		cfg_error = NULL;
+		cfg_edid_name = g_key_file_get_string(igt_key_file, UNIGRAF_CONFIG_GROUP,
+						      UNIGRAF_CONFIG_EDID_NAME, &cfg_error);
+		if (cfg_error) {
+			unigraf_debug("No default EDID set, use IGT default.\n");
+			cfg_edid_name = NULL;
+		}
 	}
 
 	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));
@@ -318,9 +426,21 @@ bool unigraf_open_device(int drm_fd)
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
+		unigraf_autodetect_connector(drm_fd);
+	}
+
 	unigraf_reset();
 
-	return true;
+	return unigraf_connector_name != NULL;
 }
 
 /**
@@ -346,6 +466,8 @@ void unigraf_reset(void)
 	unigraf_plug();
 	unigraf_set_mst_stream_count(1);
 	unigraf_set_sst();
+	unigraf_load_default_edid();
+	unigraf_hpd_assert();
 }
 
 /**
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 40f706ebd483..fdc4441740fa 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -11,6 +11,7 @@
 
 #include <stdbool.h>
 #include <stdint.h>
+#include <xf86drmMode.h>
 
 /**
  * unigraf_assert: Helper macro to assert a TSI return value and retrieve a detailed error message.
@@ -42,6 +43,8 @@ void unigraf_require_device(int drm_fd);
 
 void unigraf_reset(void);
 
+drmModeConnectorPtr unigraf_get_connector(int drm_fd);
+
 struct edid *unigraf_read_edid(uint32_t stream, uint32_t *edid_size);
 
 void unigraf_write_edid(uint32_t stream, const struct edid *edid, uint32_t edid_size);

-- 
2.52.0

