Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1516810EA4B
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Dec 2023 15:51:11 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v1 06/10] drm-uapi/xe: Remove PMU from Xe till uapi is
 finalized
Date: Fri, 15 Dec 2023 15:50:46 +0000
Message-Id: <20231215155050.7-7-francois.dugast@intel.com>
In-Reply-To: <20231215155050.7-1-francois.dugast@intel.com>
References: <20231215155050.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Align with commit ("drm/xe/pmu: Remove PMU from Xe till uapi is finalized")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/xe_drm.h | 40 ---------------------------------------
 1 file changed, 40 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 8f09e9681..b1839df48 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -1074,46 +1074,6 @@ struct drm_xe_wait_user_fence {
 	/** @reserved: Reserved */
 	__u64 reserved[2];
 };
-
-/**
- * DOC: XE PMU event config IDs
- *
- * Check 'man perf_event_open' to use the ID's DRM_XE_PMU_XXXX listed in xe_drm.h
- * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
- * particular event.
- *
- * For example to open the DRMXE_PMU_RENDER_GROUP_BUSY(0):
- *
- * .. code-block:: C
- *
- *	struct perf_event_attr attr;
- *	long long count;
- *	int cpu = 0;
- *	int fd;
- *
- *	memset(&attr, 0, sizeof(struct perf_event_attr));
- *	attr.type = type; // eg: /sys/bus/event_source/devices/xe_0000_56_00.0/type
- *	attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
- *	attr.use_clockid = 1;
- *	attr.clockid = CLOCK_MONOTONIC;
- *	attr.config = DRM_XE_PMU_RENDER_GROUP_BUSY(0);
- *
- *	fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
- */
-
-/*
- * Top bits of every counter are GT id.
- */
-#define __DRM_XE_PMU_GT_SHIFT (56)
-
-#define ___DRM_XE_PMU_OTHER(gt, x) \
-	(((__u64)(x)) | ((__u64)(gt) << __DRM_XE_PMU_GT_SHIFT))
-
-#define DRM_XE_PMU_RENDER_GROUP_BUSY(gt)	___DRM_XE_PMU_OTHER(gt, 0)
-#define DRM_XE_PMU_COPY_GROUP_BUSY(gt)		___DRM_XE_PMU_OTHER(gt, 1)
-#define DRM_XE_PMU_MEDIA_GROUP_BUSY(gt)		___DRM_XE_PMU_OTHER(gt, 2)
-#define DRM_XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___DRM_XE_PMU_OTHER(gt, 3)
-
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1
