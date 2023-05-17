Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DB810E3B7
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 06:39:02 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 17 May 2023 12:02:11 +0530
Message-Id: <20230517063323.4146387-10-bhanuprakash.modem@intel.com>
In-Reply-To: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
References: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 09/81] tests/chamelium/kms_chamelium_frames:
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
 tests/chamelium/kms_chamelium_frames.c | 102 ++++++++++++++++++++++++-
 1 file changed, 100 insertions(+), 2 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/kms_chamelium_frames.c
index 2d90b45b2..1081cb1c1 100644
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
 #include "igt_chamelium_helper.h"
@@ -547,6 +547,7 @@ static void prepare_randomized_plane(chamelium_data_t *data,
  * Run type: BAT
  * Functionality: dp
  * Mega feature: DP
+ * Driver requirement: any
  *
  * SUBTEST: hdmi-crc-fast
  * Description: Pick the first mode of the IGT base EDID, display and capture
@@ -555,6 +556,23 @@ static void prepare_randomized_plane(chamelium_data_t *data,
  * Run type: BAT
  * Functionality: hdmi
  * Mega feature: HDMI
+ * Driver requirement: any
+ */
+
+/**
+ * SUBTEST: hdmi-%s-formats
+ * Description: Pick the first mode of the IGT base EDID, display and capture a
+ *              few frames, then check captured frames are correct
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: hdmi
+ * Mega feature: HDMI
+ * Driver requirement: any
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
+ * Functionality: vga
+ * Mega feature: VGA
+ * Driver requirement: any
+ *
+ * SUBTEST: dp-crc-%s
+ * Description: For each mode of the IGT base EDID, display and capture a %arg[1]
+ *              frame(s), then check captured frame(s) are correct
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: dp
+ * Mega feature: DP
+ * Driver requirement: any
+ *
+ * SUBTEST: hdmi-crc-%s
+ * Description: For each mode of the IGT base EDID, display and capture a %arg[1]
+ *              frame(s), then check captured frame(s) are correct
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: hdmi
+ * Mega feature: HDMI
+ * Driver requirement: any
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
+ * Functionality: dp
+ * Mega feature: DP
+ * Driver requirement: any
+ *
+ * SUBTEST: hdmi-frame-dump
+ * Description: For each mode of the IGT base EDID, display and capture a few
+ *              frames, then download the captured frames and compare them
+ *              bit-by-bit to the sent ones
+ * Test category: functionality test
+ * Run type: BAT
+ * Functionality: hdmi
+ * Mega feature: HDMI
+ * Driver requirement: any
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
+ * Functionality: hdmi
+ * Mega feature: HDMI
+ * Driver requirement: any
+ */
 static const char test_display_aspect_ratio_desc[] =
 	"Pick a mode with a picture aspect-ratio, capture AVI InfoFrames and "
 	"check they include the relevant fields";
@@ -798,6 +880,22 @@ static void test_display_aspect_ratio(chamelium_data_t *data,
 	drmModeFreeConnector(connector);
 }
 
+/**
+ *
+ * SUBTEST: hdmi-%s-planes-random
+ * Description: Setup a few overlay planes with random parameters, capture the
+ *              frame and check it matches the expected output
+ * Test category: functionality test
+ * Run type: FULL
+ * Functionality: hdmi
+ * Mega feature: HDMI
+ * Driver requirement: any
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


