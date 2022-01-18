Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125C510E42A
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jan 2022 16:43:13 +0000 (UTC)
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Date: Tue, 18 Jan 2022 11:42:29 -0500
Message-ID: <20220118164229.602225-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_cursor: Use dprx CRC for
 AMDGPU
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mark Yacoub <markyacoub@chromium.org>, Leo Li <sunpeng.li@amd.com>, Harry
 Wentland <harry.wentland@amd.com>
Cc: igt-dev@lists.freedesktop.org, Hayden Goodfellow <hayden.goodfellow@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

We have some CRC errors spread around a few IGT tests related to a
driver bug; we have a kernel fix for that [1]. However, after applying the
kernel patch, all tests related to pipe-a-primary-size-* start to fail.
To fix this issue, we need to make kms_plane_cursor utilize DPRX CRC;
this commit updates this test by basically setting DPRX for amdgpu.

1. https://patchwork.freedesktop.org/series/98993/

Cc: Mark Yacoub <markyacoub@chromium.org>
Cc: Hayden Goodfellow <hayden.goodfellow@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Nicholas Choi <Nicholas.Choi@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 tests/kms_plane_cursor.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 73085cc8..def282b8 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -60,6 +60,8 @@ typedef struct data {
 /* Common test setup. */
 static void test_init(data_t *data, enum pipe pipe_id)
 {
+	const char *crc_type = INTEL_PIPE_CRC_SOURCE_AUTO;
+
 	igt_display_t *display = &data->display;
 
 	data->pipe_id = pipe_id;
@@ -77,8 +79,11 @@ static void test_init(data_t *data, enum pipe pipe_id)
 	data->cursor = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_CURSOR);
 
 	igt_require_pipe_crc(data->drm_fd);
-	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe_id,
-					  INTEL_PIPE_CRC_SOURCE_AUTO);
+
+	if (is_amdgpu_device(data->drm_fd))
+		crc_type = AMDGPU_PIPE_CRC_SOURCE_DPRX;
+
+	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe_id, crc_type);
 
 	igt_output_set_pipe(data->output, data->pipe_id);
 
-- 
2.25.1
