Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F786EE2A
 for <igt-dev@lists.freedesktop.org>; Sat, 16 Oct 2021 00:23:47 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Fri, 15 Oct 2021 17:23:34 -0700
Message-Id: <20211016002334.14580-1-ashutosh.dixit@intel.com>
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
Cc: John Harrison <john.c.harrison@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

gem_submission_method() purports to return the currently used submission
method by the driver, as evidenced by its callers. Therefore remove the
GEM_SUBMISSION_EXECLISTS flag when GuC submission is detected.

This also fixes gem_has_execlists() to match its description, previously
gem_has_execlists() would return true even if GuC submission was actually
being used in the driver.

Reported-by: John Harrison <john.c.harrison@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/i915/gem_submission.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
 
-- 
2.33.0
