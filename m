Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2080.outbound.protection.outlook.com [40.107.236.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF736E027
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Jan 2021 17:01:46 +0000 (UTC)
References: <20210112225400.115515-1-sungkim@amd.com>
 <20210112225400.115515-3-sungkim@amd.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <eacad818-6a03-da95-1128-580dbb815afa@amd.com>
Date: Thu, 14 Jan 2021 12:01:39 -0500
In-Reply-To: <20210112225400.115515-3-sungkim@amd.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 3/3] lib: Implement tiling/swizzle addressing
 for amdgpu
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
List-ID: <igt-dev@lists.freedesktop.org>

On 2021-01-12 5:54 p.m., Sung Joon Kim wrote:
> The swizzle mode is 64kb withe standard pattern.
> 
> Signed-off-by: Sung Joon Kim <sungkim@amd.com>

Mentioned in patch 1, but let's merge this with patch 1.

> ---
>   lib/igt_amd.c | 132 ++++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_amd.h |  31 ++++++++++++
>   2 files changed, 163 insertions(+)
> 
> diff --git a/lib/igt_amd.c b/lib/igt_amd.c
> index abd3ad96..737e5670 100644
> --- a/lib/igt_amd.c
> +++ b/lib/igt_amd.c
> @@ -54,3 +54,135 @@ void *igt_amd_mmap_bo(int fd, uint32_t handle, uint64_t size, int prot)
>   	ptr = mmap(0, size, prot, MAP_SHARED, fd, map.out.addr_ptr);
>   	return ptr == MAP_FAILED ? NULL : ptr;
>   }
> +
> +unsigned int igt_amd_compute_offset(unsigned int* swizzle_pattern, unsigned int x, unsigned int y)
> +{
> +    unsigned int offset = 0, index = 0, blk_size_table_index = 0, interleave = 0;
> +    unsigned int channel[16] = {0, 0, 1, 1, 2, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1};
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
> +uint32_t igt_amd_fb_tiled_offset(unsigned int bpp, unsigned int x_input, unsigned int y_input,
> +				       unsigned int width_input)
> +{
> +	unsigned int blk_size_table_index, blk_size_log2, blk_size_log2_256B;
> +	unsigned int element_bytes, width_amp, height_amp, width, height, pitch;
> +	unsigned int pb, yb, xb, blk_idx, blk_offset, addr;
> +	unsigned int* swizzle_pattern;
> +	unsigned int block256_2d[][2] = {{16, 16}, {16, 8}, {8, 8}, {8, 4}, {4, 4}};
> +	unsigned int sw_64k_s[][16]=
> +	{
> +	    {X0, X1, X2, X3, Y0, Y1, Y2, Y3, Y4, X4, Y5, X5, Y6, X6, Y7, X7},
> +	    {0,  X0, X1, X2, Y0, Y1, Y2, X3, Y3, X4, Y4, X5, Y5, X6, Y6, X7},
> +	    {0,  0,  X0, X1, Y0, Y1, Y2, X2, Y3, X3, Y4, X4, Y5, X5, Y6, X6},
> +	    {0,  0,  0,  X0, Y0, Y1, X1, X2, Y2, X3, Y3, X4, Y4, X5, Y5, X6},
> +	    {0,  0,  0,  0,  Y0, Y1, X0, X1, Y2, X2, Y3, X3, Y4, X4, Y5, X5},
> +	};
> +
> +	element_bytes = bpp >> 3;
> +	blk_size_table_index = 0;
> +
> +	while (element_bytes > 1) {
> +		blk_size_table_index++;
> +		element_bytes = (element_bytes + 1) >> 1;
> +	}
> +
> +	blk_size_log2 = 16;
> +	blk_size_log2_256B = blk_size_log2 - 8;
> +
> +	width_amp = blk_size_log2_256B / 2;
> +	height_amp = blk_size_log2_256B - width_amp;
> +
> +	width  = (block256_2d[blk_size_table_index][0] << width_amp);
> +	height = (block256_2d[blk_size_table_index][1] << height_amp);
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
Shouldn't the tiling format be checked here? This is only implementing 
one type of tiling, other types should fail.

> +	for (plane = 0; plane < src->num_planes; plane++) {
> +		igt_amd_fb_to_tiled(dst, dst_buf, src, src_buf, plane);
> +	}
> +}
> diff --git a/lib/igt_amd.h b/lib/igt_amd.h
> index f63d26f4..d5b421b4 100644
> --- a/lib/igt_amd.h
> +++ b/lib/igt_amd.h
> @@ -24,8 +24,39 @@
>   #define IGT_AMD_H
>   
>   #include <stdint.h>
> +#include "igt_fb.h"
>   
>   uint32_t igt_amd_create_bo(int fd, uint64_t size);
>   void *igt_amd_mmap_bo(int fd, uint32_t handle, uint64_t size, int prot);
> +unsigned int igt_amd_compute_offset(unsigned int* SwizzlePattern, unsigned int x, unsigned int y);
> +uint32_t igt_amd_fb_tiled_offset(unsigned int bpp, unsigned int x_input, unsigned int y_input,
> +				       unsigned int width_input);
> +void igt_amd_fb_to_tiled(struct igt_fb *dst, void *dst_buf, struct igt_fb *src,
> +				       void *src_buf, unsigned int plane);
> +void igt_amd_fb_convert_plane_to_tiled(struct igt_fb *dst, void *dst_buf,
> +				       struct igt_fb *src, void *src_buf);

Do we need conversion helpers for tiled -> linear?

Regards,
Nicholas Kazlauskas

> +
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

Can we move these constants into the igt_amd.c file itself so it doesn't 
pollute the namespace?

> +
> +struct Dim2d

nitpick: naming should be lowercase, ie. dim2d.

Can also include this structure in igt_amd.c since we're not using it 
anywhere else.

Regards,
Nicholas Kazlauskas

> +{
> +    int w;
> +    int h;
> +};
>   
>   #endif /* IGT_AMD_H */
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
