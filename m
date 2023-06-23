Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC7210E106
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jun 2023 09:11:22 +0000 (UTC)
Message-ID: <d10cbf61-9f3b-17cc-d119-710671129a27@intel.com>
Date: Fri, 23 Jun 2023 11:11:08 +0200
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20230623084635.350402-1-zbigniew.kempczynski@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20230623084635.350402-1-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/intel_blt: Prepare blt library to
 support xe
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Zbigniew,

First of all, did you use any script/sed/whatever to rename fields? If 
so, it would be good to mention it in the commit message.

Just started to review it, but for now, I have only comment (see below).

On 23.06.2023 10:46, Zbigniew Kempczyński wrote:
> Migrate i915/i915_blt -> intel_blt as a preparation step before
> extending to support xe. It is a simple move of files and rename
> of i915 -> fd field.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   2 +-
>   lib/intel_batchbuffer.c                       |   2 +-
>   lib/{i915/i915_blt.c => intel_blt.c}          | 144 +++++++++---------
>   lib/{i915/i915_blt.h => intel_blt.h}          |  49 +++---
>   lib/intel_chipset.h                           |   2 +-
>   lib/{i915 => }/intel_cmds_info.c              |   2 +-
>   lib/{i915 => }/intel_cmds_info.h              |   0
>   lib/meson.build                               |   8 +-
>   tests/i915/api_intel_bb.c                     |   2 +-
>   tests/i915/gem_blits.c                        |   2 +-
>   tests/i915/gem_caching.c                      |   2 +-
>   tests/i915/gem_ccs.c                          |   4 +-
>   tests/i915/gem_exercise_blt.c                 |   2 +-
>   tests/i915/gem_linear_blits.c                 |   2 +-
>   tests/i915/gem_lmem_swapping.c                |   2 +-
>   tests/i915/gem_userptr_blits.c                |   2 +-
>   16 files changed, 116 insertions(+), 111 deletions(-)
>   rename lib/{i915/i915_blt.c => intel_blt.c} (92%)
>   rename lib/{i915/i915_blt.h => intel_blt.h} (86%)
>   rename lib/{i915 => }/intel_cmds_info.c (99%)
>   rename lib/{i915 => }/intel_cmds_info.h (100%)
> 
> diff --git a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
> index 102c8a8978..9085eb924e 100644
> --- a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
> +++ b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
> @@ -64,7 +64,7 @@
>       <xi:include href="xml/gem_engine_topology.xml"/>
>       <xi:include href="xml/gem_scheduler.xml"/>
>       <xi:include href="xml/gem_submission.xml"/>
> -    <xi:include href="xml/i915_blt.xml"/>
> +    <xi:include href="xml/intel_blt.xml"/>
>       <xi:include href="xml/i915_crc.xml"/>
>       <xi:include href="xml/intel_ctx.xml"/>
>     </chapter>
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index 3cd680072e..186f65affe 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -32,7 +32,7 @@
>   #include "huc_copy.h"
>   #include "i915/gem_create.h"
>   #include "i915/gem_mman.h"
> -#include "i915/i915_blt.h"
> +#include "intel_blt.h"
>   #include "igt_aux.h"
>   #include "igt_syncobj.h"
>   #include "intel_batchbuffer.h"
> diff --git a/lib/i915/i915_blt.c b/lib/intel_blt.c
> similarity index 92%
> rename from lib/i915/i915_blt.c
> rename to lib/intel_blt.c
> index ef67fe26f3..28a7400942 100644
> --- a/lib/i915/i915_blt.c
> +++ b/lib/intel_blt.c
> @@ -10,8 +10,8 @@
>   #include <cairo.h>
>   #include "drm.h"
>   #include "igt.h"
> -#include "gem_create.h"
> -#include "i915_blt.h"
> +#include "i915/gem_create.h"
> +#include "intel_blt.h"
>   
>   #define BITRANGE(start, end) (end - start + 1)
>   #define GET_CMDS_INFO(__fd) intel_get_cmds_info(intel_get_drm_devid(__fd))
> @@ -271,115 +271,115 @@ bool blt_cmd_has_property(const struct intel_cmds_info *cmds_info,
>   
>   /**
>    * blt_has_block_copy
> - * @i915: drm fd
> + * @fd: drm fd
>    *
> - * Check if block copy is supported by @i915 device
> + * Check if block copy is supported by @fd device
>    *
>    * Returns:
>    * true if it does, false otherwise.
>    */
> -bool blt_has_block_copy(int i915)
> +bool blt_has_block_copy(int fd)
>   {
> -	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(i915);
> +	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(fd);
>   
>   	return blt_supports_command(cmds_info, XY_BLOCK_COPY);
>   }
>   
>   /**
>    * blt_has_fast_copy
> - * @i915: drm fd
> + * @fd: drm fd
>    *
> - * Check if fast copy is supported by @i915 device
> + * Check if fast copy is supported by @fd device
>    *
>    * Returns:
>    * true if it does, false otherwise.
>    */
> -bool blt_has_fast_copy(int i915)
> +bool blt_has_fast_copy(int fd)
>   {
> -	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(i915);
> +	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(fd);
>   
>   	return blt_supports_command(cmds_info, XY_FAST_COPY);
>   }
>   
>   /**
>    * blt_has_xy_src_copy
> - * @i915: drm fd
> + * @fd: drm fd
>    *
> - * Check if XY src copy is supported by @i915 device
> + * Check if XY src copy is supported by @fd device
>    *
>    * Returns:
>    * true if it does, false otherwise.
>    */
> -bool blt_has_xy_src_copy(int i915)
> +bool blt_has_xy_src_copy(int fd)
>   {
> -	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(i915);
> +	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(fd);
>   
>   	return blt_supports_command(cmds_info, XY_SRC_COPY);
>   }
>   
>   /**
>    * blt_fast_copy_supports_tiling
> - * @i915: drm fd
> + * @fd: drm fd
>    * @tiling: tiling format
>    *
> - * Check if fast copy provided by @i915 device supports @tiling format
> + * Check if fast copy provided by @fd device supports @tiling format
>    *
>    * Returns:
>    * true if it does, false otherwise.
>    */
> -bool blt_fast_copy_supports_tiling(int i915, enum blt_tiling_type tiling)
> +bool blt_fast_copy_supports_tiling(int fd, enum blt_tiling_type tiling)
>   {
> -	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(i915);
> +	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(fd);
>   
>   	return blt_cmd_supports_tiling(cmds_info, XY_FAST_COPY, tiling);
>   }
>   
>   /**
>    * blt_block_copy_supports_tiling
> - * @i915: drm fd
> + * @fd: drm fd
>    * @tiling: tiling format
>    *
> - * Check if block copy provided by @i915 device supports @tiling format
> + * Check if block copy provided by @fd device supports @tiling format
>    *
>    * Returns:
>    * true if it does, false otherwise.
>    */
> -bool blt_block_copy_supports_tiling(int i915, enum blt_tiling_type tiling)
> +bool blt_block_copy_supports_tiling(int fd, enum blt_tiling_type tiling)
>   {
> -	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(i915);
> +	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(fd);
>   
>   	return blt_cmd_supports_tiling(cmds_info, XY_BLOCK_COPY, tiling);
>   }
>   
>   /**
>    * blt_xy_src_copy_supports_tiling
> - * @i915: drm fd
> + * @fd: drm fd
>    * @tiling: tiling format
>    *
> - * Check if XY src copy provided by @i915 device supports @tiling format
> + * Check if XY src copy provided by @fd device supports @tiling format
>    *
>    * Returns:
>    * true if it does, false otherwise.
>    */
> -bool blt_xy_src_copy_supports_tiling(int i915, enum blt_tiling_type tiling)
> +bool blt_xy_src_copy_supports_tiling(int fd, enum blt_tiling_type tiling)
>   {
> -	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(i915);
> +	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(fd);
>   
>   	return blt_cmd_supports_tiling(cmds_info, XY_SRC_COPY, tiling);
>   }
>   
>   /**
>    * blt_block_copy_supports_compression
> - * @i915: drm fd
> + * @fd: drm fd
>    *
> - * Check if block copy provided by @i915 device supports compression.
> + * Check if block copy provided by @fd device supports compression.
>    *
>    * Returns:
>    * true if it does, false otherwise.
>    */
> -bool blt_block_copy_supports_compression(int i915)
> +bool blt_block_copy_supports_compression(int fd)
>   {
> -	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(i915);
> +	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(fd);
>   
>   	return blt_cmd_has_property(cmds_info, XY_BLOCK_COPY,
>   				    BLT_CMD_SUPPORTS_COMPRESSION);
> @@ -387,17 +387,17 @@ bool blt_block_copy_supports_compression(int i915)
>   
>   /**
>    * blt_uses_extended_block_copy
> - * @i915: drm fd
> + * @fd: drm fd
>    *
> - * Check if block copy provided by @i915 device uses an extended version
> + * Check if block copy provided by @fd device uses an extended version
>    * of the command.
>    *
>    * Returns:
>    * true if it does, false otherwise.
>    */
> -bool blt_uses_extended_block_copy(int i915)
> +bool blt_uses_extended_block_copy(int fd)
>   {
> -	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(i915);
> +	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(fd);
>   
>   	return blt_cmd_has_property(cmds_info, XY_BLOCK_COPY, BLT_CMD_EXTENDED);
>   }
> @@ -678,7 +678,7 @@ static void dump_bb_ext(struct gen12_block_copy_data_ext *data)
>   
>   /**
>    * emit_blt_block_copy:
> - * @i915: drm fd
> + * @fd: drm fd
>    * @ahnd: allocator handle
>    * @blt: basic blitter data (for TGL/DG1 which doesn't support ext version)
>    * @ext: extended blitter data (for DG2+, supports flatccs compression)
> @@ -691,7 +691,7 @@ static void dump_bb_ext(struct gen12_block_copy_data_ext *data)
>    * Returns:
>    * Next write position in batch.
>    */
> -uint64_t emit_blt_block_copy(int i915,
> +uint64_t emit_blt_block_copy(int fd,
>   			     uint64_t ahnd,
>   			     const struct blt_copy_data *blt,
>   			     const struct blt_block_copy_data_ext *ext,
> @@ -707,14 +707,14 @@ uint64_t emit_blt_block_copy(int i915,
>   	igt_assert_f(ahnd, "block-copy supports softpin only\n");
>   	igt_assert_f(blt, "block-copy requires data to do blit\n");
>   
> -	alignment = gem_detect_safe_alignment(i915);
> +	alignment = gem_detect_safe_alignment(fd);
>   	src_offset = get_offset(ahnd, blt->src.handle, blt->src.size, alignment);
>   	dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, alignment);
>   	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
>   
>   	fill_data(&data, blt, src_offset, dst_offset, ext);
>   
> -	bb = gem_mmap__device_coherent(i915, blt->bb.handle, 0, blt->bb.size,
> +	bb = gem_mmap__device_coherent(fd, blt->bb.handle, 0, blt->bb.size,
>   				       PROT_READ | PROT_WRITE);
>   
>   	igt_assert(bb_pos + sizeof(data) < blt->bb.size);
> @@ -752,7 +752,7 @@ uint64_t emit_blt_block_copy(int i915,
>   
>   /**
>    * blt_block_copy:
> - * @i915: drm fd
> + * @fd: drm fd
>    * @ctx: intel_ctx_t context
>    * @e: blitter engine for @ctx
>    * @ahnd: allocator handle
> @@ -764,7 +764,7 @@ uint64_t emit_blt_block_copy(int i915,
>    * Returns:
>    * execbuffer status.
>    */
> -int blt_block_copy(int i915,
> +int blt_block_copy(int fd,
>   		   const intel_ctx_t *ctx,
>   		   const struct intel_execution_engine2 *e,
>   		   uint64_t ahnd,
> @@ -779,12 +779,12 @@ int blt_block_copy(int i915,
>   	igt_assert_f(ahnd, "block-copy supports softpin only\n");
>   	igt_assert_f(blt, "block-copy requires data to do blit\n");
>   
> -	alignment = gem_detect_safe_alignment(i915);
> +	alignment = gem_detect_safe_alignment(fd);
>   	src_offset = get_offset(ahnd, blt->src.handle, blt->src.size, alignment);
>   	dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, alignment);
>   	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
>   
> -	emit_blt_block_copy(i915, ahnd, blt, ext, 0, true);
> +	emit_blt_block_copy(fd, ahnd, blt, ext, 0, true);
>   
>   	obj[0].offset = CANONICAL(dst_offset);
>   	obj[1].offset = CANONICAL(src_offset);
> @@ -800,7 +800,7 @@ int blt_block_copy(int i915,
>   	execbuf.buffers_ptr = to_user_pointer(obj);
>   	execbuf.rsvd1 = ctx ? ctx->id : 0;
>   	execbuf.flags = e ? e->flags : I915_EXEC_BLT;
> -	ret = __gem_execbuf(i915, &execbuf);
> +	ret = __gem_execbuf(fd, &execbuf);
>   
>   	return ret;
>   }
> @@ -873,7 +873,7 @@ static void dump_bb_surf_ctrl_cmd(const struct gen12_ctrl_surf_copy_data *data)
>   
>   /**
>    * emit_blt_ctrl_surf_copy:
> - * @i915: drm fd
> + * @fd: drm fd
>    * @ahnd: allocator handle
>    * @surf: blitter data for ctrl-surf-copy
>    * @bb_pos: position at which insert block copy commands
> @@ -886,7 +886,7 @@ static void dump_bb_surf_ctrl_cmd(const struct gen12_ctrl_surf_copy_data *data)
>    * Returns:
>    * Next write position in batch.
>    */
> -uint64_t emit_blt_ctrl_surf_copy(int i915,
> +uint64_t emit_blt_ctrl_surf_copy(int fd,
>   				 uint64_t ahnd,
>   				 const struct blt_ctrl_surf_copy_data *surf,
>   				 uint64_t bb_pos,
> @@ -900,7 +900,7 @@ uint64_t emit_blt_ctrl_surf_copy(int i915,
>   	igt_assert_f(ahnd, "ctrl-surf-copy supports softpin only\n");
>   	igt_assert_f(surf, "ctrl-surf-copy requires data to do ctrl-surf-copy blit\n");
>   
> -	alignment = max_t(uint64_t, gem_detect_safe_alignment(i915), 1ull << 16);
> +	alignment = max_t(uint64_t, gem_detect_safe_alignment(fd), 1ull << 16);
>   
>   	data.dw00.client = 0x2;
>   	data.dw00.opcode = 0x48;
> @@ -923,7 +923,7 @@ uint64_t emit_blt_ctrl_surf_copy(int i915,
>   	data.dw04.dst_address_hi = dst_offset >> 32;
>   	data.dw04.dst_mocs = surf->dst.mocs;
>   
> -	bb = gem_mmap__device_coherent(i915, surf->bb.handle, 0, surf->bb.size,
> +	bb = gem_mmap__device_coherent(fd, surf->bb.handle, 0, surf->bb.size,
>   				       PROT_READ | PROT_WRITE);
>   
>   	igt_assert(bb_pos + sizeof(data) < surf->bb.size);
> @@ -952,7 +952,7 @@ uint64_t emit_blt_ctrl_surf_copy(int i915,
>   
>   /**
>    * blt_ctrl_surf_copy:
> - * @i915: drm fd
> + * @fd: drm fd
>    * @ctx: intel_ctx_t context
>    * @e: blitter engine for @ctx
>    * @ahnd: allocator handle
> @@ -964,7 +964,7 @@ uint64_t emit_blt_ctrl_surf_copy(int i915,
>    * Returns:
>    * execbuffer status.
>    */
> -int blt_ctrl_surf_copy(int i915,
> +int blt_ctrl_surf_copy(int fd,
>   		       const intel_ctx_t *ctx,
>   		       const struct intel_execution_engine2 *e,
>   		       uint64_t ahnd,
> @@ -977,12 +977,12 @@ int blt_ctrl_surf_copy(int i915,
>   	igt_assert_f(ahnd, "ctrl-surf-copy supports softpin only\n");
>   	igt_assert_f(surf, "ctrl-surf-copy requires data to do ctrl-surf-copy blit\n");
>   
> -	alignment = max_t(uint64_t, gem_detect_safe_alignment(i915), 1ull << 16);
> +	alignment = max_t(uint64_t, gem_detect_safe_alignment(fd), 1ull << 16);
>   	src_offset = get_offset(ahnd, surf->src.handle, surf->src.size, alignment);
>   	dst_offset = get_offset(ahnd, surf->dst.handle, surf->dst.size, alignment);
>   	bb_offset = get_offset(ahnd, surf->bb.handle, surf->bb.size, alignment);
>   
> -	emit_blt_ctrl_surf_copy(i915, ahnd, surf, 0, true);
> +	emit_blt_ctrl_surf_copy(fd, ahnd, surf, 0, true);
>   
>   	obj[0].offset = CANONICAL(dst_offset);
>   	obj[1].offset = CANONICAL(src_offset);
> @@ -998,7 +998,7 @@ int blt_ctrl_surf_copy(int i915,
>   	execbuf.buffers_ptr = to_user_pointer(obj);
>   	execbuf.flags = e ? e->flags : I915_EXEC_BLT;
>   	execbuf.rsvd1 = ctx ? ctx->id : 0;
> -	gem_execbuf(i915, &execbuf);
> +	gem_execbuf(fd, &execbuf);
>   	put_offset(ahnd, surf->dst.handle);
>   	put_offset(ahnd, surf->src.handle);
>   	put_offset(ahnd, surf->bb.handle);
> @@ -1133,7 +1133,7 @@ static void dump_bb_fast_cmd(struct gen12_fast_copy_data *data)
>   
>   /**
>    * emit_blt_fast_copy:
> - * @i915: drm fd
> + * @fd: drm fd
>    * @ahnd: allocator handle
>    * @blt: blitter data for fast-copy (same as for block-copy but doesn't use
>    * compression fields).
> @@ -1147,7 +1147,7 @@ static void dump_bb_fast_cmd(struct gen12_fast_copy_data *data)
>    * Returns:
>    * Next write position in batch.
>    */
> -uint64_t emit_blt_fast_copy(int i915,
> +uint64_t emit_blt_fast_copy(int fd,
>   			    uint64_t ahnd,
>   			    const struct blt_copy_data *blt,
>   			    uint64_t bb_pos,
> @@ -1158,7 +1158,7 @@ uint64_t emit_blt_fast_copy(int i915,
>   	uint32_t bbe = MI_BATCH_BUFFER_END;
>   	uint32_t *bb;
>   
> -	alignment = gem_detect_safe_alignment(i915);
> +	alignment = gem_detect_safe_alignment(fd);
>   
>   	data.dw00.client = 0x2;
>   	data.dw00.opcode = 0x42;
> @@ -1194,7 +1194,7 @@ uint64_t emit_blt_fast_copy(int i915,
>   	data.dw08.src_address_lo = src_offset;
>   	data.dw09.src_address_hi = src_offset >> 32;
>   
> -	bb = gem_mmap__device_coherent(i915, blt->bb.handle, 0, blt->bb.size,
> +	bb = gem_mmap__device_coherent(fd, blt->bb.handle, 0, blt->bb.size,
>   				       PROT_READ | PROT_WRITE);
>   
>   	igt_assert(bb_pos + sizeof(data) < blt->bb.size);
> @@ -1222,7 +1222,7 @@ uint64_t emit_blt_fast_copy(int i915,
>   
>   /**
>    * blt_fast_copy:
> - * @i915: drm fd
> + * @fd: drm fd
>    * @ctx: intel_ctx_t context
>    * @e: blitter engine for @ctx
>    * @ahnd: allocator handle
> @@ -1234,7 +1234,7 @@ uint64_t emit_blt_fast_copy(int i915,
>    * Returns:
>    * execbuffer status.
>    */
> -int blt_fast_copy(int i915,
> +int blt_fast_copy(int fd,
>   		  const intel_ctx_t *ctx,
>   		  const struct intel_execution_engine2 *e,
>   		  uint64_t ahnd,
> @@ -1245,13 +1245,13 @@ int blt_fast_copy(int i915,
>   	uint64_t dst_offset, src_offset, bb_offset, alignment;
>   	int ret;
>   
> -	alignment = gem_detect_safe_alignment(i915);
> +	alignment = gem_detect_safe_alignment(fd);
>   
>   	src_offset = get_offset(ahnd, blt->src.handle, blt->src.size, alignment);
>   	dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, alignment);
>   	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
>   
> -	emit_blt_fast_copy(i915, ahnd, blt, 0, true);
> +	emit_blt_fast_copy(fd, ahnd, blt, 0, true);
>   
>   	obj[0].offset = CANONICAL(dst_offset);
>   	obj[1].offset = CANONICAL(src_offset);
> @@ -1267,7 +1267,7 @@ int blt_fast_copy(int i915,
>   	execbuf.buffers_ptr = to_user_pointer(obj);
>   	execbuf.rsvd1 = ctx ? ctx->id : 0;
>   	execbuf.flags = e ? e->flags : I915_EXEC_BLT;
> -	ret = __gem_execbuf(i915, &execbuf);
> +	ret = __gem_execbuf(fd, &execbuf);
>   	put_offset(ahnd, blt->dst.handle);
>   	put_offset(ahnd, blt->src.handle);
>   	put_offset(ahnd, blt->bb.handle);
> @@ -1297,7 +1297,7 @@ void blt_set_batch(struct blt_copy_batch *batch,
>   }
>   
>   struct blt_copy_object *
> -blt_create_object(int i915, uint32_t region,
> +blt_create_object(int fd, uint32_t region,
>   		  uint32_t width, uint32_t height, uint32_t bpp, uint8_t mocs,
>   		  enum blt_tiling_type tiling,
>   		  enum blt_compression compression,
> @@ -1312,7 +1312,7 @@ blt_create_object(int i915, uint32_t region,
>   	obj = calloc(1, sizeof(*obj));
>   
>   	obj->size = size;
> -	igt_assert(__gem_create_in_memory_regions(i915, &handle,
> +	igt_assert(__gem_create_in_memory_regions(fd, &handle,
>   						  &size, region) == 0);
>   
>   	blt_set_object(obj, handle, size, region, mocs, tiling,
> @@ -1320,18 +1320,18 @@ blt_create_object(int i915, uint32_t region,
>   	blt_set_geom(obj, stride, 0, 0, width, height, 0, 0);
>   
>   	if (create_mapping)
> -		obj->ptr = gem_mmap__device_coherent(i915, handle, 0, size,
> +		obj->ptr = gem_mmap__device_coherent(fd, handle, 0, size,
>   						     PROT_READ | PROT_WRITE);
>   
>   	return obj;
>   }
>   
> -void blt_destroy_object(int i915, struct blt_copy_object *obj)
> +void blt_destroy_object(int fd, struct blt_copy_object *obj)
>   {
>   	if (obj->ptr)
>   		munmap(obj->ptr, obj->size);
>   
> -	gem_close(i915, obj->handle);
> +	gem_close(fd, obj->handle);
>   	free(obj);
>   }
>   
> @@ -1372,7 +1372,7 @@ void blt_set_copy_object(struct blt_copy_object *obj,
>   
>   /**
>    * blt_surface_fill_rect:
> - * @i915: drm fd
> + * @fd: drm fd
>    * @obj: blitter copy object (@blt_copy_object) to fill with gradient pattern
>    * @width: width
>    * @height: height
> @@ -1380,7 +1380,7 @@ void blt_set_copy_object(struct blt_copy_object *obj,
>    * Function fills surface @width x @height * 24bpp with color gradient
>    * (internally uses ARGB where A == 0xff, see Cairo docs).
>    */
> -void blt_surface_fill_rect(int i915, const struct blt_copy_object *obj,
> +void blt_surface_fill_rect(int fd, const struct blt_copy_object *obj,
>   			   uint32_t width, uint32_t height)
>   {
>   	cairo_surface_t *surface;
> @@ -1389,7 +1389,7 @@ void blt_surface_fill_rect(int i915, const struct blt_copy_object *obj,
>   	void *map = obj->ptr;
>   
>   	if (!map)
> -		map = gem_mmap__device_coherent(i915, obj->handle, 0,
> +		map = gem_mmap__device_coherent(fd, obj->handle, 0,
>   						obj->size, PROT_READ | PROT_WRITE);
>   
>   	surface = cairo_image_surface_create_for_data(map,
> @@ -1445,7 +1445,7 @@ void blt_surface_info(const char *info, const struct blt_copy_object *obj)
>   
>   /**
>    * blt_surface_to_png:
> - * @i915: drm fd
> + * @fd: drm fd
>    * @run_id: prefix id to allow grouping files stored from single run
>    * @fileid: file identifier
>    * @obj: blitter copy object (@blt_copy_object) to save to png
> @@ -1454,7 +1454,7 @@ void blt_surface_info(const char *info, const struct blt_copy_object *obj)
>    *
>    * Function save surface to png file. Assumes ARGB format where A == 0xff.
>    */
> -void blt_surface_to_png(int i915, uint32_t run_id, const char *fileid,
> +void blt_surface_to_png(int fd, uint32_t run_id, const char *fileid,
>   			const struct blt_copy_object *obj,
>   			uint32_t width, uint32_t height)
>   {
> @@ -1470,7 +1470,7 @@ void blt_surface_to_png(int i915, uint32_t run_id, const char *fileid,
>   		 obj->compression ? "compressed" : "uncompressed");
>   
>   	if (!map)
> -		map = gem_mmap__device_coherent(i915, obj->handle, 0,
> +		map = gem_mmap__device_coherent(fd, obj->handle, 0,
>   						obj->size, PROT_READ);
>   	format = CAIRO_FORMAT_RGB24;
>   	surface = cairo_image_surface_create_for_data(map,
> diff --git a/lib/i915/i915_blt.h b/lib/intel_blt.h
> similarity index 86%
> rename from lib/i915/i915_blt.h
> rename to lib/intel_blt.h
> index a5f0edd154..0cbe881f4a 100644
> --- a/lib/i915/i915_blt.h
> +++ b/lib/intel_blt.h
> @@ -3,11 +3,14 @@
>    * Copyright © 2022 Intel Corporation
>    */
>   
> +#ifndef __INTEL_BLT_H__
> +#define __INTEL_BLT_H__
> +
>   /**
> - * SECTION:i915_blt
> + * SECTION:intel_blt
>    * @short_description: i915 blitter library

You've missed that line, could you please update it?

Thanks,
Karolina

>    * @title: Blitter library
> - * @include: i915_blt.h
> + * @include: intel_blt.h
>    *
>    * # Introduction
>    *
> @@ -95,7 +98,7 @@ struct blt_copy_batch {
>   
>   /* Common for block-copy and fast-copy */
>   struct blt_copy_data {
> -	int i915;
> +	int fd;
>   	struct blt_copy_object src;
>   	struct blt_copy_object dst;
>   	struct blt_copy_batch bb;
> @@ -148,7 +151,7 @@ struct blt_ctrl_surf_copy_object {
>   };
>   
>   struct blt_ctrl_surf_copy_data {
> -	int i915;
> +	int fd;
>   	struct blt_ctrl_surf_copy_object src;
>   	struct blt_ctrl_surf_copy_object dst;
>   	struct blt_copy_batch bb;
> @@ -166,51 +169,51 @@ bool blt_cmd_has_property(const struct intel_cmds_info *cmds_info,
>   			  enum blt_cmd_type cmd,
>   			  uint32_t prop);
>   
> -bool blt_has_block_copy(int i915);
> -bool blt_has_fast_copy(int i915);
> -bool blt_has_xy_src_copy(int i915);
> +bool blt_has_block_copy(int fd);
> +bool blt_has_fast_copy(int fd);
> +bool blt_has_xy_src_copy(int fd);
>   
> -bool blt_fast_copy_supports_tiling(int i915, enum blt_tiling_type tiling);
> -bool blt_block_copy_supports_tiling(int i915, enum blt_tiling_type tiling);
> -bool blt_xy_src_copy_supports_tiling(int i915, enum blt_tiling_type tiling);
> -bool blt_block_copy_supports_compression(int i915);
> -bool blt_uses_extended_block_copy(int i915);
> +bool blt_fast_copy_supports_tiling(int fd, enum blt_tiling_type tiling);
> +bool blt_block_copy_supports_tiling(int fd, enum blt_tiling_type tiling);
> +bool blt_xy_src_copy_supports_tiling(int fd, enum blt_tiling_type tiling);
> +bool blt_block_copy_supports_compression(int fd);
> +bool blt_uses_extended_block_copy(int fd);
>   
>   const char *blt_tiling_name(enum blt_tiling_type tiling);
>   
> -uint64_t emit_blt_block_copy(int i915,
> +uint64_t emit_blt_block_copy(int fd,
>   			     uint64_t ahnd,
>   			     const struct blt_copy_data *blt,
>   			     const struct blt_block_copy_data_ext *ext,
>   			     uint64_t bb_pos,
>   			     bool emit_bbe);
>   
> -int blt_block_copy(int i915,
> +int blt_block_copy(int fd,
>   		   const intel_ctx_t *ctx,
>   		   const struct intel_execution_engine2 *e,
>   		   uint64_t ahnd,
>   		   const struct blt_copy_data *blt,
>   		   const struct blt_block_copy_data_ext *ext);
>   
> -uint64_t emit_blt_ctrl_surf_copy(int i915,
> +uint64_t emit_blt_ctrl_surf_copy(int fd,
>   				 uint64_t ahnd,
>   				 const struct blt_ctrl_surf_copy_data *surf,
>   				 uint64_t bb_pos,
>   				 bool emit_bbe);
>   
> -int blt_ctrl_surf_copy(int i915,
> +int blt_ctrl_surf_copy(int fd,
>   		       const intel_ctx_t *ctx,
>   		       const struct intel_execution_engine2 *e,
>   		       uint64_t ahnd,
>   		       const struct blt_ctrl_surf_copy_data *surf);
>   
> -uint64_t emit_blt_fast_copy(int i915,
> +uint64_t emit_blt_fast_copy(int fd,
>   			    uint64_t ahnd,
>   			    const struct blt_copy_data *blt,
>   			    uint64_t bb_pos,
>   			    bool emit_bbe);
>   
> -int blt_fast_copy(int i915,
> +int blt_fast_copy(int fd,
>   		  const intel_ctx_t *ctx,
>   		  const struct intel_execution_engine2 *e,
>   		  uint64_t ahnd,
> @@ -223,13 +226,13 @@ void blt_set_batch(struct blt_copy_batch *batch,
>   		   uint32_t handle, uint64_t size, uint32_t region);
>   
>   struct blt_copy_object *
> -blt_create_object(int i915, uint32_t region,
> +blt_create_object(int fd, uint32_t region,
>   		  uint32_t width, uint32_t height, uint32_t bpp, uint8_t mocs,
>   		  enum blt_tiling_type tiling,
>   		  enum blt_compression compression,
>   		  enum blt_compression_type compression_type,
>   		  bool create_mapping);
> -void blt_destroy_object(int i915, struct blt_copy_object *obj);
> +void blt_destroy_object(int fd, struct blt_copy_object *obj);
>   void blt_set_object(struct blt_copy_object *obj,
>   		    uint32_t handle, uint64_t size, uint32_t region,
>   		    uint8_t mocs, enum blt_tiling_type tiling,
> @@ -244,8 +247,10 @@ void blt_set_copy_object(struct blt_copy_object *obj,
>   
>   void blt_surface_info(const char *info,
>   		      const struct blt_copy_object *obj);
> -void blt_surface_fill_rect(int i915, const struct blt_copy_object *obj,
> +void blt_surface_fill_rect(int fd, const struct blt_copy_object *obj,
>   			   uint32_t width, uint32_t height);
> -void blt_surface_to_png(int i915, uint32_t run_id, const char *fileid,
> +void blt_surface_to_png(int fd, uint32_t run_id, const char *fileid,
>   			const struct blt_copy_object *obj,
>   			uint32_t width, uint32_t height);
> +
> +#endif
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index accfa90ef0..84cf1799e9 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -31,7 +31,7 @@
>   #include <pciaccess.h>
>   #include <stdbool.h>
>   
> -#include "i915/intel_cmds_info.h"
> +#include "intel_cmds_info.h"
>   
>   #define BIT(x) (1ul <<(x))
>   
> diff --git a/lib/i915/intel_cmds_info.c b/lib/intel_cmds_info.c
> similarity index 99%
> rename from lib/i915/intel_cmds_info.c
> rename to lib/intel_cmds_info.c
> index 166fb4740c..151cb5f724 100644
> --- a/lib/i915/intel_cmds_info.c
> +++ b/lib/intel_cmds_info.c
> @@ -7,7 +7,7 @@
>   #include <stddef.h>
>   
>   #include "intel_chipset.h"
> -#include "i915/intel_cmds_info.h"
> +#include "intel_cmds_info.h"
>   
>   #define BLT_INFO(_cmd, _tiling)  { \
>   		.blt_cmd_type = _cmd, \
> diff --git a/lib/i915/intel_cmds_info.h b/lib/intel_cmds_info.h
> similarity index 100%
> rename from lib/i915/intel_cmds_info.h
> rename to lib/intel_cmds_info.h
> diff --git a/lib/meson.build b/lib/meson.build
> index 8e99770837..3e1ecdee2b 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -13,8 +13,6 @@ lib_sources = [
>   	'i915/gem_vm.c',
>   	'i915/intel_decode.c',
>   	'i915/intel_memory_region.c',
> -	'i915/intel_cmds_info.c',
> -	'i915/i915_blt.c',
>   	'i915/i915_crc.c',
>   	'igt_collection.c',
>   	'igt_color_encoding.c',
> @@ -54,8 +52,10 @@ lib_sources = [
>   	'intel_allocator_reloc.c',
>   	'intel_allocator_simple.c',
>   	'intel_batchbuffer.c',
> +	'intel_blt.c',
>   	'intel_bufops.c',
>   	'intel_chipset.c',
> +	'intel_cmds_info.c',
>   	'intel_ctx.c',
>   	'intel_device_info.c',
>   	'intel_mmio.c',
> @@ -232,7 +232,7 @@ igt_deps = [ lib_igt ] + lib_deps
>   lin_igt_chipset_build = static_library('igt_chipset',
>                                          ['intel_chipset.c',
>   					'intel_device_info.c',
> -					'i915/intel_cmds_info.c'],
> +					'intel_cmds_info.c'],
>                                          include_directories : inc)
>   
>   lib_igt_chipset = declare_dependency(link_with : lin_igt_chipset_build,
> @@ -255,7 +255,7 @@ lib_igt_device_scan_build = static_library('igt_device_scan',
>   	'igt_list.c',
>   	'igt_tools_stub.c',
>   	'intel_device_info.c',
> -	'i915/intel_cmds_info.c',
> +	'intel_cmds_info.c',
>   	],
>   	dependencies : scan_dep,
>   	include_directories : inc)
> diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
> index 85ca86eed1..fefb5d996f 100644
> --- a/tests/i915/api_intel_bb.c
> +++ b/tests/i915/api_intel_bb.c
> @@ -40,7 +40,7 @@
>   #include "intel_bufops.h"
>   #include "i915/gem_vm.h"
>   #include "i915/i915_crc.h"
> -#include "i915/i915_blt.h"
> +#include "intel_blt.h"
>   /**
>    * TEST: api intel bb
>    * Description: intel_bb API check.
> diff --git a/tests/i915/gem_blits.c b/tests/i915/gem_blits.c
> index 681fe04666..f058644ba5 100644
> --- a/tests/i915/gem_blits.c
> +++ b/tests/i915/gem_blits.c
> @@ -27,7 +27,7 @@
>   #include "i915/gem_create.h"
>   #include "igt.h"
>   #include "igt_x86.h"
> -#include "i915/i915_blt.h"
> +#include "intel_blt.h"
>   /**
>    * TEST: gem blits
>    * Category: Infrastructure
> diff --git a/tests/i915/gem_caching.c b/tests/i915/gem_caching.c
> index 7af427d7e4..55e466a3ee 100644
> --- a/tests/i915/gem_caching.c
> +++ b/tests/i915/gem_caching.c
> @@ -39,7 +39,7 @@
>   
>   #include "i915/gem.h"
>   #include "igt.h"
> -#include "i915/i915_blt.h"
> +#include "intel_blt.h"
>   /**
>    * TEST: gem caching
>    * Category: Desktop client
> diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
> index d38ab49a4b..1b2311f698 100644
> --- a/tests/i915/gem_ccs.c
> +++ b/tests/i915/gem_ccs.c
> @@ -13,7 +13,7 @@
>   #include "i915/gem.h"
>   #include "i915/gem_create.h"
>   #include "lib/intel_chipset.h"
> -#include "i915/i915_blt.h"
> +#include "intel_blt.h"
>   #include "intel_mocs.h"
>   /**
>    * TEST: gem ccs
> @@ -167,7 +167,7 @@ static void surf_copy(int i915,
>   	ccs = gem_create(i915, ccssize);
>   	ccs2 = gem_create(i915, ccssize);
>   
> -	surf.i915 = i915;
> +	surf.fd = i915;
>   	surf.print_bb = param.print_bb;
>   	set_surf_object(&surf.src, mid->handle, mid->region, mid->size,
>   			uc_mocs, BLT_INDIRECT_ACCESS);
> diff --git a/tests/i915/gem_exercise_blt.c b/tests/i915/gem_exercise_blt.c
> index 89f89d212b..3ec02c22e2 100644
> --- a/tests/i915/gem_exercise_blt.c
> +++ b/tests/i915/gem_exercise_blt.c
> @@ -8,7 +8,7 @@
>   #include "i915/gem.h"
>   #include "i915/gem_create.h"
>   #include "lib/intel_chipset.h"
> -#include "i915/i915_blt.h"
> +#include "intel_blt.h"
>   #include "intel_mocs.h"
>   /**
>    * TEST: gem exercise blt
> diff --git a/tests/i915/gem_linear_blits.c b/tests/i915/gem_linear_blits.c
> index bdbbf99efe..32b9052507 100644
> --- a/tests/i915/gem_linear_blits.c
> +++ b/tests/i915/gem_linear_blits.c
> @@ -48,7 +48,7 @@
>   #include "i915/gem_create.h"
>   #include "igt.h"
>   #include "igt_types.h"
> -#include "i915/i915_blt.h"
> +#include "intel_blt.h"
>   /**
>    * TEST: gem linear blits
>    * Description: Test doing many blits with a working set larger than the aperture size.
> diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
> index 8211edbe30..0ef1ceb13f 100644
> --- a/tests/i915/gem_lmem_swapping.c
> +++ b/tests/i915/gem_lmem_swapping.c
> @@ -22,7 +22,7 @@
>   #include <sys/time.h>
>   #include <sys/wait.h>
>   #include "drm.h"
> -#include "i915/i915_blt.h"
> +#include "intel_blt.h"
>   #include "intel_mocs.h"
>   /**
>    * TEST: gem lmem swapping
> diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
> index e9235a6898..4f9b854cc0 100644
> --- a/tests/i915/gem_userptr_blits.c
> +++ b/tests/i915/gem_userptr_blits.c
> @@ -66,7 +66,7 @@
>   #include "sw_sync.h"
>   
>   #include "eviction_common.c"
> -#include "i915/i915_blt.h"
> +#include "intel_blt.h"
>   /**
>    * TEST: gem userptr blits
>    * Run type: FULL
