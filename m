Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 13 Feb 2020 19:03:16 +0000
Message-Id: <20200213190316.3693878-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_exec_flush: Forgo I915_EXEC_NORELOC
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

As we do not maintain the contents of the batch buffers as we reuse and
may move the objects between cycles, the requirements for
I915_EXEC_NORELOC are not met. Rely on natural reloc skipping instead,
so long as the ioctl overhead is less than the GPU, it should not have
any impact on the incoherency detection rates.

Closes: https://gitlab.freedesktop.org/drm/intel/issues/1203
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_exec_flush.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_exec_flush.c b/tests/i915/gem_exec_flush.c
index 9b6f2ed19..513cde364 100644
--- a/tests/i915/gem_exec_flush.c
+++ b/tests/i915/gem_exec_flush.c
@@ -163,7 +163,7 @@ static void run(int fd, unsigned ring, int nchild, int timeout,
 		memset(&execbuf, 0, sizeof(execbuf));
 		execbuf.buffers_ptr = to_user_pointer(obj);
 		execbuf.buffer_count = 3;
-		execbuf.flags = ring | (1 << 11) | (1<<12);
+		execbuf.flags = ring | (1 << 12);
 		if (gen < 6)
 			execbuf.flags |= I915_EXEC_SECURE;
 
@@ -251,7 +251,7 @@ static void run(int fd, unsigned ring, int nchild, int timeout,
 			i = 16 * (idx % 64) + (idx / 64);
 			obj[1].relocs_ptr = to_user_pointer(&reloc0[i]);
 			obj[2].relocs_ptr = to_user_pointer(&reloc1[i]);
-			execbuf.batch_start_offset =  64*i;
+			execbuf.batch_start_offset = 64 * i;
 
 overwrite:
 			if ((flags & BEFORE) &&
@@ -396,7 +396,7 @@ static void batch(int fd, unsigned ring, int nchild, int timeout,
 		memset(&execbuf, 0, sizeof(execbuf));
 		execbuf.buffers_ptr = to_user_pointer(obj);
 		execbuf.buffer_count = 2;
-		execbuf.flags = ring | (1 << 11) | (1<<12);
+		execbuf.flags = ring | (1 << 12);
 		if (gen < 6)
 			execbuf.flags |= I915_EXEC_SECURE;
 
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
