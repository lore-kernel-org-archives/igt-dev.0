Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660B610E261
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Aug 2023 16:56:04 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Aug 2023 22:17:02 +0530
Message-Id: <20230815164815.320904-9-bhanuprakash.modem@intel.com>
In-Reply-To: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
References: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 08/81] tests/chamelium/kms_chamelium_frames:
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

V2: - Add chamelium & frame-integrity to the Functionality
V3: - Driver requirement: s/any/i915, xe/

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/chamelium/kms_chamelium_frames.c | 105 ++++++++++++++++++++++++-
 1 file changed, 101 insertions(+), 4 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/kms_chamelium_frames.c
index a56afada4..20e108c21 100644
--- a/tests/chamelium/kms_chamelium_frames.c
+++ b/tests/chamelium/kms_chamelium_frames.c
@@ -25,10 +25,10 @@
  */
 
 /**
- * TEST: Tests to capture frames using chamelium
+ * TEST: kms chamelium frames
  * Category: Display
+ * Description: Tests requiring a Chamelium board
  */
-
 #include "igt_eld.h"
 #include "igt_infoframe.h"
 #include "kms_chamelium_helper.h"
@@ -545,16 +545,34 @@ static void prepare_randomized_plane(chamelium_data_t *data,
  * 		a few frames, then check captured frames are correct
  * Test category: functionality test
  * Run type: BAT
- * Functionality: dp
+ * Functionality: chamelium, frame_integrity
  * Mega feature: DP
+ * Driver requirement: i915, xe
  *
  * SUBTEST: hdmi-crc-fast
  * Description: Pick the first mode of the IGT base EDID, display and capture
  * 		a few frames, then check captured frames are correct
  * Test category: functionality test
  * Run type: BAT
- * Functionality: hdmi
+ * Functionality: chamelium, frame_integrity
+ * Mega feature: HDMI
+ * Driver requirement: i915, xe
+ */
+
+/**
+ * SUBTEST: hdmi-%s-formats
+ * Description: Pick the first mode of the IGT base EDID, display and capture a
+ *              few frames, then check captured frames are correct
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, frame_integrity
  * Mega feature: HDMI
+ * Driver requirement: i915, xe
+ *
+ * arg[1]:
+ *
+ * @crc-nonplanar:     CRC with non planar formats
+ * @cmp-planar:        Compare with planar formats
  */
 static const char test_display_one_mode_desc[] =
 	"Pick the first mode of the IGT base EDID, display and capture a few "
@@ -592,6 +610,39 @@ static void test_display_one_mode(chamelium_data_t *data,
 	drmModeFreeConnector(connector);
 }
 
+/**
+ * SUBTEST: vga-frame-dump
+ * Description: For each mode of the IGT base EDID, display and capture a few
+ *              frames, then check captured frames are correct
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, frame_integrity
+ * Mega feature: VGA
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: dp-crc-%s
+ * Description: For each mode of the IGT base EDID, display and capture a %arg[1]
+ *              frame(s), then check captured frame(s) are correct
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, frame_integrity
+ * Mega feature: DP
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: hdmi-crc-%s
+ * Description: For each mode of the IGT base EDID, display and capture a %arg[1]
+ *              frame(s), then check captured frame(s) are correct
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, frame_integrity
+ * Mega feature: HDMI
+ * Driver requirement: i915, xe
+ *
+ * arg[1]:
+ *
+ * @single:    single
+ * @multiple:  multiple
+ */
 static const char test_display_all_modes_desc[] =
 	"For each mode of the IGT base EDID, display and capture a few "
 	"frames, then check captured frames are correct";
@@ -650,6 +701,27 @@ static void test_display_all_modes(chamelium_data_t *data,
 	} while (++i < count_modes);
 }
 
+/**
+ * SUBTEST: dp-frame-dump
+ * Description: For each mode of the IGT base EDID, display and capture a few
+ *              frames, then download the captured frames and compare them
+ *              bit-by-bit to the sent ones
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, frame_integrity
+ * Mega feature: DP
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: hdmi-frame-dump
+ * Description: For each mode of the IGT base EDID, display and capture a few
+ *              frames, then download the captured frames and compare them
+ *              bit-by-bit to the sent ones
+ * Test category: functionality test
+ * Run type: BAT
+ * Functionality: chamelium, frame_integrity
+ * Mega feature: HDMI
+ * Driver requirement: i915, xe
+ */
 static const char test_display_frame_dump_desc[] =
 	"For each mode of the IGT base EDID, display and capture a few "
 	"frames, then download the captured frames and compare them "
@@ -718,6 +790,16 @@ static void test_display_frame_dump(chamelium_data_t *data,
 	} while (++i < count_modes);
 }
 
+/**
+ * SUBTEST: hdmi-aspect-ratio
+ * Description: Pick a mode with a picture aspect-ratio, capture AVI InfoFrames
+ *              and check they include the relevant fields
+ * Test category: functionality test
+ * Run type: BAT
+ * Functionality: chamelium, frame_integrity
+ * Mega feature: HDMI
+ * Driver requirement: i915, xe
+ */
 static const char test_display_aspect_ratio_desc[] =
 	"Pick a mode with a picture aspect-ratio, capture AVI InfoFrames and "
 	"check they include the relevant fields";
@@ -798,6 +880,21 @@ static void test_display_aspect_ratio(chamelium_data_t *data,
 	drmModeFreeConnector(connector);
 }
 
+/**
+ * SUBTEST: hdmi-%s-planes-random
+ * Description: Setup a few overlay planes with random parameters, capture the
+ *              frame and check it matches the expected output
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: chamelium, frame_integrity
+ * Mega feature: HDMI
+ * Driver requirement: i915, xe
+ *
+ * arg[1]:
+ *
+ * @crc:     CRC check
+ * @cmp:     Compare
+ */
 static const char test_display_planes_random_desc[] =
 	"Setup a few overlay planes with random parameters, capture the frame "
 	"and check it matches the expected output";
-- 
2.40.0
