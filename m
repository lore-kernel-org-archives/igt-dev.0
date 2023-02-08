Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4517B10E041
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Feb 2023 06:25:03 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Feb 2023 22:24:59 -0800
Message-Id: <20230208062459.1113975-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests/i915/pxp:
 test_pxp_stale_buf_optout_execution requires arb session
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Subtest 'test_pxp_stale_buf_optout_execution' when run on its own,
could be executing without the PXP Arb session being alive. This
would result in the termination trigger to fail (when writing to
the pxp termination debugfs).

Create a background protected context to start the Arb session so
the simulated termination will succeed.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tests/i915/gem_pxp.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
index 8c141ddd..5fbfe6b2 100644
--- a/tests/i915/gem_pxp.c
+++ b/tests/i915/gem_pxp.c
@@ -933,6 +933,25 @@ static void test_pxp_stale_buf_optout_execution(int i915)
 {
 	int ret;
 	struct simple_exec_assets data = {0};
+	struct simple_exec_assets data2 = {0};
+
+	/*
+	 * NOTE: this subtest creates a non-protected context
+	 * for submissions that uses a protected buffer. The UAPI
+	 * requirement dictates that gem_exec_buf will not fail
+	 * if a teardown occurs since the context was not protected,
+	 * despite the buffer being protected. However, the teardown
+	 * is simulated using the pxp termination debugfs which will
+	 * fail if PXP arb session is not active. Coincidentially
+	 * this will likely not happen when running all the subtests
+	 * together but if we execute this specific subtest on its own
+	 * and if the system has no display enabled, it will likely
+	 * not have active ARB session and thus the termination debugfs
+	 * will fail and cause an assertion. That said, we need to
+	 * create a background protected context (uninvolved with
+	 * the intent of the subtest) to ensure ARB session is alive.
+	 */
+	prepare_exec_assets(i915, &data2, true, true);
 
 	/*
 	 * Use a normal context for testing opt-out behavior
@@ -948,6 +967,7 @@ static void test_pxp_stale_buf_optout_execution(int i915)
 	igt_assert_f((ret == 0), "Opt-out-execution with stale pxp buffer didn't succeed\n");
 
 	free_exec_assets(i915, &data);
+	free_exec_assets(i915, &data2);
 }
 
 static void test_pxp_pwrcycle_staleasset_execution(int i915, struct powermgt_data *pm)
-- 
2.39.0
