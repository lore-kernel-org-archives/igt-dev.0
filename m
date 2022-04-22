Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F04210EECD
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Apr 2022 00:38:52 +0000 (UTC)
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 21 Apr 2022 17:35:22 -0700
Message-Id: <20220422003522.4129510-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] i915/dg2/pm_rpm: skip basic-rte subtest for Dg2
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

As part of IGT cleanup we need to understand if the IGT needs
to change for discrete graphics scenario or need new subtests.
As of now this fails with MMIO BARS on DG2.
Lets skip the test temporarily till we completely understand the
use case for dgfx before we run this again with confidence.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
---
 tests/i915/i915_pm_rpm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 461730e8..1395718d 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -2049,6 +2049,17 @@ static struct option long_options[] = {
 igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
 	igt_subtest("basic-rte") {
+	/* TODO As a part of IGT cleanup, lets understand if the test needs
+	 * changes for DG2.
+	 * This tests results in MMIO BARs when run on DG2. The igt_require()
+	 * below does state the test to SKIP in case system is not cnfigured
+	 * properly. However on DG2 instead of skipping smoothly it  causes MMIO
+	 * BAR resulting in hang. Till we have understood
+	 * if the test makes sense to be run on DG2 or needs any changes for
+	 * discrete GPU case, lets explicitly SKIP it
+	 */
+               igt_skip_on(IS_DG2(ms_data.devid));
+
 		igt_assert(setup_environment(false));
 		basic_subtest();
 	}
-- 
2.25.1
