Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2835C6E04A
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Oct 2021 04:41:04 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Wed, 27 Oct 2021 21:40:55 -0700
Message-Id: <8da5f8f799245a0dac45ea96c0a3f992a285352e.1635395331.git.ashutosh.dixit@intel.com>
In-Reply-To: <cover.1635395331.git.ashutosh.dixit@intel.com>
References: <cover.1635395331.git.ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] lib/i915: Return actual submission
 method from gem_submission_method
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: John Harrison <john.c.harrison@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

gem_submission_method() purports to return the currently used submission
method by the kernel, as evidenced by its callers. Therefore remove the
GEM_SUBMISSION_EXECLISTS flag when GuC submission is detected.

This also fixes gem_has_execlists() to match its description, previously
gem_has_execlists() would return true even if GuC submission was actually
being used in the driver.

v2: Or gem_has_execlists call-sites with gem_has_guc_submission to make the
    new code equivalent to the previous code.
v3: Clarify that submission method is either guc (0x4), execlists (0x2) or
    legacy without semaphores (0x0) or legacy with semaphores (0x1)

Reported-by: John Harrison <john.c.harrison@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/i915/gem_submission.c   | 10 +++++-----
 tests/i915/gem_ctx_shared.c |  2 +-
 tests/i915/gem_watchdog.c   |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
index 2627b802cfb..6fe7112d958 100644
--- a/lib/i915/gem_submission.c
+++ b/lib/i915/gem_submission.c
@@ -77,7 +77,7 @@ static bool has_semaphores(int fd, int dir)
 unsigned gem_submission_method(int fd)
 {
 	const int gen = intel_gen(intel_get_drm_devid(fd));
-	unsigned flags = 0;
+	unsigned method = 0;
 
 	int dir;
 
@@ -86,21 +86,21 @@ unsigned gem_submission_method(int fd)
 		return 0;
 
 	if (igt_sysfs_get_u32(dir, "enable_guc") & 1) {
-		flags |= GEM_SUBMISSION_GUC | GEM_SUBMISSION_EXECLISTS;
+		method = GEM_SUBMISSION_GUC;
 		goto out;
 	}
 
 	if (gen >= 8) {
-		flags |= GEM_SUBMISSION_EXECLISTS;
+		method = GEM_SUBMISSION_EXECLISTS;
 		goto out;
 	}
 
 	if (has_semaphores(fd, dir))
-		flags |= GEM_SUBMISSION_SEMAPHORES;
+		method = GEM_SUBMISSION_SEMAPHORES;
 
 out:
 	close(dir);
-	return flags;
+	return method;
 }
 
 /**
diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
index ea1b5dd1b8c..f50ef13263f 100644
--- a/tests/i915/gem_ctx_shared.c
+++ b/tests/i915/gem_ctx_shared.c
@@ -159,7 +159,7 @@ static void disjoint_timelines(int i915, const intel_ctx_cfg_t *cfg)
 	uint32_t plug;
 	uint64_t ahnd;
 
-	igt_require(gem_has_execlists(i915));
+	igt_require(gem_has_execlists(i915) || gem_has_guc_submission(i915));
 
 	/*
 	 * Each context, although they share a vm, are expected to be
diff --git a/tests/i915/gem_watchdog.c b/tests/i915/gem_watchdog.c
index db562335a2a..21c7710a806 100644
--- a/tests/i915/gem_watchdog.c
+++ b/tests/i915/gem_watchdog.c
@@ -222,7 +222,7 @@ static void virtual(int i915, const intel_ctx_cfg_t *base_cfg)
 	const intel_ctx_t *ctx[num_engines];
 	uint64_t ahnd;
 
-	igt_require(gem_has_execlists(i915));
+	igt_require(gem_has_execlists(i915) || gem_has_guc_submission(i915));
 
 	igt_debug("%u virtual engines\n", num_engines);
 	igt_require(num_engines);
-- 
2.33.0
