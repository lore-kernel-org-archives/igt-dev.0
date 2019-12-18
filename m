Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA166E227
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2019 05:59:27 +0000 (UTC)
From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
Date: Tue, 17 Dec 2019 21:59:25 -0800
Message-Id: <20191218055925.705070-11-vanshidhar.r.konda@intel.com>
In-Reply-To: <20191218055925.705070-1-vanshidhar.r.konda@intel.com>
References: <20191218055925.705070-1-vanshidhar.r.konda@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 10/10] tests/kms_available_modes_crc: Don't set
 tiling for framebuffer
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
Cc: brian.welty@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

The GEM object used for the framebuffer does not need tiling to be set
on it as the entire framebuffer is being filled with the same value -
tiling will not impact the end value of the buffer.

Signed-off-by: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
---
 tests/kms_available_modes_crc.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tests/kms_available_modes_crc.c b/tests/kms_available_modes_crc.c
index d1b7b517..4113b4c0 100644
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
2.24.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
