Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B8E6E122
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Nov 2021 19:57:37 +0000 (UTC)
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Date: Mon, 29 Nov 2021 14:56:57 -0500
Message-ID: <20211129195659.1865321-4-Rodrigo.Siqueira@amd.com>
In-Reply-To: <20211129195659.1865321-1-Rodrigo.Siqueira@amd.com>
References: <20211129195659.1865321-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 3/5] tests/amdgpu: Fix test init error on
 Baffin
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: harry.wentland@amd.com, markyacoub@google.com, nicholas.choi@amd.com, hayden.goodfellow@amd.com
Cc: igt-dev@lists.freedesktop.org, Qingqing Zhuo <qingqing.zhuo@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Qingqing Zhuo <qingqing.zhuo@amd.com>

[why]
Baffin does not support plane overlay.
igt_pipe_get_plane_type would thus reports
error.

Signed-off-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
---
 tests/amdgpu/amd_color.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
index 84f0a995..74900ba9 100644
--- a/tests/amdgpu/amd_color.c
+++ b/tests/amdgpu/amd_color.c
@@ -265,7 +265,7 @@ static void test_init(data_t *data)
 	data->primary =
 		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
 	data->overlay =
-		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_OVERLAY);
+		igt_pipe_get_plane_type_index(data->pipe, DRM_PLANE_TYPE_OVERLAY, 0);
 
 	data->pipe_crc = igt_pipe_crc_new(data->fd, data->pipe_id,
 					  INTEL_PIPE_CRC_SOURCE_AUTO);
-- 
2.25.1
