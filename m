Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED816C3DA4A
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:35:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8030B10E5CC;
	Tue,  9 Jul 2024 15:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="WEmtkxmS";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DAF10E5A6
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:35:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8B0420009;
 Tue,  9 Jul 2024 15:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aL0VKzjxDMjL7k3Lr5kIDtQyrHeL3kjS+ijmT4A8DVI=;
 b=WEmtkxmS85api16aL9P+dES7IZO2s0V1S1uIZZlg6UZoNYJLpvCFrX8awySymT08gVadN3
 GhTKwCvFg+C6OM2qBoqL4cR36Ic3vjBW+UtRfXgl3Rekv4piE4L1GQ/qfn//Pi3/nwsMuD
 gq39wHvXiq67Y2vMpKJIPA+KKog0GN+y+Nvm6kCe/5GqhSYyxL7HkVqhL3T4+yXBv6HDTM
 +tkCt706YLlQHkaq2/nSfj5TmPvwpBG5gATrdgQfkDXSgVofgCnxo/AIxidTXyec0X5dW9
 tMzAs+AekLbvvcsGubLO4O7DXGf41BzJcL96rkP6a5kWwOlz33kEYI4R2mFPRQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:44 +0200
Subject: [PATCH i-g-t v2 28/39] lib/chamelium/v3: Plug specific ports for
 all tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-28-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5716;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=ovphJivpyTQzOSbIOGJbH8eThCsj5IRHkUefY4/n5/Q=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViZSeIlp6Zi/lOpl4h/wsSSFxsmMRcwI2fRZ
 lxVYZDyMWeJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YmQAKCRAgrS7GWxAs
 4n3MEADWHU9EjNByLfecmc07AM06llQC5GI58eIaRuBDXmLM2uEgafWbocrieOU7phE/PSlmgjH
 LP5rVlfupRqFjSdq0KkjFOlHjWbew9FhcL8nYf/QcpHIXzfPicRZsXZnkygi0NxnoZDNXQAexuY
 GU7k9ByAXWFfYY2wbG4tfzKfTXXUAvSreQmDN01lFOHTLBOVApDir7zNh5+Itn0keMnXxPgeEuY
 Y+B7mBYfVbsNXRO4x0KQe6ztpuQ39dR5ZkOVkQvRPWfNymQTeQS599b4vqZJG4yu2X31emghNcP
 n4GwxDO7i1ItI9mFRojplAcvcj51PgGKjM7znhiz4SEktKJ/bv3EKWONahLSVt/1MFJoF0/cFB4
 Eh+qmGpggEFTv/li+t5HQDNH6GCeBuPjf9pH167RtLNAOewT4dAp+g377FR7h8v6z0aVujj3swg
 xqD+yaQikr7f23ezRKqeugtSh2550C/eQwdT0Aq+JgvYTdFmnyzEOidIhUCIlHUMMzyMCYJAyWK
 bvBMal4g8d2wNpcuvVT5oRsBZ+nT1pUyKzaTFX2fXVfuzKtU7G+P01I58as1NnHWuVnjn6WzYHW
 1u6tljZkaYYkuluY8v0XDHKs79bc5x8RlpZiMJVdsTkB877b0i2e+anldBYN8HoBFLFBthKy5Aw
 9LnSGHzoEj9DVOw==
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

As the chamelium v3 does not support plugging all ports at the same time,
something is required to identify which port must be plugged during
non-chamelium specific tests.

Add two options in port configuration:
- ConnectOnAnyTest: force this port to be plugged during any test
- EDID: Set a specific EDID for this port

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/chamelium/v3/igt_chamelium.c | 19 ++++++++++++++
 lib/chamelium/v3/igt_chamelium.h |  7 +++++
 lib/igt_kms.c                    | 55 +++++++++++++++++++++++++++++++++++-----
 3 files changed, 74 insertions(+), 7 deletions(-)

diff --git a/lib/chamelium/v3/igt_chamelium.c b/lib/chamelium/v3/igt_chamelium.c
index 51b3a610e358..736e593a465e 100644
--- a/lib/chamelium/v3/igt_chamelium.c
+++ b/lib/chamelium/v3/igt_chamelium.c
@@ -18,6 +18,8 @@
 #define CHAMELIUM_V3_CONFIG_MST_PATH "MstPath"
 #define CHAMELIUM_V3_CONFIG_PARENT_ID "ChameliumParentID"
 #define CHAMELIUM_V3_CONFIG_AUTODETECT_SAVE "ChameliumAutodetectSave"
+#define CHAMELIUM_V3_CONFIG_CONNECT_ON_ANY_TEST "ConnectOnAnyTest"
+#define CHAMELIUM_V3_CONFIG_EDID "EDID"
 
 struct igt_chamelium_v3 {
 	xmlrpc_env env;
@@ -234,6 +236,23 @@ static void chamelium_v3_fill_port_mapping_from_config_v3(struct igt_chamelium_v
 
 			port_mapping = chamelium_v3_port_mapping_alloc();
 			port_mapping->port_id = chamelium_port_id;
+			port_mapping->connect_on_any_test = g_key_file_get_boolean(igt_key_file,
+										   group_list[group_idx],
+										   CHAMELIUM_V3_CONFIG_CONNECT_ON_ANY_TEST,
+										   NULL);
+
+			if (g_key_file_has_key(igt_key_file, group_list[group_idx],
+					       CHAMELIUM_V3_CONFIG_EDID, NULL)) {
+				port_mapping->edid_name = g_key_file_get_string(igt_key_file,
+										group_list[group_idx],
+										CHAMELIUM_V3_CONFIG_EDID,
+										&error);
+				if (error) {
+					igt_info("Skipping malformed entry %s: %s\n",
+						 group_list[group_idx], error->message);
+					goto exit_loop;
+				}
+			}
 
 			if (g_key_file_has_key(igt_key_file, group_list[group_idx],
 					       CHAMELIUM_V3_CONFIG_PORT_NAME, NULL)) {
diff --git a/lib/chamelium/v3/igt_chamelium.h b/lib/chamelium/v3/igt_chamelium.h
index 90d2a7473894..834f446f4317 100644
--- a/lib/chamelium/v3/igt_chamelium.h
+++ b/lib/chamelium/v3/igt_chamelium.h
@@ -18,6 +18,9 @@ typedef int chamelium_edid_id;
  * the chamelium
  *
  * @port_id: Chamelium port ID.
+ * @connect_on_any_test: if true, this port will be connected, even for tests that are not
+ *                       chamelium-specific
+ * @edid_name: When using @connect_on_any_test, set this specific EDID to the port
  * @connector_name: DRM connector name, used to identify the connector in DRM, mutually exclusive
  *		    with @mst_path
  * @mst_path: MST path property, used to identify the connector in DRM, mutually exclusive with
@@ -29,6 +32,10 @@ typedef int chamelium_edid_id;
 struct chamelium_v3_port_mapping {
 	chamelium_v3_port_id port_id;
 
+	/* Using chamelium to emulate a display */
+	bool connect_on_any_test;
+	char *edid_name;
+
 	/* For normal DRM connector */
 	char *connector_name;
 
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 6c2b7cc4f5bd..a30bb483594c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -49,6 +49,8 @@
 #include <time.h>
 
 #include <i915_drm.h>
+#include <chamelium/v3/igt_chamelium.h>
+#include <monitor_edids/monitor_edids_helper.h>
 
 #include "drmtest.h"
 #include "igt_kms.h"
@@ -2883,14 +2885,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	if (!resources)
 		goto out;
 
-/*
- * FIXME: Dirty hack to avoid those lines when chamelium v3 is used
- *
- * Must be replaced with a configuration file information, so the end user can choose if the
- * chamelium must be connected or not.
- */
 #ifdef HAVE_CHAMELIUM_V2
-#ifndef HAVE_CHAMELIUM_V3
 	{
 		struct chamelium *chamelium;
 
@@ -2906,6 +2901,52 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 		}
 	}
 #endif
+
+#ifdef HAVE_CHAMELIUM_V3
+	{
+		struct igt_chamelium_v3 *chamelium = chamelium_v3_init_from_config();
+
+		if (chamelium) {
+			struct chamelium_v3_port_mapping *mapping, *tmp;
+
+			chamelium_v3_reset(chamelium);
+			chamelium_v3_fill_port_mapping(chamelium);
+
+			igt_list_for_each_entry_safe(mapping, tmp,
+						     chamelium_v3_get_port_mapping(chamelium),
+						     link) {
+				if (mapping->connect_on_any_test && !chamelium_v3_is_mst(chamelium, mapping->port_id)) {
+					int edid_id = CHAMELIUM_DEFAULT_EDID;
+
+					igt_info("Plugging port %s\n", mapping->connector_name);
+					if (mapping->edid_name) {
+						struct edid *edid = get_edid_by_name(mapping->edid_name);
+
+						if (edid)
+							edid_id = chamelium_v3_create_edid(chamelium,
+											   edid);
+						else
+							igt_warn("Impossible to find an edid named \"%s\". Available names:\n",
+								 mapping->edid_name);
+							list_edid_names(IGT_LOG_WARN);
+					}
+					if (edid_id == CHAMELIUM_DEFAULT_EDID)
+						igt_info("\tUsing default EDID\n");
+					else
+						igt_info("\tUsing edid: %s\n", mapping->edid_name);
+
+					chamelium_v3_apply_edid(chamelium, mapping->port_id,
+								edid_id);
+					chamelium_v3_plug(chamelium, mapping->port_id);
+					igt_require(igt_wait_for_connector_status(drm_fd,
+										  chamelium_v3_port_mapping_get_connector_id(mapping, drm_fd),
+										  igt_default_detect_timeout(),
+										  DRM_MODE_CONNECTED));
+				}
+			}
+			chamelium_v3_uninit(chamelium);
+		}
+	}
 #endif
 
 	igt_require_f(resources->count_crtcs <= IGT_MAX_PIPES,

-- 
2.44.2

