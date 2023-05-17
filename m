Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782B510E3B1
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 06:39:02 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 17 May 2023 12:02:12 +0530
Message-Id: <20230517063323.4146387-11-bhanuprakash.modem@intel.com>
In-Reply-To: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
References: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 10/81] tests/chamelium/kms_chamelium_hpd:
 Document each subtest for testplan
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
 tests/chamelium/kms_chamelium_hpd.c | 186 +++++++++++++++++++++++++++-
 1 file changed, 185 insertions(+), 1 deletion(-)

diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
index ea0ee10e7..6926dcb6b 100644
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
 
 #include "igt_chamelium_helper.h"
@@ -117,6 +118,7 @@ static void try_suspend_resume_hpd(chamelium_data_t *data,
  * Run type: BAT
  * Functionality: dp_hotplug
  * Mega feature: DP
+ * Driver requirement: any
  *
  * SUBTEST: hdmi-hpd-fast
  * Description: Check that we get uevents and updated connector status on
@@ -125,6 +127,7 @@ static void try_suspend_resume_hpd(chamelium_data_t *data,
  * Run type: BAT
  * Functionality: hdmi_hotplug
  * Mega feature: HDMI
+ * Driver requirement: any
  *
  * SUBTEST: vga-hpd-fast
  * Description: Check that we get uevents and updated connector status on
@@ -133,6 +136,66 @@ static void try_suspend_resume_hpd(chamelium_data_t *data,
  * Run type: BAT
  * Functionality: vga_hotplug
  * Mega feature: VGA
+ * Driver requirement: any
+ *
+ * SUBTEST: dp-hpd
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: dp_hotplug
+ * Mega feature: DP
+ * Driver requirement: any
+ *
+ * SUBTEST: hdmi-hpd
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: hdmi_hotplug
+ * Mega feature: HDMI
+ * Driver requirement: any
+ *
+ * SUBTEST: vga-hpd
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: vga_hotplug
+ * Mega feature: VGA
+ * Driver requirement: any
+ *
+ * SUBTEST: dp-hpd-%s
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: dp_hotplug
+ * Mega feature: DP
+ * Driver requirement: any
+ *
+ * SUBTEST: hdmi-hpd-%s
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: hdmi_hotplug
+ * Mega feature: HDMI
+ * Driver requirement: any
+ *
+ * SUBTEST: vga-hpd-%s
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: vga_hotplug
+ * Mega feature: VGA
+ * Driver requirement: any
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
+ * Functionality: dp_hotplug
+ * Mega feature: DP
+ * Driver requirement: any
+ *
+ * SUBTEST: hdmi-hpd-for-each-pipe
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug for each pipe with valid output
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: hdmi_hotplug
+ * Mega feature: HDMI
+ * Driver requirement: any
+ *
+ * SUBTEST: vga-hpd-for-each-pipe
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug for each pipe with valid output
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: vga_hotplug
+ * Mega feature: VGA
+ * Driver requirement: any
+ */
 static const char test_hotplug_for_each_pipe_desc[] =
 	"Check that we get uevents and updated connector status on "
 	"hotplug and unplug for each pipe with valid output";
@@ -245,6 +336,39 @@ static void test_hotplug_for_each_pipe(chamelium_data_t *data,
 	igt_hpd_storm_reset(data->drm_fd);
 }
 
+/**
+ * SUBTEST: dp-hpd-after-%s
+ * Description: Toggle HPD during %arg[1], check that uevents are sent and
+ *              connector status is updated
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: dp_hotplug
+ * Mega feature: DP
+ * Driver requirement: any
+ *
+ * SUBTEST: hdmi-hpd-after-%s
+ * Description: Toggle HPD during %arg[1], check that uevents are sent and
+ *              connector status is updated
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: hdmi_hotplug
+ * Mega feature: HDMI
+ * Driver requirement: any
+ *
+ * SUBTEST: vga-hpd-after-%s
+ * Description: Toggle HPD during %arg[1], check that uevents are sent and
+ *              connector status is updated
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: vga_hotplug
+ * Mega feature: VGA
+ * Driver requirement: any
+ *
+ * arg[1]:
+ *
+ * @hibernate:     Hibernation
+ * @suspend:       Suspend
+ */
 static const char test_suspend_resume_hpd_desc[] =
 	"Toggle HPD during suspend, check that uevents are sent and connector "
 	"status is updated";
@@ -276,6 +400,16 @@ static void test_suspend_resume_hpd(chamelium_data_t *data,
  * Run type: BAT
  * Functionality: hotplug
  * Mega feature: General Display Features
+ * Driver requirement: any
+ *
+ * SUBTEST: common-hpd-after-hibernate
+ * Description: Toggle HPD during suspend on all connectors, check that uevents
+ *              are sent and connector status is updated
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: hotplug
+ * Mega feature: General Display Features
+ * Driver requirement: any
  */
 static const char test_suspend_resume_hpd_common_desc[] =
 	"Toggle HPD during suspend on all connectors, check that uevents are "
@@ -306,6 +440,16 @@ static void test_suspend_resume_hpd_common(chamelium_data_t *data,
 	igt_cleanup_uevents(mon);
 }
 
+/**
+ * SUBTEST: vga-hpd-without-ddc
+ * Description: Disable DDC on a VGA connector, check we still get a uevent on
+ *              hotplug
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: vga_hotplug
+ * Mega feature: VGA
+ * Driver requirement: any
+ */
 static const char test_hpd_without_ddc_desc[] =
 	"Disable DDC on a VGA connector, check we still get a uevent on hotplug";
 static void test_hpd_without_ddc(chamelium_data_t *data,
@@ -332,6 +476,27 @@ static void test_hpd_without_ddc(chamelium_data_t *data,
 	igt_cleanup_uevents(mon);
 }
 
+/**
+ * SUBTEST: dp-hpd-storm
+ * Description: Trigger a series of hotplugs in a very small timeframe to
+ *              simulate abad cable, check the kernel falls back to polling
+ *              to avoid a hotplug storm
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: dp_hotplug
+ * Mega feature: DP
+ * Driver requirement: any
+ *
+ * SUBTEST: hdmi-hpd-storm
+ * Description: Trigger a series of hotplugs in a very small timeframe to
+ *              simulate abad cable, check the kernel falls back to polling
+ *              to avoid a hotplug storm
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: hdmi_hotplug
+ * Mega feature: HDMI
+ * Driver requirement: any
+ */
 static const char test_hpd_storm_detect_desc[] =
 	"Trigger a series of hotplugs in a very small timeframe to simulate a"
 	"bad cable, check the kernel falls back to polling to avoid a hotplug "
@@ -366,6 +531,25 @@ static void test_hpd_storm_detect(chamelium_data_t *data,
 	igt_hpd_storm_reset(data->drm_fd);
 }
 
+/**
+ * SUBTEST: dp-hpd-storm-disable
+ * Description: Disable HPD storm detection, trigger a storm and check the
+ *              kernel doesn't detect one
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: dp_hotplug
+ * Mega feature: DP
+ * Driver requirement: any
+ *
+ * SUBTEST: hdmi-hpd-storm-disable
+ * Description: Disable HPD storm detection, trigger a storm and check the
+ *              kernel doesn't detect one
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: hdmi_hotplug
+ * Mega feature: HDMI
+ * Driver requirement: any
+ */
 static const char test_hpd_storm_disable_desc[] =
 	"Disable HPD storm detection, trigger a storm and check the kernel "
 	"doesn't detect one";
-- 
2.40.0


