Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2071.outbound.protection.outlook.com [40.107.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522CC10E073
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jun 2023 21:20:49 +0000 (UTC)
From: Hersen Wu <hersenxs.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>, <rodrigo.siqueira@amd.com>,
 <aurabindo.pillai@amd.com>, <alex.hung@amd.com>, <stylon.wang@amd.com>,
 <hamza.mahfooz@amd.com>
Date: Tue, 20 Jun 2023 17:20:35 -0400
Message-ID: <20230620212035.147910-1-hersenxs.wu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] [i-g-t] tests/amdgpu/amd_bypass: Skip test when
 DP Rx output bpc < 8 bpc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Hersen Wu <hersenxs.wu@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Check DP or eDP Rx output bpc, skip test when output bpc is
less than 8bpc.

This test compares CRC of CRTC and Rx. It needs both CRTC_CRC
and Rx-CRC with 8bpc. If CRTC-CRC with 8bpc, but Rx-CRC with
6bpc, then their values  will not match.

Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
---
 tests/amdgpu/amd_bypass.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
index d191779b0..d192a30ea 100644
--- a/tests/amdgpu/amd_bypass.c
+++ b/tests/amdgpu/amd_bypass.c
@@ -331,6 +331,13 @@ static void bypass_8bpc_test(data_t *data)
 	igt_skip_on_f(igt_amd_read_dsc_clock_status(data->drm_fd, data->output->name) == 1,
 		      "DSC enabled on %s and no sense to validate bypass mode\n", data->output->name);
 
+	/* 8bpc bypass only valid when DP or eDP Rx supports 8bpc or up. When
+	 * Rx supports only up to 6bpc, Rx-crc will different from crtc-crc
+	 * with 8bpc.
+	 */
+	igt_skip_on_f(igt_get_output_max_bpc(data->drm_fd, data->output->name) <= 6,
+		      "check /sys/kernel/debug/dri/0/eDP-1 (connector)/output_bpc\n");
+
 	igt_create_fb(data->drm_fd, data->width, data->height,
 		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb);
 
-- 
2.25.1
