Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6224310E042
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Aug 2022 07:57:05 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 24 Aug 2022 19:24:47 -0600
Message-ID: <20220825012447.2757057-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests/kms_plane_multiple: skip cursor plane on
 AMD HW
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

DRM thinks of cursor and plane blending like this:

┌─────────┐
│ Cursor  ├───────┐
└─────────┘       │
                  │
┌─────────┐      ┌▼──────┐
│ Plane 1 ├──────► CRTC  │
└─────────┘      └▲──────┘
                  │
┌─────────┐       │
│ Plane 2 ├───────┘
└─────────┘

AMD HW is designed like this:

┌─────────┐   ┌─────────┐      ┌───────┐
│ Cursor  ├───► Plane 1 ├──────► CRTC  │
└─────────┘   └─────────┘      └▲──────┘
                                │
              ┌─────────┐       │
              │ Plane 2 ├───────┘
              └─────────┘

The implementation can cause CRC values to be
different and not suitable to compare to values
from other planes.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_plane_multiple.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 1679f7ce..f29c8f36 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -369,6 +369,14 @@ test_plane_position(data_t *data, enum pipe pipe, uint64_t modifier)
 	int n_planes = opt.all_planes ?
 			data->display.pipes[pipe].n_planes : DEFAULT_N_PLANES;
 
+	/*
+	 * Skip cursor (3rd) plane because AMD has different implementation
+	 * which cannot be drawn outside its associated plane and can cause
+	 * CRC values to be different from other planes.
+	 */
+	if (is_amdgpu_device(data->drm_fd))
+		n_planes = 2;
+
 	output = igt_get_single_output_for_pipe(&data->display, pipe);
 	igt_require(output);
 
-- 
2.37.2
