Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C991210EA07
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 15:46:21 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  6 May 2022 21:15:50 +0530
Message-Id: <20220506154553.6146-7-anshuman.gupta@intel.com>
In-Reply-To: <20220506154553.6146-1-anshuman.gupta@intel.com>
References: <20220506154553.6146-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 6/9] i915_pm_rpm: Add D3Cold basic subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add support for D3Cold basic subtest.
It setup and prepares the gfx PCI card for D3Cold
and checks the ACPI D3Cold state.

v2:
- Removed IS_DGFX() condition.
- Added igt_describe(). [Kamil]

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/i915/i915_pm_rpm.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index d2bce5826..31f9712a8 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -1534,6 +1534,28 @@ __noreturn static void stay_subtest(void)
 		sleep(600);
 }
 
+static void d3cold_basic_subtest(void)
+{
+	struct pci_device *root;
+	bool result;
+
+	root = igt_device_get_pci_root_port(drm_fd);
+	igt_require(igt_pm_acpi_d3cold_supported(root));
+	igt_pm_setup_pci_card_runtime_pm(root);
+	disable_all_screens_and_wait(&ms_data);
+
+	result = igt_wait(igt_pm_get_acpi_real_d_state(root) == IGT_ACPI_D3Cold, 10000, 500);
+
+	if (!result) {
+		igt_info("D3Cold not achieved for root port %04x:%02x:%02x.%01x\n",
+			 root->domain, root->bus, root->dev, root->func);
+		igt_pm_print_pci_card_runtime_status();
+	}
+
+	igt_assert(result);
+	igt_pm_restore_pci_card_runtime_pm();
+}
+
 static void system_suspend_subtest(int state, int debug)
 {
 	disable_all_screens_and_wait(&ms_data);
@@ -2065,6 +2087,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		igt_subtest("stay")
 			stay_subtest();
 
+	igt_describe("Validate gfx root port d3cold state");
+	igt_subtest("d3cold-basic")
+		d3cold_basic_subtest();
+
 	/* Essential things */
 	igt_subtest("drm-resources-equal")
 		drm_resources_equal_subtest();
-- 
2.26.2
