Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7B7C25B10
	for <igt-dev@archiver.kernel.org>; Fri, 10 May 2024 12:29:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D84A10E06E;
	Fri, 10 May 2024 12:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CutKTxZd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D6E10E06E
 for <igt-dev@lists.freedesktop.org>; Fri, 10 May 2024 12:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715344190; x=1746880190;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kVDFkYX5iB3o2X0mI62abW1NNDghk2RVFHJMwshkw/c=;
 b=CutKTxZd1DbHDRjJgZRmO04gw7TdWukvFHQ7lYtIePUljfqie9xmVtEA
 yd9f2FMu7LZeqGpY8m3o2fhjcK6k+9fDQ6evFAbJq94AGbsMGtnRlKHNu
 WsG5Vcv7RJTWz62S70eRFQBtmU75x9zHVeBN1JLFtvr4XScsSZkwk7GAf
 EeZAo3Txurd3+cx8gfetGGsO3m3MqGbluozi+pGgeIrG8C/9VMDJtW16e
 84Hs8VNcWfU2jcr981bl/uCcBpJ+7FsXtLyEj/LknbMwyxHXodLCR30ZA
 69GXi6ypdAZ6+4S7ZMsNWX9RTFmPYa3o4Rd/lFLmo69Jw9EbV/aYlLuiC g==;
X-CSE-ConnectionGUID: ulWkFrURSW+Vg+58ioT2+w==
X-CSE-MsgGUID: WTrWoa/CRUWN8x7PhNs15g==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11452384"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="11452384"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 05:29:49 -0700
X-CSE-ConnectionGUID: ROwq6hg3QxO0AYQ9ijd0dw==
X-CSE-MsgGUID: 6xCYJBpGSsiDOuvqIKm7fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="34119084"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 05:29:48 -0700
Date: Fri, 10 May 2024 14:29:45 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zack Rusin <zack.rusin@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com
Subject: Re: [PATCH i-g-t 3/3] tests/vmwgfx: Add a prime test
Message-ID: <20240510122945.vrdbki637tm6tqba@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Zack Rusin <zack.rusin@broadcom.com>,
 ian.forbes@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com
References: <20240509191529.3783796-1-zack.rusin@broadcom.com>
 <20240509191529.3783796-4-zack.rusin@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240509191529.3783796-4-zack.rusin@broadcom.com>
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
On 2024-05-09 at 15:15:29 -0400, Zack Rusin wrote:
> Add a test that check for various dma-buf/prime related issues that might
> show up on vmwgfx.
> 
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> ---
>  tests/vmwgfx/meson.build |   3 +-
>  tests/vmwgfx/vmw_prime.c | 355 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 357 insertions(+), 1 deletion(-)
>  create mode 100644 tests/vmwgfx/vmw_prime.c
> 
> diff --git a/tests/vmwgfx/meson.build b/tests/vmwgfx/meson.build
> index 073905f0a..716024381 100644
> --- a/tests/vmwgfx/meson.build
> +++ b/tests/vmwgfx/meson.build
> @@ -4,7 +4,8 @@ vmwgfx_progs = [
>  	'vmw_execution_buffer',
>  	'vmw_surface_copy',
>  	'vmw_mob_stress',
> -	'vmw_ref_count'
> +	'vmw_ref_count',
> +	'vmw_prime'

'prime' should be before 'ref_count'

Btw rest of vmw tests should also be sorted...

>  ]
>  vmwgfx_deps = test_deps
>  
> diff --git a/tests/vmwgfx/vmw_prime.c b/tests/vmwgfx/vmw_prime.c
> new file mode 100644
> index 000000000..b9294517b
> --- /dev/null
> +++ b/tests/vmwgfx/vmw_prime.c
> @@ -0,0 +1,355 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT

Could it be MIT?

> +/**********************************************************
> + * Copyright (c) 2024 Broadcom. All Rights Reserved. The term

Delete this, SPDX replaced it.

> + * “Broadcom” refers to Broadcom Inc. and/or its subsidiaries.
> + *
> + * Permission is hereby granted, free of charge, to any person
> + * obtaining a copy of this software and associated documentation
> + * files (the "Software"), to deal in the Software without
> + * restriction, including without limitation the rights to use, copy,
> + * modify, merge, publish, distribute, sublicense, and/or sell copies
> + * of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> + * included in all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> + * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
> + * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
> + * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
> + * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> + * SOFTWARE.
> + *
> + **********************************************************/
> +
> +#include "igt_vmwgfx.h"
> +
Delete this empty line.

> +#include "igt_kms.h"

'kms.h' should be before 'vmwgfxh'.

Regards,
Kamil

> +
> +IGT_TEST_DESCRIPTION(
> +	"Check whether basic DRM prime and dma-buf work correctly.");
> +
> +static void replace_with_prime_rt(struct vmw_svga_device *device,
> +				  int32 context_id, uint32 buffer_handle,
> +				  struct vmw_default_objects *objects,
> +				  const SVGA3dSize *rt_size)
> +{
> +	struct vmw_execbuf *cmd_buf;
> +	SVGA3dRenderTargetViewDesc rtv_desc = { 0 };
> +	SVGA3dCmdDXDefineRenderTargetView rt_view_define_cmd = { 0 };
> +	SVGA3dCmdDXDestroyRenderTargetView rt_view_cmd = {
> +		.renderTargetViewId = objects->color_rt_id
> +	};
> +
> +	vmw_ioctl_surface_unref(device->drm_fd, objects->color_rt);
> +	objects->color_rt = vmw_ioctl_create_surface_full(
> +		device->drm_fd,
> +		SVGA3D_SURFACE_HINT_TEXTURE | SVGA3D_SURFACE_HINT_RENDERTARGET |
> +			SVGA3D_SURFACE_BIND_RENDER_TARGET,
> +		SVGA3D_R8G8B8A8_UNORM, 0, SVGA3D_MS_PATTERN_NONE,
> +		SVGA3D_MS_QUALITY_NONE, SVGA3D_TEX_FILTER_NONE, 1, 1, *rt_size,
> +		buffer_handle, drm_vmw_surface_flag_shareable);
> +
> +	cmd_buf = vmw_execbuf_create(device->drm_fd, context_id);
> +
> +	rtv_desc.tex.arraySize = 1;
> +	rtv_desc.tex.firstArraySlice = 0;
> +	rtv_desc.tex.mipSlice = 0;
> +	vmw_bitvector_find_next_bit(device->rt_view_bv,
> +				    &rt_view_define_cmd.renderTargetViewId);
> +	rt_view_define_cmd.sid = objects->color_rt->base.handle;
> +	rt_view_define_cmd.format = SVGA3D_R8G8B8A8_UNORM;
> +	rt_view_define_cmd.resourceDimension = SVGA3D_RESOURCE_TEXTURE2D;
> +	rt_view_define_cmd.desc = rtv_desc;
> +	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_DESTROY_RENDERTARGET_VIEW,
> +			   &rt_view_cmd, sizeof(rt_view_cmd), NULL, 0);
> +	vmw_execbuf_append(cmd_buf, SVGA_3D_CMD_DX_DEFINE_RENDERTARGET_VIEW,
> +			   &rt_view_define_cmd, sizeof(rt_view_define_cmd),
> +			   NULL, 0);
> +	vmw_execbuf_submit(cmd_buf, NULL);
> +	vmw_execbuf_destroy(cmd_buf);
> +
> +	vmw_bitvector_free_bit(device->rt_view_bv, objects->color_rt_id);
> +	objects->color_rt_id = rt_view_define_cmd.renderTargetViewId;
> +}
> +
> +static void draw_triangle_map_gem(struct vmw_svga_device *mdevice,
> +				  struct vmw_svga_device *device, int32 cid)
> +{
> +	struct vmw_default_objects objects;
> +	void *ptr;
> +	bool save_status;
> +	int fd, imported_handle, gem_handle;
> +	uint64_t gem_size;
> +
> +	gem_handle = kmstest_dumb_create(mdevice->drm_fd,
> +					 vmw_default_rect_size.width,
> +					 vmw_default_rect_size.height, 32, NULL,
> +					 &gem_size);
> +	fd = prime_handle_to_fd(mdevice->drm_fd, gem_handle);
> +	imported_handle = prime_fd_to_handle(device->drm_fd, fd);
> +
> +	vmw_create_default_objects(device, cid, &objects,
> +				   &vmw_default_rect_size);
> +	replace_with_prime_rt(device, cid, imported_handle, &objects,
> +			      &vmw_default_rect_size);
> +	vmw_triangle_draw(device, cid, &objects,
> +			  vmw_triangle_draw_flags_sync |
> +				  vmw_triangle_draw_flags_readback);
> +
> +	ptr = kmstest_dumb_map_buffer(mdevice->drm_fd, gem_handle, gem_size,
> +				      PROT_READ);
> +
> +	save_status = vmw_save_data_as_png(objects.color_rt, ptr,
> +					   "vmw_prime_tri1.png");
> +	igt_assert(save_status);
> +	vmw_triangle_assert_values(ptr, objects.color_rt);
> +
> +	munmap(ptr, gem_size);
> +
> +	vmw_destroy_default_objects(device, &objects);
> +	kmstest_dumb_destroy(mdevice->drm_fd, gem_handle);
> +}
> +
> +static void draw_triangle_map_dmabuf(struct vmw_svga_device *mdevice,
> +				     struct vmw_svga_device *device, int32 cid)
> +{
> +	struct vmw_default_objects objects;
> +	void *ptr;
> +	bool save_status;
> +	int fd, imported_handle, gem_handle;
> +	uint64_t gem_size;
> +
> +	gem_handle = kmstest_dumb_create(mdevice->drm_fd,
> +					 vmw_default_rect_size.width,
> +					 vmw_default_rect_size.height, 32, NULL,
> +					 &gem_size);
> +	fd = prime_handle_to_fd_for_mmap(mdevice->drm_fd, gem_handle);
> +	kmstest_dumb_destroy(mdevice->drm_fd, gem_handle);
> +	imported_handle = prime_fd_to_handle(device->drm_fd, fd);
> +
> +	vmw_create_default_objects(device, cid, &objects,
> +				   &vmw_default_rect_size);
> +	replace_with_prime_rt(device, cid, imported_handle, &objects,
> +			      &vmw_default_rect_size);
> +	vmw_triangle_draw(device, cid, &objects,
> +			  vmw_triangle_draw_flags_sync |
> +				  vmw_triangle_draw_flags_readback);
> +
> +	ptr = mmap(NULL, gem_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
> +
> +	save_status = vmw_save_data_as_png(objects.color_rt, ptr,
> +					   "vmw_prime_tri2.png");
> +	igt_assert(save_status);
> +	vmw_triangle_assert_values(ptr, objects.color_rt);
> +
> +	munmap(ptr, gem_size);
> +	close(fd);
> +
> +	vmw_destroy_default_objects(device, &objects);
> +}
> +
> +typedef struct {
> +	struct vmw_svga_device mdevice;
> +	struct vmw_svga_device rdevice;
> +	int32 cid;
> +	igt_display_t display;
> +	struct igt_fb fb;
> +	igt_output_t *output;
> +	igt_plane_t *primary;
> +	enum pipe pipe;
> +	igt_crc_t reference_tri_crc;
> +} gpu_process_t;
> +
> +static void cleanup_crtc(gpu_process_t *gpu)
> +{
> +	igt_display_t *display = &gpu->display;
> +	igt_output_t *output = gpu->output;
> +
> +	igt_plane_set_fb(gpu->primary, NULL);
> +
> +	igt_output_set_pipe(output, PIPE_ANY);
> +	igt_display_commit(display);
> +
> +	igt_remove_fb(gpu->mdevice.drm_fd, &gpu->fb);
> +}
> +
> +static void prepare_crtc(gpu_process_t *gpu)
> +{
> +	igt_display_t *display = &gpu->display;
> +	igt_output_t *output = gpu->output;
> +	drmModeModeInfo *mode;
> +	int ret;
> +
> +	/* select the pipe we want to use */
> +	igt_output_set_pipe(output, gpu->pipe);
> +
> +	mode = igt_output_get_mode(output);
> +
> +	/* create a white fb and flip to it */
> +	igt_create_color_fb(gpu->mdevice.drm_fd, mode->hdisplay, mode->vdisplay,
> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 1.0,
> +			    1.0, 1.0, &gpu->fb);
> +
> +	gpu->primary =
> +		igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_plane_set_fb(gpu->primary, &gpu->fb);
> +	ret = igt_display_commit(display);
> +	igt_assert(ret == 0);
> +}
> +
> +static void run_renderer(struct vmw_svga_device *device, int prime_fd, int cid,
> +			 int fb_size, int width, int height,
> +			 uint32_t draw_flags)
> +{
> +	struct vmw_default_objects objects;
> +	int imported_handle;
> +	SVGA3dSize rt_size = { 0 };
> +
> +	rt_size.width = width;
> +	rt_size.height = height;
> +	rt_size.depth = 1;
> +
> +	imported_handle = prime_fd_to_handle(device->drm_fd, prime_fd);
> +
> +	vmw_create_default_objects(device, cid, &objects, &rt_size);
> +	replace_with_prime_rt(device, cid, imported_handle, &objects, &rt_size);
> +	vmw_triangle_draw(device, cid, &objects, draw_flags);
> +
> +	vmw_destroy_default_objects(device, &objects);
> +}
> +
> +static void draw_triangle_3d(gpu_process_t *gpu, uint32_t draw_flags)
> +{
> +	igt_display_t *display = &gpu->display;
> +	igt_output_t *output;
> +	enum pipe pipe;
> +	igt_pipe_crc_t *pipe_crc;
> +	igt_crc_t blank_crc, tri_crc;
> +	char *blank_crc_str, *tri_crc_str;
> +	bool crc_equal;
> +
> +	for_each_pipe_with_valid_output(display, pipe, output) {
> +		int prime_fd;
> +
> +		gpu->output = output;
> +		gpu->pipe = pipe;
> +
> +		prepare_crtc(gpu);
> +		pipe_crc = igt_pipe_crc_new(gpu->mdevice.drm_fd, pipe,
> +					    IGT_PIPE_CRC_SOURCE_AUTO);
> +		igt_pipe_crc_collect_crc(pipe_crc, &blank_crc);
> +
> +		prime_fd = prime_handle_to_fd_for_mmap(gpu->mdevice.drm_fd,
> +						       gpu->fb.gem_handle);
> +		igt_skip_on(prime_fd == -1 && errno == EINVAL);
> +
> +		igt_fork(renderer_no, 1)
> +		{
> +			run_renderer(&gpu->rdevice, prime_fd, gpu->cid,
> +				     gpu->fb.size, gpu->fb.width,
> +				     gpu->fb.height, draw_flags);
> +		}
> +		igt_waitchildren();
> +
> +		igt_plane_set_fb(gpu->primary, &gpu->fb);
> +		igt_display_commit(display);
> +		igt_pipe_crc_collect_crc(pipe_crc, &tri_crc);
> +		blank_crc_str = igt_crc_to_string(&blank_crc);
> +		tri_crc_str = igt_crc_to_string(&tri_crc);
> +
> +		igt_debug("Blank crc = '%s', tri = '%s\n'", blank_crc_str,
> +			  tri_crc_str);
> +		crc_equal = igt_check_crc_equal(&blank_crc, &tri_crc);
> +		igt_assert_f(
> +			!crc_equal,
> +			"Blank and rendered triangle CRCs should be different.\n");
> +		if (draw_flags == (vmw_triangle_draw_flags_sync |
> +				   vmw_triangle_draw_flags_readback)) {
> +			memcpy(&gpu->reference_tri_crc, &tri_crc,
> +			       sizeof(gpu->reference_tri_crc));
> +		} else if (gpu->reference_tri_crc.has_valid_frame) {
> +			igt_assert_crc_equal(&gpu->reference_tri_crc, &tri_crc);
> +		}
> +
> +		igt_debug_wait_for_keypress("paint");
> +
> +		close(prime_fd);
> +		igt_pipe_crc_free(pipe_crc);
> +		cleanup_crtc(gpu);
> +		free(blank_crc_str);
> +		free(tri_crc_str);
> +		/* once is enough */
> +		return;
> +	}
> +
> +	igt_skip("no valid crtc/connector combinations found\n");
> +}
> +
> +igt_main
> +{
> +	gpu_process_t gpu = { 0 };
> +
> +	igt_fixture
> +	{
> +		vmw_svga_device_init(&gpu.mdevice, vmw_svga_device_node_master);
> +		vmw_svga_device_init(&gpu.rdevice, vmw_svga_device_node_render);
> +		igt_require(gpu.mdevice.drm_fd != -1);
> +		igt_require(gpu.rdevice.drm_fd != -1);
> +
> +		gpu.cid = vmw_ioctl_context_create(gpu.rdevice.drm_fd);
> +		igt_require(gpu.cid != SVGA3D_INVALID_ID);
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_require_pipe_crc(gpu.mdevice.drm_fd);
> +
> +		igt_display_require(&gpu.display, gpu.mdevice.drm_fd);
> +	}
> +
> +	igt_describe("Tests prime rendering triangle with gem mmap.");
> +	igt_subtest("tri-map-gem")
> +	{
> +		draw_triangle_map_gem(&gpu.mdevice, &gpu.rdevice, gpu.cid);
> +	}
> +
> +	igt_describe("Tests prime rendering triangle with dmabuf mmap.");
> +	igt_subtest("tri-map-dmabuf")
> +	{
> +		draw_triangle_map_dmabuf(&gpu.mdevice, &gpu.rdevice, gpu.cid);
> +	}
> +
> +	igt_describe(
> +		"Tests synchronous/readback prime rendering triangle while buffer bound to fb");
> +	igt_subtest("buffer-surface-fb-sharing-sync-readback")
> +	{
> +		draw_triangle_3d(&gpu,
> +				 vmw_triangle_draw_flags_sync |
> +					 vmw_triangle_draw_flags_readback);
> +	}
> +
> +	igt_describe(
> +		"Tests synchronous prime rendering triangle while buffer bound to fb");
> +	igt_subtest("buffer-surface-fb-sharing-sync")
> +	{
> +		draw_triangle_3d(&gpu, vmw_triangle_draw_flags_sync);
> +	}
> +
> +	igt_describe("Tests prime rendering triangle while buffer bound to fb");
> +	igt_subtest("buffer-surface-fb-sharing")
> +	{
> +		draw_triangle_3d(&gpu, vmw_triangle_draw_flags_none);
> +	}
> +
> +	igt_fixture
> +	{
> +		vmw_ioctl_context_destroy(gpu.rdevice.drm_fd, gpu.cid);
> +		igt_display_fini(&gpu.display);
> +		vmw_svga_device_fini(&gpu.rdevice);
> +		vmw_svga_device_fini(&gpu.mdevice);
> +	}
> +}
> -- 
> 2.40.1
> 
