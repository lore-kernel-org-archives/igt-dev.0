Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A4910EAEB
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Jul 2022 18:18:34 +0000 (UTC)
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  8 Jul 2022 11:17:44 -0700
Message-Id: <20220708181744.398984-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/i915/i915_pm_dc: Remove PC8+ dependency
 from DC9
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

Different from DC6, DC9 does not depend on BIOS/PCU
to execute save and restore or any other sequence when
going to PC9/PC10

DC9 actually depends on D3 and PCODE simply remove power
if SW allowed

v2: resrict the check for igfx only.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>(v2)
---
 tests/i915/i915_pm_dc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index a780f2cb..5132734b 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -532,8 +532,9 @@ int main(int argc, char *argv[])
 
 	igt_describe("This test validates display engine entry to DC9 state");
 	igt_subtest("dc9-dpms") {
-		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
-				"PC8+ residencies not supported\n");
+		if (!(IS_DG1(data.devid) || IS_DG2(data.devid)))
+			igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
+				      "PC8+ residencies not supported\n");
 		test_dc9_dpms(&data);
 	}
 
-- 
2.25.1
