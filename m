Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ADEC10E2C3
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Apr 2022 18:46:38 +0000 (UTC)
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 20 Apr 2022 14:46:28 -0400
Message-Id: <20220420184628.412506-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/i915_pm_dc.c: Remove PC8+
 dependency from DC9.
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

Different from DC6, DC9 does not depend on the BIOS/PCU
to execute save and restore or any other sequence when
going to PC9/PC10.

DC9 actually depends on D3 and PCODE simply remove power
if SW allowed.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/i915/i915_pm_dc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index 2c2c5086..9a22246c 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -531,8 +531,6 @@ int main(int argc, char *argv[])
 
 	igt_describe("This test validates display engine entry to DC9 state");
 	igt_subtest("dc9-dpms") {
-		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
-				"PC8+ residencies not supported\n");
 		test_dc9_dpms(&data);
 	}
 
-- 
2.34.1
