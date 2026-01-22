Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199F3C44500
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 11:05:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB89F10E06D;
	Thu, 22 Jan 2026 11:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KBdjTACM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE81610E06D
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 11:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769079922; x=1800615922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ouFb61Gmn/xfv3B0XjWDN5H5Nbv4eKiziZYGteRHnUo=;
 b=KBdjTACMYa9iYXm6S+hl1/xKwlwDbfZtkxQ0i7bNY1HL92qUuOsVCbIJ
 +9Xktlf2QsKMOof0zs/C4aVneDq7PTZenx/vJfrPoI8EPC55q9wn71iDG
 E4acAP/snjlPr6oKdb3kDTnWeJ/d7+TaL6gXUOihGqJkoNRTYfg8AJE8G
 U0uSzYsMoKfOSUEHerqatL1ObyGziMk+mizSXl7OaH0PdX0Zulf0OcPSx
 UVUzeTZt48A/2U4gx9RBNHtrmhQT1Tebx8b8FxKMju7ACL1tFXxHbJDTZ
 zd9Of0GHhx31Agl8vKLhVS4qv4t/8kl1/wHogqWWMxaDN1gyZ44/zdk5R w==;
X-CSE-ConnectionGUID: OZRezE3xTBS1bk+MmfkY7g==
X-CSE-MsgGUID: JqzJzjDhRf6pQI0h2aLohQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="87896082"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="87896082"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 03:05:22 -0800
X-CSE-ConnectionGUID: NGlLoiedTNqEA1cHm20RaQ==
X-CSE-MsgGUID: WXtPmC8GSVGwmJsJeSSnfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="237375539"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 03:05:20 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 louis.chauvet@bootlin.com, Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v5 1/5] lib/igt_kms: Add a detect timeout value
Date: Thu, 22 Jan 2026 16:33:56 +0530
Message-ID: <20260122110400.330188-2-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260122110400.330188-1-mohammed.bilal@intel.com>
References: <20260122110400.330188-1-mohammed.bilal@intel.com>
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

Some tests need to wait for a specific connector status. In order to make
the timeout customisable for each target, add an option in the
configuration file.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 lib/igt_core.c |  4 ++++
 lib/igt_kms.c  | 35 +++++++++++++++++++++++++++++++++++
 lib/igt_kms.h  | 10 ++++++++++
 3 files changed, 49 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 3ee670a41..da2453cc1 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -271,6 +271,10 @@
  *	&num; It is not mandatory and allows overriding default values.
  *	[DUT]
  *	SuspendResumeDelay=10
+ *
+ *	&num; The following option define the timeout for detection feature
+ *	&num; (waiting for a connector status)
+ *	DisplayDetectTimeout=10.0
  * ]|
  *
  * Some specific configuration options may be used by specific parts of IGT,
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 7b6102cb7..897b7fc70 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -60,6 +60,7 @@
 #include "igt_debugfs.h"
 #include "igt_device.h"
 #include "igt_pipe_crc.h"
+#include "igt_rc.h"
 #include "igt_sysfs.h"
 #include "sw_sync.h"
 #ifdef HAVE_CHAMELIUM
@@ -7988,3 +7989,37 @@ bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output)
                                               buf, sizeof(buf));
         return res == 0;
 }
+
+/**
+ * igt_default_display_detect_timeout:
+ *
+ * Get the default timeout value for detection feature
+ *
+ * Some tests requires to wait for a specific connector status. This value will determine the
+ * timeout value for this waiting.
+ */
+double igt_default_display_detect_timeout(void)
+{
+	static double timeout = 0.0;
+	static bool first_call = true;
+	GError *error = NULL;
+
+	if (first_call) {
+		if (igt_key_file) {
+			timeout = g_key_file_get_double(igt_key_file, "DUT", "DisplayDetectTimeout",
+							&error);
+			if (error) {
+				igt_debug("Failed to read DisplayDetectTimeout, defaulting to %f\n",
+					  DEFAULT_DETECT_TIMEOUT);
+				g_clear_error(&error);
+				timeout = DEFAULT_DETECT_TIMEOUT;
+			}
+		} else {
+			timeout = DEFAULT_DETECT_TIMEOUT;
+		}
+
+		first_call = false;
+	}
+
+	return timeout;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index b291673c2..1347cf355 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -40,6 +40,14 @@
 #include "igt_fb.h"
 #include "ioctl_wrappers.h"
 
+/**
+ * define DEFAULT_DETECT_TIMEOUT - Default timeout in second used for some screen detection
+ * functions
+ *
+ * It can be overiden by option DetectTimeout in the .igtrc file.
+ */
+#define DEFAULT_DETECT_TIMEOUT 10.0
+
 /* Low-level helpers with kmstest_ prefix */
 
 /**
@@ -1303,4 +1311,6 @@ void igt_get_and_wait_out_fence(igt_output_t *output);
 
 igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
 
+double igt_default_display_detect_timeout(void);
+
 #endif /* __IGT_KMS_H__ */
-- 
2.48.1

