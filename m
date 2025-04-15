Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129D2C369B9
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 06:22:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F26910E34C;
	Tue, 15 Apr 2025 06:22:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OjRRAYqB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD1610E35D
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 06:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744698127; x=1776234127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sD69aYDQPPbKd3/XMsuNYL2hhmA12CXA7xbDZ+MY8X8=;
 b=OjRRAYqBPF93xd5VpaeKiTzfVIbmD1iSixnQkml+gP2H4uD45iLzFj/R
 oABpHCMm50mgfQ5zAgzhpEuRtn/eTEyyvKoYdp0MoCZRazwyrNBrD0snF
 kGZsqGiukhHJNXnYfps05E+Icy/VI9ISZ2twyPwbCWJtIXq6Lf1tq71ia
 IHMnefL3l/dPbgAa3n0saiF1vhq3Olz3kFF6fAa0NPgFzaqeIFvWNXbzl
 UeKKbZZwxduDoqouB12Rhe8q6FJ2H0DyAzXI/cBEYzrk2WRb8QPx42slK
 cdh2Qq9UihN5AEPLTOfEDq4yBeNmijR3LWGfckK0/998nuw2bLzIIs/BE g==;
X-CSE-ConnectionGUID: 5PsCL9oISwWd50nUKerBrQ==
X-CSE-MsgGUID: frsJoM+YSzKayY7182Id1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="56367851"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="56367851"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 23:22:06 -0700
X-CSE-ConnectionGUID: 3buVnXGmQd2lYQ9Z8xqO+A==
X-CSE-MsgGUID: 34ScrTQwTiGDFqTY0iI35w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="129993273"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 23:22:04 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 2/2] tests/chamelium/kms_chamelium_color: print output
 name in assert
Date: Tue, 15 Apr 2025 12:07:42 +0530
Message-Id: <20250415063742.3026718-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250415063742.3026718-1-kunal1.joshi@intel.com>
References: <20250415063742.3026718-1-kunal1.joshi@intel.com>
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

Print output name in assert

v2: print output name for better log readability (Swati)

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_chamelium.c                   | 62 --------------------------
 lib/igt_chamelium.h                   | 64 ++++++++++++++++++++++++---
 lib/intel_compute.c                   |  2 +
 tests/chamelium/kms_chamelium_color.c |  2 +-
 4 files changed, 61 insertions(+), 69 deletions(-)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index a96e36b5b..87ac1a1ca 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -24,28 +24,7 @@
  *  Lyude Paul <lyude@redhat.com>
  */
 
-#include "config.h"
-
-#include <stdbool.h>
-#include <string.h>
-#include <errno.h>
-#include <math.h>
-#include <xmlrpc-c/base.h>
-#include <xmlrpc-c/client.h>
-#include <pthread.h>
-#include <glib.h>
-#include <pixman.h>
-#include <cairo.h>
-
 #include "igt_chamelium.h"
-#include "igt_core.h"
-#include "igt_aux.h"
-#include "igt_edid.h"
-#include "igt_frame.h"
-#include "igt_list.h"
-#include "igt_kms.h"
-#include "igt_pipe_crc.h"
-#include "igt_rc.h"
 
 /**
  * SECTION:igt_chamelium
@@ -90,47 +69,6 @@
  * Especially with modern, more complex hardware where we may have LSPcons and
  * USB controllers in the way.
  */
-#define CHAMELIUM_HOTPLUG_DETECTION_DELAY 10
-
-struct chamelium_port {
-	unsigned int type;
-	int id;
-	int connector_id;
-	char *name;
-	bool adapter_allowed;
-	char *connector_path;
-	bool is_mapped;
-};
-
-struct chamelium_frame_dump {
-	unsigned char *bgr;
-	size_t size;
-	int width;
-	int height;
-	struct chamelium_port *port;
-};
-
-struct chamelium_fb_crc_async_data {
-	cairo_surface_t *fb_surface;
-
-	pthread_t thread_id;
-	igt_crc_t *ret;
-};
-
-struct chamelium {
-	xmlrpc_env env;
-	xmlrpc_client *client;
-	char *url;
-
-	/* Indicates the last port to have been used for capturing video */
-	struct chamelium_port *capturing_port;
-
-	int drm_fd;
-
-	struct igt_list_head edids;
-	struct chamelium_port ports[CHAMELIUM_MAX_PORTS];
-	int port_count;
-};
 
 bool igt_chamelium_allow_fsm_handling = true;
 
diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
index 8882e13fb..b2b97434f 100644
--- a/lib/igt_chamelium.h
+++ b/lib/igt_chamelium.h
@@ -28,23 +28,35 @@
 
 #include "config.h"
 
-#include <stdbool.h>
+#include <cairo.h>
+#include <errno.h>
+#include <glib.h>
+#include <math.h>
+#include <pixman.h>
+#include <pthread.h>
 #include <stddef.h>
+#include <stdbool.h>
+#include <string.h>
 #include <xf86drmMode.h>
+#include <xmlrpc-c/base.h>
+#include <xmlrpc-c/client.h>
 
+#include "igt_aux.h"
+#include "igt_core.h"
 #include "igt_debugfs.h"
+#include "igt_edid.h"
+#include "igt_frame.h"
 #include "igt_kms.h"
 #include "igt_list.h"
+#include "igt_pipe_crc.h"
+#include "igt_rc.h"
+
+#define CHAMELIUM_HOTPLUG_DETECTION_DELAY 10
 
 struct igt_fb;
 struct edid;
 typedef struct _igt_crc igt_crc_t;
 
-struct chamelium;
-struct chamelium_port;
-struct chamelium_frame_dump;
-struct chamelium_fb_crc_async_data;
-
 /**
  * chamelium_check:
  * @CHAMELIUM_CHECK_ANALOG: Fuzzy checking method for analog interfaces
@@ -107,6 +119,46 @@ extern bool igt_chamelium_allow_fsm_handling;
 
 #define CHAMELIUM_HOTPLUG_TIMEOUT 20 /* seconds */
 
+struct chamelium_port {
+        unsigned int type;
+        int id;
+        int connector_id;
+        char *name;
+        bool adapter_allowed;
+        char *connector_path;
+        bool is_mapped;
+};
+
+struct chamelium_frame_dump {
+        unsigned char *bgr;
+        size_t size;
+        int width;
+        int height;
+        struct chamelium_port *port;
+};
+
+struct chamelium_fb_crc_async_data {
+        cairo_surface_t *fb_surface;
+
+        pthread_t thread_id;
+        igt_crc_t *ret;
+};
+
+struct chamelium {
+        xmlrpc_env env;
+        xmlrpc_client *client;
+        char *url;
+
+        /* Indicates the last port to have been used for capturing video */
+        struct chamelium_port *capturing_port;
+
+        int drm_fd;
+
+        struct igt_list_head edids;
+        struct chamelium_port ports[CHAMELIUM_MAX_PORTS];
+        int port_count;
+};
+
 /**
  * chamelium_edid:
  * @chamelium: instance of the chamelium where the EDID will be applied
diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 825bfb110..827b72f54 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -22,7 +22,9 @@
 
 #define PIPE_CONTROL			0x7a000004
 #define MEDIA_STATE_FLUSH		0x0
+#ifndef MAX
 #define MAX(X, Y)			(((X) > (Y)) ? (X) : (Y))
+#endif
 #define SIZE_DATA			64
 #define SIZE_BATCH			0x10000
 #define SIZE_BUFFER_INPUT		MAX(sizeof(float) * SIZE_DATA, 0x10000)
diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index bf6510969..88b3717d4 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -758,7 +758,7 @@ igt_main
 			igt_assert_f(chamelium_reprobe_connector(&data.display,
 								 data.chamelium,
 								 data.ports[i]) == DRM_MODE_CONNECTED,
-								 "Output not connected\n");
+								 "%s not connected\n", data.chamelium->ports[i].name);
 		}
 
 		kmstest_set_vt_graphics_mode();
-- 
2.25.1

