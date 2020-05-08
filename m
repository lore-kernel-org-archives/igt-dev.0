Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025AA6E096
 for <igt-dev@lists.freedesktop.org>; Fri,  8 May 2020 21:29:44 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Fri,  8 May 2020 14:29:39 -0700
Message-Id: <20200508212939.1260-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] igt/gem_shrink: touch each page in
 pwrite_/pread_
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

pwrite_() and pread_() purport to read each page but weren't.

Reported-by: CQ Tang <cq.tang@intel.com>
Fixes 88bfe6ac41 ("igt/gem_shrink: Add pread/pwrite stress)
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_shrink.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_shrink.c b/tests/i915/gem_shrink.c
index c9964ccc0..f6f1144ba 100644
--- a/tests/i915/gem_shrink.c
+++ b/tests/i915/gem_shrink.c
@@ -58,7 +58,7 @@ static void pwrite_(int fd, uint64_t alloc)
 	uint32_t tmp;
 	uint32_t handle = gem_create(fd, alloc);
 	for (int page = 0; page < alloc>>12; page++)
-		gem_write(fd, handle, (page + page % 4095) & ~3, &tmp, 4);
+		gem_write(fd, handle, page << 12, &tmp, 4);
 	gem_madvise(fd, handle, I915_MADV_DONTNEED);
 }
 
@@ -67,7 +67,7 @@ static void pread_(int fd, uint64_t alloc)
 	uint32_t tmp;
 	uint32_t handle = gem_create(fd, alloc);
 	for (int page = 0; page < alloc>>12; page++)
-		gem_read(fd, handle, (page + page % 4095) & ~3, &tmp, 4);
+		gem_read(fd, handle, page << 12, &tmp, 4);
 	gem_madvise(fd, handle, I915_MADV_DONTNEED);
 }
 
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
