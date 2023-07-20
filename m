Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1295F10E159
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jul 2023 15:04:01 +0000 (UTC)
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 20 Jul 2023 20:32:39 +0530
Message-Id: <20230720150239.550161-1-nemesa.garg@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_hdmi_inject: As audio driver is
 blacklisted so loading the module before the test run
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Garg@freedesktop.org, "Garg, Nemesa" <nemesa.garg@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Garg, Nemesa <nemesa.garg@intel.com>
---
 tests/kms_hdmi_inject.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
index 9aa5c59fc..1b99e190e 100644
--- a/tests/kms_hdmi_inject.c
+++ b/tests/kms_hdmi_inject.c
@@ -30,6 +30,7 @@
 #include "igt_edid.h"
 #include "igt_eld.h"
 #include "xe/xe_query.h"
+#include "igt_kmod.h"
 
 #define HDISPLAY_4K	3840
 #define VDISPLAY_4K	2160
@@ -208,6 +209,9 @@ igt_main
 		kmstest_unset_all_crtcs(drm_fd, res);
 	}
 
+	if (!igt_kmod_is_loaded("snd_hda_intel"))
+                igt_kmod_load("snd_hda_intel", NULL);
+
 	igt_describe("Make sure that 4K modes exposed by DRM match the "
                      "forced EDID and modesetting using it succeed.");
 	igt_subtest("inject-4k")
-- 
2.25.1
