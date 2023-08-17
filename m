Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC4FA10E3EE
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 05:05:34 +0000 (UTC)
From: Nemesa Garg <nemesa.garg@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 17 Aug 2023 10:34:12 +0530
Message-Id: <20230817050412.1647350-1-nemesa.garg@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t,
 v3] tests/kms_hdmi_inject: Fix audio test by loading snd driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nemesa Garg <nemesa.garg@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

As audio driver is blacklisted so load the snd_hda_intel
module before the inject_audio test run.

v2: Address comments(Kamil)

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 tests/kms_hdmi_inject.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
index 9aa5c59fc..cb5ccd14d 100644
--- a/tests/kms_hdmi_inject.c
+++ b/tests/kms_hdmi_inject.c
@@ -29,11 +29,18 @@
 #include "igt.h"
 #include "igt_edid.h"
 #include "igt_eld.h"
+#include "igt_kmod.h"
 #include "xe/xe_query.h"
 
 #define HDISPLAY_4K	3840
 #define VDISPLAY_4K	2160
 
+/*
+ * Wait for 200ms as it take time for making
+ * driver entry after the driver load.
+ */
+#define AUDIO_DELAY_US  200000
+
 IGT_TEST_DESCRIPTION("Test that in-kernel EDID parsing is producing "
 		     "expected results by forcing a HDMI connector "
 		     "with a known EDID and checking that the metadata "
@@ -144,6 +151,11 @@ hdmi_inject_audio(int drm_fd, drmModeConnector *connector)
 	struct igt_fb fb;
 	struct kmstest_connector_config config;
 
+	if (!igt_kmod_is_loaded("snd_hda_intel"))
+		igt_assert(igt_kmod_load("snd_hda_intel", NULL) == 0);
+
+	usleep(AUDIO_DELAY_US);
+
 	igt_require(eld_is_supported());
 
 	edid = igt_kms_get_hdmi_audio_edid();
-- 
2.25.1
