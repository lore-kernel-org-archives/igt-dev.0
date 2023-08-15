Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C38E10E261
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Aug 2023 16:56:05 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Aug 2023 22:17:03 +0530
Message-Id: <20230815164815.320904-10-bhanuprakash.modem@intel.com>
In-Reply-To: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
References: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 09/81] tests/chamelium/kms_chamelium_hpd:
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

V2: - Add chamelium & hotplug to the Functionality
V3: - Driver requirement: s/any/i915, xe/

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/chamelium/kms_chamelium_hpd.c | 224 ++++++++++++++++++++++++++--
 1 file changed, 215 insertions(+), 9 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
index 8b3189ca0..1599c0a62 100644
--- a/tests/chamelium/kms_chamelium_hpd.c
+++ b/tests/chamelium/kms_chamelium_hpd.c
@@ -25,8 +25,9 @@
  */
 
 /**
- * TEST: Tests behaviour of hpd using chamelium
+ * TEST: kms chamelium hpd
  * Category: Display
+ * Description: Testing HPD with a Chamelium board
  */
 
 #include "kms_chamelium_helper.h"
@@ -114,25 +115,87 @@ static void try_suspend_resume_hpd(chamelium_data_t *data,
  * Description: Check that we get uevents and updated connector status on
  * 		hotplug and unplug
  * Test category: functionality test
- * Run type: BAT
- * Functionality: dp_hotplug
+ * Run type: BAT, FULL
+ * Functionality: chamelium, hotplug
  * Mega feature: DP
+ * Driver requirement: i915, xe
  *
  * SUBTEST: hdmi-hpd-fast
  * Description: Check that we get uevents and updated connector status on
  * 		hotplug and unplug
  * Test category: functionality test
- * Run type: BAT
- * Functionality: hdmi_hotplug
+ * Run type: BAT, FULL
+ * Functionality: chamelium, hotplug
  * Mega feature: HDMI
+ * Driver requirement: i915, xe
  *
  * SUBTEST: vga-hpd-fast
  * Description: Check that we get uevents and updated connector status on
  * 		hotplug and unplug
  * Test category: functionality test
- * Run type: BAT
- * Functionality: vga_hotplug
+ * Run type: BAT, FULL
+ * Functionality: chamelium, hotplug
  * Mega feature: VGA
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: dp-hpd
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, hotplug
+ * Mega feature: DP
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: hdmi-hpd
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, hotplug
+ * Mega feature: HDMI
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: vga-hpd
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, hotplug
+ * Mega feature: VGA
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: dp-hpd-%s
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, hotplug
+ * Mega feature: DP
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: hdmi-hpd-%s
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, hotplug
+ * Mega feature: HDMI
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: vga-hpd-%s
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, hotplug
+ * Mega feature: VGA
+ * Driver requirement: i915, xe
+ *
+ * arg[1]:
+ *
+ * @enable-disable-mode:     Toggle the mode
+ * @with-enabled-mode:       Enabling the mode
  */
 static const char test_basic_hotplug_desc[] =
 	"Check that we get uevents and updated connector status on "
@@ -200,6 +263,34 @@ static void test_hotplug(chamelium_data_t *data, struct chamelium_port *port,
 	igt_remove_fb(data->drm_fd, &fb);
 }
 
+/**
+ * SUBTEST: dp-hpd-for-each-pipe
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug for each pipe with valid output
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, hotplug
+ * Mega feature: DP
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: hdmi-hpd-for-each-pipe
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug for each pipe with valid output
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, hotplug
+ * Mega feature: HDMI
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: vga-hpd-for-each-pipe
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug for each pipe with valid output
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, hotplug
+ * Mega feature: VGA
+ * Driver requirement: i915, xe
+ */
 static const char test_hotplug_for_each_pipe_desc[] =
 	"Check that we get uevents and updated connector status on "
 	"hotplug and unplug for each pipe with valid output";
@@ -245,6 +336,61 @@ static void test_hotplug_for_each_pipe(chamelium_data_t *data,
 	igt_hpd_storm_reset(data->drm_fd);
 }
 
+/**
+ * SUBTEST: dp-hpd-after-hibernate
+ * Description: Toggle HPD during Hibernation, check that uevents are sent and
+ *              connector status is updated
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, hotplug, hibernation
+ * Mega feature: DP
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: hdmi-hpd-after-hibernate
+ * Description: Toggle HPD during Hibernation, check that uevents are sent and
+ *              connector status is updated
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, hotplug, hibernation
+ * Mega feature: HDMI
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: vga-hpd-after-hibernate
+ * Description: Toggle HPD during Hibernation, check that uevents are sent and
+ *              connector status is updated
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, hotplug, hibernation
+ * Mega feature: VGA
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: dp-hpd-after-suspend
+ * Description: Toggle HPD during Suspend, check that uevents are sent and
+ *              connector status is updated
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, hotplug, suspend
+ * Mega feature: DP
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: hdmi-hpd-after-suspend
+ * Description: Toggle HPD during Suspend, check that uevents are sent and
+ *              connector status is updated
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, hotplug, suspend
+ * Mega feature: HDMI
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: vga-hpd-after-suspend
+ * Description: Toggle HPD during Suspend, check that uevents are sent and
+ *              connector status is updated
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, hotplug, suspend
+ * Mega feature: VGA
+ * Driver requirement: i915, xe
+ */
 static const char test_suspend_resume_hpd_desc[] =
 	"Toggle HPD during suspend, check that uevents are sent and connector "
 	"status is updated";
@@ -273,9 +419,19 @@ static void test_suspend_resume_hpd(chamelium_data_t *data,
  * Description: Toggle HPD during suspend on all connectors, check that uevents
  * 		are sent and connector status is updated
  * Test category: functionality test
- * Run type: BAT
- * Functionality: hotplug
+ * Run type: BAT, FULL
+ * Functionality: chamelium, hotplug, suspend
+ * Mega feature: General Display Features
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: common-hpd-after-hibernate
+ * Description: Toggle HPD during suspend on all connectors, check that uevents
+ *              are sent and connector status is updated
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, hotplug, hibernation
  * Mega feature: General Display Features
+ * Driver requirement: i915, xe
  */
 static const char test_suspend_resume_hpd_common_desc[] =
 	"Toggle HPD during suspend on all connectors, check that uevents are "
@@ -306,6 +462,16 @@ static void test_suspend_resume_hpd_common(chamelium_data_t *data,
 	igt_cleanup_uevents(mon);
 }
 
+/**
+ * SUBTEST: vga-hpd-without-ddc
+ * Description: Disable DDC on a VGA connector, check we still get a uevent on
+ *              hotplug
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, hotplug
+ * Mega feature: VGA
+ * Driver requirement: i915, xe
+ */
 static const char test_hpd_without_ddc_desc[] =
 	"Disable DDC on a VGA connector, check we still get a uevent on hotplug";
 static void test_hpd_without_ddc(chamelium_data_t *data,
@@ -332,6 +498,27 @@ static void test_hpd_without_ddc(chamelium_data_t *data,
 	igt_cleanup_uevents(mon);
 }
 
+/**
+ * SUBTEST: dp-hpd-storm
+ * Description: Trigger a series of hotplugs in a very small timeframe to
+ *              simulate abad cable, check the kernel falls back to polling
+ *              to avoid a hotplug storm
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, hotplug
+ * Mega feature: DP
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: hdmi-hpd-storm
+ * Description: Trigger a series of hotplugs in a very small timeframe to
+ *              simulate abad cable, check the kernel falls back to polling
+ *              to avoid a hotplug storm
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, hotplug
+ * Mega feature: HDMI
+ * Driver requirement: i915, xe
+ */
 static const char test_hpd_storm_detect_desc[] =
 	"Trigger a series of hotplugs in a very small timeframe to simulate a"
 	"bad cable, check the kernel falls back to polling to avoid a hotplug "
@@ -366,6 +553,25 @@ static void test_hpd_storm_detect(chamelium_data_t *data,
 	igt_hpd_storm_reset(data->drm_fd);
 }
 
+/**
+ * SUBTEST: dp-hpd-storm-disable
+ * Description: Disable HPD storm detection, trigger a storm and check the
+ *              kernel doesn't detect one
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, hotplug
+ * Mega feature: DP
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: hdmi-hpd-storm-disable
+ * Description: Disable HPD storm detection, trigger a storm and check the
+ *              kernel doesn't detect one
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, hotplug
+ * Mega feature: HDMI
+ * Driver requirement: i915, xe
+ */
 static const char test_hpd_storm_disable_desc[] =
 	"Disable HPD storm detection, trigger a storm and check the kernel "
 	"doesn't detect one";
-- 
2.40.0
