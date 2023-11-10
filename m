Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2605810E10C
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Nov 2023 15:52:33 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 10 Nov 2023 15:52:11 +0000
Message-Id: <20231110155211.7-8-francois.dugast@intel.com>
In-Reply-To: <20231110155211.7-1-francois.dugast@intel.com>
References: <20231110155211.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v1 7/7] drm-uapi/xe: Drop interrupt pmu event
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

Align with kernel commit ("drm/xe/pmu: Drop interrupt pmu event")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 0f4c83e4c..babfaf0fe 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -977,7 +977,7 @@ struct drm_xe_wait_user_fence {
  * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
  * particular event.
  *
- * For example to open the XE_PMU_INTERRUPTS(0):
+ * For example to open the XE_PMU_RENDER_GROUP_BUSY(0):
  *
  * .. code-block:: C
  *
@@ -991,7 +991,7 @@ struct drm_xe_wait_user_fence {
  *	attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
  *	attr.use_clockid = 1;
  *	attr.clockid = CLOCK_MONOTONIC;
- *	attr.config = XE_PMU_INTERRUPTS(0);
+ *	attr.config = XE_PMU_RENDER_GROUP_BUSY(0);
  *
  *	fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
  */
@@ -1004,11 +1004,10 @@ struct drm_xe_wait_user_fence {
 #define ___XE_PMU_OTHER(gt, x) \
 	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
 
-#define XE_PMU_INTERRUPTS(gt)			___XE_PMU_OTHER(gt, 0)
-#define XE_PMU_RENDER_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 1)
-#define XE_PMU_COPY_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 2)
-#define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 3)
-#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 4)
+#define XE_PMU_RENDER_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 0)
+#define XE_PMU_COPY_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 1)
+#define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 2)
+#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 3)
 
 #if defined(__cplusplus)
 }
-- 
2.34.1
