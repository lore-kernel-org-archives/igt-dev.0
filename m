Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B53410E266
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 10:16:38 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Date: Mon, 29 May 2023 15:46:54 +0530
Message-Id: <20230529101654.488126-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/core_hotunplug: Add XE driver test
 support
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Enable test for DRIVER_XE

Signed-off-by: Janga Rahul Kumar<janga.rahul.kumar@intel.com>
---
 tests/core_hotunplug.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 4d6a721f..2b97e86e 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -445,7 +445,7 @@ static void node_healthcheck(struct hotunplug *priv, unsigned flags)
 	if (closed)	/* store fd for cleanup if not dirty */
 		priv->fd.drm_hc = fd_drm;
 
-	if (priv->chipset == DRIVER_INTEL) {
+	if (priv->chipset == DRIVER_INTEL || priv->chipset == DRIVER_XE) {
 		/* don't report library failed asserts as healthcheck failure */
 		priv->failure = "Unrecoverable test failure";
 		if (local_i915_healthcheck(fd_drm, "") &&
@@ -694,6 +694,10 @@ igt_main
 			igt_require_gem(fd_drm);
 
 			priv.has_intel_perf = local_i915_perf_healthcheck(fd_drm);
+		} else if (is_xe_device(fd_drm)) {
+			priv.chipset = DRIVER_XE;
+
+			gem_quiescent_gpu(fd_drm);
 		}
 
 		/* Make sure subtests always reopen the same device */
-- 
2.25.1
