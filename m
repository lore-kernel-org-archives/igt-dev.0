Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB58C2BD09
	for <igt-dev@archiver.kernel.org>; Fri, 28 Jun 2024 16:13:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F1710E224;
	Fri, 28 Jun 2024 16:13:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SppCmm5X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9EEF10E224
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jun 2024 16:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719591195; x=1751127195;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7WrI0NaTBiit0bM6O6yw/XhmcyPMNVZD5oqjEEcw6k0=;
 b=SppCmm5XsBrXi5XRMKpcjEKZn2iojdtouZz6oxvK77R/0SyCYwCmZOVY
 gYMd/abVhOH9gaGo7kHZfCkcQFKr5Kb6nlnmOwIcGfaoywm8C8GPCmcTk
 ++BY8kfbWP/5mihWqjh1dYWoSmyIzeEud5ih5mwU70UhI/NYiGG6m7rNH
 clEESMh19b2erOIL3smmVQ7da7vI2AvFhD+uQjv/II2uNecUOLlXb78wW
 2mEV77kL+IjKUo7ZDExZETSUwyd+u+8FrdVmgm4pvpQecGJmam+5P/BSG
 Vo/4p8lvK4xBA0iv+Q7d0esEHQEGEWXONwGb4GtqbujHI0NxEoYiIXit2 w==;
X-CSE-ConnectionGUID: 2DteZSYtRtGaJs0rbiXmHg==
X-CSE-MsgGUID: eGXa31QxR1ehWOp0nRINfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="17005592"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="17005592"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 09:13:14 -0700
X-CSE-ConnectionGUID: snSVvR+fTZCI56ts7xOjzg==
X-CSE-MsgGUID: xE9uZ7rpRqiacJOaqnpb7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="75979793"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 09:13:12 -0700
Date: Fri, 28 Jun 2024 18:13:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zack Rusin <zack.rusin@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH i-g-t 4/5] tests/vmwgfx: Fix and extend the reference
 counting test
Message-ID: <20240628161309.ilhpxvqfk26aymsp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Zack Rusin <zack.rusin@broadcom.com>,
 ian.forbes@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com,
 Petri Latvala <adrinael@adrinael.net>
References: <20240627195615.3695848-1-zack.rusin@broadcom.com>
 <20240627195615.3695848-5-zack.rusin@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240627195615.3695848-5-zack.rusin@broadcom.com>
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

Hi Zack,
On 2024-06-27 at 15:56:14 -0400, Zack Rusin wrote:
> Fix a few issues related to buffer managment in the reference counting
> test. Extend it to include various prime related reference counting
> issues.
- ^^^^^^
imho better 'capabilities' or some other word.

> 
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> ---
>  lib/igt_vmwgfx.c             |  45 +++-----
>  lib/igt_vmwgfx.h             |  30 +----
>  tests/vmwgfx/vmw_ref_count.c | 207 +++++++++++++++++++++++++++++------
>  3 files changed, 193 insertions(+), 89 deletions(-)
> 
> diff --git a/lib/igt_vmwgfx.c b/lib/igt_vmwgfx.c
> index d2f699575..b62d7a326 100644
> --- a/lib/igt_vmwgfx.c
> +++ b/lib/igt_vmwgfx.c
> @@ -1,28 +1,8 @@
>  // SPDX-License-Identifier: GPL-2.0 OR MIT
> -/**********************************************************
> - * Copyright 2021-2023 VMware, Inc.
------------------------- ^^^^^^^^^^^^

> - *
> - * Permission is hereby granted, free of charge, to any person
> - * obtaining a copy of this software and associated documentation
> - * files (the "Software"), to deal in the Software without
> - * restriction, including without limitation the rights to use, copy,
> - * modify, merge, publish, distribute, sublicense, and/or sell copies
> - * of the Software, and to permit persons to whom the Software is
> - * furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice shall be
> - * included in all copies or substantial portions of the Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> - * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> - * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> - * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
> - * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
> - * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
> - * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> - * SOFTWARE.
> - *
> - **********************************************************/
> +/*
> + * Copyright (c) 2021-2024 Broadcom. All Rights Reserved. The term
----------------------------- ^^^^^^^^^

This is not the same. Btw why not:

 * Copyright 2021-2023 VMware, Inc.
 * Copyright 2024 Broadcom, Inc. and/or its subsidiaries.

But I am a little reluctant to see '... subsidiaries' as this
adds some unknown numbers/names here?
+cc Petri

> + * “Broadcom” refers to Broadcom Inc. and/or its subsidiaries.
> + */
>  
>  #include "igt_vmwgfx.h"
>  
> @@ -154,6 +134,7 @@ bool vmw_save_data_as_png(struct vmw_surface *surface, void *data,
>  	/* Can separate this into another function as it grows */
>  	switch (surface->params.base.format) {
>  	case SVGA3D_R8G8B8A8_UNORM:
> +	case SVGA3D_B8G8R8X8_UNORM:
>  		format = CAIRO_FORMAT_ARGB32;
>  		break;
>  	default:
> @@ -345,11 +326,15 @@ void vmw_ioctl_mob_close_handle(int fd, struct vmw_mob *mob)
>  	free(mob);
>  }
>  
> -struct vmw_surface vmw_ioctl_surface_ref(int fd, int32 sid, uint32 handle_type)
> +struct vmw_surface *vmw_ioctl_surface_ref(int fd, int32 sid, uint32 handle_type)
>  {
>  	int ret;
> -	union drm_vmw_gb_surface_reference_ext_arg arg;
> -	struct vmw_surface surface;
> +	union drm_vmw_gb_surface_reference_ext_arg arg = {0};
> +	struct vmw_surface *surface;
> +
> +	surface = calloc(1, sizeof(struct vmw_surface));
> +	if (!surface)
> +		return NULL;
>  
>  	arg.req.handle_type = handle_type;
>  	arg.req.sid = sid;
> @@ -359,8 +344,8 @@ struct vmw_surface vmw_ioctl_surface_ref(int fd, int32 sid, uint32 handle_type)
>  	if (ret != 0)
>  		fprintf(stderr, "%s Failed\n", __func__);
>  
> -	surface.base = arg.rep.crep;
> -	surface.params = arg.rep.creq;
> +	surface->base = arg.rep.crep;
> +	surface->params = arg.rep.creq;
>  	return surface;
>  }
>  
> @@ -471,7 +456,7 @@ struct vmw_surface *vmw_ioctl_create_surface_full(
>  	arg.req.base.autogen_filter = autogen_filter;
>  	arg.req.base.drm_surface_flags |= surface_flags;
>  	arg.req.base.buffer_handle = buffer_handle;
> -	if (buffer_handle != SVGA3D_INVALID_ID) {
> +	if (buffer_handle == SVGA3D_INVALID_ID) {
>  		arg.req.base.drm_surface_flags |=
>  			drm_vmw_surface_flag_create_buffer;
>  	}
> diff --git a/lib/igt_vmwgfx.h b/lib/igt_vmwgfx.h
> index 961aac389..e80e9848f 100644
> --- a/lib/igt_vmwgfx.h
> +++ b/lib/igt_vmwgfx.h
> @@ -1,28 +1,8 @@
>  /* SPDX-License-Identifier: GPL-2.0 OR MIT */
> -/**********************************************************
> - * Copyright 2021-2023 VMware, Inc.
------------------------- ^
Same here, you replaced VMware with Broadcom.

> - *
> - * Permission is hereby granted, free of charge, to any person
> - * obtaining a copy of this software and associated documentation
> - * files (the "Software"), to deal in the Software without
> - * restriction, including without limitation the rights to use, copy,
> - * modify, merge, publish, distribute, sublicense, and/or sell copies
> - * of the Software, and to permit persons to whom the Software is
> - * furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice shall be
> - * included in all copies or substantial portions of the Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> - * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> - * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> - * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
> - * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
> - * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
> - * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> - * SOFTWARE.
> - *
> - **********************************************************/
> +/*
> + * Copyright (c) 2021-2024 Broadcom. All Rights Reserved. The term
> + * “Broadcom” refers to Broadcom Inc. and/or its subsidiaries.
> + */
>  
>  #ifndef IGT_VMWGFX_H
>  #define IGT_VMWGFX_H
> @@ -186,7 +166,7 @@ struct vmw_surface *vmw_ioctl_buffer_create(int fd, SVGA3dSurfaceAllFlags flags,
>  					    uint32_t size, struct vmw_mob *mob);
>  void vmw_ioctl_surface_unref(int fd, struct vmw_surface *buffer);
>  
> -struct vmw_surface vmw_ioctl_surface_ref(int fd, int32 sid, uint32 handle_type);
> +struct vmw_surface *vmw_ioctl_surface_ref(int fd, int32 sid, uint32 handle_type);
>  
>  struct vmw_surface *vmw_ioctl_create_surface_full(
>  	int fd, SVGA3dSurfaceAllFlags flags, SVGA3dSurfaceFormat format,
> diff --git a/tests/vmwgfx/vmw_ref_count.c b/tests/vmwgfx/vmw_ref_count.c
> index c765f2e70..8b4108471 100644
> --- a/tests/vmwgfx/vmw_ref_count.c
> +++ b/tests/vmwgfx/vmw_ref_count.c
> @@ -1,33 +1,14 @@
>  // SPDX-License-Identifier: GPL-2.0 OR MIT
> -/**********************************************************
> - * Copyright 2021-2023 VMware, Inc.
------------------------- ^
Same here, you replaced VMware with Broadcom.

Regards,
Kamil

> - *
> - * Permission is hereby granted, free of charge, to any person
> - * obtaining a copy of this software and associated documentation
> - * files (the "Software"), to deal in the Software without
> - * restriction, including without limitation the rights to use, copy,
> - * modify, merge, publish, distribute, sublicense, and/or sell copies
> - * of the Software, and to permit persons to whom the Software is
> - * furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice shall be
> - * included in all copies or substantial portions of the Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> - * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> - * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> - * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
> - * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
> - * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
> - * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> - * SOFTWARE.
> - *
> - **********************************************************/
> +/*
> + * Copyright (c) 2021-2024 Broadcom. All Rights Reserved. The term
> + * “Broadcom” refers to Broadcom Inc. and/or its subsidiaries.
> + */
>  
>  #include "igt_vmwgfx.h"
>  
>  IGT_TEST_DESCRIPTION("Perform tests related to vmwgfx's ref_count codepaths.");
>  
> +#define NUM_SURFACES 10
>  static uint32 data[10] = { 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 };
>  
>  static void write_to_mob(int fd, struct vmw_mob *mob)
> @@ -35,6 +16,7 @@ static void write_to_mob(int fd, struct vmw_mob *mob)
>  	void *write_data;
>  
>  	write_data = vmw_ioctl_mob_map(fd, mob);
> +	igt_assert(write_data);
>  	memcpy(write_data, data, sizeof(data));
>  	vmw_ioctl_mob_unmap(mob);
>  }
> @@ -73,7 +55,7 @@ create_and_write_shareable_surface(int32 fd, SVGA3dSize surface_size)
>  		fd, SVGA3D_SURFACE_HINT_RENDERTARGET, SVGA3D_BUFFER, 0,
>  		SVGA3D_MS_PATTERN_NONE, SVGA3D_MS_QUALITY_NONE,
>  		SVGA3D_TEX_FILTER_NONE, 1, 1, surface_size, SVGA3D_INVALID_ID,
> -		drm_vmw_surface_flag_shareable);
> +		drm_vmw_surface_flag_shareable | drm_vmw_surface_flag_create_buffer);
>  
>  	mob.handle = surface->base.buffer_handle;
>  	mob.map_handle = surface->base.buffer_map_handle;
> @@ -86,17 +68,22 @@ create_and_write_shareable_surface(int32 fd, SVGA3dSize surface_size)
>  
>  static bool ref_surface_and_check_contents(int32 fd, uint32 surface_handle)
>  {
> -	struct vmw_surface surface;
> +	struct vmw_surface *surface;
>  	struct vmw_mob mob = { 0 };
> +	bool data_valid;
>  
>  	surface = vmw_ioctl_surface_ref(fd, surface_handle,
>  					DRM_VMW_HANDLE_LEGACY);
>  
> -	mob.handle = surface.base.handle;
> -	mob.size = surface.base.buffer_size;
> -	mob.map_handle = surface.base.buffer_map_handle;
> +	mob.handle = surface->base.handle;
> +	mob.size = surface->base.buffer_size;
> +	mob.map_handle = surface->base.buffer_map_handle;
> +
> +	data_valid = verify_mob_data(fd, &mob);
> +
> +	vmw_ioctl_surface_unref(fd, surface);
>  
> -	return verify_mob_data(fd, &mob);
> +	return data_valid;
>  }
>  
>  igt_main
> @@ -293,7 +280,7 @@ igt_main
>  	igt_subtest("surface_alloc_ref_unref")
>  	{
>  		struct vmw_surface *surface;
> -		struct vmw_surface ref_surface;
> +		struct vmw_surface *ref_surface;
>  		struct vmw_mob readback_mob = { 0 };
>  
>  		surface = create_and_write_shareable_surface(fd1, surface_size);
> @@ -303,11 +290,163 @@ igt_main
>  
>  		vmw_ioctl_surface_unref(fd1, surface);
>  
> -		readback_mob.handle = ref_surface.base.handle;
> -		readback_mob.size = ref_surface.base.buffer_size;
> -		readback_mob.map_handle = ref_surface.base.buffer_map_handle;
> +		readback_mob.handle = ref_surface->base.handle;
> +		readback_mob.size = ref_surface->base.buffer_size;
> +		readback_mob.map_handle = ref_surface->base.buffer_map_handle;
>  
>  		igt_assert(verify_mob_data(fd1, &readback_mob));
> +
> +		vmw_ioctl_surface_unref(fd1, ref_surface);
> +	}
> +
> +	igt_describe("Test refing a surface from the buffer handle.");
> +	igt_subtest("surface_buffer_ref")
> +	{
> +		struct vmw_surface *surfaces[NUM_SURFACES] = {0};
> +		struct vmw_surface *refs[NUM_SURFACES] = {0};
> +		struct vmw_surface *buf_refs[NUM_SURFACES] = {0};
> +		int i;
> +		SVGA3dSize surf_size;
> +
> +		for (i = 0; i < NUM_SURFACES; ++i) {
> +			surf_size.width = 32 + i * 16;
> +			surf_size.height = 32 + i * 16;
> +			surf_size.depth = 1;
> +
> +			surfaces[i] = vmw_create_surface_simple(
> +				fd1,
> +				SVGA3D_SURFACE_HINT_TEXTURE |
> +				SVGA3D_SURFACE_HINT_RENDERTARGET |
> +				SVGA3D_SURFACE_BIND_RENDER_TARGET,
> +				SVGA3D_R8G8B8A8_UNORM, surf_size, SVGA3D_INVALID_ID);
> +			igt_assert(surfaces[i]);
> +		}
> +
> +		for (i = 0; i < NUM_SURFACES; ++i) {
> +			int prime_fd = prime_handle_to_fd_for_mmap(
> +				fd1, surfaces[i]->base.handle);
> +
> +			refs[i] = vmw_ioctl_surface_ref(fd1, prime_fd,
> +							DRM_VMW_HANDLE_PRIME);
> +			igt_assert_eq(surfaces[i]->base.handle,
> +				      refs[i]->base.handle);
> +			igt_assert_eq(surfaces[i]->base.backup_size,
> +				      refs[i]->base.backup_size);
> +			igt_assert_eq(surfaces[i]->base.buffer_size,
> +				      refs[i]->base.buffer_size);
> +			igt_assert_eq(surfaces[i]->base.buffer_map_handle,
> +				      refs[i]->base.buffer_map_handle);
> +			igt_assert_eq(surfaces[i]->params.base.format,
> +				      refs[i]->params.base.format);
> +		}
> +
> +		for (i = 0; i < NUM_SURFACES; ++i) {
> +			int prime_fd = prime_handle_to_fd_for_mmap(
> +				fd1, surfaces[i]->base.buffer_handle);
> +
> +			buf_refs[i] = vmw_ioctl_surface_ref(
> +				fd1, prime_fd, DRM_VMW_HANDLE_PRIME);
> +			igt_assert_eq(surfaces[i]->base.handle,
> +				      buf_refs[i]->base.handle);
> +			igt_assert_eq(surfaces[i]->base.backup_size,
> +				      buf_refs[i]->base.backup_size);
> +			igt_assert_eq(surfaces[i]->base.buffer_size,
> +				      buf_refs[i]->base.buffer_size);
> +			igt_assert_eq(surfaces[i]->base.buffer_map_handle,
> +				      buf_refs[i]->base.buffer_map_handle);
> +			igt_assert_eq(surfaces[i]->params.base.format,
> +				      buf_refs[i]->params.base.format);
> +		}
> +
> +		for (i = 0; i < NUM_SURFACES; ++i) {
> +			vmw_ioctl_surface_unref(fd1, buf_refs[i]);
> +			vmw_ioctl_surface_unref(fd1, refs[i]);
> +			vmw_ioctl_surface_unref(fd1, surfaces[i]);
> +		}
> +	}
> +
> +	igt_describe("Test refcounts on prime surfaces.");
> +	igt_subtest("surface_prime_refs")
> +	{
> +		struct vmw_surface *surfaces[NUM_SURFACES] = {0};
> +		int prime_fds[NUM_SURFACES] = {0};
> +		struct vmw_surface *refs[NUM_SURFACES] = {0};
> +		int i;
> +		SVGA3dSize surf_size;
> +
> +		for (i = 0; i < NUM_SURFACES; ++i) {
> +			surf_size.width = 32 + i * 16;
> +			surf_size.height = 32 + i * 16;
> +			surf_size.depth = 1;
> +
> +			surfaces[i] = vmw_create_surface_simple(
> +				fd1,
> +				SVGA3D_SURFACE_HINT_TEXTURE |
> +				SVGA3D_SURFACE_HINT_RENDERTARGET |
> +				SVGA3D_SURFACE_BIND_RENDER_TARGET,
> +				SVGA3D_R8G8B8A8_UNORM, surf_size, SVGA3D_INVALID_ID);
> +			igt_assert(surfaces[i]);
> +		}
> +
> +		for (i = 0; i < NUM_SURFACES; ++i) {
> +			prime_fds[i] = prime_handle_to_fd(
> +				fd1, surfaces[i]->base.handle);
> +			igt_assert_neq(prime_fds[i], 0);
> +			igt_assert_neq(prime_fds[i], -1);
> +			vmw_ioctl_surface_unref(fd1, surfaces[i]);
> +		}
> +
> +		for (i = 0; i < NUM_SURFACES; ++i) {
> +			refs[i] = vmw_ioctl_surface_ref(fd1, prime_fds[i],
> +							DRM_VMW_HANDLE_PRIME);
> +			close(prime_fds[i]);
> +			igt_assert_neq(refs[i]->base.handle, 0);
> +			igt_assert_neq(refs[i]->base.backup_size, 0);
> +			igt_assert_neq(refs[i]->base.buffer_size, 0);
> +
> +		}
> +	}
> +
> +	igt_describe("Test refcounts on prime surfaces with buffer handles.");
> +	igt_subtest("surface_buffer_prime_refs")
> +	{
> +		struct vmw_surface *surfaces[NUM_SURFACES] = {0};
> +		int prime_fds[NUM_SURFACES] = {0};
> +		struct vmw_surface *refs[NUM_SURFACES] = {0};
> +		int i;
> +		SVGA3dSize surf_size;
> +
> +		for (i = 0; i < NUM_SURFACES; ++i) {
> +			surf_size.width = 32 + i * 16;
> +			surf_size.height = 32 + i * 16;
> +			surf_size.depth = 1;
> +
> +			surfaces[i] = vmw_create_surface_simple(
> +				fd1,
> +				SVGA3D_SURFACE_HINT_TEXTURE |
> +				SVGA3D_SURFACE_HINT_RENDERTARGET |
> +				SVGA3D_SURFACE_BIND_RENDER_TARGET,
> +				SVGA3D_R8G8B8A8_UNORM, surf_size, SVGA3D_INVALID_ID);
> +			igt_assert(surfaces[i]);
> +		}
> +
> +		for (i = 0; i < NUM_SURFACES; ++i) {
> +			prime_fds[i] = prime_handle_to_fd(
> +				fd1, surfaces[i]->base.buffer_handle);
> +			igt_assert_neq(prime_fds[i], 0);
> +			igt_assert_neq(prime_fds[i], -1);
> +			vmw_ioctl_surface_unref(fd1, surfaces[i]);
> +		}
> +
> +		for (i = 0; i < NUM_SURFACES; ++i) {
> +			refs[i] = vmw_ioctl_surface_ref(fd1, prime_fds[i],
> +							DRM_VMW_HANDLE_PRIME);
> +			close(prime_fds[i]);
> +			igt_assert_neq(refs[i]->base.handle, 0);
> +			igt_assert_neq(refs[i]->base.backup_size, 0);
> +			igt_assert_neq(refs[i]->base.buffer_size, 0);
> +
> +		}
>  	}
>  
>  	igt_fixture
> -- 
> 2.40.1
> 
