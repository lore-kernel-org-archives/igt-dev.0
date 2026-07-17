Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C58BC44507
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 09:32:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1EE10F4CF;
	Fri, 17 Jul 2026 09:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LUyvFI7x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6DFC10F4C6
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 09:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784280725; x=1815816725;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PF7ZbSslockfnq7QL3rNdPWzYiynx8CDZAM0HKfFMXw=;
 b=LUyvFI7x46VvDuWwUA+5UsbylgYI8580kcuzEXiLvjIkgotOF5Evn8+6
 a+RfcYUB9BdD0vDfimSm2ivHq/0UEdJwLqtdYgJTkeME+WmLlj8t0R6hK
 3lKGET/jyH9e5oGCt2Nn8eCe61kdAl8lJLib6/oTRN4GBsdKNI0f0mfg9
 C+nVbCGOL9b2J4HIJxEmgyjqbN3JLfT3m37w90OgYCewjyRZn3eNIN/sy
 MebD7135nzzFu3VqpqDGohYE7qSa/w69cVDoWxlkr/IjTrhXYqyRU11vj
 G5GEAoPSbgbqGISGj4vK2R26ZoeAkJhtT6NKDGWFAurxnfTWFOxrd6E8O A==;
X-CSE-ConnectionGUID: w+OF9MSuSieAzFA3Jsgx0Q==
X-CSE-MsgGUID: kCegA6W+RwmHAvh9BDbG3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84071272"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="84071272"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 02:32:05 -0700
X-CSE-ConnectionGUID: utk7AbYPStGFWs+BNrlKPA==
X-CSE-MsgGUID: tTN/5v6cTY2aXtyAlNdgjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="261026813"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa005.jf.intel.com with ESMTP; 17 Jul 2026 02:32:04 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com,
	Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH] lib/igt_eld: Poll for async HDA codec probe in
 eld_is_supported()
Date: Fri, 17 Jul 2026 15:21:10 +0530
Message-ID: <20260717095110.4193078-1-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
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

The ALSA HDA HDMI/DP codec enumerates and creates its eld# procfs nodes
asynchronously with respect to the graphics driver load and the
i915/xe <-> snd_hda_intel audio-component binding. When eld_is_supported()
is queried before that probe completes (e.g. shortly after boot or a driver
reload), the glob for /proc/asound/card*/eld#* returns no match and the
caller skips, producing sporadic skips of tests such as
kms_hdmi_inject@inject-audio and kms_chamelium_audio.

Split the glob check into eld_has_nodes() and poll it via igt_wait() for a
bounded 2s before giving up. The common case where the nodes already exist
returns immediately, so there is no added cost when audio is already up.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 lib/igt_eld.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/lib/igt_eld.c b/lib/igt_eld.c
index 6cec9abdd..4a6f867ab 100644
--- a/lib/igt_eld.c
+++ b/lib/igt_eld.c
@@ -33,12 +33,22 @@
 #include <stdio.h>
 #include <string.h>
 
+#include "igt_aux.h"
 #include "igt_core.h"
 #include "igt_eld.h"
 
 #define ELD_PREFIX "eld#"
 #define ELD_DELIM " \t"
 
+/*
+ * The ALSA HDA HDMI/DP codec enumerates and creates its eld# procfs nodes
+ * asynchronously with respect to the graphics driver load and the
+ * i915/xe <-> snd_hda_intel audio-component binding. Poll for a short while
+ * so a not-yet-probed codec doesn't cause a spurious skip.
+ */
+#define ELD_SUPPORTED_TIMEOUT_MS 2000
+#define ELD_SUPPORTED_INTERVAL_MS 100
+
 /**
  * EDID-Like Data (ELD) is metadata parsed and exposed by ALSA for HDMI and
  * DisplayPort connectors supporting audio. This includes the monitor name and
@@ -266,9 +276,8 @@ bool eld_has_igt(void)
 	return eld_get_igt(&eld);
 }
 
-/** eld_is_supported: check whether the ALSA procfs is enabled, audio cards
- * are found and ELDs are supported */
-bool eld_is_supported(void)
+/* eld_has_nodes: check whether any ALSA eld# procfs node exists */
+static bool eld_has_nodes(void)
 {
 	glob_t glob_buf = {0};
 	int ret;
@@ -285,6 +294,17 @@ bool eld_is_supported(void)
 	return has_elds;
 }
 
+/** eld_is_supported: check whether the ALSA procfs is enabled, audio cards
+ * are found and ELDs are supported.
+ *
+ * The eld# nodes are created asynchronously by the HDA HDMI codec, so poll
+ * for a bounded amount of time before giving up to avoid spurious skips. */
+bool eld_is_supported(void)
+{
+	return igt_wait(eld_has_nodes(), ELD_SUPPORTED_TIMEOUT_MS,
+			ELD_SUPPORTED_INTERVAL_MS);
+}
+
 #define ELD_MAX_SIZE 256
 #define MONITOR_NAME_OFFSET 20
 #define MONITOR_NAME_MAX_SIZE 16
-- 
2.50.1

