Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345B7892C1
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Sep 2022 19:52:30 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
 Lionel G Landwerlin <lionel.g.landwerlin@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Fri, 23 Sep 2022 19:52:10 +0000
Message-Id: <20220923195224.283045-4-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20220923195224.283045-1-umesh.nerlige.ramappa@intel.com>
References: <20220923195224.283045-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 03/17] i915/perf: Check return value from
 getparam
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

In some cases getparam could fail. Check return from getparam and fail
early on.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 lib/i915/perf.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index d88835ff..7349a460 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -287,19 +287,16 @@ intel_perf_for_devinfo(uint32_t device_id,
 	return perf;
 }
 
-static uint32_t
-getparam(int drm_fd, uint32_t param)
+static int
+getparam(int drm_fd, uint32_t param, uint32_t *val)
 {
-        struct drm_i915_getparam gp;
-        int val = -1;
-
-        memset(&gp, 0, sizeof(gp));
-        gp.param = param;
-        gp.value = &val;
+	struct drm_i915_getparam gp;
 
-	perf_ioctl(drm_fd, DRM_IOCTL_I915_GETPARAM, &gp);
+	memset(&gp, 0, sizeof(gp));
+	gp.param = param;
+	gp.value = (int *)val;
 
-        return val;
+	return perf_ioctl(drm_fd, DRM_IOCTL_I915_GETPARAM, &gp);
 }
 
 static bool
@@ -415,9 +412,9 @@ open_master_sysfs_dir(int drm_fd)
 struct intel_perf *
 intel_perf_for_fd(int drm_fd)
 {
-	uint32_t device_id = getparam(drm_fd, I915_PARAM_CHIPSET_ID);
-	uint32_t device_revision = getparam(drm_fd, I915_PARAM_REVISION);
-	uint32_t timestamp_frequency = getparam(drm_fd, I915_PARAM_CS_TIMESTAMP_FREQUENCY);
+	uint32_t device_id;
+	uint32_t device_revision;
+	uint32_t timestamp_frequency;
 	uint64_t gt_min_freq;
 	uint64_t gt_max_freq;
 	struct drm_i915_query_topology_info *topology;
@@ -434,6 +431,11 @@ intel_perf_for_fd(int drm_fd)
 	}
 	close(sysfs_dir_fd);
 
+	if (getparam(drm_fd, I915_PARAM_CHIPSET_ID, &device_id) ||
+	    getparam(drm_fd, I915_PARAM_REVISION, &device_revision) ||
+	    getparam(drm_fd, I915_PARAM_CS_TIMESTAMP_FREQUENCY, &timestamp_frequency))
+		return NULL;
+
 	topology = query_topology(drm_fd);
 	if (!topology)
 		return NULL;
-- 
2.25.1
