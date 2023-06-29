Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F83110E3F3
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 14:56:51 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Jun 2023 20:18:41 +0530
Message-Id: <20230629144910.3055377-53-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V5 i-g-t 52/81] tests/kms_hdmi_inject: Document each
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_hdmi_inject.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
index 9aa5c59fc..436f34a8c 100644
--- a/tests/kms_hdmi_inject.c
+++ b/tests/kms_hdmi_inject.c
@@ -30,6 +30,31 @@
 #include "igt_edid.h"
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
+ * Driver requirement: any
+ * Functionality: force_connector
+ * Mega feature: HDMI
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: inject-audio
+ * Description: Make sure that audio information exposed by ALSA match the forced
+ *              EDID.
+ * Driver requirement: any
+ * Functionality: force_connector
+ * Mega feature: Disply Audio
+ * Run type: FULL
+ * Test category: functionality test
+ */
 
 #define HDISPLAY_4K	3840
 #define VDISPLAY_4K	2160
-- 
2.40.0
