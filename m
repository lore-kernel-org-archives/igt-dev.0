Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A81046EC57
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2020 19:53:17 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Fri, 13 Mar 2020 12:53:14 -0700
Message-Id: <20200313195316.7494-2-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200313195316.7494-1-umesh.nerlige.ramappa@intel.com>
References: <20200313195316.7494-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/3] include/drm-uapi: Update i915_drm.h for
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
To: igt-dev@lists.freedesktop.org, Lionel G Landwerlin <lionel.g.landwerlin@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

Add APIs to configure poll delay in perf OA.

v2: (Umesh)
- Remove interrupt and flush APIs
- Change commit message

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 include/drm-uapi/i915_drm.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index 3794e768..813175c4 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -1969,6 +1969,19 @@ enum drm_i915_perf_property_id {
 	 */
 	DRM_I915_PERF_PROP_HOLD_PREEMPTION,
 
+	/**
+	 * This optional parameter specifies the timer interval in nanoseconds
+	 * at which the i915 driver will check the OA buffer for available data.
+	 * Minimum allowed value is 100 microseconds. A default value is used by
+	 * the driver if this parameter is not specified. Note that a large
+	 * value may reduce cpu consumption during OA perf captures, but it
+	 * would also potentially result in OA buffer overwrite as the captures
+	 * reach end of the OA buffer.
+	 *
+	 * This property is available in perf revision 4.
+	 */
+	DRM_I915_PERF_PROP_POLL_OA_DELAY,
+
 	DRM_I915_PERF_PROP_MAX /* non-ABI */
 };
 
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
