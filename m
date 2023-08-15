Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E46AD10E261
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Aug 2023 16:56:03 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Aug 2023 22:17:01 +0530
Message-Id: <20230815164815.320904-8-bhanuprakash.modem@intel.com>
In-Reply-To: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
References: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 07/81] tests/chamelium/kms_chamelium_edid:
 Document each subtest for testplan
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add documentation for all kms tests which is used by IGT testplan
documentation.

V2: - Add chamelium to the Functionality
    - Update Functionality to reflect the edid
V3: - Driver requirement: s/any/i915, xe/

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/chamelium/kms_chamelium_edid.c | 96 ++++++++++++++++++++++++++--
 1 file changed, 92 insertions(+), 4 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
index 446bbd204..8e730c818 100644
--- a/tests/chamelium/kms_chamelium_edid.c
+++ b/tests/chamelium/kms_chamelium_edid.c
@@ -25,8 +25,9 @@
  */
 
 /**
- * TEST: Tests behaviour of edid & timings using chamelium
+ * TEST: kms chamelium edid
  * Category: Display
+ * Description: Testing EDID with a Chamelium board
  */
 
 #include <fcntl.h>
@@ -149,22 +150,25 @@ static void check_mode(struct chamelium *chamelium, struct chamelium_port *port,
  * Description: Make sure the EDID exposed by KMS is the same as the screen's
  * Test category: functionality test
  * Run type: BAT
- * Functionality: dp
+ * Functionality: chamelium, dp_edid
  * Mega feature: DP
+ * Driver requirement: i915, xe
  *
  * SUBTEST: hdmi-edid-read
  * Description: Make sure the EDID exposed by KMS is the same as the screen's
  * Test category: functionality test
  * Run type: BAT
- * Functionality: hdmi
+ * Functionality: chamelium, hdmi_edid
  * Mega feature: HDMI
+ * Driver requirement: i915, xe
  *
  * SUBTEST: vga-edid-read
  * Description: Make sure the EDID exposed by KMS is the same as the screen's
  * Test category: functionality test
  * Run type: BAT
- * Functionality: vga
+ * Functionality: chamelium, vga_edid
  * Mega feature: VGA
+ * Driver requirement: i915, xe
  */
 static const char igt_custom_edid_type_read_desc[] =
 	"Make sure the EDID exposed by KMS is the same as the screen's";
@@ -205,6 +209,32 @@ static void igt_custom_edid_type_read(chamelium_data_t *data,
 	drmModeFreeConnector(connector);
 }
 
+/**
+ * SUBTEST: dp-edid-stress-resolution-%s
+ * Description: Stress test the DUT by testing multiple EDIDs, one right after
+ *              the other, and ensure their validity by check the real screen
+ *              resolution vs the advertised mode (%arg[1]) resolution.
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, dp_edid
+ * Mega feature: DP
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: hdmi-edid-stress-resolution-%s
+ * Description: Stress test the DUT by testing multiple EDIDs, one right after
+ *              the other, and ensure their validity by check the real screen
+ *              resolution vs the advertised mode (%arg[1]) resolution.
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, hdmi_edid
+ * Mega feature: HDMI
+ * Driver requirement: i915, xe
+ *
+ * arg[1]:
+ *
+ * @4k:      4K
+ * @non-4k:  Non 4K
+ */
 static const char igt_edid_stress_resolution_desc[] =
 	"Stress test the DUT by testing multiple EDIDs, one right after the other, "
 	"and ensure their validity by check the real screen resolution vs the "
@@ -274,6 +304,17 @@ static void edid_stress_resolution(chamelium_data_t *data,
 			      data->ports, data->port_count);
 }
 
+/**
+ * SUBTEST: dp-edid-resolution-list
+ * Description: Get an EDID with many modes of different configurations, set
+ *              them on the screen and check the screen resolution matches the
+ *              mode resolution.
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, dp_edid
+ * Mega feature: DP
+ * Driver requirement: i915, xe
+ */
 static const char igt_edid_resolution_list_desc[] =
 	"Get an EDID with many modes of different configurations, set them on the screen and check the"
 	" screen resolution matches the mode resolution.";
@@ -337,6 +378,32 @@ static void edid_resolution_list(chamelium_data_t *data,
 	drmModeFreeConnector(connector);
 }
 
+/**
+ * SUBTEST: dp-edid-change-during-%s
+ * Description: Simulate a screen being unplugged and another screen being
+ *              plugged during suspend, check that a uevent is sent and
+ *              connector status is updated during %arg[1]
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, dp_edid
+ * Mega feature: DP
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: hdmi-edid-change-during-%s
+ * Description: Simulate a screen being unplugged and another screen being
+ *              plugged during suspend, check that a uevent is sent and
+ *              connector status is updated during %arg[1]
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, dp_edid
+ * Mega feature: DP
+ * Driver requirement: i915, xe
+ *
+ * arg[1]:
+ *
+ * @hibernate:    hibernation
+ * @suspend:      suspend
+ */
 static const char test_suspend_resume_edid_change_desc[] =
 	"Simulate a screen being unplugged and another screen being plugged "
 	"during suspend, check that a uevent is sent and connector status is "
@@ -389,6 +456,27 @@ static void test_suspend_resume_edid_change(chamelium_data_t *data,
 			    link_status_failed[1][p]);
 }
 
+/**
+ * SUBTEST: dp-mode-timings
+ * Description: For each mode of the IGT base EDID, perform a modeset and check
+ *              the mode detected by the Chamelium receiver matches the mode we
+ *              set
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, dp_edid
+ * Mega feature: DP
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: hdmi-mode-timings
+ * Description: For each mode of the IGT base EDID, perform a modeset and check
+ *              the mode detected by the Chamelium receiver matches the mode we
+ *              set
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, dp_edid
+ * Mega feature: DP
+ * Driver requirement: i915, xe
+ */
 static const char test_mode_timings_desc[] =
 	"For each mode of the IGT base EDID, perform a modeset and check the "
 	"mode detected by the Chamelium receiver matches the mode we set";
-- 
2.40.0
