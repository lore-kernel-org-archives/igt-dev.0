Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2051.outbound.protection.outlook.com [40.107.212.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4186F89DB9
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Sep 2021 16:07:10 +0000 (UTC)
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
Date: Mon, 27 Sep 2021 12:07:00 -0400
Message-ID: <20210927160700.1570885-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t] tests/kms_flip : skip subtest bo-too-big
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
 tests/kms_flip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 54137871..20112de1 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1290,6 +1290,7 @@ static void __run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 	/* 256 MB is usually the maximum mappable aperture,
 	 * (make it 4x times that to ensure failure) */
 	if (o->flags & TEST_BO_TOOBIG) {
+		igt_skip_on(!is_i915_device(drm_fd));
 		bo_size = 4*gem_mappable_aperture_size(drm_fd);
 		igt_require(bo_size < gem_global_aperture_size(drm_fd));
 	}
-- 
2.30.2
