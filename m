Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 854D710E270
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Aug 2023 16:57:16 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Aug 2023 22:17:45 +0530
Message-Id: <20230815164815.320904-52-bhanuprakash.modem@intel.com>
In-Reply-To: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
References: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 51/81] tests/kms_hdmi_inject: Document each
 subtest for testplan
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add documentation for all kms tests which is used by IGT testplan
documentation.

V2: - Driver requirement: s/any/i915, xe/

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_hdmi_inject.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
index 9aa5c59fc..ba2d457cc 100644
--- a/tests/kms_hdmi_inject.c
+++ b/tests/kms_hdmi_inject.c
@@ -31,6 +31,32 @@
 #include "igt_eld.h"
 #include "xe/xe_query.h"
 
+/**
+ * TEST: kms hdmi inject
+ * Category: Display
+ * Description: Test that in-kernel EDID parsing is producing expected results
+ *              by forcing a HDMI connector with a known EDID and checking that
+ *              the metadata exposed to user space matches.
+ *
+ * SUBTEST: inject-4k
+ * Description: Make sure that 4K modes exposed by DRM match the forced EDID and
+ *              modesetting using it succeed.
+ * Driver requirement: i915, xe
+ * Functionality: force_connector, hdmi_edid
+ * Mega feature: HDMI
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: inject-audio
+ * Description: Make sure that audio information exposed by ALSA match the forced
+ *              EDID.
+ * Driver requirement: i915, xe
+ * Functionality: audio, force_connector
+ * Mega feature: HDMI
+ * Run type: FULL
+ * Test category: functionality test
+ */
+
 #define HDISPLAY_4K	3840
 #define VDISPLAY_4K	2160
 
-- 
2.40.0
