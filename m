Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435DE6F953
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2020 00:27:01 +0000 (UTC)
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date: Wed, 22 Jan 2020 16:25:17 -0800
Message-Id: <20200123002517.31327-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH-i-g-t] tests/i915/gem_exec_schedule: Use
 mmap__device_coherent
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Replace calls to mmap_gtt with mmap__device_coherent for platforms
where aperture is not available.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 tests/i915/gem_exec_schedule.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index 0b6826fd..a2098586 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -252,7 +252,7 @@ static void independent(int fd, unsigned int engine)
 	igt_require(engine != 0);
 
 	scratch = gem_create(fd, 4096);
-	ptr = gem_mmap__gtt(fd, scratch, 4096, PROT_READ);
+	ptr = gem_mmap__device_coherent(fd, scratch, 0, 4096, PROT_READ);
 	igt_assert_eq(ptr[0], 0);
 
 	fence = igt_cork_plug(&cork, fd);
@@ -1410,7 +1410,7 @@ static void reorder_wide(int fd, unsigned ring)
 		gem_context_set_priority(fd, execbuf.rsvd1, n);
 
 		obj[1].handle = gem_create(fd, sz);
-		batch = gem_mmap__gtt(fd, obj[1].handle, sz, PROT_WRITE);
+		batch = gem_mmap__device_coherent(fd, obj[1].handle, 0, sz, PROT_WRITE);
 		gem_set_domain(fd, obj[1].handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 
 		for (int m = 0; m < ring_size; m++) {
-- 
2.22.0.245.g4d8ec15c66

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
