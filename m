Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE4B10E369
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jun 2023 08:45:37 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 28 Jun 2023 10:45:28 +0200
Message-Id: <20230628084528.18779-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915/gem_madvise: fix dontneed-*-mmap
 subtests
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

Introduction of drm_close_driver() and following changes which
uses it caught a bug in two dontneed subtests:

Starting subtest: dontneed-after-mmap
(gem_madvise:1464) drmtest-WARNING: Don't attempt to close standard/invalid file descriptor: 5

Starting subtest: dontneed-before-mmap
(gem_madvise:1708) drmtest-WARNING: Don't attempt to close standard/invalid file descriptor: 5

It turns out that closing fd was done regardless of mmap
failure or success, that leads to stopping testing due to closed
fd and later at test exit or loop iteration there is attempt to
close already closed fd.

Fixed that by doing close just before actual testing. Also while
at this, fix style and remove one unnecessery empty line.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/gem_madvise.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_madvise.c b/tests/i915/gem_madvise.c
index 765809e7f..06b3ddf32 100644
--- a/tests/i915/gem_madvise.c
+++ b/tests/i915/gem_madvise.c
@@ -109,11 +109,10 @@ dontneed_before_mmap(void)
 		ptr = __gem_mmap_offset(fd, handle, 0, OBJECT_SIZE,
 					PROT_READ | PROT_WRITE,
 					t->type);
-
-		drm_close_driver(fd);
 		if (!ptr)
 			continue;
 
+		drm_close_driver(fd);
 		old_sigsegv = signal(SIGSEGV, sigtrap);
 		old_sigbus = signal(SIGBUS, sigtrap);
 		switch (sigsetjmp(jmp, SIGBUS | SIGSEGV)) {
@@ -156,10 +155,10 @@ dontneed_after_mmap(void)
 					t->type);
 
 		gem_madvise(fd, handle, I915_MADV_DONTNEED);
-		drm_close_driver(fd);
 		if (!ptr)
 			continue;
 
+		drm_close_driver(fd);
 		old_sigsegv = signal(SIGSEGV, sigtrap);
 		old_sigbus = signal(SIGBUS, sigtrap);
 		switch (sigsetjmp(jmp, SIGBUS | SIGSEGV)) {
-- 
2.39.2
