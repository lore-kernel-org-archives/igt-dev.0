Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E806F42D
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Nov 2021 14:22:29 +0000 (UTC)
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Date: Thu, 4 Nov 2021 10:22:12 -0400
Message-ID: <20211104142212.3098989-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t] Revert "test/kms_atomic: Skip plane overlay
 test for amdgpu"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Simon Ser <contact@emersion.fr>, Hayden Goodfellow <Hayden.Goodfellow@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

This reverts commit 080869f804cb86b25a38889e5ce9a870571cd8c4.

Thanks to Simon's patch to amd-staging-drm-next, we recently re-enabled
overlay support in our driver. We don't need to skip overlay tests in
the kms_atomic anymore; for this reason, this commit reverted the skip
when we have overlay tests.

Cc: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Nicholas Choi <Nicholas.Choi@amd.com>
Cc: Hayden Goodfellow <Hayden.Goodfellow@amd.com>
Cc: Mark Yacoub <markyacoub@chromium.org>

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 tests/kms_atomic.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 1657624e..5295c8f5 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -502,13 +502,6 @@ static void plane_overlay(igt_pipe_t *pipe, igt_output_t *output, igt_plane_t *p
 	uint32_t w = mode->hdisplay / 2;
 	uint32_t h = mode->vdisplay / 2;
 
-	/* On AMD, with hardware cursor, overlay plane must fully cover
-	 * the primary plane (underlay). AMD does not support this test
-	 * scenario
-	 */
-	igt_require_f(!is_amdgpu_device(output->display->drm_fd),
-		      "Overlay must fully cover the primary plane on AMD\n");
-
 	igt_require(format != 0);
 
 	igt_create_pattern_fb(pipe->display->drm_fd, w, h,
-- 
2.25.1
