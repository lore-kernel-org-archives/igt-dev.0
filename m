Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FD46EB04
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Jun 2021 12:31:41 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Thu, 24 Jun 2021 17:52:48 +0530
Message-Id: <20210624122248.903530-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [i-g-t] i915/gem_exec_fair: Extend icl ctx timestamp w/a
 to gen11
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

80ns timestamp interval identified for icl also applies to
gen11 platforms. igt@gem_exec_fair@basic-deadline is
passing with the change on ehl and jsl.

Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 tests/i915/gem_exec_fair.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/tests/i915/gem_exec_fair.c b/tests/i915/gem_exec_fair.c
index 628f4df2..45237574 100644
--- a/tests/i915/gem_exec_fair.c
+++ b/tests/i915/gem_exec_fair.c
@@ -98,16 +98,11 @@ static uint64_t div64_u64_round_up(uint64_t x, uint64_t y)
 	return (x + y - 1) / y;
 }
 
-static bool is_icelake(int i915)
-{
-	return intel_get_device_info(intel_get_drm_devid(i915))->is_icelake;
-}
-
 static uint64_t ns_to_ctx_ticks(int i915, uint64_t ns)
 {
 	int f = read_timestamp_frequency(i915);
-	if (is_icelake(i915))
-		f = 12500000; /* icl!!! are you feeling alright? CTX vs CS */
+	if (intel_gen(intel_get_drm_devid(i915)) == 11)
+		f = 12500000; /* gen11!!! are you feeling alright? CTX vs CS */
 	return div64_u64_round_up(ns * f, NSEC64);
 }
 
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
