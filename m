Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373C5A33E1
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Aug 2022 18:04:34 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 4 Aug 2022 12:03:57 -0600
Message-ID: <20220804180357.417821-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] tests/kms_plane: Check plane format before using
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

If a plane does not support the format or modifier, skip testing
for this plane.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_plane.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index c885a813..3cf3cfd3 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -224,6 +224,9 @@ test_plane_position_with_output(data_t *data,
 	create_fb_for_mode(data, mode, &green, &rect, 1, &primary_fb);
 	igt_plane_set_fb(primary, &primary_fb);
 
+	if (!igt_plane_has_format_mod(sprite, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR))
+		return;
+
 	igt_create_color_fb(data->drm_fd,
 			    64, 64, /* width, height */
 			    DRM_FORMAT_XRGB8888,
-- 
2.37.1
