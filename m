Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
Date: Fri, 24 Jan 2020 16:41:31 +0000
Message-Id: <20200124164131.39591-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] i915/tests/gem_exec_big: prefer PROT_WRITE
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
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Technically mmap__cpu and mmap__wc just ignore the prot value, so it
doesn't really matter, but the intention is to have write access to the
ptr, so make that clear. Also if the underlying mmap__wc were to at some
point use mmap_offset where the prot is not ignored then we won't have
any surprises.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_exec_big.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/i915/gem_exec_big.c b/tests/i915/gem_exec_big.c
index c06ee995..a5869330 100644
--- a/tests/i915/gem_exec_big.c
+++ b/tests/i915/gem_exec_big.c
@@ -217,9 +217,9 @@ static void exhaustive(int fd)
 		gem_write(fd, handle, 0, batch, sizeof(batch));
 
 		if (!FORCE_PREAD_PWRITE && gem_has_llc(fd))
-			ptr = __gem_mmap__cpu(fd, handle, 0, batch_size, PROT_READ);
+			ptr = __gem_mmap__cpu(fd, handle, 0, batch_size, PROT_WRITE);
 		else if (!FORCE_PREAD_PWRITE && gem_mmap__has_wc(fd))
-			ptr = __gem_mmap__wc(fd, handle, 0, batch_size, PROT_READ);
+			ptr = __gem_mmap__wc(fd, handle, 0, batch_size, PROT_WRITE);
 		else
 			ptr = NULL;
 
@@ -281,9 +281,9 @@ static void single(int i915)
 	gem_write(i915, handle, 0, &bbe, sizeof(bbe));
 
 	if (!FORCE_PREAD_PWRITE && gem_has_llc(i915))
-		ptr = __gem_mmap__cpu(i915, handle, 0, batch_size, PROT_READ);
+		ptr = __gem_mmap__cpu(i915, handle, 0, batch_size, PROT_WRITE);
 	else if (!FORCE_PREAD_PWRITE && gem_mmap__has_wc(i915))
-		ptr = __gem_mmap__wc(i915, handle, 0, batch_size, PROT_READ);
+		ptr = __gem_mmap__wc(i915, handle, 0, batch_size, PROT_WRITE);
 	else
 		ptr = NULL;
 
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
