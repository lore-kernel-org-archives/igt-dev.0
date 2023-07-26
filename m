Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3369B10E14B
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jul 2023 13:41:42 +0000 (UTC)
From: Nemesa Garg <nemesa.garg@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 26 Jul 2023 19:10:08 +0530
Message-Id: <20230726134008.750267-1-nemesa.garg@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t,
 v2] tests/kms_hdmi_inject: Fix audio test by loading snd driver
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
 tests/kms_hdmi_inject.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
index 9aa5c59fc..93a1e53d3 100644
--- a/tests/kms_hdmi_inject.c
+++ b/tests/kms_hdmi_inject.c
@@ -29,6 +29,7 @@
 #include "igt.h"
 #include "igt_edid.h"
 #include "igt_eld.h"
+#include "igt_kmod.h"
 #include "xe/xe_query.h"
 
 #define HDISPLAY_4K	3840
@@ -206,6 +207,9 @@ igt_main
 		igt_require(connector);
 
 		kmstest_unset_all_crtcs(drm_fd, res);
+
+		if (!igt_kmod_is_loaded("snd_hda_intel"))
+			igt_kmod_load("snd_hda_intel", NULL);
 	}
 
 	igt_describe("Make sure that 4K modes exposed by DRM match the "
-- 
2.25.1
