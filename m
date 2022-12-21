Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2042.outbound.protection.outlook.com [40.107.244.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C3210E420
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Dec 2022 01:23:51 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 20 Dec 2022 18:23:10 -0700
Message-ID: <20221221012310.2892105-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] tests/kms_bw: remove fb in the reverse order
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

Some systems observe instability if fb is not removed in the
reverse order.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_bw.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 2a8df5b3..9ecd58af 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -194,6 +194,13 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 		igt_pipe_crc_collect_crc(data->pipe_crc[i], &captured[i]);
 		igt_assert_f(!igt_check_crc_equal(&zero, &captured[i]),
 			     "CRC is zero\n");
+	}
+
+	for (i = pipe; i >= 0; i--) {
+		output = data->output[i];
+		if (!output)
+			continue;
+
 		igt_remove_fb(display->drm_fd, &buffer[i]);
 	}
 
-- 
2.39.0
