Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E6010E62C
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 08:19:47 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Aug 2023 13:41:51 +0530
Message-Id: <20230825081153.883708-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20230825081153.883708-1-bhanuprakash.modem@intel.com>
References: <20230825081153.883708-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 2/4] tests/i915/kms_big_fb: Fix testplan
 documentation
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

Update testplan documentation for Async flip subtests (Add
"async_flips" to the Functionality).

Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_big_fb.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
index 33008c40a..50e9deeda 100644
--- a/tests/i915/kms_big_fb.c
+++ b/tests/i915/kms_big_fb.c
@@ -661,12 +661,22 @@ max_hw_stride_async_flip_test(data_t *data)
  */
 
 /**
+ * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d-hflip
+ * Description: Test maximum hardware supported stride length for given combination
+ *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
+ *              and %arg[3]-rotation with H-flip mode
+ * Driver requirement: i915, xe
+ * Functionality: big_fbs, kms_gem_interop, rotation, tiling
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
  * SUBTEST: %s-max-hw-stride-%dbpp-rotate-%d-%s
  * Description: Test maximum hardware supported stride length for given combination
  *              of %arg[1] modifier with max hardware stride length, %arg[2]-bpp,
  *              and %arg[3]-rotation with %arg[4] mode
  * Driver requirement: i915, xe
- * Functionality: big_fbs, kms_gem_interop, rotation, tiling
+ * Functionality: async_flips, big_fbs, kms_gem_interop, rotation, tiling
  * Mega feature: General Display Features
  * Run type: FULL
  * Test category: functionality test
@@ -684,7 +694,6 @@ max_hw_stride_async_flip_test(data_t *data)
  * arg[4]:
  *
  * @async-flip:         Async flip
- * @hflip:              H-flip
  * @hflip-async-flip:   Async & H-flip
  */
 static void test_scanout(data_t *data)
-- 
2.40.0
