Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AAB010E0A7
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 01:00:24 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  7 Aug 2023 18:00:08 -0700
Message-ID: <20230808010017.37819-12-ashutosh.dixit@intel.com>
In-Reply-To: <20230808010017.37819-1-ashutosh.dixit@intel.com>
References: <20230808010017.37819-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 11/20] tests/i915/perf: Only iterate over
 render engines for xe
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

Return a render engine (class == instance == 0) from __ci_to_e2. This
causes __for_random_engine_in_each_group to return only a render engine
from the render group.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 6f10e1d035cb..7cbf3f7ca287 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -5564,13 +5564,18 @@ __ci_to_e2(const intel_ctx_t *ctx, struct i915_engine_class_instance *ci)
 	static struct intel_execution_engine2 e2;
 	struct intel_execution_engine2 *e;
 
+	if (is_xe_device(drm_fd)) {
+		strncpy(e2.name, "rcs", sizeof(e2.name));
+		goto exit;
+	}
+
 	for_each_ctx_engine(drm_fd, ctx, e) {
 		if (e->class == ci->engine_class && e->instance == ci->engine_instance) {
 			e2 = *e;
 			break;
 		}
 	}
-
+exit:
 	return &e2;
 }
 
-- 
2.41.0
