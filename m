Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7052F10E2EC
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Apr 2022 14:52:30 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 6 Apr 2022 10:52:13 -0400
Message-ID: <20220406145213.418625-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] lib/igt_amd: return negative if PSR state debugfs
 open fails
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
The PSR state read helper should return an integer which is not
the same as PSR state enumeration item for the case of debugfs
interface opening fail. Currently it return false which is casted
to 0 that is the same as PSR_STATE0, this is incorrect.

Instead of returning 0, a negative (e.g. -1) value is returned
when debugfs interface of PSR state opening fails. And adding the
check of such negative value in amd_psr test case as well.

Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Wayne Lin <wayne.lin@amd.com>

Signed-off-by: David Zhang <dingchen.zhang@amd.com>
Rivewed-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
---
 lib/igt_amd.c          | 2 +-
 tests/amdgpu/amd_psr.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 888da44a..664602da 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -1064,7 +1064,7 @@ int igt_amd_read_psr_state(int drm_fd, char *connector_name)
 	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
 	if (fd < 0) {
 		igt_info("Couldn't open connector %s debugfs directory\n", connector_name);
-		return false;
+		return -1;
 	}
 
 	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_PSR_STATE, buf, sizeof(buf));
diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index b9d8a53b..d21d41e3 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -179,6 +179,7 @@ static void run_check_psr(data_t *data, bool test_null_crtc) {
 			continue;
 
 		psr_state =  igt_amd_read_psr_state(data->fd, output->name);
+		igt_fail_on_f(psr_state < 0, "Open PSR state debugfs failed\n");
 		igt_fail_on_f(psr_state < 1, "PSR was not enabled for connector %s\n", output->name);
 		igt_fail_on_f(psr_state == 0xff, "PSR is invalid for connector %s\n", output->name);
 		igt_fail_on_f(psr_state != 5, "PSR state is expected to be at 5 on a "
@@ -295,6 +296,7 @@ static void run_check_psr_su_mpo(data_t *data)
 		/* check PSR state */
 		if (i > PSR_SETTLE_DELAY * frame_rate) {
 			psr_state = igt_amd_read_psr_state(data->fd, data->output->name);
+			igt_fail_on_f(psr_state < 0, "Open PSR state debugfs failed\n");
 			igt_fail_on_f(psr_state == PSR_STATE0,
 				"PSR was not enabled for connector %s\n", data->output->name);
 			igt_fail_on_f(psr_state == PSR_STATE_INVALID,
-- 
2.25.1
