Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A905610E592
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Aug 2023 16:15:14 +0000 (UTC)
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 24 Aug 2023 12:15:02 -0400
Message-ID: <20230824161504.154365-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 1/3] tests/amdgpu/amd_mall: Add crc check
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: hersenxs.wu@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In addition to checking whether display scanout from MALL cache is
triggered, double check that the same pattern is being displayed. This
can detect any corruption due to incorrect MALL size calculations

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 tests/amdgpu/amd_mall.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/amdgpu/amd_mall.c b/tests/amdgpu/amd_mall.c
index c50d046ee..6016d5e8c 100644
--- a/tests/amdgpu/amd_mall.c
+++ b/tests/amdgpu/amd_mall.c
@@ -117,6 +117,7 @@ static void test_mall_ss(data_t *data)
 	igt_fb_t rfb;
 	int exec_ret;
 	struct line_check line = {0};
+	igt_crc_t test_crc, ref_crc;
 
 	test_init(data);
 
@@ -124,6 +125,7 @@ static void test_mall_ss(data_t *data)
 	igt_plane_set_fb(data->primary, &rfb);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
+	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
 	sleep(MALL_SETTLE_DELAY);
 
 	igt_system_cmd(exec_ret, "umr -O bits -r *.*.HUBP0_HUBP_MALL_STATUS | grep MALL_IN_USE");
@@ -135,6 +137,10 @@ static void test_mall_ss(data_t *data)
 
 	igt_assert_eq(line.found, 1);
 
+	igt_pipe_crc_collect_crc(data->pipe_crc, &test_crc);
+
+	igt_assert_crc_equal(&ref_crc, &test_crc);
+
 	igt_remove_fb(data->fd, &rfb);
 	test_fini(data);
 }
-- 
2.41.0
