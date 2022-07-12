Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A503418A881
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Jul 2022 16:48:25 +0000 (UTC)
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 12 Jul 2022 09:47:44 -0700
Message-Id: <20220712164744.255984-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v2] tests/i915/i915_pm_dc: Remove PC8+ dependency
 for DGFX DC9
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

For DGFX, the DC9 flow and dependency is different from igfx.
DC9 does not depend on BIOS/PCU to execute save
and restore or any other sequence when
going to PC9/PC10

DC9 actually depends on D3 and PCODE simply remove power
if SW allowed

v2: Get the info about platform being discrete or not from
i915_gpu_info debugfs (Anshuman)

v2: Update commit message and subject to reflect that the changes
Cc: Imre Deak <imre.deak@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>(v2)
---
 tests/i915/i915_pm_dc.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index a780f2cb..f664a2a2 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -422,6 +422,15 @@ static void check_dc9(data_t *data, int dc_target, int prev_dc)
 			data->debugfs_dump = igt_sysfs_get(data->debugfs_fd, RPM_STATUS));
 }
 
+static bool check_is_dgfx(data_t *data)
+{
+	char buf[4096];
+
+	igt_debugfs_simple_read(data->debugfs_fd, "i915_gpu_info",
+				buf, sizeof(buf));
+	return strstr(buf, "is_dgfx: yes");
+}
+
 static void setup_dc9_dpms(data_t *data, int dc_target)
 {
 	int prev_dc, sysfs_fd;
@@ -532,8 +541,9 @@ int main(int argc, char *argv[])
 
 	igt_describe("This test validates display engine entry to DC9 state");
 	igt_subtest("dc9-dpms") {
-		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
-				"PC8+ residencies not supported\n");
+		if (!(check_is_dgfx(&data)))
+			igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
+				      "PC8+ residencies not supported\n");
 		test_dc9_dpms(&data);
 	}
 
-- 
2.25.1
