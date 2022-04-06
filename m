Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9B910E043
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Apr 2022 20:29:05 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 6 Apr 2022 16:28:28 -0400
Message-ID: <20220406202829.456384-2-dingchen.zhang@amd.com>
In-Reply-To: <20220406202829.456384-1-dingchen.zhang@amd.com>
References: <20220406202829.456384-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 1/2] tests/amdgpu/amd_psr: use PSR state enum
 replace the integer
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
The enum of AMDGPU PSR STATE may update along the time and should
be aligned to the code base of upstream. Instead of using hard-
coded integer, replace them with enum PSR_STATE would be preferred
and we only need to update the PSR_STATE enum if needed in the
future.

Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Jay Pillai <aurabindo.pillai@amd.com>
Cc: Wayne Lin <wayne.lin@amd.com>

Signed-off-by: David Zhang <dingchen.zhang@amd.com>
---
 tests/amdgpu/amd_psr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index d21d41e3..83e44c4e 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -179,10 +179,10 @@ static void run_check_psr(data_t *data, bool test_null_crtc) {
 			continue;
 
 		psr_state =  igt_amd_read_psr_state(data->fd, output->name);
-		igt_fail_on_f(psr_state < 0, "Open PSR state debugfs failed\n");
-		igt_fail_on_f(psr_state < 1, "PSR was not enabled for connector %s\n", output->name);
-		igt_fail_on_f(psr_state == 0xff, "PSR is invalid for connector %s\n", output->name);
-		igt_fail_on_f(psr_state != 5, "PSR state is expected to be at 5 on a "
+		igt_fail_on_f(psr_state < PSR_STATE0, "Open PSR state debugfs failed\n");
+		igt_fail_on_f(psr_state < PSR_STATE1, "PSR was not enabled for connector %s\n", output->name);
+		igt_fail_on_f(psr_state == PSR_STATE_INVALID, "PSR is invalid for connector %s\n", output->name);
+		igt_fail_on_f(psr_state != PSR_STATE3, "PSR state is expected to be at PSR_STATE3 (Active) on a "
 			      "static screen for connector %s\n", output->name);
 	}
 
-- 
2.25.1
