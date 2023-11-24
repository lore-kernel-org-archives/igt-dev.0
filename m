Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC9710E7C2
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Nov 2023 08:54:34 +0000 (UTC)
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 24 Nov 2023 09:52:59 +0100
Message-Id: <20231124085259.1777-9-lukasz.laguna@intel.com>
In-Reply-To: <20231124085259.1777-1-lukasz.laguna@intel.com>
References: <20231124085259.1777-1-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 8/8] tests/sriov_basic: add more tests for
 VF driver binding
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

- bind-unbind-vf: validate driver binding and unbinding to specified VF
- enable-vfs-bind-unbind-each: validate driver binding and unbinding to
  VFs from specified range.

v2:
 - remove checks that are outside the scope of the test (Michal)

Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/sriov_basic.c | 90 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
index 866bb88e4..72541fe2f 100644
--- a/tests/sriov_basic.c
+++ b/tests/sriov_basic.c
@@ -90,6 +90,58 @@ static void enable_vfs_bind_all_unbind_all(int pf_fd, unsigned int num_vfs)
 	igt_sriov_disable_vfs(pf_fd);
 }
 
+/**
+ * SUBTEST: enable-vfs-bind-unbind-each
+ * Description:
+ *   Verify VFs enabling with binding and unbinding the driver one be one to each of them
+ * Run type: BAT
+ */
+static void enable_vfs_bind_unbind_each(int pf_fd, unsigned int num_vfs)
+{
+	igt_debug("Testing %u VFs\n", num_vfs);
+
+	igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
+
+	igt_sriov_disable_driver_autoprobe(pf_fd);
+	igt_sriov_enable_vfs(pf_fd, num_vfs);
+	igt_sriov_enable_driver_autoprobe(pf_fd);
+
+	for (int i = 1; i <= num_vfs; i++) {
+		igt_assert(!igt_sriov_is_vf_drm_driver_probed(pf_fd, i));
+		igt_sriov_bind_vf_drm_driver(pf_fd, i);
+		igt_assert(igt_sriov_is_vf_drm_driver_probed(pf_fd, i));
+		igt_sriov_unbind_vf_drm_driver(pf_fd, i);
+		igt_assert(!igt_sriov_is_vf_drm_driver_probed(pf_fd, i));
+	}
+
+	igt_sriov_disable_vfs(pf_fd);
+}
+
+/**
+ * SUBTEST: bind-unbind-vf
+ * Description:
+ *   Verify binding and unbinding the driver to specific VF
+ * Run type: BAT
+ */
+static void bind_unbind_vf(int pf_fd, unsigned int vf_num)
+{
+	igt_debug("Testing VF%u\n", vf_num);
+
+	igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
+
+	igt_sriov_disable_driver_autoprobe(pf_fd);
+	igt_sriov_enable_vfs(pf_fd, vf_num);
+	igt_sriov_enable_driver_autoprobe(pf_fd);
+
+	igt_assert(!igt_sriov_is_vf_drm_driver_probed(pf_fd, vf_num));
+	igt_sriov_bind_vf_drm_driver(pf_fd, vf_num);
+	igt_assert(igt_sriov_is_vf_drm_driver_probed(pf_fd, vf_num));
+	igt_sriov_unbind_vf_drm_driver(pf_fd, vf_num);
+	igt_assert(!igt_sriov_is_vf_drm_driver_probed(pf_fd, vf_num));
+
+	igt_sriov_disable_vfs(pf_fd);
+}
+
 igt_main
 {
 	int pf_fd;
@@ -159,6 +211,44 @@ igt_main
 		}
 	}
 
+	igt_describe("Verify VFs enabling with binding and unbinding the driver one be one to each of them");
+	igt_subtest_with_dynamic("enable-vfs-bind-unbind-each") {
+		for_each_num_vfs(pf_fd, num_vfs) {
+			igt_dynamic_f("numvfs-%u", num_vfs) {
+				enable_vfs_bind_unbind_each(pf_fd, num_vfs);
+			}
+		}
+		for_random_num_vfs(pf_fd, num_vfs) {
+			igt_dynamic_f("numvfs-random") {
+				enable_vfs_bind_unbind_each(pf_fd, num_vfs);
+			}
+		}
+		for_max_num_vfs(pf_fd, num_vfs) {
+			igt_dynamic_f("numvfs-all") {
+				enable_vfs_bind_unbind_each(pf_fd, num_vfs);
+			}
+		}
+	}
+
+	igt_describe("Test binds and unbinds the driver to specific VF");
+	igt_subtest_with_dynamic("bind-unbind-vf") {
+		for_each_vf(pf_fd, vf) {
+			igt_dynamic_f("vf-%u", vf) {
+				bind_unbind_vf(pf_fd, vf);
+			}
+		}
+		for_random_vf(pf_fd, vf) {
+			igt_dynamic_f("vf-random") {
+				bind_unbind_vf(pf_fd, vf);
+			}
+		}
+		for_last_vf(pf_fd, vf) {
+			igt_dynamic_f("vf-last") {
+				bind_unbind_vf(pf_fd, vf);
+			}
+		}
+	}
+
 	igt_fixture {
 		igt_sriov_disable_vfs(pf_fd);
 		/* abort to avoid execution of next tests with enabled VFs */
-- 
2.40.0
