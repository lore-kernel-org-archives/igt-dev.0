Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDEF6FBAD
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2020 17:31:12 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Fri, 31 Jan 2020 23:01:02 +0530
Message-Id: <20200131173109.12527-3-ramalingam.c@intel.com>
In-Reply-To: <20200131173109.12527-1-ramalingam.c@intel.com>
References: <20200131173109.12527-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/9] tests/intel_dp_compliance: Skip tests
 as tiling is not supported
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
To: igt-dev <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Skip the test if the tiling is not supported on the platforms.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 tools/intel_dp_compliance.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/intel_dp_compliance.c b/tools/intel_dp_compliance.c
index 5cc3d37a71d6..8f4ea3f3d328 100644
--- a/tools/intel_dp_compliance.c
+++ b/tools/intel_dp_compliance.c
@@ -1043,6 +1043,8 @@ int main(int argc, char **argv)
 	drm_fd = drm_open_driver(DRIVER_ANY);
 	gen = intel_gen(intel_get_drm_devid(drm_fd));
 
+	/* Set tiling is not supported on newer platforms */
+	gem_require_mappable_ggtt(drm_fd);
 	kmstest_set_vt_graphics_mode();
 	setup_debugfs_files();
 	cleanup_test();
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
