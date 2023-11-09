Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B2E10E1C3
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 06:53:22 +0000 (UTC)
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 07:51:46 +0100
Message-Id: <20231109065147.9479-8-lukasz.laguna@intel.com>
In-Reply-To: <20231109065147.9479-1-lukasz.laguna@intel.com>
References: <20231109065147.9479-1-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 7/8] tests/sriov_basic: validate driver
 binding to VFs
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

From: Katarzyna Dec <katarzyna.dec@intel.com>

Test enables VFs in range <1..totalvfs>, bind driver to all of them and
then unbind driver from all of them.

Signed-off-by: Katarzyna Dec <katarzyna.dec@intel.com>
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/sriov_basic.c | 48 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
index 8717d2186..a10b7a290 100644
--- a/tests/sriov_basic.c
+++ b/tests/sriov_basic.c
@@ -59,6 +59,35 @@ static void enable_vfs_autoprobe_on(int pf_fd, unsigned int num_vfs)
 	igt_assert(!err);
 }
 
+/**
+ * SUBTEST: enable-vfs-bind-all-unbind-all
+ * Description:
+ *   Verify VFs enabling, binding the driver and then unbinding it from all of them
+ */
+static void enable_vfs_bind_all_unbind_all(int pf_fd, unsigned int num_vfs)
+{
+	igt_debug("Testing %u VFs\n", num_vfs);
+
+	igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
+
+	igt_assert(igt_sriov_disable_driver_autoprobe(pf_fd));
+	igt_assert(igt_sriov_enable_vfs(pf_fd, num_vfs));
+	igt_assert(igt_sriov_enable_driver_autoprobe(pf_fd));
+
+	for (int i = 1; i <= num_vfs; i++) {
+		igt_assert(!igt_sriov_is_vf_drm_driver_probed(pf_fd, i));
+		igt_assert(igt_sriov_bind_vf_drm_driver(pf_fd, i));
+		igt_assert(igt_sriov_is_vf_drm_driver_probed(pf_fd, i));
+	}
+
+	for (int i = 1; i <= num_vfs; i++) {
+		igt_assert(igt_sriov_unbind_vf_drm_driver(pf_fd, i));
+		igt_assert(!igt_sriov_is_vf_drm_driver_probed(pf_fd, i));
+	}
+
+	igt_assert(igt_sriov_disable_vfs(pf_fd));
+}
+
 igt_main
 {
 	int pf_fd;
@@ -111,6 +140,25 @@ igt_main
 		}
 	}
 
+	igt_describe("Verify VFs enabling, binding the driver and then unbinding it from all of them");
+	igt_subtest_with_dynamic("enable-vfs-bind-all-unbind-all") {
+		for_each_num_vfs(pf_fd, num_vfs) {
+			igt_dynamic_f("numvfs-%u", num_vfs) {
+				enable_vfs_bind_all_unbind_all(pf_fd, num_vfs);
+			}
+		}
+		for_random_num_vfs(pf_fd, num_vfs) {
+			igt_dynamic_f("numvfs-random") {
+				enable_vfs_bind_all_unbind_all(pf_fd, num_vfs);
+			}
+		}
+		for_max_num_vfs(pf_fd, num_vfs) {
+			igt_dynamic_f("numvfs-all") {
+				enable_vfs_bind_all_unbind_all(pf_fd, num_vfs);
+			}
+		}
+	}
+
 	igt_fixture {
 		igt_sriov_disable_vfs(pf_fd);
 		/* abort to avoid execution of next tests with enabled VFs */
-- 
2.40.0
