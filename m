Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76036E92E
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Sep 2020 15:21:04 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Wed,  2 Sep 2020 20:54:23 +0530
Message-Id: <20200902152423.630343-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_mmap: Modified offset in subtest
 "bad-size"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Subtest "bad-size" should keep valid/good offset
corresponding to buffer object being mapped.
Currently, subtest will pass for any value of size
provided as the offset value itself will not allow
to map any size of memory which defies the purpose
of this subtest.

The subtest should not pass due to bad offset value
while it should pass only due to bad size provided.

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/i915/gem_mmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_mmap.c b/tests/i915/gem_mmap.c
index f8cf052e..73ffac91 100644
--- a/tests/i915/gem_mmap.c
+++ b/tests/i915/gem_mmap.c
@@ -218,7 +218,7 @@ igt_main
 		for (int i = 0; i < ARRAY_SIZE(bad_size); i++) {
 			struct drm_i915_gem_mmap arg = {
 				.handle = gem_create(fd, 4096),
-				.offset = 4096,
+				.offset = 0,
 				.size = bad_size[i],
 			};
 
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
