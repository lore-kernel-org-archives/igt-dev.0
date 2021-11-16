Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24718986D
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Nov 2021 18:27:41 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id t26so14695257lfk.9
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Nov 2021 10:27:41 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Tue, 16 Nov 2021 20:27:15 +0200
Message-Id: <20211116182716.17199-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/kms: add --force-connect-hdmi
 command line parameter
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Add --force-connect-hdmi parameter which forces unconnected hdmi
connector to be connected state with 1080p 60Hz settings. This allow
running tests on hdmi connector without anything physically connected
to hdmi.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_core.c |  7 +++++++
 lib/igt_core.h |  1 +
 lib/igt_kms.c  | 31 +++++++++++++++++++++++++++++++
 3 files changed, 39 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index ec05535cd..513d3a1c6 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -269,6 +269,7 @@ jmp_buf igt_dynamic_jmpbuf;
 static unsigned int exit_handler_count;
 const char *igt_interactive_debug;
 bool igt_skip_crc_compare;
+bool igt_force_connect_hdmi;
 
 /* subtests helpers */
 static bool list_subtests = false;
@@ -324,6 +325,7 @@ enum {
 	OPT_DEBUG,
 	OPT_INTERACTIVE_DEBUG,
 	OPT_SKIP_CRC,
+	OPT_FORCE_CONNECT_HDMI,
 	OPT_TRACE_OOPS,
 	OPT_DEVICE,
 	OPT_VERSION,
@@ -708,6 +710,7 @@ static void print_usage(const char *help_str, bool output_on_stderr)
 		   "  --debug[=log-domain]\n"
 		   "  --interactive-debug[=domain]\n"
 		   "  --skip-crc-compare\n"
+		   "  --force-connect-hdmi\n"
 		   "  --trace-on-oops\n"
 		   "  --help-description\n"
 		   "  --describe\n"
@@ -885,6 +888,7 @@ static int common_init(int *argc, char **argv,
 		{"debug",             optional_argument, NULL, OPT_DEBUG},
 		{"interactive-debug", optional_argument, NULL, OPT_INTERACTIVE_DEBUG},
 		{"skip-crc-compare",  no_argument,       NULL, OPT_SKIP_CRC},
+		{"force-connect-hdmi", no_argument,      NULL, OPT_FORCE_CONNECT_HDMI},
 		{"trace-on-oops",     no_argument,       NULL, OPT_TRACE_OOPS},
 		{"device",            required_argument, NULL, OPT_DEVICE},
 		{"version",           no_argument,       NULL, OPT_VERSION},
@@ -1015,6 +1019,9 @@ static int common_init(int *argc, char **argv,
 		case OPT_SKIP_CRC:
 			igt_skip_crc_compare = true;
 			break;
+		case OPT_FORCE_CONNECT_HDMI:
+			igt_force_connect_hdmi = true;
+			break;
 		case OPT_TRACE_OOPS:
 			show_ftrace = true;
 			break;
diff --git a/lib/igt_core.h b/lib/igt_core.h
index 6b8dbf348..8cf9b527b 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1176,6 +1176,7 @@ void igt_skip_on_simulation(void);
 
 extern const char *igt_interactive_debug;
 extern bool igt_skip_crc_compare;
+extern bool igt_force_connect_hdmi;
 
 /**
  * igt_log_level:
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 34a2aa00e..923f261e7 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2057,6 +2057,28 @@ static void igt_output_reset(igt_output_t *output)
 		igt_output_set_prop_enum(output, IGT_CONNECTOR_DITHERING_MODE,
 					 "off");
 
+	if (igt_force_connect_hdmi && !igt_output_is_connected(output) &&
+	    (output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
+	    output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIB)) {
+		const drmModeModeInfo mode = {
+			148500,
+			1920, 2008, 2052, 2200, 0,
+			1080, 1084, 1089, 1125, 0,
+			60,
+			DRM_MODE_FLAG_NHSYNC,
+			0x48,
+			"1920x1080p\0"
+		};
+
+		kmstest_force_edid(output->display->drm_fd,
+				   output->config.connector,
+				   igt_kms_get_4k_edid());
+
+		if (kmstest_force_connector(output->display->drm_fd,
+					    output->config.connector,
+					    FORCE_CONNECTOR_DIGITAL))
+			igt_output_override_mode(output, &mode);
+	}
 }
 
 /**
@@ -4626,6 +4648,15 @@ void igt_enable_connectors(int drm_fd)
 					 c->connector_type_id);
 		}
 
+		if (igt_force_connect_hdmi &&
+		    (c->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
+		     c->connector_type == DRM_MODE_CONNECTOR_HDMIB)) {
+			if (!kmstest_force_connector(drm_fd, c, FORCE_CONNECTOR_DIGITAL))
+				igt_info("Unable to force state on %s-%d\n",
+					 kmstest_connector_type_str(c->connector_type),
+					 c->connector_type_id);
+		}
+
 		drmModeFreeConnector(c);
 	}
 }
-- 
2.28.0
