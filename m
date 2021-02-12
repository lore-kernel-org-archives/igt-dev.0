Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 049646EEA6
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Feb 2021 18:13:15 +0000 (UTC)
References: <20210203205604.24494-1-sungkim@amd.com>
 <20210203205604.24494-2-sungkim@amd.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <161a5e5b-82ef-e7a7-0c95-c1decdb6528a@amd.com>
Date: Fri, 12 Feb 2021 13:13:09 -0500
In-Reply-To: <20210203205604.24494-2-sungkim@amd.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v3 2/3] tests/kms_rotation_crc: Add HW
 Rotation test case for amdgpu with tiling
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Sung Joon Kim <sungkim@amd.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 2021-02-03 3:56 p.m., Sung Joon Kim wrote:
> Allow amdgpu to run HW rotation IGT test case
> Added conditions to bypass all the requirements needed for intel when testing amdgpu.
> Additionally, freed unused frame buffers.
> Added swizzle 64kb tiling method for amdgpu-specific.
> Updated drm header for amdgpu tiling modifiers.
> 
> v2: drm_fourcc.h copied from kernel header commit:8ba16d5993749c3f31fd2b49e16f0dc1e1770b9c from drm-next.
> removed igt_pipe_crc_collect_crc for intel gpu. Only on AMDGPU.
> 
> v3: moved drm_fourcc.h to another patch.
> Removed creating redundant fb in prepare_crtc for amdgpu.
> Guarded display commit for amdgpu.
> Blocked cursor plane rotation for amdgpu.
> Added back tiling when creating reference fb.
> 
> Signed-off-by: Sung Joon Kim <sungkim@amd.com>

This looks okay to me now. Thanks for addressing all my feedback.

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

I ran a smoke test of a rebase of this patch on the latest tree and the 
tests pass. CI results are good too, so I think this looks OK to merge.

I'll put this in on Monday or Tuesday provided there are no further 
concerns from Juha-Pekka or Petri Latvala.

Regards,
Nicholas Kazlauskas

> ---
>   lib/igt_amd.c            | 192 +++++++++++++++++++++++++++++++++++++++
>   lib/igt_amd.h            |  14 ++-
>   lib/igt_fb.c             |  36 +++++++-
>   tests/kms_rotation_crc.c |  76 ++++++++++++----
>   4 files changed, 299 insertions(+), 19 deletions(-)
> 
> diff --git a/lib/igt_amd.c b/lib/igt_amd.c
> index abd3ad96..a4e1cb59 100644
> --- a/lib/igt_amd.c
> +++ b/lib/igt_amd.c
> @@ -24,6 +24,29 @@
>   #include "igt.h"
>   #include <amdgpu_drm.h>
>   
> +#define X0 1
> +#define X1 2
> +#define X2 4
> +#define X3 8
> +#define X4 16
> +#define X5 32
> +#define X6 64
> +#define X7 128
> +#define Y0 1
> +#define Y1 2
> +#define Y2 4
> +#define Y3 8
> +#define Y4 16
> +#define Y5 32
> +#define Y6 64
> +#define Y7 128
> +
> +struct dim2d
> +{
> +    int w;
> +    int h;
> +};
> +
>   uint32_t igt_amd_create_bo(int fd, uint64_t size)
>   {
>   	union drm_amdgpu_gem_create create;
> @@ -54,3 +77,172 @@ void *igt_amd_mmap_bo(int fd, uint32_t handle, uint64_t size, int prot)
>   	ptr = mmap(0, size, prot, MAP_SHARED, fd, map.out.addr_ptr);
>   	return ptr == MAP_FAILED ? NULL : ptr;
>   }
> +
> +unsigned int igt_amd_compute_offset(unsigned int* swizzle_pattern,
> +				       unsigned int x, unsigned int y)
> +{
> +    unsigned int offset = 0, index = 0;
> +    unsigned int blk_size_table_index = 0, interleave = 0;
> +    unsigned int channel[16] =
> +				{0, 0, 1, 1, 2, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1};
> +    unsigned int i, v;
> +
> +    for (i = 0; i < 16; i++)
> +    {
> +        v = 0;
> +        if (channel[i] == 1)
> +        {
> +            blk_size_table_index = 0;
> +            interleave = swizzle_pattern[i];
> +
> +            while (interleave > 1) {
> +				blk_size_table_index++;
> +				interleave = (interleave + 1) >> 1;
> +			}
> +
> +            index = blk_size_table_index + 2;
> +            v ^= (x >> index) & 1;
> +        }
> +        else if (channel[i] == 2)
> +        {
> +            blk_size_table_index = 0;
> +            interleave = swizzle_pattern[i];
> +
> +            while (interleave > 1) {
> +				blk_size_table_index++;
> +				interleave = (interleave + 1) >> 1;
> +			}
> +
> +            index = blk_size_table_index;
> +            v ^= (y >> index) & 1;
> +        }
> +
> +        offset |= (v << i);
> +    }
> +
> +	return offset;
> +}
> +
> +unsigned int igt_amd_fb_get_blk_size_table_idx(unsigned int bpp)
> +{
> +	unsigned int element_bytes;
> +	unsigned int blk_size_table_index = 0;
> +
> +	element_bytes = bpp >> 3;
> +
> +	while (element_bytes > 1) {
> +		blk_size_table_index++;
> +		element_bytes = (element_bytes + 1) >> 1;
> +	}
> +
> +	return blk_size_table_index;
> +}
> +
> +void igt_amd_fb_calculate_tile_dimension(unsigned int bpp,
> +				       unsigned int *width, unsigned int *height)
> +{
> +	unsigned int blk_size_table_index;
> +	unsigned int blk_size_log2, blk_size_log2_256B;
> +	unsigned int width_amp, height_amp;
> +
> +	// swizzle 64kb tile block
> +	unsigned int block256_2d[][2] = {{16, 16}, {16, 8}, {8, 8}, {8, 4}, {4, 4}};
> +	blk_size_log2 = 16;
> +
> +	blk_size_table_index = igt_amd_fb_get_blk_size_table_idx(bpp);
> +
> +	blk_size_log2_256B = blk_size_log2 - 8;
> +
> +	width_amp = blk_size_log2_256B / 2;
> +	height_amp = blk_size_log2_256B - width_amp;
> +
> +	*width  = (block256_2d[blk_size_table_index][0] << width_amp);
> +	*height = (block256_2d[blk_size_table_index][1] << height_amp);
> +}
> +
> +uint32_t igt_amd_fb_tiled_offset(unsigned int bpp, unsigned int x_input,
> +				       unsigned int y_input, unsigned int width_input)
> +{
> +	unsigned int width, height, pitch;
> +	unsigned int pb, yb, xb, blk_idx, blk_offset, addr;
> +	unsigned int blk_size_table_index, blk_size_log2;
> +	unsigned int* swizzle_pattern;
> +
> +	// swizzle 64kb tile block
> +	unsigned int sw_64k_s[][16]=
> +	{
> +	    {X0, X1, X2, X3, Y0, Y1, Y2, Y3, Y4, X4, Y5, X5, Y6, X6, Y7, X7},
> +	    {0,  X0, X1, X2, Y0, Y1, Y2, X3, Y3, X4, Y4, X5, Y5, X6, Y6, X7},
> +	    {0,  0,  X0, X1, Y0, Y1, Y2, X2, Y3, X3, Y4, X4, Y5, X5, Y6, X6},
> +	    {0,  0,  0,  X0, Y0, Y1, X1, X2, Y2, X3, Y3, X4, Y4, X5, Y5, X6},
> +	    {0,  0,  0,  0,  Y0, Y1, X0, X1, Y2, X2, Y3, X3, Y4, X4, Y5, X5},
> +	};
> +	igt_amd_fb_calculate_tile_dimension(bpp, &width, &height);
> +	blk_size_table_index = igt_amd_fb_get_blk_size_table_idx(bpp);
> +	blk_size_log2 = 16;
> +
> +	pitch = (width_input + (width - 1)) & (~(width - 1));
> +
> +	swizzle_pattern = sw_64k_s[blk_size_table_index];
> +
> +	pb = pitch / width;
> +	yb = y_input / height;
> +	xb = x_input / width;
> +	blk_idx = yb * pb + xb;
> +	blk_offset = igt_amd_compute_offset(swizzle_pattern,
> +					x_input << blk_size_table_index, y_input);
> +	addr = (blk_idx << blk_size_log2) + blk_offset;
> +
> +    return (uint32_t)addr;
> +}
> +
> +void igt_amd_fb_to_tiled(struct igt_fb *dst, void *dst_buf, struct igt_fb *src,
> +				       void *src_buf, unsigned int plane)
> +{
> +	uint32_t src_offset, dst_offset;
> +	unsigned int bpp = src->plane_bpp[plane];
> +	unsigned int width = dst->plane_width[plane];
> +	unsigned int height = dst->plane_height[plane];
> +	unsigned int x, y;
> +
> +	for (y = 0; y < height; y++) {
> +		for (x = 0; x < width; x++) {
> +			src_offset = src->offsets[plane];
> +			dst_offset = dst->offsets[plane];
> +
> +			src_offset += src->strides[plane] * y + x * bpp / 8;
> +			dst_offset += igt_amd_fb_tiled_offset(bpp, x, y, width);
> +
> +			switch (bpp) {
> +			case 16:
> +				*(uint16_t *)(dst_buf + dst_offset) =
> +					*(uint16_t *)(src_buf + src_offset);
> +				break;
> +			case 32:
> +				*(uint32_t *)(dst_buf + dst_offset) =
> +					*(uint32_t *)(src_buf + src_offset);
> +				break;
> +			}
> +		}
> +	}
> +}
> +
> +void igt_amd_fb_convert_plane_to_tiled(struct igt_fb *dst, void *dst_buf,
> +				       struct igt_fb *src, void *src_buf)
> +{
> +	unsigned int plane;
> +
> +	for (plane = 0; plane < src->num_planes; plane++) {
> +		igt_require(AMD_FMT_MOD_GET(TILE, dst->modifier) ==
> +					AMD_FMT_MOD_TILE_GFX9_64K_S);
> +		igt_amd_fb_to_tiled(dst, dst_buf, src, src_buf, plane);
> +	}
> +}
> +
> +bool igt_amd_is_tiled(uint64_t modifier)
> +{
> +	if (IS_AMD_FMT_MOD(modifier) && AMD_FMT_MOD_GET(TILE, modifier))
> +		return true;
> +	else
> +		return false;
> +}
> diff --git a/lib/igt_amd.h b/lib/igt_amd.h
> index f63d26f4..6656d901 100644
> --- a/lib/igt_amd.h
> +++ b/lib/igt_amd.h
> @@ -24,8 +24,20 @@
>   #define IGT_AMD_H
>   
>   #include <stdint.h>
> +#include "igt_fb.h"
>   
>   uint32_t igt_amd_create_bo(int fd, uint64_t size);
>   void *igt_amd_mmap_bo(int fd, uint32_t handle, uint64_t size, int prot);
> -
> +unsigned int igt_amd_compute_offset(unsigned int* swizzle_pattern,
> +				       unsigned int x, unsigned int y);
> +unsigned int igt_amd_fb_get_blk_size_table_idx(unsigned int bpp);
> +void igt_amd_fb_calculate_tile_dimension(unsigned int bpp,
> +				       unsigned int *width, unsigned int *height);
> +uint32_t igt_amd_fb_tiled_offset(unsigned int bpp, unsigned int x_input,
> +				       unsigned int y_input, unsigned int width_input);
> +void igt_amd_fb_to_tiled(struct igt_fb *dst, void *dst_buf, struct igt_fb *src,
> +				       void *src_buf, unsigned int plane);
> +void igt_amd_fb_convert_plane_to_tiled(struct igt_fb *dst, void *dst_buf,
> +				       struct igt_fb *src, void *src_buf);
> +bool igt_amd_is_tiled(uint64_t modifier);
>   #endif /* IGT_AMD_H */
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 4b9be47e..f0fcd1a7 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -671,6 +671,17 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
>   		 * so the easiest way is to align the luma stride to 256.
>   		 */
>   		return ALIGN(min_stride, 256);
> +	} else if (fb->modifier != LOCAL_DRM_FORMAT_MOD_NONE && is_amdgpu_device(fb->fd)) {
> +		/*
> +		 * For amdgpu device with tiling mode
> +		 */
> +		unsigned int tile_width, tile_height;
> +
> +		igt_amd_fb_calculate_tile_dimension(fb->plane_bpp[plane],
> +				     &tile_width, &tile_height);
> +		tile_width *= (fb->plane_bpp[plane] / 8);
> +
> +		return ALIGN(min_stride, tile_width);
>   	} else if (is_gen12_ccs_cc_plane(fb, plane)) {
>   		/* clear color always fixed to 64 bytes */
>   		return 64;
> @@ -711,6 +722,18 @@ static uint64_t calc_plane_size(struct igt_fb *fb, int plane)
>   		size = roundup_power_of_two(size);
>   
>   		return size;
> +	} else if (fb->modifier != LOCAL_DRM_FORMAT_MOD_NONE && is_amdgpu_device(fb->fd)) {
> +		/*
> +		 * For amdgpu device with tiling mode
> +		 */
> +		unsigned int tile_width, tile_height;
> +
> +		igt_amd_fb_calculate_tile_dimension(fb->plane_bpp[plane],
> +				     &tile_width, &tile_height);
> +		tile_height *= (fb->plane_bpp[plane] / 8);
> +
> +		return (uint64_t) fb->strides[plane] *
> +			ALIGN(fb->plane_height[plane], tile_height);
>   	} else if (is_gen12_ccs_plane(fb, plane)) {
>   		/* The AUX CCS surface must be page aligned */
>   		return (uint64_t)fb->strides[plane] *
> @@ -2352,6 +2375,12 @@ static void free_linear_mapping(struct fb_blit_upload *blit)
>   
>   		vc4_fb_convert_plane_to_tiled(fb, map, &linear->fb, &linear->map);
>   
> +		munmap(map, fb->size);
> +	} else if (igt_amd_is_tiled(fb->modifier)) {
> +		void *map = igt_amd_mmap_bo(fd, fb->gem_handle, fb->size, PROT_WRITE);
> +
> +		igt_amd_fb_convert_plane_to_tiled(fb, map, &linear->fb, linear->map);
> +
>   		munmap(map, fb->size);
>   	} else {
>   		gem_munmap(linear->map, linear->fb.size);
> @@ -2419,6 +2448,10 @@ static void setup_linear_mapping(struct fb_blit_upload *blit)
>   		vc4_fb_convert_plane_from_tiled(&linear->fb, &linear->map, fb, map);
>   
>   		munmap(map, fb->size);
> +	} else if (igt_amd_is_tiled(fb->modifier)) {
> +		linear->map = igt_amd_mmap_bo(fd, linear->fb.gem_handle,
> +					      linear->fb.size,
> +					      PROT_READ | PROT_WRITE);
>   	} else {
>   		/* Copy fb content to linear BO */
>   		gem_set_domain(fd, linear->fb.gem_handle,
> @@ -3625,7 +3658,8 @@ cairo_surface_t *igt_get_cairo_surface(int fd, struct igt_fb *fb)
>   		if (use_convert(fb))
>   			create_cairo_surface__convert(fd, fb);
>   		else if (use_blitter(fb) || use_enginecopy(fb) ||
> -			 igt_vc4_is_tiled(fb->modifier))
> +			 igt_vc4_is_tiled(fb->modifier) ||
> +			 igt_amd_is_tiled(fb->modifier))
>   			create_cairo_surface__gpu(fd, fb);
>   		else
>   			create_cairo_surface__gtt(fd, fb);
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index e7072e20..6b0ea67c 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -197,10 +197,14 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
>   	/* create the pipe_crc object for this pipe */
>   	igt_pipe_crc_free(data->pipe_crc);
>   
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> +	/* defer crtc cleanup + crtc active for later on amd - not valid
> +	 * to enable CRTC without a plane active
> +	 */
> +	if (!is_amdgpu_device(data->gfx_fd))
> +		igt_display_commit2(display, COMMIT_ATOMIC);
>   	data->pipe_crc = igt_pipe_crc_new(data->gfx_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
>   
> -	if (start_crc)
> +	if (!is_amdgpu_device(data->gfx_fd) && start_crc)
>   		igt_pipe_crc_start(data->pipe_crc);
>   }
>   
> @@ -285,8 +289,14 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
>   			igt_plane_set_position(plane, data->pos_x, data->pos_y);
>   		igt_display_commit2(display, COMMIT_ATOMIC);
>   
> -		igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &data->crc_rect[rect].flip_crc);
> -		igt_remove_fb(data->gfx_fd, &data->fb_flip);
> +		if (is_i915_device(data->gfx_fd)) {
> +			igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc,
> +					&data->crc_rect[rect].flip_crc);
> +			igt_remove_fb(data->gfx_fd, &data->fb_flip);
> +		} else if (is_amdgpu_device(data->gfx_fd)) {
> +			igt_pipe_crc_collect_crc(data->pipe_crc,
> +					&data->crc_rect[rect].flip_crc);
> +		}
>   
>   		/*
>   		* Create a reference CRC for a software-rotated fb.
> @@ -300,7 +310,14 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
>   			igt_plane_set_position(plane, data->pos_x, data->pos_y);
>   		igt_display_commit2(display, COMMIT_ATOMIC);
>   
> -		igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &data->crc_rect[rect].ref_crc);
> +		if (is_i915_device(data->gfx_fd)) {
> +			igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc,
> +					&data->crc_rect[rect].ref_crc);
> +		} else if (is_amdgpu_device(data->gfx_fd)) {
> +			igt_pipe_crc_collect_crc(data->pipe_crc,
> +					&data->crc_rect[rect].ref_crc);
> +			igt_remove_fb(data->gfx_fd, &data->fb_flip);
> +		}
>   		data->crc_rect[rect].valid = true;
>   	}
>   
> @@ -350,7 +367,10 @@ static void test_single_case(data_t *data, enum pipe pipe,
>   	igt_assert_eq(ret, 0);
>   
>   	/* Check CRC */
> -	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc_output);
> +	if (is_i915_device(data->gfx_fd))
> +		igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc_output);
> +	else if (is_amdgpu_device(data->gfx_fd))
> +		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_output);
>   	igt_assert_crc_equal(&data->crc_rect[rect].ref_crc, &crc_output);
>   
>   	/*
> @@ -373,7 +393,10 @@ static void test_single_case(data_t *data, enum pipe pipe,
>   			igt_assert_eq(ret, 0);
>   		}
>   		kmstest_wait_for_pageflip(data->gfx_fd);
> -		igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc_output);
> +		if (is_i915_device(data->gfx_fd))
> +			igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc_output);
> +		else if (is_amdgpu_device(data->gfx_fd))
> +			igt_pipe_crc_collect_crc(data->pipe_crc, &crc_output);
>   		igt_assert_crc_equal(&data->crc_rect[rect].flip_crc, &crc_output);
>   	}
>   }
> @@ -407,6 +430,10 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
>   	enum pipe pipe;
>   	int pipe_count = 0;
>   
> +	if (is_amdgpu_device(data->gfx_fd))
> +		igt_require(plane_type != DRM_PLANE_TYPE_OVERLAY &&
> +					plane_type != DRM_PLANE_TYPE_CURSOR);
> +
>   	if (plane_type == DRM_PLANE_TYPE_CURSOR)
>   		igt_require(display->has_cursor_plane);
>   
> @@ -419,7 +446,7 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
>   		for (c = 0; c < num_rectangle_types; c++)
>   			data->crc_rect[c].valid = false;
>   
> -		if (IS_CHERRYVIEW(data->devid) && pipe != PIPE_B)
> +		if (is_i915_device(data->gfx_fd) && IS_CHERRYVIEW(data->devid) && pipe != PIPE_B)
>   			continue;
>   
>   		/* restricting the execution to 2 pipes to reduce execution time*/
> @@ -441,8 +468,9 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
>   				continue;
>   
>   			/* Only support partial covering primary plane on gen9+ */
> -			if (plane_type == DRM_PLANE_TYPE_PRIMARY &&
> -			    intel_gen(intel_get_drm_devid(data->gfx_fd)) < 9) {
> +			if (is_amdgpu_device(data->gfx_fd) ||
> +				(plane_type == DRM_PLANE_TYPE_PRIMARY &&
> +			    intel_gen(intel_get_drm_devid(data->gfx_fd)) < 9)) {
>   				if (i != rectangle)
>   					continue;
>   				else
> @@ -472,7 +500,9 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
>   						 data->override_fmt, test_bad_format);
>   			}
>   		}
> -		igt_pipe_crc_stop(data->pipe_crc);
> +		if (is_i915_device(data->gfx_fd)) {
> +			igt_pipe_crc_stop(data->pipe_crc);
> +		}
>   	}
>   }
>   
> @@ -850,9 +880,11 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   	int gen = 0;
>   
>   	igt_fixture {
> -		data.gfx_fd = drm_open_driver_master(DRIVER_INTEL);
> -		data.devid = intel_get_drm_devid(data.gfx_fd);
> -		gen = intel_gen(data.devid);
> +		data.gfx_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_AMDGPU);
> +		if (is_i915_device(data.gfx_fd)) {
> +			data.devid = intel_get_drm_devid(data.gfx_fd);
> +			gen = intel_gen(data.devid);
> +		}
>   
>   		kmstest_set_vt_graphics_mode();
>   
> @@ -866,9 +898,19 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   		igt_subtest_f("%s-rotation-%s",
>   			      plane_test_str(subtest->plane),
>   			      rot_test_str(subtest->rot)) {
> -			igt_require(!(subtest->rot &
> -				    (IGT_ROTATION_90 | IGT_ROTATION_270)) ||
> -				    gen >= 9);
> +			if (is_i915_device(data.gfx_fd)) {
> +				igt_require(!(subtest->rot &
> +					    (IGT_ROTATION_90 | IGT_ROTATION_270)) ||
> +					    gen >= 9);
> +			} else if (is_amdgpu_device(data.gfx_fd)) {
> +				data.override_fmt = DRM_FORMAT_XRGB8888;
> +				if (subtest->rot & (IGT_ROTATION_90 | IGT_ROTATION_270))
> +					data.override_tiling = AMD_FMT_MOD |
> +						AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S) |
> +						AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9);
> +				else
> +					data.override_tiling = LOCAL_DRM_FORMAT_MOD_NONE;
> +			}
>   			data.rotation = subtest->rot;
>   			test_plane_rotation(&data, subtest->plane, false);
>   		}
> 


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
