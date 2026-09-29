Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCD7CA5FA5
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 09:07:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B3E10EDB9;
	Tue, 29 Sep 2026 09:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eYtdog7a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B177F10EDB8
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 09:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790672709; x=1822208709;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VUVjZbB/bZtp/ZCVDIj7vMONOR/PBMQcb16oDKnz9Mw=;
 b=eYtdog7ajoX5DNreSzArVK2pTMae6IgGd8vGBnP0ZdG7gxM6XBJk+B7B
 qY3/qdKLtDsXDX3OmVWRnUq4RMRUMcKhJ6JFGfHxbuc7w7b0UjW7FfM8A
 Kbpiy7JIE1Q57vtnQCz5+Ra0IywJUS8mZ5f0Mh2bWuzF67fnstCu/Zzzb
 PLuP0/ie6RwqBn62mJ880V/Bdo1lYmTpupNTsYwscMR6sQMvKsxlKXZdr
 3EcrdBGHIzetO1aqwOXHTPBkhOEwgH9wtY6YXLaFRa5D545OBnpwAwLAR
 1uDw3TjEwVMHS/m/JVyww4BsICIE46P2Z6vaSCJmDJr7X/smNecIZlqRK g==;
X-CSE-ConnectionGUID: u6JUT0WdTiyd+fbGbqOZuQ==
X-CSE-MsgGUID: sXYCNkMET6KzhRgkAqN9Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="91483780"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="91483780"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 02:05:08 -0700
X-CSE-ConnectionGUID: eaXjUmdOS1qU9WeEjSolhQ==
X-CSE-MsgGUID: ypAwRwVJTf2kz1TwKgi0ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="275462906"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 02:05:07 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, kunal1.joshi@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 1/5] tests/intel/kms_alpm: add ALPM test structure
Date: Tue, 29 Sep 2026 14:34:46 +0530
Message-ID: <20260929090454.2796967-2-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929090454.2796967-1-sowmiya.s@intel.com>
References: <20260929090454.2796967-1-sowmiya.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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

Add the kms_alpm test scaffolding covering ALPM (Advanced Link Power
Management) on eDP and DP 2.1 outputs: the shared alpm_status/data_t
types and the igt_main() fixture that opens the driver, requires an
atomic display and enumerates outputs.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Assisted-by: Gnai_Claude:sonnet-5
---
 tests/intel/kms_alpm.c | 96 ++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build      |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 tests/intel/kms_alpm.c

diff --git a/tests/intel/kms_alpm.c b/tests/intel/kms_alpm.c
new file mode 100644
index 000000000..8bd71a981
--- /dev/null
+++ b/tests/intel/kms_alpm.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * TEST: kms alpm
+ * Category: Display
+ * Description: Test ALPM (Advanced Link Power Management) on eDP and DP2.1
+ *              outputs
+ * Driver requirement: i915, xe
+ * Mega feature: Panel Replay
+ */
+
+#include <fcntl.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "igt.h"
+#include "igt_edid.h"
+#include "igt_psr.h"
+#include "igt_sysfs.h"
+#include "intel_chipset.h"
+
+#define ALPM_INFO_FILE		"i915_edp_lobf_info"
+#define ALPM_INFO_MAX_LEN	512
+#define ALPM_TIMEOUT_MS		100
+
+/*
+ * The kernel gates creation of the ALPM debugfs files on
+ * intel_alpm_source_supported(): external DisplayPort needs display ver 35,
+ * eDP needs display ver 20.
+ */
+#define ALPM_DP_MIN_DISPLAY_VER		35
+#define ALPM_EDP_MIN_DISPLAY_VER	20
+
+/**
+ * struct alpm_status - parsed contents of the ALPM info debugfs
+ * @lobf: ALPM_CTL_LOBF_ENABLE is set
+ * @aux_less: ALPM_CTL_ALPM_AUX_LESS_ENABLE is set
+ * @aux_wake: the aux-wake line as printed by the kernel
+ *
+ * The kernel dumps three lines derived from ALPM_CTL. Note that it never
+ * prints ALPM_CTL_ALPM_ENABLE directly, which constrains what can be
+ * asserted; see alpm_is_enabled().
+ *
+ * @aux_wake's meaning is connector-type dependent. Per the HAS, DP only ever
+ * uses AUX-Less ALPM flows - AUX-Wake is not supported by this feature on DP
+ * at all - so on a DP link @aux_wake is just the observed complement of
+ * @aux_less and carries no independent information (confirmed on a NovaLake
+ * DP link: "LOBF disabled, Aux-wake disabled, Aux-less enabled"). eDP is
+ * different: classic PSR2 genuinely runs over AUX-Wake ALPM (distinct from
+ * Panel Replay's AUX-Less), so there @aux_wake is real, independent evidence
+ * that ALPM is up. alpm_is_enabled() branches on connector type for exactly
+ * this reason - never read @aux_wake on its own, go through it (or
+ * alpm_mode_str(), which resolves the mode only once ALPM is known to be up).
+ */
+struct alpm_status {
+	bool lobf;
+	bool aux_less;
+	bool aux_wake;
+};
+
+typedef struct {
+	int drm_fd;
+	int debugfs_fd;
+	uint32_t devid;
+	igt_display_t display;
+	igt_output_t *output;
+	igt_crtc_t *crtc;
+	struct igt_fb fb;
+} data_t;
+
+int igt_main()
+{
+	data_t data = {};
+
+	igt_fixture() {
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
+		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
+		data.devid = intel_get_drm_devid(data.drm_fd);
+
+		kmstest_set_vt_graphics_mode();
+
+		igt_display_require(&data.display, data.drm_fd);
+		igt_require(data.display.is_atomic);
+		igt_display_require_output(&data.display);
+	}
+
+	igt_fixture() {
+		close(data.debugfs_fd);
+		igt_display_fini(&data.display);
+		drm_close_driver(data.drm_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 1ac89bab7..8ad4d096f 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -246,6 +246,7 @@ intel_i915_progs = [
 ]
 
 intel_kms_progs = [
+	'kms_alpm',
 	'kms_big_fb',
 	'kms_busy',
 	'kms_ccs',
-- 
2.43.0

