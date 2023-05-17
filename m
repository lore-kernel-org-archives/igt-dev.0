Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E592410E3C4
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 06:40:13 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 17 May 2023 12:03:00 +0530
Message-Id: <20230517063323.4146387-59-bhanuprakash.modem@intel.com>
In-Reply-To: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
References: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 58/81] tests/kms_pipe_crc_basic: Document each
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

V2: - Add missing "Driver requirement" field

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_pipe_crc_basic.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 84c73fd7f..1b4a4e014 100644
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
+ * Driver requirement: any
+ * Functionality: crc
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void test_bad_source(data_t *data)
 {
 	errno = 0;
@@ -88,6 +98,7 @@ enum {
 /**
  * SUBTEST: read-crc
  * Description: Test for pipe CRC reads
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
  * Functionality: crc
@@ -95,6 +106,7 @@ enum {
  *
  * SUBTEST: read-crc-frame-sequence
  * Description: Tests the pipe CRC read and ensure frame sequence
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
  * Functionality: crc
@@ -102,6 +114,7 @@ enum {
  *
  * SUBTEST: nonblocking-crc
  * Description: Test for O_NONBLOCK CRC reads
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
  * Functionality: crc
@@ -109,6 +122,7 @@ enum {
  *
  * SUBTEST: nonblocking-crc-frame-sequence
  * Description: Test for O_NONBLOCK CRC reads and ensure frame sequence
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
  * Functionality: crc
@@ -116,6 +130,7 @@ enum {
  *
  * SUBTEST: suspend-read-crc
  * Description: Suspend test for pipe CRC reads
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
  * Functionality: crc
@@ -123,12 +138,12 @@ enum {
  *
  * SUBTEST: hang-read-crc
  * Description: Hang test for pipe CRC read
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
  * Functionality: crc
  * Mega feature: General Display Features
  */
-
 static void test_read_crc(data_t *data, enum pipe pipe,
 			  igt_output_t *output, unsigned flags)
 {
@@ -229,6 +244,7 @@ static void test_read_crc(data_t *data, enum pipe pipe,
 /**
  * SUBTEST: compare-crc-sanitycheck
  * Description: Basic sanity check for CRC mismatches
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
  * Functionality: crc
@@ -299,6 +315,16 @@ static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_remove_fb(data->drm_fd, &fb1);
 }
 
+/**
+ * SUBTEST: disable-crc-after-crtc
+ * Description: Check that disabling CRCs on a CRTC after having disabled the
+ *              CRTC does not cause issues.
+ * Driver requirement: any
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


