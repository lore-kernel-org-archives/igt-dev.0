Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE30810E043
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Apr 2022 20:29:06 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 6 Apr 2022 16:28:29 -0400
Message-ID: <20220406202829.456384-3-dingchen.zhang@amd.com>
In-Reply-To: <20220406202829.456384-1-dingchen.zhang@amd.com>
References: <20220406202829.456384-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 2/2] tests/amdgpu/amd_psr: drop the PSR state
 check for PSR-SU MPO test
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

[why & how]
Currently the enablement of PSR-SU for Linux kernel is still WIP
and the PSR state to check for PSR-SU MPO is not upstreamed yet.
In addition, all the PSR-SU test case currently by default is
validated with visual confirm.

Drop the PSR state check in MPO PSR-SU sub-test case in the loop.

Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Jay Pillai <aurabindo.pillai@amd.com>
Cc: Wayne Lin <wayne.lin@amd.com>

Signed-off-by: David Zhang <dingchen.zhang@amd.com>
---
 tests/amdgpu/amd_psr.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index 83e44c4e..8ea73080 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -292,18 +292,6 @@ static void run_check_psr_su_mpo(data_t *data)
 				      flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
 		igt_require(ret == 0);
 		kmstest_wait_for_pageflip(data->fd);
-
-		/* check PSR state */
-		if (i > PSR_SETTLE_DELAY * frame_rate) {
-			psr_state = igt_amd_read_psr_state(data->fd, data->output->name);
-			igt_fail_on_f(psr_state < 0, "Open PSR state debugfs failed\n");
-			igt_fail_on_f(psr_state == PSR_STATE0,
-				"PSR was not enabled for connector %s\n", data->output->name);
-			igt_fail_on_f(psr_state == PSR_STATE_INVALID,
-				"PSR is invalid for connector %s\n", data->output->name);
-			igt_fail_on_f(psr_state != PSR_STATE3,
-				"PSR state is expected to be STATE_3 for connector %s\n", data->output->name);
-		}
 	}
 
 	/* fini */
-- 
2.25.1
