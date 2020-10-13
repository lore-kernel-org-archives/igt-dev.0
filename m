Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 13 Oct 2020 15:22:01 +0100
Message-Id: <20201013142202.2416663-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t] i915/gen9_exec_parse: Check oversized
 batch with length==0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Include the implicit eb.batch_len=0 into the mix of various offsets and
lengths.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 tests/i915/gen9_exec_parse.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/i915/gen9_exec_parse.c b/tests/i915/gen9_exec_parse.c
index 7ddb5bf2b..087d6f35f 100644
--- a/tests/i915/gen9_exec_parse.c
+++ b/tests/i915/gen9_exec_parse.c
@@ -628,6 +628,8 @@ static void test_bb_oversize(int i915)
 	gem_write(i915, obj.handle, (4ull << 30) - sizeof(bbe),
 		  &bbe, sizeof(bbe));
 
+	igt_assert_eq(__checked_execbuf(i915, &execbuf), 0);
+
 	for (int i = 13; i <= 32; i++) {
 		igt_debug("Checking length %#llx\n", 1ull << i);
 
@@ -638,6 +640,9 @@ static void test_bb_oversize(int i915)
 		igt_assert_eq(__checked_execbuf(i915, &execbuf), 0);
 	}
 
+	execbuf.batch_len = 0;
+	igt_assert_eq(__checked_execbuf(i915, &execbuf), 0);
+
 	gem_close(i915, obj.handle);
 }
 
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
