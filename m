Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C416E519
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2020 01:10:58 +0000 (UTC)
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date: Wed, 29 Jan 2020 17:10:16 -0800
Message-Id: <20200130011016.5214-1-vinay.belgaumkar@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>
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


From bbe42e9b2c2cd27eed8c090c4be80e7c18a4263d Mon Sep 17 00:00:00 2001
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date: Wed, 29 Jan 2020 16:24:31 -0800
Subject: [PATCH i-g-t 2/2] tests/i915/gem_mmap_offset_exhaustion: Use
 gem_mmap__device_coherent

Allow test to run on platforms that do not have aperture.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Antonio Argenziano <antonio.argenziano@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Daniel Vetter <daniel.vetter@intel.com>
---
 tests/i915/gem_mmap_offset_exhaustion.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_mmap_offset_exhaustion.c b/tests/i915/gem_mmap_offset_exhaustion.c
index f243507e..992bc43b 100644
--- a/tests/i915/gem_mmap_offset_exhaustion.c
+++ b/tests/i915/gem_mmap_offset_exhaustion.c
@@ -60,9 +60,9 @@ create_and_map_bo(int fd)
 
 	handle = gem_create(fd, OBJECT_SIZE);
 
-	ptr = gem_mmap__gtt(fd, handle, OBJECT_SIZE, PROT_READ | PROT_WRITE);
+	ptr = gem_mmap__device_coherent(fd, handle, 0, OBJECT_SIZE, PROT_READ | PROT_WRITE);
 
-	/* touch it to force it into the gtt */
+	/* touch it to force backing storage allocation */
 	*ptr = 0;
 
 	/* but then unmap it again because we only have limited address space on
-- 
2.22.0.245.g4d8ec15c66

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
