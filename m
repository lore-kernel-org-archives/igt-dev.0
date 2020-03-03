Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A5A6E978
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2020 22:38:15 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Tue,  3 Mar 2020 14:38:09 -0800
Message-Id: <20200303223813.3866-3-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200303223813.3866-1-umesh.nerlige.ramappa@intel.com>
References: <20200303223813.3866-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/6] include/drm-uapi: Update i915_drm.h for
 perf OA APIs
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
To: igt-dev@lists.freedesktop.org, Lionel G Landwerlin <lionel.g.landwerlin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

Add APIs to enable/disable interrupts in perf OA.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 include/drm-uapi/i915_drm.h | 41 +++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index 3794e768..fca6ab4d 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -1969,6 +1969,26 @@ enum drm_i915_perf_property_id {
 	 */
 	DRM_I915_PERF_PROP_HOLD_PREEMPTION,
 
+	/**
+	 * Specifying this property sets up a hrtimer in nanoseconds at which
+	 * the i915 driver will check the OA buffer for available data. A
+	 * value of 0 means no hrtimer will be started. Values below 100
+	 * microseconds are not allowed.
+	 *
+	 * This property is available in perf revision 4.
+	 */
+	DRM_I915_PERF_PROP_POLL_OA_DELAY,
+
+	/**
+	 * Specifying this property sets up the interrupt mechanism for the OA
+	 * buffer in i915. This option in conjuction with a long polling delay
+	 * for avaibility of OA data can reduce CPU load significantly if you
+	 * do not care about OA data being read as soon as it's available.
+	 *
+	 * This property is available in perf revision 5.
+	 */
+	DRM_I915_PERF_PROP_OA_ENABLE_INTERRUPT,
+
 	DRM_I915_PERF_PROP_MAX /* non-ABI */
 };
 
@@ -2024,6 +2044,27 @@ struct drm_i915_perf_open_param {
  */
 #define I915_PERF_IOCTL_CONFIG	_IO('i', 0x2)
 
+/**
+ * Actively check the availability of data from a stream.
+ *
+ * A stream data availability can be driven by two types of events :
+ *
+ *   - if enabled, the kernel's hrtimer checking the amount of available data
+ *     in the OA buffer through head/tail registers.
+ *
+ *   - if enabled, the OA unit's interrupt mechanism
+ *
+ * The kernel hrtimer incur a cost of running callback at fixed time
+ * intervals, while the OA interrupt might only happen rarely. In the
+ * situation where the application has disabled the kernel's hrtimer and only
+ * uses the OA interrupt to know about available data, the application can
+ * request an active check of the available OA data through this ioctl. This
+ * will make any data in the OA buffer available with either poll() or read().
+ *
+ * This ioctl is available in perf revision 6.
+ */
+#define I915_PERF_IOCTL_FLUSH_DATA _IO('i', 0x3)
+
 /**
  * Common to all i915 perf records
  */
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
