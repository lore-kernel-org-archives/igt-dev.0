Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0DAC112641
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Aug 2022 23:57:04 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 22 Aug 2022 23:56:38 +0000
Message-Id: <20220822235657.280702-5-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20220822235657.280702-1-umesh.nerlige.ramappa@intel.com>
References: <20220822235657.280702-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 04/23] i915/perf: Limit sseu-config tests
 for gen11
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

From: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>

On Gen11, the Media driver will need to limit dispatch to only big
subslices (usually half the EUs depending on EU fusing). If media,
render and OA are running in parallel, then OA will lose the NOA config
because half of the EUs will be turned off by media. To avoid this with
concurrent use cases, an sseu config to keep all EUs powered on is
passed to OA in the i915_perf_open_ioctl params. This configuration is
made part of the render contexts, so that it's applied when 3d contexts
are running. Since this is an issue on gen11, limit sseu-config tests to
gen11.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/i915/perf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 0b8f6ac8..ca3ccc17 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -5112,6 +5112,7 @@ igt_main
 	igt_subtest_group {
 		igt_fixture {
 			igt_require(i915_perf_revision(drm_fd) >= 4);
+			igt_require(intel_gen(devid) == 11);
 		}
 
 		igt_describe("Verify invalid SSEU opening parameters");
-- 
2.25.1
