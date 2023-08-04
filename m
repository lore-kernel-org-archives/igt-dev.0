Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D329510E041
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Aug 2023 08:23:17 +0000 (UTC)
Date: Fri, 4 Aug 2023 10:22:18 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Message-ID: <20230804082218.jaw4xyesgldw7wd6@zkempczy-mobl2>
References: <20230803074902.172493-1-zbigniew.kempczynski@intel.com>
 <20230803074902.172493-3-zbigniew.kempczynski@intel.com>
 <3876cd00-3387-0fb5-e141-9b40bd8962df@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3876cd00-3387-0fb5-e141-9b40bd8962df@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/xe_media_fill: Exercise media
 fill on Xe
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

On Thu, Aug 03, 2023 at 11:18:22PM +0200, Manszewski, Christoph wrote:
> Hi Zbigniew,
> 
> On 3.08.2023 09:49, Zbigniew Kempczyński wrote:
> > Platforms like Tigerlake and DG1 have dedicated media pipeline so
> > add simple test which exercises it.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> > ---
> >   tests/meson.build        |   1 +
> >   tests/xe/xe_media_fill.c | 135 +++++++++++++++++++++++++++++++++++++++
> >   2 files changed, 136 insertions(+)
> >   create mode 100644 tests/xe/xe_media_fill.c
> > 
> > diff --git a/tests/meson.build b/tests/meson.build
> > index b9f0a9c159..58061dbc26 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -282,6 +282,7 @@ xe_progs = [
> >   	'xe_huc_copy',
> >   	'xe_intel_bb',
> >   	'xe_live_ktest',
> > +	'xe_media_fill',
> >   	'xe_mmap',
> >   	'xe_mmio',
> >   	'xe_module_load',
> > diff --git a/tests/xe/xe_media_fill.c b/tests/xe/xe_media_fill.c
> > new file mode 100644
> > index 0000000000..5227ac3ee6
> > --- /dev/null
> > +++ b/tests/xe/xe_media_fill.c
> > @@ -0,0 +1,135 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2023 Intel Corporation
> > + */
> > +
> > +/*
> > + * This file is a basic test for the media_fill() function, a very simple
> > + * workload for the Media pipeline.
> > + */
> > +
> > +#include <stdbool.h>
> > +#include <unistd.h>
> > +#include <stdlib.h>
> > +#include <sys/ioctl.h>
> > +#include <stdio.h>
> > +#include <string.h>
> > +#include <fcntl.h>
> > +#include <inttypes.h>
> > +#include <errno.h>
> > +#include <sys/stat.h>
> > +#include <sys/time.h>
> > +
> > +#include "drm.h"
> > +#include "igt.h"
> > +#include "xe/xe_ioctl.h"
> > +#include "xe/xe_query.h"
> > +
> > +/**
> > + * TEST: xe media fill
> > + * Description: Basic test for the media_fill() function,
> > + *              a very simple workload for the Media pipeline.
> > + * Feature: media
> > + * Run type: FULL
> > + *
> > + * SUBTEST: media-fill
> > + */
> > +
> > +IGT_TEST_DESCRIPTION("Basic test for the media_fill() function, a very simple"
> > +		     " xe workload for the Media pipeline.");
> > +
> > +#define WIDTH 64
> > +#define STRIDE (WIDTH)
> > +#define HEIGHT 64
> > +#define SIZE (HEIGHT*STRIDE)
> > +
> > +#define COLOR_C4	0xc4
> > +#define COLOR_4C	0x4c
> > +
> > +struct data_t {
> > +	int drm_fd;
> > +	uint32_t devid;
> > +	struct buf_ops *bops;
> > +};
> > +
> > +static struct intel_buf *
> > +create_buf(struct data_t *data, int width, int height, uint8_t color)
> > +{
> > +	struct intel_buf *buf;
> > +	uint8_t *ptr;
> > +	int i;
> > +
> > +	buf = calloc(1, sizeof(*buf));
> > +	igt_assert(buf);
> > +
> > +	buf = intel_buf_create(data->bops, width/4, height, 32, 0,
> > +			       I915_TILING_NONE, 0);
> > +
> > +	ptr = xe_bo_map(data->drm_fd, buf->handle, buf->surface[0].size);
> > +
> > +	for (i = 0; i < buf->surface[0].size; i++)
> > +		ptr[i] = color;
> > +
> > +	munmap(ptr, buf->surface[0].size);
> > +
> > +	return buf;
> > +}
> > +
> > +static void buf_check(uint8_t *ptr, int x, int y, uint8_t color)
> > +{
> > +	uint8_t val;
> > +
> > +	val = ptr[y * WIDTH + x];
> > +	igt_assert_f(val == color,
> > +		     "Expected 0x%02x, found 0x%02x at (%d,%d)\n",
> > +		     color, val, x, y);
> > +}
> > +
> > +static void media_fill(struct data_t *data, igt_fillfunc_t fill)
> > +{
> > +	struct intel_buf *buf;
> > +	uint8_t *ptr;
> > +	int i, j;
> > +
> > +	buf = create_buf(data, WIDTH, HEIGHT, COLOR_C4);
> > +	ptr = xe_bo_map(data->drm_fd, buf->handle, buf->surface[0].size);
> > +
> > +	for (i = 0; i < WIDTH; i++)
> > +		for (j = 0; j < HEIGHT; j++)
> > +			buf_check(ptr, i, j, COLOR_C4);
> > +
> > +	fill(data->drm_fd, buf, 0, 0, WIDTH / 2, HEIGHT / 2, COLOR_4C);
> > +
> > +	for (i = 0; i < WIDTH; i++)
> > +		for (j = 0; j < HEIGHT; j++)
> > +			if (i < WIDTH / 2 && j < HEIGHT / 2)
> > +				buf_check(ptr, i, j, COLOR_4C);
> > +			else
> > +				buf_check(ptr, i, j, COLOR_C4);
> > +
> > +	munmap(ptr, buf->surface[0].size);
> > +}
> > +
> > +igt_main
> > +{
> > +	struct data_t data = {0, };
> > +	igt_fillfunc_t fill_fn = NULL;
> > +
> > +	igt_fixture {
> > +		data.drm_fd = drm_open_driver_render(DRIVER_XE);
> > +		data.devid = intel_get_drm_devid(data.drm_fd);
> > +		data.bops = buf_ops_create(data.drm_fd);
> > +
> > +		fill_fn = igt_get_media_fillfunc(data.devid);
> > +
> > +		igt_require_f(fill_fn, "no media-fill function\n");
> > +	}
> > +
> > +	igt_subtest("media-fill")
> > +		media_fill(&data, fill_fn);
> > +
> > +	igt_fixture {
> > +		drm_close_driver(data.drm_fd);
> 
> Add the complementary 'buf_ops_destroy()' call here and we end up with an
> exact copy of xe_gpgpu_fill. This begs the question if we could maybe
> implement some 'xe_pipeline_fill' test, that could simply run both fill
> functions, either in the same sub-test or separate sub-tests.
> 
> Anyway - the code looks good to me, so:
> Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>
> 
> Christoph

Thanks for the review. I've added buf_ops_destroy() and merged.

--
Zbigniew

> 
> 
> > +	}
> > +}
> > +
