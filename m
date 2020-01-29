Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 29 Jan 2020 22:24:56 +0000
Message-Id: <20200129222456.1503424-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_exec_reloc: Add SIGINT injection
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

Do a pass over gem_exec_reloc where we inject lots of SIGINTs.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Antonio Argenziano <antonio.argenziano@intel.com>
---
 tests/i915/gem_exec_reloc.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
index bc904a0ae..1aa03fba3 100644
--- a/tests/i915/gem_exec_reloc.c
+++ b/tests/i915/gem_exec_reloc.c
@@ -379,7 +379,8 @@ static bool has_64b_reloc(int fd)
 
 #define NORELOC 1
 #define ACTIVE 2
-#define HANG 4
+#define INTERRUPTIBLE 4
+#define HANG 8
 static void basic_reloc(int fd, unsigned before, unsigned after, unsigned flags)
 {
 #define OBJSZ 8192
@@ -735,6 +736,7 @@ igt_main
 		{ "", 0 , true},
 		{ "-noreloc", NORELOC, true },
 		{ "-active", ACTIVE, true },
+		{ "-interruptible", ACTIVE | INTERRUPTIBLE },
 		{ "-hang", ACTIVE | HANG },
 		{ },
 	}, *f;
@@ -762,14 +764,17 @@ igt_main
 					      f->name) {
 					if ((m->before | m->after) & I915_GEM_DOMAIN_WC)
 						igt_require(gem_mmap__has_wc(fd));
-					basic_reloc(fd, m->before, m->after, f->flags);
+					igt_while_interruptible(f->flags & INTERRUPTIBLE)
+						basic_reloc(fd, m->before, m->after, f->flags);
 				}
 			}
 
 			if (!(f->flags & NORELOC)) {
 				igt_subtest_f("%srange%s",
-					      f->basic ? "basic-" : "", f->name)
-					basic_range(fd, f->flags);
+					      f->basic ? "basic-" : "", f->name) {
+					igt_while_interruptible(f->flags & INTERRUPTIBLE)
+						basic_range(fd, f->flags);
+				}
 			}
 
 			igt_fixture {
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
