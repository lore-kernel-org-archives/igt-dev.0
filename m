Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 089346EE9F
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Oct 2020 22:55:52 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Fri, 30 Oct 2020 15:55:48 -0700
Message-Id: <20201030225548.7444-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/perf: Make sure i915 is loaded before
 reading proc
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
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

The previous test may have unloaded i915 or failed to load it back. To
combat such cases, each test fixture is supposed to ensure that i915 is
loaded prior to running the subtests. In most fixtures this happens
automatically when we try to get a handle to i915. In perf OA, we stat
some proc/sys files even before getting a handle to i915. Occassionally,
perf tests fail trying to stat these files. Fix perf OA by checking and
loading i915 if it's not loaded.

v2: Remove the if check (Ashutosh)

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/405
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index a5c4adc3..bd8281bd 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -41,6 +41,7 @@
 #include "i915/gem.h"
 #include "i915/perf.h"
 #include "igt.h"
+#include "igt_kmod.h"
 #include "igt_sysfs.h"
 #include "drm.h"
 
@@ -4806,6 +4807,13 @@ igt_main
 	igt_fixture {
 		struct stat sb;
 
+		/*
+		 * Prior tests may have unloaded i915 or failed while
+		 * loading/unloading i915. Load i915 here before we stat the
+		 * files.
+		 */
+		igt_i915_driver_load(NULL);
+
 		igt_require(stat("/proc/sys/dev/i915/perf_stream_paranoid", &sb)
 			    == 0);
 		igt_require(stat("/proc/sys/dev/i915/oa_max_sample_rate", &sb)
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
