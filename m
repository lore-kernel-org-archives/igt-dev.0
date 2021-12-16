Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA12710E55A
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Dec 2021 08:19:06 +0000 (UTC)
From: Arjun Melkaveri <arjun.melkaveri@intel.com>
Date: Thu, 16 Dec 2021 13:38:05 +0530
Message-Id: <20211216080805.12086-1-arjun.melkaveri@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_schedule: Added
 igt_spin_end for submit_slice subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: arjun.melkaveri@intel.com, krishnaiah.bommu@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Due to new ctx implementation , "submit_slice" subtests are waiting for
long time at I915_GEM_WAIT.
Adding igt_spin_end resolves this issue.

Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
---
 tests/i915/gem_exec_schedule.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index 68457406..2c72c5e1 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -875,6 +875,7 @@ static void submit_slice(int i915, const intel_ctx_cfg_t *cfg,
 		if (timeline != -1)
 			close(timeline);
 
+		igt_spin_end(spin);
 		gem_sync(i915, spin->handle);
 		igt_spin_free(i915, spin);
 		igt_spin_free(i915, bg);
-- 
2.25.1
