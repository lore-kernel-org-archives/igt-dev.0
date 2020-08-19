Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D96A6E2CC
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2020 13:41:22 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 19 Aug 2020 16:41:18 +0300
Message-Id: <20200819134118.28904-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/perf: Ensure i915.ko is loaded before
 requiring its procfs files
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

If for example i915_module_load is executed before this test, i915.ko
is not loaded and /proc/sys/dev/i915/perf_stream_paranoid naturally
does not exist. Ensure the module is loaded by briefly opening
DRIVER_INTEL.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
---
 tests/i915/perf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 92edc9f1..c43ef496 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -4902,6 +4902,9 @@ igt_main
 	igt_fixture {
 		struct stat sb;
 
+		/* Ensure i915.ko is loaded */
+		close(__drm_open_driver(DRIVER_INTEL));
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
