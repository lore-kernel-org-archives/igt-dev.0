Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA7B10E043
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Oct 2022 19:53:03 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 28 Oct 2022 19:52:35 +0000
Message-Id: <20221028195258.106453-6-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20221028195258.106453-1-umesh.nerlige.ramappa@intel.com>
References: <20221028195258.106453-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 05/28] i915/perf: Skip sseu-config tests
 for gfx12.50+
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

On Gen11, the Media driver will need to limit dispatch to only big
subslices (usually half the EUs depending on EU fusing). If media,
render and OA are running in parallel, then OA will lose the NOA config
because half of the EUs will be turned off by media. To avoid this with
concurrent use cases, an sseu config to keep all EUs powered on is
passed to OA in the i915_perf_open_ioctl params. This configuration is
made part of the render contexts, so that it's applied when 3d contexts
are running. Since this is an issue on gen11, skip sseu-config tests on
other platforms.

v2:
- While sseu-config is only applicable gen11, gfx12 is already shipped
  with this, so skip the test only for gfx12.50+

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 tests/i915/perf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 0b8f6ac8..8d1e3658 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -5112,6 +5112,7 @@ igt_main
 	igt_subtest_group {
 		igt_fixture {
 			igt_require(i915_perf_revision(drm_fd) >= 4);
+			igt_require(intel_graphics_ver(devid) < IP_VER(12, 50));
 		}
 
 		igt_describe("Verify invalid SSEU opening parameters");
-- 
2.25.1
