Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBA06E03F
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2020 02:05:22 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Sun, 12 Apr 2020 19:05:09 -0700
Message-Id: <20200413020509.678-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] igt/gem_shrink: Fix reversed logic when
 mmap fails
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Can't touch the memory if mmap returns MAP_FAILED.

Fixes: 9cff3be127("igt/gem_shrink: Reduce oom spam")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_shrink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_shrink.c b/tests/i915/gem_shrink.c
index 11aa9efc1..bb55a4a78 100644
--- a/tests/i915/gem_shrink.c
+++ b/tests/i915/gem_shrink.c
@@ -274,7 +274,7 @@ static void leak(int fd, uint64_t alloc)
 	ptr = mmap(NULL, alloc, PROT_READ | PROT_WRITE,
 		   MAP_ANON | MAP_PRIVATE | MAP_POPULATE,
 		   -1, 0);
-	if (ptr != (char *)-1)
+	if (ptr == (char *)-1)
 		return;
 
 	while (alloc) {
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
