Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE3510E3BB
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 06:39:34 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 17 May 2023 12:02:35 +0530
Message-Id: <20230517063323.4146387-34-bhanuprakash.modem@intel.com>
In-Reply-To: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
References: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 33/81] tests/kms_async_flips: Document each
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
 tests/kms_async_flips.c | 62 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 51ffa523a..a53212a57 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -25,6 +25,11 @@
  *  Karthik B S <karthik.b.s@intel.com>
  */
 
+/**
+ * TEST: kms async flips
+ * Category: Display
+ * Description: Test asynchronous page flips.
+ */
 #include "igt.h"
 #include "igt_aux.h"
 #include "igt_psr.h"
@@ -182,6 +187,25 @@ static void test_init(data_t *data)
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 }
 
+/**
+ * SUBTEST: alternate-sync-async-flip
+ * Description: Verify the async flip functionality and the fps during async flips
+ *              Alternate between sync and async flips
+ * Driver requirement: i915
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: async-flip-with-page-flip-events
+ * Description: Verify the async flip functionality and the fps during async flips
+ *              Wait for page flip events in between successive asynchronous flips
+ * Driver requirement: i915
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void test_async_flip(data_t *data)
 {
 	int ret, frame;
@@ -277,6 +301,17 @@ static void wait_for_vblank(data_t *data, unsigned long *vbl_time, unsigned int
 	*seq = wait_vbl.reply.sequence;
 }
 
+/**
+ * SUBTEST: test-time-stamp
+ * Description: Verify the async flip functionality and the fps during async flips
+ *              Verify that the async flip timestamp does not coincide with either
+ *              previous or next vblank
+ * Driver requirement: i915
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void test_timestamp(data_t *data)
 {
 	int flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
@@ -323,6 +358,15 @@ static void test_timestamp(data_t *data)
 		     "Async flip time stamp is expected to be in between 2 vblank time stamps\n");
 }
 
+/**
+ * SUBTEST: test-cursor
+ * Description: Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip
+ * Driver requirement: i915
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void test_cursor(data_t *data)
 {
 	int flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
@@ -479,6 +523,15 @@ static unsigned int clock_ms(void)
 	return ts.tv_sec * 1000 + ts.tv_nsec / 1000000;
 }
 
+/**
+ * SUBTEST: crc
+ * Description: Use CRC to verify async flip scans out the correct framebuffer
+ * Driver requirement: i915
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void test_crc(data_t *data)
 {
 	unsigned int frame = 0;
@@ -543,6 +596,15 @@ static void test_crc(data_t *data)
 	igt_assert_lt(data->frame_count * 2, data->flip_count);
 }
 
+/**
+ * SUBTEST: invalid-async-flip
+ * Description: Negative case to verify if changes in fb are rejected from kernel as expected
+ * Driver requirement: i915
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void run_test(data_t *data, void (*test)(data_t *))
 {
 	igt_output_t *output;
-- 
2.40.0


