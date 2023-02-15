Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DB310E9FC
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Feb 2023 00:46:53 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Feb 2023 16:46:20 -0800
Message-Id: <20230215004648.2100655-4-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230215004648.2100655-1-umesh.nerlige.ramappa@intel.com>
References: <20230215004648.2100655-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 03/31] i915/perf: Use default engine for
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
---
 tests/i915/perf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 15ffb50e..015693e7 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -4482,6 +4482,9 @@ test_global_sseu_config_invalid(void)
 	};
 
 	memset(&default_sseu, 0, sizeof(default_sseu));
+	default_sseu.flags = I915_CONTEXT_SSEU_FLAG_ENGINE_INDEX;
+	default_sseu.engine.engine_class = default_e2.class;
+	default_sseu.engine.engine_instance = default_e2.flags;
 	igt_require(__gem_context_get_param(drm_fd, &ctx_gp) == 0);
 
 	igt_debug("Default context sseu:\n");
@@ -4557,6 +4560,9 @@ test_global_sseu_config(void)
 	};
 
 	memset(&default_sseu, 0, sizeof(default_sseu));
+	default_sseu.flags = I915_CONTEXT_SSEU_FLAG_ENGINE_INDEX;
+	default_sseu.engine.engine_class = default_e2.class;
+	default_sseu.engine.engine_instance = default_e2.flags;
 	igt_require(__gem_context_get_param(drm_fd, &ctx_gp) == 0);
 
 	igt_debug("Default context sseu:\n");
-- 
2.36.1
