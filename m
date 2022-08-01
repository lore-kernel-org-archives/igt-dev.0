Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F5797416
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Aug 2022 18:01:50 +0000 (UTC)
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  1 Aug 2022 14:01:42 -0400
Message-Id: <20220801180145.243227-2-rodrigo.vivi@intel.com>
In-Reply-To: <20220801180145.243227-1-rodrigo.vivi@intel.com>
References: <20220801180145.243227-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/5] tests/i915/i915_suspend: Be more
 specific on the S3 mem_sleep requirement.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

1. We are not using DISK
2. DISK has no dependency on mem_sleep.

Let's be clear on what exactly we are trying to do.

Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_suspend.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
index f992d447..222a8e4a 100644
--- a/tests/i915/i915_suspend.c
+++ b/tests/i915/i915_suspend.c
@@ -209,8 +209,9 @@ test_suspend_without_i915(int state)
 	igt_kmsg(KMSG_INFO "Unloading i915\n");
 	igt_assert_eq(igt_i915_driver_unload(),0);
 
-	igt_skip_on_f(igt_get_memsleep_state() == MEM_SLEEP_S2IDLE && state > SUSPEND_STATE_FREEZE,
-		      "Platform default mem_sleep state is s2idle\n");
+	igt_skip_on_f(igt_get_memsleep_state() == MEM_SLEEP_S2IDLE &&
+		      state == SUSPEND_STATE_MEM,
+		      "S3 not possible: platform default mem_sleep state is s2idle\n");
 	igt_system_suspend_autoresume(state, SUSPEND_TEST_NONE);
 
 	igt_kmsg(KMSG_INFO "Re-loading i915 \n");
-- 
2.35.3
