Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D9310E6F5
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 18:55:00 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 12 Aug 2023 00:15:51 +0530
Message-Id: <20230811184655.157060-18-bhanuprakash.modem@intel.com>
In-Reply-To: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V6 17/81] tests/i915/kms_fb_coherency: Document
 each subtest for testplan
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/i915/kms_fb_coherency.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/i915/kms_fb_coherency.c b/tests/i915/kms_fb_coherency.c
index edb5ba460..e8fcbe58e 100644
--- a/tests/i915/kms_fb_coherency.c
+++ b/tests/i915/kms_fb_coherency.c
@@ -5,6 +5,7 @@
 
 /**
  * TEST: kms_fb_coherency
+ * Category: Display
  * Description: Exercise coherency of future scanout buffer objects
  */
 
@@ -244,7 +245,10 @@ igt_main
 	 *		of memset operations on future scanout buffer objects
 	 *		mmapped with different mmap methods and different caching modes.
 	 * Mega feature: General Display Features
-	 * Functionality: gtt
+	 * Functionality: kms_core
+	 * Driver requirement: any
+	 * Run type: FULL
+	 * Test category: functionality test
 	 */
 	igt_subtest_with_dynamic("memset-crc") {
 		if (gem_has_mappable_ggtt(data.drm_fd)) {
-- 
2.40.0
