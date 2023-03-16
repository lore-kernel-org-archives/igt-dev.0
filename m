Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC5810E24B
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Mar 2023 23:33:28 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 kamil.konieczny@linux.intel.com
Date: Thu, 16 Mar 2023 16:32:55 -0700
Message-Id: <20230316233323.2638668-4-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230316233323.2638668-1-umesh.nerlige.ramappa@intel.com>
References: <20230316233323.2638668-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 03/31] i915/perf: Use default engine for
 sseu tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Explicitly pass the default engine for the sseu tests.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index f7883de6..ee5a77fc 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -4469,6 +4469,9 @@ test_global_sseu_config_invalid(void)
 	};
 
 	memset(&default_sseu, 0, sizeof(default_sseu));
+	default_sseu.flags = I915_CONTEXT_SSEU_FLAG_ENGINE_INDEX;
+	default_sseu.engine.engine_class = default_e2.class;
+	default_sseu.engine.engine_instance = default_e2.flags;
 	igt_require(__gem_context_get_param(drm_fd, &ctx_gp) == 0);
 
 	igt_debug("Default context sseu:\n");
@@ -4544,6 +4547,9 @@ test_global_sseu_config(void)
 	};
 
 	memset(&default_sseu, 0, sizeof(default_sseu));
+	default_sseu.flags = I915_CONTEXT_SSEU_FLAG_ENGINE_INDEX;
+	default_sseu.engine.engine_class = default_e2.class;
+	default_sseu.engine.engine_instance = default_e2.flags;
 	igt_require(__gem_context_get_param(drm_fd, &ctx_gp) == 0);
 
 	igt_debug("Default context sseu:\n");
-- 
2.36.1
