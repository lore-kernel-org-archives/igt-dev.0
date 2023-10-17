Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A7F10E27F
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Oct 2023 07:40:11 +0000 (UTC)
Date: Tue, 17 Oct 2023 09:40:06 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231017074006.jxsu6hyv7syacfgv@kamilkon-desk.igk.intel.com>
References: <20231016142327.2671-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231016142327.2671-1-contact@emersion.fr>
Subject: Re: [igt-dev] [PATCH] tests/kms_closefb: add CLOSEFB IOCTL test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Simon Ser <contact@emersion.fr>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Simon,

On 2023-10-16 at 14:23:31 +0000, Simon Ser wrote:
> CLOSEFB is the same as RMFB but keeps the FB alive as long as any
> plane is using it. Check the behavior of that IOCTL.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> ---
>  tests/kms_closefb.c | 141 ++++++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build   |   1 +
>  2 files changed, 142 insertions(+)
>  create mode 100644 tests/kms_closefb.c
> 
> diff --git a/tests/kms_closefb.c b/tests/kms_closefb.c
> new file mode 100644
> index 000000000000..26e1670bd29a
> --- /dev/null
> +++ b/tests/kms_closefb.c
> @@ -0,0 +1,141 @@

Put SPDX MIT here:
// SPDX-License-Identifier: MIT

> +/*
> + * Copyright © 2023 Simon Ser
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a

Delete this (SPDX above replaces this).

> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + */
> +
> +#include "igt.h"
> +#include "drmtest.h"
------------^^^
igt includes should follow after systems ones (below)
and should also be sorted alphabetically (drmtest.h before igt.h)

> +#include <errno.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <time.h>

Here put igt includes (after newline).

This is kms test so adding Juha-Pekka and Bhanu on cc.

Regards,
Kamil

> +
> +/**
> + * TEST: kms closefb
> + * Category: Display
> + * Description: This tests CLOSEFB behavior. Contrary to RMFB, the
> + *              framebuffers should not be removed from the CRTC.
> + *
> + * SUBTEST: closefb-ioctl
> + * Description: CLOSEFB is supposed to leave all planes intact.
> + */
> +
> +IGT_TEST_DESCRIPTION("This tests CLOSEFB behavior. Contrary to RMFB, the"
> +		     "framebuffers should not be removed from the CRTC.");
> +
> +// TODO: drop when shipped in kernel header
> +#ifndef DRM_IOCTL_MODE_CLOSEFB
> +#define DRM_IOCTL_MODE_CLOSEFB DRM_IOWR(0xD0, unsigned int)
> +#endif
> +
> +/* 1. Set primary plane to a known FB.
> + * 2. Make sure GETCRTC returns the correct FB ID.
> + * 3. Call CLOSEFB on the FB.
> + * 4. Make sure GETCRTC returns non-0 FB ID.
> + */
> +static void
> +test_closefb(int *drm_fd, igt_display_t *display, igt_output_t *output,
> +	     enum pipe pipe)
> +{
> +	struct igt_fb fb;
> +	drmModeModeInfo *mode;
> +	igt_plane_t *plane;
> +	drmModeCrtc *crtc;
> +	int ret;
> +
> +	mode = igt_output_get_mode(output);
> +	plane = igt_pipe_get_plane_type(&display->pipes[pipe], DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_create_fb(*drm_fd, mode->hdisplay, mode->vdisplay,
> +		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb);
> +	igt_plane_set_fb(plane, &fb);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +
> +	crtc = drmModeGetCrtc(*drm_fd, output->config.crtc->crtc_id);
> +	igt_assert_eq(crtc->buffer_id, fb.fb_id);
> +	drmModeFreeCrtc(crtc);
> +
> +	ret = drmIoctl(*drm_fd, DRM_IOCTL_MODE_CLOSEFB, &fb.fb_id);
> +	igt_assert_eq(ret, 0);
> +
> +	/* Re-open our DRM FD. Without CLOSEFB, this would implicitly turn off
> +	 * the CRTC and remove the FB (see test kms_rmfb@close-fd). */
> +	drm_close_driver(*drm_fd);
> +	*drm_fd = drm_open_driver_master(DRIVER_ANY);
> +	drmSetClientCap(*drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
> +	drmSetClientCap(*drm_fd, DRM_CLIENT_CAP_ATOMIC, 1);
> +	igt_pipe_refresh(display, pipe, true);
> +
> +	/* Check that our CRTC still has the FB attached */
> +	crtc = drmModeGetCrtc(*drm_fd, output->config.crtc->crtc_id);
> +	igt_assert_eq(crtc->buffer_id, fb.fb_id);
> +	drmModeFreeCrtc(crtc);
> +}
> +
> +static void
> +run_closefb_test(int *drm_fd, igt_display_t *display)
> +{
> +	igt_output_t *output;
> +	enum pipe pipe;
> +
> +	for_each_pipe_with_single_output(display, pipe, output) {
> +		igt_display_reset(display);
> +
> +		igt_output_set_pipe(output, pipe);
> +
> +		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
> +			      igt_output_name(output))
> +			test_closefb(drm_fd, display, output, pipe);
> +	}
> +}
> +
> +igt_main
> +{
> +	int drm_fd;
> +	igt_display_t display;
> +	uint32_t fb_id = 0;
> +	int ret;
> +
> +	igt_fixture {
> +		drm_fd = drm_open_driver_master(DRIVER_ANY);
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&display, drm_fd);
> +		igt_display_require_output(&display);
> +
> +		/* Detect kernel support for CLOSEFB */
> +		ret = drmIoctl(drm_fd, DRM_IOCTL_MODE_CLOSEFB, &fb_id);
> +		igt_require(ret != 0 && errno == ENOENT);
> +	}
> +
> +	igt_describe("CLOSEFB is supposed to not touch any plane the FB is "
> +		     "currently attached to. Check that behavior.");
> +	igt_subtest_with_dynamic("closefb-ioctl") {
> +		run_closefb_test(&drm_fd, &display);
> +	}
> +
> +	igt_fixture {
> +		igt_display_fini(&display);
> +		drm_close_driver(drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 2c2e1ca9acad..6b1b15973bde 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -21,6 +21,7 @@ test_progs = [
>  	'kms_atomic_interruptible',
>  	'kms_atomic_transition',
>  	'kms_bw',
> +	'kms_closefb',
>  	'kms_color',
>  	'kms_concurrent',
>  	'kms_content_protection',
> -- 
> 2.42.0
> 
> 
