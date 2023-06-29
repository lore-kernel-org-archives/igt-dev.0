Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC65810E3EC
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 14:55:49 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Jun 2023 20:18:06 +0530
Message-Id: <20230629144910.3055377-18-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V5 i-g-t 17/81] tests/i915/kms_fb_coherency: Document
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
---
 tests/i915/kms_fb_coherency.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/i915/kms_fb_coherency.c b/tests/i915/kms_fb_coherency.c
index edb5ba460..8a553613a 100644
--- a/tests/i915/kms_fb_coherency.c
+++ b/tests/i915/kms_fb_coherency.c
@@ -5,6 +5,7 @@
 
 /**
  * TEST: kms_fb_coherency
+ * Category: Display
  * Description: Exercise coherency of future scanout buffer objects
  */
 
@@ -245,6 +246,9 @@ igt_main
 	 *		mmapped with different mmap methods and different caching modes.
 	 * Mega feature: General Display Features
 	 * Functionality: gtt
+	 * Driver requirement: any
+	 * Run type: FULL
+	 * Test category: functionality test
 	 */
 	igt_subtest_with_dynamic("memset-crc") {
 		if (gem_has_mappable_ggtt(data.drm_fd)) {
-- 
2.40.0
