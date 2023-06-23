Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D7010E632
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jun 2023 10:23:38 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 23 Jun 2023 12:23:31 +0200
Message-Id: <20230623102331.40250-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/kms_fb_coherency: add
 mega-feature and functionality
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Modem@linux.intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

This test is currently missing mega-feature and functionality.
Add them.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/i915/kms_fb_coherency.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/i915/kms_fb_coherency.c b/tests/i915/kms_fb_coherency.c
index b530bf5dcd70..edb5ba460fbf 100644
--- a/tests/i915/kms_fb_coherency.c
+++ b/tests/i915/kms_fb_coherency.c
@@ -243,6 +243,8 @@ igt_main
 	 * Description: Use display controller CRC hardware to validate (non)coherency
 	 *		of memset operations on future scanout buffer objects
 	 *		mmapped with different mmap methods and different caching modes.
+	 * Mega feature: General Display Features
+	 * Functionality: gtt
 	 */
 	igt_subtest_with_dynamic("memset-crc") {
 		if (gem_has_mappable_ggtt(data.drm_fd)) {
-- 
2.40.1
