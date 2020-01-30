Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E07F6E40D
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2020 01:24:46 +0000 (UTC)
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date: Wed, 29 Jan 2020 17:23:57 -0800
Message-Id: <20200130012358.5798-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/i915/gem_madvise: Use
 gem_mmap__device_coherent
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

Allow test to run on platforms without aperture as well.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Antonio Argenziano <antonio.argenziano@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_madvise.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_madvise.c b/tests/i915/gem_madvise.c
index 7162a5c3..56ce91cb 100644
--- a/tests/i915/gem_madvise.c
+++ b/tests/i915/gem_madvise.c
@@ -63,7 +63,7 @@ dontneed_before_mmap(void)
 
 	handle = gem_create(fd, OBJECT_SIZE);
 	gem_madvise(fd, handle, I915_MADV_DONTNEED);
-	ptr = gem_mmap__gtt(fd, handle, OBJECT_SIZE, PROT_READ | PROT_WRITE);
+	ptr = gem_mmap__device_coherent(fd, handle, 0, OBJECT_SIZE, PROT_READ | PROT_WRITE);
 	close(fd);
 
 	signal(SIGSEGV, sigtrap);
@@ -90,7 +90,7 @@ dontneed_after_mmap(void)
 	char *ptr;
 
 	handle = gem_create(fd, OBJECT_SIZE);
-	ptr = gem_mmap__gtt(fd, handle, OBJECT_SIZE, PROT_READ | PROT_WRITE);
+	ptr = gem_mmap__device_coherent(fd, handle, 0, OBJECT_SIZE, PROT_READ | PROT_WRITE);
 	igt_assert(ptr);
 	gem_madvise(fd, handle, I915_MADV_DONTNEED);
 	close(fd);
-- 
2.22.0.245.g4d8ec15c66

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
