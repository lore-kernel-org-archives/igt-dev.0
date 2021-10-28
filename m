Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A54F6E04A
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Oct 2021 04:41:04 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Wed, 27 Oct 2021 21:40:57 -0700
Message-Id: <a37a07d818420cb136e182b767e8302c476caf4a.1635395331.git.ashutosh.dixit@intel.com>
In-Reply-To: <cover.1635395331.git.ashutosh.dixit@intel.com>
References: <cover.1635395331.git.ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/gem_ctx_shared: Fix
 disjoint_timelines test requirements
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

Use gem_uses_ppgtt() for create vm and gem_scheduler_enabled() for
context re-ordering.

Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_ctx_shared.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
index 849713ff32f..670452f97fd 100644
--- a/tests/i915/gem_ctx_shared.c
+++ b/tests/i915/gem_ctx_shared.c
@@ -159,7 +159,7 @@ static void disjoint_timelines(int i915, const intel_ctx_cfg_t *cfg)
 	uint32_t plug;
 	uint64_t ahnd;
 
-	igt_require(gem_using_execlists(i915) || gem_using_guc_submission(i915));
+	igt_require(gem_uses_ppgtt(i915) && gem_scheduler_enabled(i915));
 
 	/*
 	 * Each context, although they share a vm, are expected to be
-- 
2.33.0
