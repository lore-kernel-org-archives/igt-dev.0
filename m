Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC8FC54798
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 16:32:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE1B112BFC;
	Tue,  5 Mar 2024 16:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BCUpX44O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D00112BF7
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2024 16:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709656357; x=1741192357;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HU0nSklh/N/uGETlldRgtbLHs4lMBxt7fpVeCejqFX0=;
 b=BCUpX44Ou8E8rU/kieVr4Vq2jUMB3wfYZ/rm1MX5exJ89W9qgAgoBoim
 wUD7D52BlWOgn2K2IfVlDM6i/+iYwp9OOn5S6msymxsPEJwyryj4XSgzC
 KOJIb+rm4n6OKtX5rOKsfT1BS4kvghWveJon2OmvM0br4jSHujD3ssQZy
 u1Z8qOWBqXB1rLSUBx7unGB9/Yjd5Q+DZtV/9zwCo/0PfA3SzXjOonrOp
 /bVscybRpURNUIS0jdSS5zHQXSO1F42OMD//5grhwQ86jwvpI4INQpzaE
 ldYQjlWs18J6ie4gXZPtrv07EMxC1tahFXmAAl/hlXb5swZZPcXA2mu70 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15623802"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="15623802"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 08:32:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="14112476"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 08:32:34 -0800
Date: Tue, 5 Mar 2024 17:32:16 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t 4/4] tests/xe_render_copy: Add render-copy test for
 xe
Message-ID: <20240305163216.zuoojfseaegbsrfb@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240305054056.139691-1-zbigniew.kempczynski@intel.com>
 <20240305054056.139691-5-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240305054056.139691-5-zbigniew.kempczynski@intel.com>
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
On 2024-03-05 at 06:40:56 +0100, Zbigniew Kempczyński wrote:
> Fill the gap with testing render-copy for xe driver. Currently only
> few basic render-copy checks are executing within xe_intel_bb@render.
> 
> xe_render_copy introduces new checks comparing to gem_render_copy
> test. During my work on enabling render-copy on LunarLake I've
> used same r6 subregisters like on previous platforms what causes
> full render-copy between surfaces worked but partials were not.
> 
> I decided to include square and v/h stripes tests to verify cofficients
> for barycentric coordinates matches expected <x,y> position. More
> stressful is random subtest which randomizes width and height as well
> as division point (it copies four rectangles to destination surface).
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> ---
>  tests/intel/xe_render_copy.c | 430 +++++++++++++++++++++++++++++++++++
>  tests/meson.build            |   1 +
>  2 files changed, 431 insertions(+)
>  create mode 100644 tests/intel/xe_render_copy.c
> 
> diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
> new file mode 100644
> index 0000000000..ce9547df50
> --- /dev/null
> +++ b/tests/intel/xe_render_copy.c
> @@ -0,0 +1,430 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <cairo.h>
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <glib.h>
> +#include <inttypes.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/ioctl.h>
> +#include <sys/stat.h>
> +#include <unistd.h>

We strive for alphabeticall order but unistd.h have some
impact on other headers (not sure if only for glib.h?),
so I do see it is sometimes a first include. +cc Mauro

Regards,
Kamil


> +#include <zlib.h>
> +
> +#include "igt.h"
> +#include "igt_crc.h"
> +#include "intel_blt.h"
> +#include "intel_bufops.h"
> +#include "intel_pat.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +
> +/**
> + * TEST: Copy memory using 3d engine
> + * Category: Software building block
> + * Sub-category: 3d
> + * Functionality: render
> + * Test category: functionality test
> + *
> + * SUBTEST: render-square
> + * Description: Copy surface using 3d engine dividing to 2x2 squares
> + *
> + * SUBTEST: render-vstripes
> + * Description: Copy surface using 3d engine dividing to 4x1 rectangles
> + *
> + * SUBTEST: render-hstripes
> + * Description: Copy surface using 3d engine dividing to 1x4 rectangles
> + *
> + * SUBTEST: render-random
> + * Description: Copy surface using 3d engine with randomized width, height and
> + *              rectangles size
> + *
> + * SUBTEST: render-full
> + * Description: Copy surface using 3d engine (1:1)
> + */
> +#define WIDTH	256
> +#define HEIGHT	256
> +IGT_TEST_DESCRIPTION("Exercise render-copy on xe");
> +
> +static bool debug_bb;
> +static bool write_png;
> +static bool buf_info;
> +static uint32_t surfwidth = WIDTH;
> +static uint32_t surfheight = HEIGHT;
> +
> +static void scratch_buf_init(struct buf_ops *bops,
> +			     struct intel_buf *buf,
> +			     int width, int height,
> +			     uint32_t req_tiling,
> +			     enum i915_compression compression)
> +{
> +	int fd = buf_ops_get_fd(bops);
> +	int bpp = 32;
> +
> +	intel_buf_init_in_region(bops, buf, width, height, bpp, 0,
> +				 req_tiling, compression, system_memory(fd));
> +
> +	igt_assert(intel_buf_width(buf) == width);
> +	igt_assert(intel_buf_height(buf) == height);
> +}
> +
> +#define GROUP_SIZE 4096
> +static int compare_detail(const uint32_t *ptr1, uint32_t *ptr2,
> +			  uint32_t size)
> +{
> +	int i, ok = 0, fail = 0;
> +	int groups = size / GROUP_SIZE;
> +	int *hist = calloc(GROUP_SIZE, groups);
> +
> +	igt_debug("size: %d, group_size: %d, groups: %d\n",
> +		  size, GROUP_SIZE, groups);
> +
> +	for (i = 0; i < size / sizeof(uint32_t); i++) {
> +		if (ptr1[i] == ptr2[i]) {
> +			ok++;
> +		} else {
> +			fail++;
> +			hist[i * sizeof(uint32_t) / GROUP_SIZE]++;
> +		}
> +	}
> +
> +	for (i = 0; i < groups; i++) {
> +		if (hist[i])
> +			igt_debug("[group %4x]: %d\n", i, hist[i]);
> +	}
> +	free(hist);
> +
> +	igt_debug("ok: %d, fail: %d\n", ok, fail);
> +
> +	return fail;
> +}
> +
> +static int compare_bufs(struct intel_buf *buf1, struct intel_buf *buf2,
> +			bool detail_compare)
> +{
> +	void *ptr1, *ptr2;
> +	int fd1, fd2, ret;
> +
> +	/* Avoid comparison of buffers of different sizes */
> +	if (buf1->surface[0].size != buf2->surface[0].size)
> +		return 0;
> +
> +	fd1 = buf_ops_get_fd(buf1->bops);
> +	fd2 = buf_ops_get_fd(buf2->bops);
> +
> +	ptr1 = xe_bo_map(fd1, buf1->handle, buf1->surface[0].size);
> +	ptr2 = xe_bo_map(fd2, buf2->handle, buf2->surface[0].size);
> +	ret = memcmp(ptr1, ptr2, buf1->surface[0].size);
> +	if (detail_compare)
> +		ret = compare_detail(ptr1, ptr2, buf1->surface[0].size);
> +
> +	munmap(ptr1, buf1->surface[0].size);
> +	munmap(ptr2, buf2->surface[0].size);
> +
> +	return ret;
> +}
> +
> +/*
> + *
> + * Scenarios implemented are presented below. We copy from linear to and forth
> + * linear/tiled and back manipulating x,y coordinates from source and
> + * destination.
> + * For render randomize width and height and randomize x,y inside.
> + *
> + *  <linear>        <linear/x/y/4/64>
> + *
> + *  Square:
> + *  +---+---+       +---+---+
> + *  | 1 | 2 |  ==>  | 3 | 1 |
> + *  +---+---+       +---+---+
> + *  | 3 | 4 |  <==  | 4 | 2 |
> + *  +---+---+       +---+---+
> + *
> + *  VStripes:
> + *  +-+-+-+-+       +-+-+-+-+
> + *  | | | | |  ==>  | | | | |
> + *  |1|2|3|4|       |2|4|1|3|
> + *  | | | | |  ==>  | | | | |
> + *  +-+-+-+-+       +-+-+-+-+
> + *
> + *  HStripes:
> + *  +-------+       +-------+
> + *  |   1   |       |   2   |
> + *  +-------+  ==>  +-------+
> + *  |   2   |       |   4   |
> + *  +-------+       +-------+
> + *  |   3   |       |   1   |
> + *  +-------+  <==  +-------+
> + *  |   4   |       |   3   |
> + *  +-------+       +-------+
> + *
> + *   Full:
> + *  +-------+       +-------+
> + *  |       |  ==>  |       |
> + *  |   1   |       |   1   |
> + *  |       |  <==  |       |
> + *  +-------+       +-------+
> + *
> + *  Random:
> + *  +-+-----+       +-+-----+
> + *  |1|  2  |       |1|  2  |
> + *  +-+-----+  ==>  +-+-----+
> + *  |3|  4  |       |3|  4  |
> + *  | |     |  <==  | |     |
> + *  +-+-----+       +-+-----+
> + */
> +
> +enum render_copy_testtype {
> +	COPY_SQUARE,
> +	COPY_VSTRIPES,
> +	COPY_HSTRIPES,
> +	COPY_RANDOM,
> +	COPY_FULL,
> +};
> +
> +static const char * const testname[] = {
> +	[COPY_SQUARE]	= "square",
> +	[COPY_VSTRIPES]	= "vstripes",
> +	[COPY_HSTRIPES]	= "hstripes",
> +	[COPY_RANDOM]	= "random",
> +	[COPY_FULL]	= "full",
> +};
> +
> +static int render(struct buf_ops *bops, uint32_t tiling,
> +		  uint32_t width, uint32_t height,
> +		  enum render_copy_testtype testtype)
> +{
> +	struct intel_bb *ibb;
> +	struct intel_buf src, dst, final, grfs;
> +	int xe = buf_ops_get_fd(bops);
> +	uint32_t fails = 0;
> +	uint32_t devid = intel_get_drm_devid(xe);
> +	igt_render_copyfunc_t render_copy = NULL;
> +	struct posrc {
> +		uint32_t x0, y0;
> +		uint32_t x1, y1;
> +		uint32_t x2, y2;
> +		uint32_t x3, y3;
> +		uint32_t w, h;
> +	} xys[] = {
> +		/* square */
> +		{ .x0 = 0,		.y0 = 0,
> +		  .x1 = width/2,	.y1 = 0,
> +		  .x2 = width/2,	.y2 = height/2,
> +		  .x3 = 0,		.y3 = height/2,
> +		  .w = width/2,		.h = height/2 },
> +
> +		/* vstripes */
> +		{ .x0 = 0,
> +		  .x1 = width/2,
> +		  .x2 = width/2 + width/4,
> +		  .x3 = width/4,
> +		  .w = width/4,		.h = height },
> +
> +		/* hstripes */
> +		{ .y0 = 0,
> +		  .y1 = height/2,
> +		  .y2 = height/2 + height/4,
> +		  .y3 = height/4,
> +		  .w = width,		.h = height/4 },
> +
> +		/* random - filled later */
> +		{ 0, }
> +	}, *p;
> +
> +	if (testtype == COPY_RANDOM) {
> +		width = rand() % width + 1;
> +		height = rand() % height + 1;
> +	}
> +
> +	ibb = intel_bb_create(xe, SZ_4K);
> +
> +	if (debug_bb)
> +		intel_bb_set_debug(ibb, true);
> +
> +	scratch_buf_init(bops, &src, width, height, I915_TILING_NONE,
> +			 I915_COMPRESSION_NONE);
> +	scratch_buf_init(bops, &dst, width, height, tiling,
> +			 I915_COMPRESSION_NONE);
> +	scratch_buf_init(bops, &final, width, height, I915_TILING_NONE,
> +			 I915_COMPRESSION_NONE);
> +	scratch_buf_init(bops, &grfs, 64, height * 4, I915_TILING_NONE,
> +			 I915_COMPRESSION_NONE);
> +
> +	intel_buf_draw_pattern(bops, &src,
> +			       0, 0, width, height,
> +			       0, 0, width, height, 0);
> +
> +	render_copy = igt_get_render_copyfunc(devid);
> +	igt_assert(render_copy);
> +
> +	switch (testtype) {
> +	case COPY_SQUARE:
> +	case COPY_VSTRIPES:
> +	case COPY_HSTRIPES:
> +		p = &xys[testtype];
> +
> +		/* copy to intermediate surface (dst) */
> +		render_copy(ibb,
> +			    &src, p->x0, p->y0, p->w, p->h,
> +			    &dst, p->x1, p->y1);
> +		render_copy(ibb,
> +			    &src, p->x1, p->y1, p->w, p->h,
> +			    &dst, p->x2, p->y2);
> +		render_copy(ibb,
> +			    &src, p->x2, p->y2, p->w, p->h,
> +			    &dst, p->x3, p->y3);
> +		render_copy(ibb,
> +			    &src, p->x3, p->y3, p->w, p->h,
> +			    &dst, p->x0, p->y0);
> +
> +		/* copy to final */
> +		render_copy(ibb,
> +			    &dst, p->x0, p->y0, p->w, p->h,
> +			    &final, p->x3, p->y3);
> +		render_copy(ibb,
> +			    &dst, p->x1, p->y1, p->w, p->h,
> +			    &final, p->x0, p->y0);
> +		render_copy(ibb,
> +			    &dst, p->x2, p->y2, p->w, p->h,
> +			    &final, p->x1, p->y1);
> +		render_copy(ibb,
> +			    &dst, p->x3, p->y3, p->w, p->h,
> +			    &final, p->x2, p->y2);
> +		break;
> +
> +	case COPY_RANDOM:
> +		p = &xys[testtype];
> +		p->x0 = rand() % width;
> +		p->y0 = rand() % height;
> +		igt_debug("Random <width: %u, height: %u, x0: %d, y0: %d>\n",
> +			  width, height, p->x0, p->y0);
> +
> +		/* copy to intermediate surface (dst), split is randomized */
> +		render_copy(ibb,
> +			    &src, 0, 0, p->x0, p->y0,
> +			    &dst, 0, 0);
> +		render_copy(ibb,
> +			    &src, p->x0, 0, width - p->x0, p->y0,
> +			    &dst, p->x0, 0);
> +		render_copy(ibb,
> +			    &src, 0, p->y0, p->x0, height - p->y0,
> +			    &dst, 0, p->y0);
> +		render_copy(ibb,
> +			    &src, p->x0, p->y0, width - p->x0, height - p->y0,
> +			    &dst, p->x0, p->y0);
> +
> +		render_copy(ibb,
> +			    &dst, 0, 0, width, height,
> +			    &final, 0, 0);
> +		break;
> +
> +
> +	case COPY_FULL:
> +		render_copy(ibb,
> +			    &src, 0, 0, width, height,
> +			    &dst, 0, 0);
> +
> +		render_copy(ibb,
> +			    &dst, 0, 0, width, height,
> +			    &final, 0, 0);
> +		break;
> +	}
> +
> +	intel_bb_sync(ibb);
> +	intel_bb_destroy(ibb);
> +
> +	if (write_png) {
> +		intel_buf_raw_write_to_png(&src, "render_src_tiling_%d_%dx%d.png",
> +					   tiling, width, height);
> +		intel_buf_raw_write_to_png(&dst, "render_dst_tiling_%d_%dx%d.png",
> +					   tiling, width, height);
> +		intel_buf_raw_write_to_png(&final, "render_final_tiling_%d_%dx%d.png",
> +					   tiling, width, height);
> +	}
> +
> +	fails = compare_bufs(&src, &final, true);
> +
> +	intel_buf_close(bops, &src);
> +	intel_buf_close(bops, &dst);
> +	intel_buf_close(bops, &final);
> +
> +	igt_assert_f(fails == 0, "%s: (tiling: %d) fails: %d\n",
> +		     __func__, tiling, fails);
> +
> +	return fails;
> +}
> +
> +static int opt_handler(int opt, int opt_index, void *data)
> +{
> +	switch (opt) {
> +	case 'd':
> +		debug_bb = true;
> +		break;
> +	case 'p':
> +		write_png = true;
> +		break;
> +	case 'i':
> +		buf_info = true;
> +		break;
> +	case 'W':
> +		surfwidth = atoi(optarg);
> +		break;
> +	case 'H':
> +		surfheight = atoi(optarg);
> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +const char *help_str =
> +	"  -d\tDebug bb\n"
> +	"  -p\tWrite surfaces to png\n"
> +	"  -i\tPrint buffer info\n"
> +	"  -W\tWidth (default 256)\n"
> +	"  -H\tHeight (default 256)"
> +	;
> +
> +
> +igt_main_args("dpiW:H:", NULL, help_str, opt_handler, NULL)
> +{
> +	int xe;
> +	struct buf_ops *bops;
> +	const char *tiling_name;
> +	int tiling;
> +
> +	igt_fixture {
> +		xe = drm_open_driver(DRIVER_XE);
> +		bops = buf_ops_create(xe);
> +		srand(time(NULL));
> +	}
> +
> +	for (int id = 0; id <= COPY_FULL; id++) {
> +		igt_subtest_with_dynamic_f("render-%s", testname[id]) {
> +			igt_require(xe_has_engine_class(xe, DRM_XE_ENGINE_CLASS_RENDER));
> +
> +			for_each_tiling(tiling) {
> +				if (!blt_block_copy_supports_tiling(xe, tiling))
> +					continue;
> +
> +				tiling_name = blt_tiling_name(tiling);
> +				tiling = blt_tile_to_fb_tile(tiling);
> +				igt_dynamic_f("render-%s-%ux%u", tiling_name, surfwidth, surfheight)
> +					render(bops, tiling, surfwidth, surfheight, id);
> +			}
> +		}
> +	}
> +
> +	igt_fixture {
> +		buf_ops_destroy(bops);
> +		drm_close_driver(xe);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 02cbc37806..a856510fce 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -309,6 +309,7 @@ intel_xe_progs = [
>  	'xe_pm_residency',
>  	'xe_prime_self_import',
>  	'xe_query',
> +	'xe_render_copy',
>  	'xe_vm',
>  	'xe_waitfence',
>  	'xe_spin_batch',
> -- 
> 2.34.1
> 
