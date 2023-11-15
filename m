Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA1110E4F9
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Nov 2023 07:13:53 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Nov 2023 12:33:42 +0530
Message-Id: <20231115070344.1488683-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20231115070344.1488683-1-bhanuprakash.modem@intel.com>
References: <20231115070344.1488683-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 3/5] tests/intel/kms_dirtyfb: Use blitter as a
 default draw method
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

As Rendercopy support in IGT is not present for few latest
platforms, use Blitter as default draw method.

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/kms_dirtyfb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index b14cc8bec..c072c221d 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -177,7 +177,7 @@ static void prepare(data_t *data)
 			    &data->fbs[0]);
 
 	igt_draw_rect_fb(data->drm_fd, data->bops, 0, &data->fbs[0],
-			 IGT_DRAW_RENDER, 0, 0, data->fbs[0].width,
+			 IGT_DRAW_BLT, 0, 0, data->fbs[0].width,
 			 data->fbs[0].height, 0xFF);
 
 	primary = igt_output_get_plane_type(data->output,
@@ -197,7 +197,7 @@ static void prepare(data_t *data)
 			    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
 			    &data->fbs[1]);
 	igt_draw_rect_fb(data->drm_fd, data->bops, 0, &data->fbs[1],
-			 IGT_DRAW_RENDER, 0, 0, data->fbs[1].width,
+			 IGT_DRAW_BLT, 0, 0, data->fbs[1].width,
 			 data->fbs[1].height, 0xFF);
 
 	igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
-- 
2.40.0
