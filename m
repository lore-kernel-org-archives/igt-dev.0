Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECA46EB20
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2020 19:15:44 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Fri,  7 Feb 2020 21:15:19 +0200
Message-Id: <20200207191524.19362-3-imre.deak@intel.com>
In-Reply-To: <20200207191524.19362-1-imre.deak@intel.com>
References: <20200207191524.19362-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/8] tests/kms_available_modes_crc: Don't
 set tiling for framebuffer
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
Cc: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>

The GEM object used for the framebuffer does not need tiling to be set
on it as the entire framebuffer is being filled with the same value -
tiling will not impact the end value of the buffer.

Signed-off-by: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 tests/kms_available_modes_crc.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tests/kms_available_modes_crc.c b/tests/kms_available_modes_crc.c
index 12761343..ed43d1fb 100644
--- a/tests/kms_available_modes_crc.c
+++ b/tests/kms_available_modes_crc.c
@@ -211,17 +211,11 @@ static bool setup_fb(data_t *data, igt_output_t *output, igt_plane_t *plane,
 	data->buf = (unsigned char *)calloc(data->size*2, 1);
 
 	data->gem_handle = gem_create(data->gfx_fd, gemsize);
-	ret = __gem_set_tiling(data->gfx_fd, data->gem_handle,
-			       igt_fb_mod_to_tiling(tiling),
-			       data->fb.strides[0]);
-
 	data->fb.gem_handle = data->gem_handle;
 	data->fb.width = w;
 	data->fb.height = h;
 	fill_in_fb(data, output, plane, format);
 
-	igt_assert_eq(ret, 0);
-
 	ret = __kms_addfb(data->gfx_fd, data->gem_handle, w, h,
 			  format, tiling, data->fb.strides, data->fb.offsets,
 			  num_planes, LOCAL_DRM_MODE_FB_MODIFIERS,
-- 
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
