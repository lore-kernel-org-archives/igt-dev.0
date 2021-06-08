Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE7F6E045
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jun 2021 09:40:28 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so1422978wmq.0
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 02:40:28 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue,  8 Jun 2021 11:40:14 +0200
Message-Id: <20210608094020.21598-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/7] tests/gem_exec_reloc: Remove banned
 tests
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
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: Petri Latvala <petri.latvala@intel.com>, Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

These have been banned across all CI for over 2 years, realistically
that's not going to change and they're just in the way.

Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 tests/i915/gem_exec_reloc.c  | 31 +++++--------------------------
 tests/intel-ci/blacklist.txt |  1 -
 2 files changed, 5 insertions(+), 27 deletions(-)

diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
index 397c335e4d3c..cb4899fe6e1e 100644
--- a/tests/i915/gem_exec_reloc.c
+++ b/tests/i915/gem_exec_reloc.c
@@ -614,8 +614,6 @@ static bool has_64b_reloc(int fd)
 
 #define NORELOC 1
 #define ACTIVE 2
-#define INTERRUPTIBLE 4
-#define HANG 8
 static void basic_reloc(int fd, unsigned before, unsigned after, unsigned flags)
 {
 #define OBJSZ 8192
@@ -678,8 +676,7 @@ static void basic_reloc(int fd, unsigned before, unsigned after, unsigned flags)
 			spin = igt_spin_new(fd,
 					    .engine = I915_EXEC_DEFAULT,
 					    .dependency = obj.handle);
-			if (!(flags & HANG))
-				igt_spin_set_timeout(spin, NSEC_PER_SEC/100);
+
 			igt_assert(gem_bo_busy(fd, obj.handle));
 		}
 
@@ -746,8 +743,6 @@ static void basic_reloc(int fd, unsigned before, unsigned after, unsigned flags)
 			spin = igt_spin_new(fd,
 					    .engine = I915_EXEC_DEFAULT,
 					    .dependency = obj.handle);
-			if (!(flags & HANG))
-				igt_spin_set_timeout(spin, NSEC_PER_SEC/100);
 			igt_assert(gem_bo_busy(fd, obj.handle));
 		}
 
@@ -873,8 +868,6 @@ static void basic_range(int fd, unsigned flags)
 
 	if (flags & ACTIVE) {
 		spin = igt_spin_new(fd, .dependency = obj[n].handle);
-		if (!(flags & HANG))
-			igt_spin_set_timeout(spin, NSEC_PER_SEC/100);
 		igt_assert(gem_bo_busy(fd, obj[n].handle));
 	}
 
@@ -1468,8 +1461,6 @@ igt_main
 		{ "", 0 , true},
 		{ "-noreloc", NORELOC, true },
 		{ "-active", ACTIVE, true },
-		{ "-interruptible", ACTIVE | INTERRUPTIBLE },
-		{ "-hang", ACTIVE | HANG },
 		{ },
 	}, *f;
 	uint64_t size;
@@ -1483,14 +1474,7 @@ igt_main
 	}
 
 	for (f = flags; f->name; f++) {
-		igt_hang_t hang;
-
 		igt_subtest_group {
-			igt_fixture {
-				if (f->flags & HANG)
-					hang = igt_allow_hang(fd, 0, 0);
-			}
-
 			for (m = modes; m->name; m++) {
 				igt_subtest_f("%s%s%s",
 					      f->basic ? "basic-" : "",
@@ -1498,22 +1482,17 @@ igt_main
 					      f->name) {
 					if ((m->before | m->after) & I915_GEM_DOMAIN_WC)
 						igt_require(gem_mmap__has_wc(fd));
-					igt_while_interruptible(f->flags & INTERRUPTIBLE)
-						basic_reloc(fd, m->before, m->after, f->flags);
+
+					basic_reloc(fd, m->before, m->after, f->flags);
 				}
 			}
 
 			if (!(f->flags & NORELOC)) {
 				igt_subtest_f("%srange%s",
 					      f->basic ? "basic-" : "", f->name) {
-					igt_while_interruptible(f->flags & INTERRUPTIBLE)
-						basic_range(fd, f->flags);
-				}
-			}
 
-			igt_fixture {
-				if (f->flags & HANG)
-					igt_disallow_hang(fd, hang);
+					basic_range(fd, f->flags);
+				}
 			}
 		}
 	}
diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index 33f92e37f602..4d2555f8adb3 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -30,7 +30,6 @@ igt@gem_exec_flush@(?!.*basic).*
 igt@gem_exec_latency(@.*)?
 igt@gem_exec_lut_handle(@.*)?
 igt@gem_exec_nop@(?!.*basic).*
-igt@gem_exec_reloc@(?!.*basic).*
 igt@gem_exec_suspend@(?!.*basic).*
 igt@gem_exec_whisper@(?!basic).*
 igt@gem_fd_exhaustion(@.*)?
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
