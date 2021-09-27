Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728376E85C
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Sep 2021 19:26:12 +0000 (UTC)
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
Date: Mon, 27 Sep 2021 15:26:09 -0400
Message-ID: <20210927192609.2973428-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_flip : skip subtest bo-too-big
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, markyacoub@google.com
Cc: rodrigo.siqueira@amd.com
List-ID: <igt-dev@lists.freedesktop.org>

[Why]
The rationale of the test does not hold true for AMD hardware. The
aperture size calculation has an upper bound check which is done through
i915 specific IOCTL. Hence this part of subtest must be moved
out of the platform agnostic tests. Moreover, AMD hardware
supports buffers larger than aperture size.

[How]
Skip the bo-too-big subtest unless its run on i915 as the test fails on
AMD, VKMS and VC4

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 tests/kms_flip.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 54137871..03e61e46 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1705,6 +1705,9 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		test_nonblocking_read(drm_fd);
 
 	for (i = 0; i < sizeof(tests) / sizeof (tests[0]); i++) {
+		if ((tests[i].flags & TEST_BO_TOOBIG) && !is_i915_device(drm_fd))
+			continue;
+
 		igt_describe("Basic test for validating modeset, dpms and pageflips");
 		igt_subtest_with_dynamic_f("%s%s",
 			      tests[i].flags & TEST_BASIC ? "basic-" : "",
@@ -1721,6 +1724,9 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 	igt_fork_signal_helper();
 	for (i = 0; i < sizeof(tests) / sizeof (tests[0]); i++) {
+		if ((tests[i].flags & TEST_BO_TOOBIG) && !is_i915_device(drm_fd))
+			continue;
+
 		/* relative blocking vblank waits that get constantly interrupt
 		 * take forver. So don't do them. */
 		if ((tests[i].flags & TEST_VBLANK_BLOCK) &&
-- 
2.30.2
