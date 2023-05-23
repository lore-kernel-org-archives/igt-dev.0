Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B157B10E3DE
 for <igt-dev@lists.freedesktop.org>; Tue, 23 May 2023 06:38:49 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 23 May 2023 12:01:39 +0530
Message-Id: <20230523063243.669540-19-bhanuprakash.modem@intel.com>
In-Reply-To: <20230523063243.669540-1-bhanuprakash.modem@intel.com>
References: <20230523063243.669540-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 18/82] tests/i915/kms_fb_coherency: Document
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
 tests/i915/kms_fb_coherency.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/i915/kms_fb_coherency.c b/tests/i915/kms_fb_coherency.c
index b530bf5dc..9d2506ce8 100644
--- a/tests/i915/kms_fb_coherency.c
+++ b/tests/i915/kms_fb_coherency.c
@@ -243,6 +243,11 @@ igt_main
 	 * Description: Use display controller CRC hardware to validate (non)coherency
 	 *		of memset operations on future scanout buffer objects
 	 *		mmapped with different mmap methods and different caching modes.
+	 * Driver requirement: i915
+	 * Functionality: kms_core
+	 * Run type: FULL
+	 * Mega feature: General Display Features
+	 * Test category: functionality test
 	 */
 	igt_subtest_with_dynamic("memset-crc") {
 		if (gem_has_mappable_ggtt(data.drm_fd)) {
-- 
2.40.0
