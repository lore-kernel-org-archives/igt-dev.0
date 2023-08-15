Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D7A10E272
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Aug 2023 16:57:26 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Aug 2023 22:17:51 +0530
Message-Id: <20230815164815.320904-58-bhanuprakash.modem@intel.com>
In-Reply-To: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
References: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 57/81] tests/kms_pipe_crc_basic: Document each
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

V2: - Add missing "Driver requirement" field
V3: - Driver requirement: s/any/i915, xe/
    - Run type: s/BAT/BAT, FULL/

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_pipe_crc_basic.c | 50 +++++++++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 95cc1d7fa..c085fb971 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -23,8 +23,9 @@
  */
 
 /**
- * TEST: Tests behaviour of CRC
+ * TEST: kms pipe crc basic
  * Category: Display
+ * Description: Tests behaviour of CRC
  */
 
 #include "igt.h"
@@ -64,6 +65,15 @@ static bool simulation_constraint(enum pipe pipe)
 	return false;
 }
 
+/**
+ * SUBTEST: bad-source
+ * Description: Tests error handling when the bad source is set.
+ * Driver requirement: i915, xe
+ * Functionality: crc
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void test_bad_source(data_t *data)
 {
 	errno = 0;
@@ -88,47 +98,52 @@ enum {
 /**
  * SUBTEST: read-crc
  * Description: Test for pipe CRC reads
+ * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT
+ * Run type: BAT, FULL
  * Functionality: crc
  * Mega feature: General Display Features
  *
  * SUBTEST: read-crc-frame-sequence
  * Description: Tests the pipe CRC read and ensure frame sequence
+ * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT
+ * Run type: BAT, FULL
  * Functionality: crc
  * Mega feature: General Display Features
  *
  * SUBTEST: nonblocking-crc
  * Description: Test for O_NONBLOCK CRC reads
+ * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT
+ * Run type: BAT, FULL
  * Functionality: crc
  * Mega feature: General Display Features
  *
  * SUBTEST: nonblocking-crc-frame-sequence
  * Description: Test for O_NONBLOCK CRC reads and ensure frame sequence
+ * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT
+ * Run type: BAT, FULL
  * Functionality: crc
  * Mega feature: General Display Features
  *
  * SUBTEST: suspend-read-crc
  * Description: Suspend test for pipe CRC reads
+ * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT
- * Functionality: crc
+ * Run type: BAT, FULL
+ * Functionality: crc, suspend
  * Mega feature: General Display Features
  *
  * SUBTEST: hang-read-crc
  * Description: Hang test for pipe CRC read
+ * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT
- * Functionality: crc
+ * Run type: BAT, FULL
+ * Functionality: crc, hang
  * Mega feature: General Display Features
  */
-
 static void test_read_crc(data_t *data, enum pipe pipe,
 			  igt_output_t *output, unsigned flags)
 {
@@ -229,9 +244,10 @@ static void test_read_crc(data_t *data, enum pipe pipe,
 /**
  * SUBTEST: compare-crc-sanitycheck-%s
  * Description: Basic sanity check for CRC mismatches with %arg[1]
+ * Driver requirement: i915, xe
  * Test category: functionality test
- * Run type: BAT
- * Functionality: crc
+ * Run type: BAT, FULL
+ * Functionality: crc, pixel_format
  * Mega feature: General Display Features
  *
  * arg[1]:
@@ -305,6 +321,16 @@ static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output,
 	igt_remove_fb(data->drm_fd, &fb1);
 }
 
+/**
+ * SUBTEST: disable-crc-after-crtc
+ * Description: Check that disabling CRCs on a CRTC after having disabled the
+ *              CRTC does not cause issues.
+ * Driver requirement: i915, xe
+ * Functionality: crc
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe,
 					igt_output_t *output)
 {
-- 
2.40.0
