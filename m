Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C511B10E391
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 01:00:24 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  7 Aug 2023 18:00:12 -0700
Message-ID: <20230808010017.37819-16-ashutosh.dixit@intel.com>
In-Reply-To: <20230808010017.37819-1-ashutosh.dixit@intel.com>
References: <20230808010017.37819-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 15/20] tests/i915/perf: Temporarily skip
 render_copy for xe
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

Temporarily test xe without render_copy.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index df6cb7edd017..0efa7f71477d 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -5995,7 +5995,8 @@ igt_main
 		perf_oa_groups = get_engine_groups(drm_fd, &num_perf_oa_groups);
 		igt_assert(perf_oa_groups && num_perf_oa_groups);
 
-		if (has_class_instance(drm_fd, I915_ENGINE_CLASS_RENDER, 0))
+		if (has_class_instance(drm_fd, I915_ENGINE_CLASS_RENDER, 0) &&
+		    !is_xe_device(drm_fd))
 			render_copy = igt_get_render_copyfunc(devid);
 	}
 
-- 
2.41.0
