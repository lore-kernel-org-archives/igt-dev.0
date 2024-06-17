Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A802BC27C79
	for <igt-dev@archiver.kernel.org>; Mon, 17 Jun 2024 19:46:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48AE810E4D4;
	Mon, 17 Jun 2024 19:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jLy5yjSr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB4B10E0E9
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 19:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718653599; x=1750189599;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LGjJ02w59Vec8av8JPIROLs4Xc+6Kq5CslRqKq/hK4U=;
 b=jLy5yjSrGPA5Oeh6DUTyn/D01mykApyhuI3Kl0H1I5Huh4GLvMWOE+SL
 0fPW/TUaKogfMhiBUHyxrsXJRfXoYR7/M77fO92XH4MiJt6iUIXfKEQIY
 v3f6N+bvLSqza0JZVRNmzvOE6SnRN8XAZglWaSkIl7XH5svufRdb6mTl0
 GE+/zZWFqd11WI0ttkzASd/IrPzUP9aAbfg29kj/Xcrw/uYUoJokFamP7
 3CZKpRUx2dDgqKaSiyGG5vrLThgTqUXrdPDt3ty0mPuxqD1bV0N9RZVDT
 6PffAgpHZDaJP5gc2qmpAKEFBEcnSIaCJ9dB1tAG6NzrWDOnjoesSD/SA g==;
X-CSE-ConnectionGUID: IDdzyOjmRb++VKMy2GzMiQ==
X-CSE-MsgGUID: zakNEWiPR+Osn5aQ7GVG4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26077061"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="26077061"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 12:46:39 -0700
X-CSE-ConnectionGUID: gv2xAiFDRGaIObyAPDE4Tw==
X-CSE-MsgGUID: vY20H2V2SsSXHSWqNHfJ3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="41400888"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 12:46:38 -0700
Date: Mon, 17 Jun 2024 21:46:20 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: Re: [PATCH i-g-t 12/12] tools/intel_tiling_detect: Introduce tiling
 detection tool
Message-ID: <20240617194620.dllglfgctdpfbft5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
References: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
 <20240527073345.54729-13-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240527073345.54729-13-zbigniew.kempczynski@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Zbigniew,
On 2024-05-27 at 09:33:45 +0200, Zbigniew Kempczyński wrote:
> In some tests we're incorrectly assumming we get requested tiling.
> In blt library we defined available blitter and render tilings for
> defined platforms to avoid being wrong and allowing iterators to walk
> over proper tilings. Unfortunately we're not sure what's the real
> tiling underneath as we're not validating its content.
> 
> Instead of blindly trusting the documentation as it might be wrong
> or vague lets introduce tiling detection tool for Intel platforms.
> Currently it supports detecting linear/X/Y/Yf/Ys/4 tilings (tile64
> is queued to be added) in fast-copy, block-copy and render-copy
> commands.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tools/intel_tiling_detect.c | 432 ++++++++++++++++++++++++++++++++++++
>  tools/meson.build           |   1 +
>  2 files changed, 433 insertions(+)
>  create mode 100644 tools/intel_tiling_detect.c
> 
> diff --git a/tools/intel_tiling_detect.c b/tools/intel_tiling_detect.c
> new file mode 100644
> index 0000000000..ea5ea5eae6
> --- /dev/null
> +++ b/tools/intel_tiling_detect.c
> @@ -0,0 +1,432 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <errno.h>
> +#include <glib.h>
> +#include <sys/ioctl.h>
> +#include <sys/time.h>
> +#include <malloc.h>
-------------^
Sort it alphabetically.

Add newline here.

> +#include "drm.h"
> +#include "igt.h"
> +#include "igt_syncobj.h"
> +#include "i915/gem_create.h"
-------------^^
Sort it alphabetically.

> +#include "intel_blt.h"
> +#include "intel_common.h"
> +#include "intel_mocs.h"
> +#include "intel_pat.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +#include "xe/xe_util.h"
> +
> +IGT_TEST_DESCRIPTION("Exercise gen12 blitter with and without flatccs compression on Xe");
> +
> +static struct param {
> +	int tiling;
> +	bool write_png;
> +	bool print_bb;
> +	bool print_surface_info;
> +	int width;
> +	int height;
> +	int incdim_width;
> +} param = {
> +	.tiling = -1,
> +	.write_png = false,
> +	.print_bb = false,
> +	.print_surface_info = false,
> +	.width = 256,
> +	.height = 256,
> +	.incdim_width = 1,
> +};
> +
> +struct intel_buf refs[I915_TILING_64] = {};
> +
> +#define PRINT_SURFACE_INFO(name, obj) do { \
> +	if (param.print_surface_info) \
> +		blt_surface_info((name), (obj)); } while (0)
> +
> +#define WRITE_PNG(fd, id, name, obj, w, h, bpp) do { \
> +	if (param.write_png) \
> +		blt_surface_to_png((fd), (id), (name), (obj), (w), (h), (bpp)); } while (0)
> +
> +const char *help_str =
> +	"  -b\tPrint bb\n"
> +	"  -s\tPrint surface info\n"
> +	"  -p\tWrite PNG\n"
> +	"  -W\tWidth (default 256)\n"
> +	"  -H\tHeight (default 256)\n"
> +	"  -h\tHelp"
---------------^
No final '\n'?

> +	;

Could you also add some examples for usage?
Do you allow to specify which /dev/driN device will be tested?
Or maybe just allow user to specify path for device?

Regards,
Kamil

> +
> +enum copy_fn {
> +	FAST_COPY,
> +	BLOCK_COPY,
> +	RENDER_COPY,
> +};
> +
> +static const char * const copy_fn_name[] = {
> +	[FAST_COPY] = "fast-copy",
> +	[BLOCK_COPY] = "block-copy",
> +	[RENDER_COPY] = "render-copy",
> +};
> +
> +static void detect_blt_tiling(const struct blt_copy_object *buf)
> +{
> +	bool detected = false;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(refs); i++) {
> +		if (!refs[i].bops)
> +			continue;
> +
> +		if (!memcmp(buf->ptr, refs[i].ptr, buf->size)) {
> +			detected = true;
> +			break;
> +		}
> +	}
> +
> +	igt_info("buffer tiling (claimed): %s, detected: %s\n",
> +		 blt_tiling_name(buf->tiling),
> +		 detected ? blt_tiling_name(i915_tile_to_blt_tile(i)) : "unknown");
> +}
> +
> +static void blt_copy(int fd,
> +		     intel_ctx_t *ctx,
> +		     const struct intel_execution_engine2 *e,
> +		     uint32_t width, uint32_t height,
> +		     enum blt_tiling_type tiling,
> +		     enum copy_fn fn)
> +{
> +	struct blt_copy_data blt = {};
> +	struct blt_block_copy_data_ext ext = {}, *pext = &ext;
> +	struct blt_copy_object *src, *dst;
> +	const uint32_t bpp = 32;
> +	uint64_t bb_size;
> +	uint64_t ahnd = intel_allocator_open(fd, ctx->vm, INTEL_ALLOCATOR_RELOC);
> +	uint32_t run_id = tiling;
> +	uint32_t src_region, dst_region;
> +	uint32_t bb;
> +	uint8_t uc_mocs = intel_get_uc_mocs_index(fd);
> +	bool is_xe = is_xe_device(fd);
> +
> +	if (is_xe) {
> +		bb_size = xe_bb_size(fd, SZ_4K);
> +		src_region = system_memory(fd);
> +		dst_region = vram_if_possible(fd, 0);
> +		bb = xe_bo_create(fd, 0, bb_size, src_region, 0);
> +	} else {
> +		bb_size = SZ_4K;
> +		src_region = REGION_SMEM;
> +		dst_region = gem_has_lmem(fd) ? REGION_LMEM(0) : REGION_SMEM;
> +		igt_assert(__gem_create_in_memory_regions(fd, &bb, &bb_size, src_region) == 0);
> +	}
> +
> +	if (!blt_uses_extended_block_copy(fd))
> +		pext = NULL;
> +
> +	blt_copy_init(fd, &blt);
> +
> +	src = blt_create_object(&blt, src_region, width, height, bpp, uc_mocs,
> +				T_LINEAR, COMPRESSION_DISABLED,
> +				COMPRESSION_TYPE_3D, true);
> +	dst = blt_create_object(&blt, dst_region, width, height, bpp, uc_mocs,
> +				tiling, COMPRESSION_DISABLED,
> +				COMPRESSION_TYPE_3D, true);
> +	PRINT_SURFACE_INFO("src", src);
> +	PRINT_SURFACE_INFO("dst", dst);
> +
> +	blt_surface_fill_rect(fd, src, width, height);
> +
> +	blt.color_depth = CD_32bit;
> +	blt.print_bb = param.print_bb;
> +	blt_set_copy_object(&blt.src, src);
> +	blt_set_copy_object(&blt.dst, dst);
> +	blt_set_object_ext(&ext.src, 0, width, height, SURFACE_TYPE_2D);
> +	blt_set_object_ext(&ext.dst, 0, width, height, SURFACE_TYPE_2D);
> +	blt_set_batch(&blt.bb, bb, bb_size, src_region);
> +	if (fn == BLOCK_COPY)
> +		blt_block_copy(fd, ctx, e, ahnd, &blt, pext);
> +	else if (fn == FAST_COPY)
> +		blt_fast_copy(fd, ctx, e, ahnd, &blt);
> +	if (is_xe)
> +		intel_ctx_xe_sync(ctx, true);
> +	else
> +		gem_sync(fd, dst->handle);
> +
> +	WRITE_PNG(fd, run_id, copy_fn_name[fn], &blt.dst, width, height, bpp);
> +
> +	detect_blt_tiling(dst);
> +
> +	/* Politely clean vm */
> +	put_offset(ahnd, src->handle);
> +	put_offset(ahnd, dst->handle);
> +	put_offset(ahnd, bb);
> +	intel_allocator_bind(ahnd, 0, 0);
> +	blt_destroy_object(fd, src);
> +	blt_destroy_object(fd, dst);
> +	gem_close(fd, bb);
> +	put_ahnd(ahnd);
> +}
> +
> +static void detect_render_tiling(struct intel_buf *buf)
> +{
> +	bool detected = false;
> +	int i;
> +
> +	intel_buf_device_map(buf, false);
> +
> +	for (i = 0; i < ARRAY_SIZE(refs); i++) {
> +		if (!refs[i].bops)
> +			continue;
> +
> +		if (!memcmp(buf->ptr, refs[i].ptr, buf->size)) {
> +			detected = true;
> +			break;
> +		}
> +	}
> +
> +	intel_buf_unmap(buf);
> +
> +	igt_info("buffer tiling (claimed): %s, detected: %s\n",
> +		 blt_tiling_name(buf->tiling),
> +		 detected ? blt_tiling_name(i915_tile_to_blt_tile(i)) : "unknown");
> +}
> +
> +static void scratch_buf_init(struct buf_ops *bops,
> +			     struct intel_buf *buf,
> +			     int width, int height,
> +			     uint32_t tiling,
> +			     enum i915_compression compression)
> +{
> +	int fd = buf_ops_get_fd(bops);
> +	int bpp = 32;
> +
> +	/*
> +	 * We use system memory even if vram is possible because wc mapping
> +	 * is extremely slow.
> +	 */
> +	intel_buf_init_in_region(bops, buf, width, height, bpp, 0,
> +				 tiling, compression,
> +				 is_xe_device(fd) ? system_memory(fd) : REGION_SMEM);
> +
> +	igt_assert(intel_buf_width(buf) == width);
> +	igt_assert(intel_buf_height(buf) == height);
> +}
> +
> +static void render(int fd, uint32_t width, uint32_t height, uint32_t tiling)
> +{
> +	struct buf_ops *bops;
> +	struct intel_bb *ibb;
> +	struct intel_buf src, dst;
> +	uint32_t devid = intel_get_drm_devid(fd);
> +	igt_render_copyfunc_t render_copy = NULL;
> +
> +	bops = buf_ops_create(fd);
> +
> +	igt_debug("%s() gen: %d\n", __func__, intel_gen(devid));
> +
> +	ibb = intel_bb_create(fd, SZ_4K);
> +
> +	scratch_buf_init(bops, &src, width, height, I915_TILING_NONE,
> +			 I915_COMPRESSION_NONE);
> +	scratch_buf_init(bops, &dst, width, height, tiling,
> +			 I915_COMPRESSION_NONE);
> +
> +	/* Copy reference linear image */
> +	intel_buf_device_map(&src, true);
> +	memcpy(src.ptr, refs[0].ptr, src.bo_size);
> +	intel_buf_unmap(&src);
> +
> +	render_copy = igt_get_render_copyfunc(devid);
> +	igt_assert(render_copy);
> +
> +	render_copy(ibb,
> +		    &src,
> +		    0, 0, width, height,
> +		    &dst,
> +		    0, 0);
> +
> +	intel_bb_sync(ibb);
> +	intel_bb_destroy(ibb);
> +
> +	detect_render_tiling(&dst);
> +
> +	if (param.write_png)
> +		intel_buf_raw_write_to_png(&dst, "render-tile-%s.png",
> +					   blt_tiling_name(i915_tile_to_blt_tile(tiling)));
> +
> +	intel_buf_close(bops, &src);
> +	intel_buf_close(bops, &dst);
> +
> +	buf_ops_destroy(bops);
> +}
> +
> +static void single_copy(int fd,
> +			uint32_t width, uint32_t height,
> +			int tiling, enum copy_fn fn)
> +{
> +	/* for potential hangs */
> +	fd = drm_reopen_driver(fd);
> +
> +	switch (fn) {
> +	case BLOCK_COPY:
> +	case FAST_COPY:
> +		if (is_xe_device(fd)) {
> +			struct drm_xe_engine_class_instance inst = {
> +				.engine_class = DRM_XE_ENGINE_CLASS_COPY,
> +			};
> +			uint32_t vm, exec_queue;
> +			intel_ctx_t *ctx;
> +
> +			vm = xe_vm_create(fd, 0, 0);
> +			exec_queue = xe_exec_queue_create(fd, vm, &inst, 0);
> +			ctx = intel_ctx_xe(fd, vm, exec_queue, 0, 0, 0);
> +
> +			blt_copy(fd, ctx, NULL, width, height, tiling, fn);
> +
> +			xe_exec_queue_destroy(fd, exec_queue);
> +			xe_vm_destroy(fd, vm);
> +			free(ctx);
> +		} else {
> +			const struct intel_execution_engine2 *e;
> +			const intel_ctx_t *ctx;
> +
> +			ctx = intel_ctx_create_all_physical(fd);
> +			for_each_ctx_engine(fd, ctx, e) {
> +				if (e->class != I915_ENGINE_CLASS_COPY)
> +					continue;
> +
> +				if (fn == BLOCK_COPY && !gem_engine_can_block_copy(fd, e))
> +					continue;
> +
> +				blt_copy(fd, (intel_ctx_t *)ctx, e,
> +					 width, height, tiling, fn);
> +				break;
> +			}
> +			intel_ctx_destroy(fd, ctx);
> +		}
> +		break;
> +
> +	case RENDER_COPY:
> +		render(fd, width, height, blt_tile_to_i915_tile(tiling));
> +		break;
> +	}
> +
> +	drm_close_driver(fd);
> +}
> +
> +static void soft_tile(struct buf_ops *bops, struct intel_buf *buf,
> +		      uint32_t width, uint32_t height, uint32_t tiling)
> +{
> +	struct blt_copy_data blt = {};
> +	struct blt_copy_object *src;
> +	int fd = buf_ops_get_fd(bops);
> +	uint8_t uc_mocs = intel_get_uc_mocs_index(fd);
> +	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
> +	uint64_t sys_region;
> +	const int bpp = 32;
> +
> +	sys_region = is_xe_device(fd) ? system_memory(fd) : REGION_SMEM;
> +	blt_copy_init(fd, &blt);
> +	src = blt_create_object(&blt, sys_region, width, height, bpp, uc_mocs,
> +				T_LINEAR, COMPRESSION_DISABLED, comp_type, true);
> +	blt_surface_fill_rect(fd, src, width, height);
> +
> +	intel_buf_init(bops, buf, width, height, bpp, 0, tiling, false);
> +	buf_ops_set_software_tiling(bops, tiling, true);
> +
> +	linear_to_intel_buf(bops, buf, src->ptr);
> +
> +	if (param.write_png)
> +		intel_buf_raw_write_to_png(buf, "reference-tile-%s.png",
> +					   blt_tiling_name(i915_tile_to_blt_tile(tiling)));
> +}
> +
> +static bool try_tile[] = {
> +	[I915_TILING_NONE] = true,
> +	[I915_TILING_X] = true,
> +	[I915_TILING_Y] = true,
> +	[I915_TILING_4] = true,
> +	[I915_TILING_Yf] = true,
> +	[I915_TILING_64] = false,
> +};
> +
> +int main(int argc, char *argv[])
> +{
> +	struct buf_ops *bops;
> +	int fd, i, fn, opt;
> +
> +	while ((opt = getopt(argc, argv, "bpsW:H:h")) != -1) {
> +		switch (opt) {
> +		case 'b':
> +			param.print_bb = true;
> +			break;
> +
> +		case 'p':
> +			param.write_png = true;
> +			break;
> +
> +		case 's':
> +			param.print_surface_info = true;
> +			break;
> +
> +		case 'W':
> +			param.width = atoi(optarg);
> +			break;
> +
> +		case 'H':
> +			param.height = atoi(optarg);
> +			break;
> +
> +		case 'h':
> +			igt_info("%s\n", help_str);
> +			exit(0);
> +			break;
> +
> +		default:
> +			break;
> +		}
> +	}
> +
> +	fd = drm_open_driver(DRIVER_INTEL | DRIVER_XE);
> +	if (is_xe_device(fd))
> +		xe_device_get(fd);
> +
> +	bops = buf_ops_create(fd);
> +
> +	for (i = 0; i <= I915_TILING_64; i++) {
> +		igt_info("Building reference tile[%-7s] = %s\n",
> +			 blt_tiling_name(i915_tile_to_blt_tile(i)),
> +			 try_tile[i] ? "yes" : "no");
> +		if (try_tile[i]) {
> +			soft_tile(bops, &refs[i],
> +				  param.width, param.height, i);
> +			intel_buf_device_map(&refs[i], false);
> +		}
> +	}
> +
> +	for (fn = FAST_COPY; fn <= RENDER_COPY; fn++) {
> +		if (fn == FAST_COPY && !blt_has_fast_copy(fd))
> +			continue;
> +
> +		if (fn == BLOCK_COPY && !blt_has_block_copy(fd))
> +			continue;
> +
> +		igt_info("[%s]:\n", copy_fn_name[fn]);
> +
> +		for (i = 0; i <= I915_TILING_64; i++)
> +			if (try_tile[i])
> +				single_copy(fd, param.width, param.height,
> +					    i915_tile_to_blt_tile(i), fn);
> +	}
> +
> +	for (i = 0; i <= I915_TILING_64; i++) {
> +		if (try_tile[i])
> +			intel_buf_unmap(&refs[i]);
> +	}
> +
> +	if (is_xe_device(fd))
> +		xe_device_put(fd);
> +	close(fd);
> +}
> diff --git a/tools/meson.build b/tools/meson.build
> index ac79d8b584..1656355eef 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -36,6 +36,7 @@ tools_progs = [
>  	'intel_reg_checker',
>  	'intel_residency',
>  	'intel_stepping',
> +	'intel_tiling_detect',
>  	'intel_vbt_decode',
>  	'intel_watermark',
>  	'intel_gem_info',
> -- 
> 2.34.1
> 
