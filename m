Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBD96F61B
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2020 18:16:21 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Wed, 29 Jan 2020 20:16:01 +0200
Message-Id: <20200129181601.15918-9-imre.deak@intel.com>
In-Reply-To: <20200129181601.15918-1-imre.deak@intel.com>
References: <20200129181601.15918-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 9/9] tests/kms_plane: Fix format/mod for
 reference FB
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Fix the use of uninited format, modifier.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 tests/kms_plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 9ef3a7f3..7d7316d5 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -683,7 +683,7 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 		struct igt_fb test_fb;
 		int ret;
 
-		igt_create_fb(data->drm_fd, 64, 64, format,
+		igt_create_fb(data->drm_fd, 64, 64, ref_format,
 			      LOCAL_DRM_FORMAT_MOD_NONE, &test_fb);
 
 		igt_plane_set_fb(plane, &test_fb);
@@ -704,7 +704,7 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 		const color_t *c = &data->colors[i];
 
 		test_format_plane_color(data, pipe, plane,
-					format, modifier,
+					ref_format, ref_modifier,
 					width, height,
 					IGT_COLOR_YCBCR_BT709,
 					IGT_COLOR_YCBCR_LIMITED_RANGE,
-- 
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
