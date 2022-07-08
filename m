Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E30112EE2
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Jul 2022 12:24:32 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  8 Jul 2022 14:24:21 +0200
Message-Id: <20220708122422.94917-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220708122422.94917-1-zbigniew.kempczynski@intel.com>
References: <20220708122422.94917-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] i915/i915_module_load: Randomise fault
 injection
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@linux.intel.com>

Reduce the number of faults we inject during module reload to bring the
test runtime back to a reasonable level, and rely on multiple CI runs to
establish the full picture. This reduces the efficacy of testing (i.e.
premerge will probably not prevent inclusion of a buggy patch), but
error handling on module reload is not a critical factor for driver
health -- a broken patch that explodes in an error path is unlikely to
prevent CI from detecting critical issues, and with multiple runs we
should still be able to detect and fix issues before merging.

Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/6393

Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/i915/i915_module_load.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/tests/i915/i915_module_load.c b/tests/i915/i915_module_load.c
index 4705f3d6c4..a922af0064 100644
--- a/tests/i915/i915_module_load.c
+++ b/tests/i915/i915_module_load.c
@@ -302,21 +302,28 @@ igt_main
 		     " with fault injection.");
 	igt_subtest("reload-with-fault-injection") {
 		const char *param;
-		int i = 0;
+		int i;
 
 		igt_i915_driver_unload();
 
+		i = 0;
+		param = getenv("IGT_SRANDOM");
+		if (param)
+			i = atoi(param);
+		if (!i)
+			i = time(NULL);
+		igt_info("Using IGT_SRANDOM=%d for randomised faults\n", i);
+		srandom(i);
+
 		param = "inject_probe_failure";
 		if (!igt_kmod_has_param("i915", param))
 			param = "inject_load_failure";
 		igt_require(igt_kmod_has_param("i915", param));
 
-		while (inject_fault("i915", param, ++i) == 0)
+		i = 0;
+		while (inject_fault("i915", param, i += 1 + random() % 17) == 0)
 			;
 
-		/* We expect to hit at least one fault! */
-		igt_assert(i > 1);
-
 		/* inject_fault() leaves the module unloaded */
 	}
 
-- 
2.34.1
