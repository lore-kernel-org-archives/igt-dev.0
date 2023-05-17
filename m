Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EF110E3C9
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 06:40:04 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 17 May 2023 12:02:54 +0530
Message-Id: <20230517063323.4146387-53-bhanuprakash.modem@intel.com>
In-Reply-To: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
References: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 52/81] tests/kms_hdmi_inject: Document each
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
To: igt-dev@lists.freedesktop.org, mchehab@kernel.org
List-ID: <igt-dev@lists.freedesktop.org>

Add documentation for all kms tests which is used by IGT testplan
documentation.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_hdmi_inject.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
index 2085d1453..244768f36 100644
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


