Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 10 Feb 2020 10:11:35 +0000
Message-Id: <20200210101135.420500-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] intel-ci: Enable gem_exec_whisper
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

In hindsignt, gem_exec_whisper has an excellent detection rate for the
5.3/5.4 faux pas. Had it been enabled...

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
---
 tests/i915/gem_exec_whisper.c | 31 +++++++++++++++++--------------
 tests/intel-ci/blacklist.txt  |  2 +-
 2 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/tests/i915/gem_exec_whisper.c b/tests/i915/gem_exec_whisper.c
index 2f665f8d1..153854d1c 100644
--- a/tests/i915/gem_exec_whisper.c
+++ b/tests/i915/gem_exec_whisper.c
@@ -82,6 +82,7 @@ static void verify_reloc(int fd, uint32_t handle,
 #define PRIORITY 0x80
 #define ALL 0x100
 #define QUEUES 0x200
+#define BASIC 0x400
 
 struct hang {
 	struct drm_i915_gem_exec_object2 obj;
@@ -527,30 +528,30 @@ igt_main
 		const char *name;
 		unsigned flags;
 	} modes[] = {
-		{ "normal", 0 },
+		{ "normal", BASIC },
 		{ "interruptible", INTERRUPTIBLE },
-		{ "forked", FORKED },
-		{ "sync", SYNC },
+		{ "forked", BASIC | FORKED },
+		{ "sync", BASIC | SYNC },
 		{ "chain", CHAIN },
 		{ "chain-forked", CHAIN | FORKED },
 		{ "chain-interruptible", CHAIN | INTERRUPTIBLE },
 		{ "chain-sync", CHAIN | SYNC },
-		{ "fds", FDS },
+		{ "fds", BASIC | FDS },
 		{ "fds-interruptible", FDS | INTERRUPTIBLE},
-		{ "fds-forked", FDS | FORKED},
-		{ "fds-priority", FDS | FORKED | PRIORITY },
+		{ "fds-forked", BASIC | FDS | FORKED},
+		{ "fds-priority", BASIC | FDS | FORKED | PRIORITY },
 		{ "fds-chain", FDS | CHAIN},
 		{ "fds-sync", FDS | SYNC},
-		{ "contexts", CONTEXTS },
+		{ "contexts", BASIC | CONTEXTS },
 		{ "contexts-interruptible", CONTEXTS | INTERRUPTIBLE},
-		{ "contexts-forked", CONTEXTS | FORKED},
-		{ "contexts-priority", CONTEXTS | FORKED | PRIORITY },
+		{ "contexts-forked", BASIC | CONTEXTS | FORKED},
+		{ "contexts-priority", BASIC | CONTEXTS | FORKED | PRIORITY },
 		{ "contexts-chain", CONTEXTS | CHAIN },
 		{ "contexts-sync", CONTEXTS | SYNC },
-		{ "queues", QUEUES },
+		{ "queues", BASIC | QUEUES },
 		{ "queues-interruptible", QUEUES | INTERRUPTIBLE},
-		{ "queues-forked", QUEUES | FORKED},
-		{ "queues-priority", QUEUES | FORKED | PRIORITY },
+		{ "queues-forked", BASIC | QUEUES | FORKED},
+		{ "queues-priority", BASIC | QUEUES | FORKED | PRIORITY },
 		{ "queues-chain", QUEUES | CHAIN },
 		{ "queues-sync", QUEUES | SYNC },
 		{ NULL }
@@ -567,9 +568,11 @@ igt_main
 	}
 
 	for (const struct mode *m = modes; m->name; m++) {
-		igt_subtest_f("%s", m->name)
+		igt_subtest_f("%s%s",
+			      m->flags & BASIC ? "basic-" : "", m->name)
 			whisper(fd, ALL_ENGINES, m->flags);
-		igt_subtest_f("%s-all", m->name)
+		igt_subtest_f("%s%s-all",
+			      m->flags & BASIC ? "basic-" : "", m->name)
 			whisper(fd, ALL_ENGINES, m->flags | ALL);
 	}
 
diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index 181c8cd5f..0d65e2f15 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -40,7 +40,7 @@ igt@gem_exec_lut_handle(@.*)?
 igt@gem_exec_nop@(?!.*basic).*
 igt@gem_exec_reloc@(?!.*basic).*
 igt@gem_exec_suspend@(?!.*basic).*
-igt@gem_exec_whisper@(?!normal$).*
+igt@gem_exec_whisper@(?!basic).*
 igt@gem_fd_exhaustion(@.*)?
 igt@gem_fence_upload(@.*)?
 igt@gem_gtt_hog(@.*)?
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
