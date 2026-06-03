Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAABCD6E55
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jun 2026 15:22:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B591C112010;
	Wed,  3 Jun 2026 15:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QJRD1Sfl";
	dkim-atps=neutral
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1CB11200A
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jun 2026 15:21:49 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2c0c1e0d00bso37943905ad.0
 for <igt-dev@lists.freedesktop.org>; Wed, 03 Jun 2026 08:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780500108; x=1781104908; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W9ylqUl60FZudLEsFxvz0vT976bLtrOyaRPx/Ap0QPg=;
 b=QJRD1Sfl6VFR5wu3S/mAA4g6tHmN7tG6na8U+nsJL72SGDpQjL5U/d7miKQWnvewu5
 1+rg2Min8FVo8vxgTAdp5tUwdVyGf+uthw2tpd/trl9eNQ3jxLkLieT2KuGmTpqxp0M4
 ko+lye/64I9yWWuesmXgLAAM7+su1js8/zqRGRDrl51WD12rvdZONhyiZBMjKxVUTG2J
 TZsSBMMBhjQhYoXdmsiQUypZUjNaauTh4thUFAYPs3+bAnhCNt6MXiQl6bXJGxhlaboz
 T/sRGX+qVpsUYAibmWEffXRwLIk4hTwjpmS5vOiSP0+/BGBfEMUaBKmm7Y9MRBW5i06v
 D+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780500108; x=1781104908;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W9ylqUl60FZudLEsFxvz0vT976bLtrOyaRPx/Ap0QPg=;
 b=JCe9Jvd+q/Usc50kUjYzfTVB9oYnxYjix0lHnn2r1p1rwiUcxF/K+A6/KzOTQGTAo7
 yTiFatcjxbkCq2rNof8N4kwM7GAiORqTSBW/x0JJVjjoStBq13fu+QScBHNnIORfOtmR
 Y0klK6fEopIQTCqI62Gvf1UretvIdl1jR5z6Bstz3LCiOFMEFzIuMKFMeQwhYHR0Tw7e
 o1vw5n8nn4DD83Ggx6oRq32W1ea2ZKLmeKfsa6Tk+3DIgQ6p9XQEu6aBbhCj35IUNDfW
 E4vKvVDyiJ3GqdSrTeMS8MsW75pd9NzcRI5UguNfFK9Xnp4Dg+X1b9DjsyFtjNf1Q4kD
 uLQA==
X-Gm-Message-State: AOJu0YxkQ3yqgHRaspWE0V0TxpmQa75YcOo1CmfcJ8JJ3CxY6Hfvs3uE
 KWlqGsS3WwoGUmaarKccxiCUseAmOx+h2S/KchBKJ04kxf1Yl86bmPLtl2rhZgHV
X-Gm-Gg: Acq92OGsRhL43wOnKdlb/KDplIcvGS4mk4hEQ9n651F1TO2NHDhPfX2Q549gxx+hlsq
 XYmlkHuEsUlfCmcJXr8frKCBjDbdsB+IPQP5/WaQcUy6wyWcSEkcajzxNxovYqCmbPB0A8b1SSf
 h0btgrSepRTLBLk/dKZOSUUzP6KOuDTIbmtDAkHB/5I3+7ZA/UKzIRfwp26TGLGyqmUWIdUeW3F
 R+wJed15cUq3vXdKaUEch6jj2oi5yIp/kz8hOT/g07b9gXGO72gSft9uHS9qwiYMIBKichZrh6w
 P4A8NW4OdEAVzX/g12hBUayD8DKkA8MVZuraUDHZBVrtOQf7UUVlKpBwtKyLHadKIF4DxXhJ8YO
 JMb4WNwGFqzlZzkCC7bLA+JfOdsQfGL2YOKBxUxQliGNt3iAYH+ewOj6FCZHkRP2JgO9vBEZ3No
 CM0jFP45k5drWECU0cvg330OfuxFSq/0shV4o2tz1fkngi3BhtUIQ+DadhNzFNU20UlWAh9VdIB
 ZDdgIzqIj0=
X-Received: by 2002:a17:902:f547:b0:2bf:2188:a916 with SMTP id
 d9443c01a7336-2c163a3dbe8mr41629055ad.10.1780500108368; 
 Wed, 03 Jun 2026 08:21:48 -0700 (PDT)
Received: from localhost ([134.134.139.75]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c16629d55esm29323295ad.63.2026.06.03.08.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 08:21:47 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>
Subject: [PATCH i-g-t] lib/igt_kms: add --connector option to filter outputs
 by name
Date: Wed,  3 Jun 2026 18:21:40 +0300
Message-ID: <20260603152140.3501317-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add a global --connector command line option and IGT_CONNECTOR
environment variable which allow restrict KMS tests to subset
of connectors by name. Matching is done with strstr(), so "HDMI"
selects all HDMI connectors, "DP" all DisplayPort connectors, and
"DP-1" only DP-1.

The filter is applied in the two core output-iteration primitives,
for_each_connected_output() and igt_crtc_connector_valid(), so all
higher-level macros (for_each_valid_output_on_crtc,
for_each_crtc_with_valid_output, for_each_crtc_with_single_output)
honor it automatically.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_core.c | 12 ++++++++++++
 lib/igt_core.h | 12 ++++++++++++
 lib/igt_kms.h  | 27 ++++++++++++++++++++++++++-
 3 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index dc3ac5304..5198d4ec5 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -358,6 +358,7 @@ enum {
 	OPT_HOOK,
 	OPT_HELP_HOOK,
 	OPT_DEVICE,
+	OPT_CONNECTOR,
 	OPT_VERSION,
 	OPT_HELP = 'h'
 };
@@ -951,6 +952,7 @@ static void print_usage(const char *help_str, bool output_on_stderr)
 		   "  --help-description\n"
 		   "  --describe\n"
 		   "  --device filters\n"
+		   "  --connector <name>\n"
 		   "  --version\n"
 		   "  --help|-h\n");
 	if (help_str)
@@ -1119,6 +1121,10 @@ static void common_init_env(void)
 		igt_rc_device = strdup(env);
 	}
 
+	env = getenv("IGT_CONNECTOR");
+	if (env)
+		igt_connector_filter = strdup(env);
+
 	env = getenv("IGT_RUNNER_SOCKET_FD");
 	if (env) {
 		set_runner_socket(atoi(env));
@@ -1147,6 +1153,7 @@ static int common_init(int *argc, char **argv,
 		{"hook",              required_argument, NULL, OPT_HOOK},
 		{"help-hook",         no_argument,       NULL, OPT_HELP_HOOK},
 		{"device",            required_argument, NULL, OPT_DEVICE},
+		{"connector",         required_argument, NULL, OPT_CONNECTOR},
 		{"version",           no_argument,       NULL, OPT_VERSION},
 		{"help",              no_argument,       NULL, OPT_HELP},
 		{0, 0, 0, 0}
@@ -1300,6 +1307,10 @@ static int common_init(int *argc, char **argv,
 			}
 			igt_device_filter_add(optarg);
 			break;
+		case OPT_CONNECTOR:
+			assert(optarg);
+			igt_connector_filter = strdup(optarg);
+			break;
 		case OPT_VERSION:
 			print_version();
 			ret = -1;
@@ -1440,6 +1451,7 @@ int igt_subtest_init_parse_opts(int *argc, char **argv,
 }
 
 enum igt_log_level igt_log_level = IGT_LOG_INFO;
+char *igt_connector_filter;
 
 /**
  * igt_simple_init_parse_opts:
diff --git a/lib/igt_core.h b/lib/igt_core.h
index 7ee9ceddd..8e468cc74 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1354,6 +1354,18 @@ void igt_log_buffer_inspect(igt_buffer_log_handler_t check, void *data);
 
 extern enum igt_log_level igt_log_level;
 
+/**
+ * igt_connector_filter:
+ *
+ * Global connector name filter, set via the '--connector' command line option
+ * or the 'IGT_CONNECTOR' environment variable. When non-NULL, KMS output
+ * iteration macros (e.g. for_each_connected_output(),
+ * for_each_valid_output_on_crtc()) only enumerate outputs whose name contains
+ * this string (matched with strstr()). NULL means no filtering
+ * (all outputs are enumerated).
+ */
+extern char *igt_connector_filter;
+
 /**
  * igt_warn_on:
  * @condition: condition to test
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index c2a3099de..3d59b0d93 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -32,11 +32,13 @@
 #include <stdbool.h>
 #include <stdint.h>
 #include <stddef.h>
+#include <string.h>
 #include <assert.h>
 #include <limits.h>
 
 #include <xf86drmMode.h>
 
+#include "igt_core.h"
 #include "igt_fb.h"
 #include "ioctl_wrappers.h"
 
@@ -672,6 +674,27 @@ static inline bool igt_output_is_connected(igt_output_t *output)
 	return false;
 }
 
+/**
+ * igt_output_matches_connector_filter:
+ * @output: #igt_output_t to check.
+ *
+ * Checks whether the given @output passes the global connector filter set via
+ * the '--connector' command line option (or the 'IGT_CONNECTOR' environment
+ * variable). The match is done with strstr(), so e.g. "HDMI" matches all HDMI
+ * connectors.
+ *
+ * Returns: True if no filter is set or the @output's name contains the filter
+ * string, otherwise False.
+ */
+static inline bool igt_output_matches_connector_filter(igt_output_t *output)
+{
+	if (!igt_connector_filter)
+		return true;
+
+	return output->name &&
+	       strstr(output->name, igt_connector_filter);
+}
+
 /**
  * igt_crtc_connector_valid:
  * @crtc: CRTC to check.
@@ -682,6 +705,7 @@ static inline bool igt_output_is_connected(igt_output_t *output)
 static inline bool igt_crtc_connector_valid(igt_crtc_t *crtc, igt_output_t *output)
 {
 	return igt_output_is_connected(output) &&
+		igt_output_matches_connector_filter(output) &&
 		output->config.valid_crtc_index_mask & (1 << crtc->crtc_index);
 }
 
@@ -708,7 +732,8 @@ static inline bool igt_crtc_connector_valid(igt_crtc_t *crtc, igt_output_t *outp
  */
 #define for_each_connected_output(display, output)		\
 	for_each_output((display), (output))	\
-		for_each_if ((igt_output_is_connected((output))))
+		for_each_if ((igt_output_is_connected((output))) && \
+			     igt_output_matches_connector_filter((output)))
 
 /**
  * for_each_disconnected_output:
-- 
2.43.0

