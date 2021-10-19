Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812AE6E123
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Oct 2021 03:17:12 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Mon, 18 Oct 2021 20:17:06 -0700
Message-Id: <20211019031706.6992-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/i915: Return actual submission method
 from gem_submission_method
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
method by the driver, as evidenced by its callers. Therefore remove the
GEM_SUBMISSION_EXECLISTS flag when GuC submission is detected.

This also fixes gem_has_execlists() to match its description, previously
gem_has_execlists() would return true even if GuC submission was actually
being used in the driver.

v2: Or gem_has_execlists call-sites with gem_has_guc_submission to make the
    new code equivalent to the previous code.

Reported-by: John Harrison <john.c.harrison@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/i915/gem_submission.c   | 2 +-
 tests/i915/gem_ctx_shared.c | 2 +-
 tests/i915/gem_watchdog.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
index 2627b802cfb..b037d04cc4a 100644
--- a/lib/i915/gem_submission.c
+++ b/lib/i915/gem_submission.c
@@ -86,7 +86,7 @@ unsigned gem_submission_method(int fd)
 		return 0;
 
 	if (igt_sysfs_get_u32(dir, "enable_guc") & 1) {
-		flags |= GEM_SUBMISSION_GUC | GEM_SUBMISSION_EXECLISTS;
+		flags |= GEM_SUBMISSION_GUC;
 		goto out;
 	}
 
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
