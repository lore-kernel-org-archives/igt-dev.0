Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B857AD6910B
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 13:25:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7411510E070;
	Thu, 28 Nov 2024 13:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TaCY2srU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB8710E070
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Nov 2024 13:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732800350; x=1764336350;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vq+kLIhxulLoTbqEQ6ySJpS7KobHiqqhKKnBTExBUz0=;
 b=TaCY2srUMlIUIRcf1f6DCPVeLXMFodT7ncgEvZ0U/WMJEhObIVHfH4NS
 +mw/dYEi2Vlzj7VHPqB7tw/m+DrGTnITF4L05xW8UfeUpRV1B3ojETj6c
 YdKgEGRi36jBAbjMx6NLBsii4zBdhsTBmUQXTGb7lY3bf9Ub51P7Jlq7a
 KZR8Qx9Kxr/y9g+kF500lhLjvdpdD6hWhFgrAX61pNwG7e1us156VPMgI
 Dy7IDCEEbMtFQRELe5gaUVS8InkNQEJlleenLS8JAXvPdOvSYiKyjzdLm
 UqkLYge4RzLtJtS/hm8xIU4+gsQI0PHFw2Ni01yaVnikgiFxzp6L/imee Q==;
X-CSE-ConnectionGUID: 4EQmODd1TWym2WFoBQv1sg==
X-CSE-MsgGUID: 08jQddUkT/SEyx0Pu1OqGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="43646641"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="43646641"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 05:25:49 -0800
X-CSE-ConnectionGUID: jELklekmQlm+d4HEsUkX/A==
X-CSE-MsgGUID: y+XlTwX4TL+ZkEX5NFEjQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="129742124"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.163])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 05:25:48 -0800
Date: Thu, 28 Nov 2024 14:25:45 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/1] tests/intel/xe_exec_store: Introduce
 long-shader tests
Message-ID: <20241128132545.ij56mpynmkpamajx@zkempczy-mobl2>
References: <20241125135645.6776-1-dominik.karol.piatkowski@intel.com>
 <20241125135645.6776-2-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241125135645.6776-2-dominik.karol.piatkowski@intel.com>
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

On Mon, Nov 25, 2024 at 02:56:45PM +0100, Dominik Karol Piątkowski wrote:
> Introduce 4 tests:
> - long-shader-bb-sram-target-sram
> - long-shader-bb-sram-target-vram
> - long-shader-bb-vram-target-sram
> - long-shader-bb-vram-target-vram
> 
> These tests are core version of xe_eudebug_online@writes-caching* tests.
> 
> Each test writes incrementing values to 2-page-long target surface using
> long shader. The bb is searched for full shader, expecting it to exist.
> The target surface is checked against written values. Each test places
> bb and surface in different configuration of memory regions in order to
> validate memory coherency.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>  tests/intel/xe_exec_store.c | 130 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 130 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
> index 1375ee906..bb7e7987d 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -12,6 +12,10 @@
>  #include "xe/xe_query.h"
>  #include "xe_drm.h"
>  
> +#include "intel_pat.h"
> +#include "intel_mocs.h"
> +#include "gpgpu_shader.h"
> +
>  /**
>   * TEST: Tests to verify store dword functionality.
>   * Category: Core
> @@ -334,6 +338,120 @@ static void persistent(int fd)
>  	xe_vm_destroy(fd, vm);
>  }
>  
> +#define LONG_SHADER_VALUE(n)	(0xcafe0000 + (n))
> +
> +/**
> + * SUBTEST: long-shader-bb-%s-target-%s
> + * DESCRIPTION: Write incrementing values to 2-page-long target surface using long shader. Check if
> + *		the bb contains full shader. Check if all written values are in the target surface.
> + *		Place bb and surface in various memory regions to validate memory coherency.
> + *
> + * arg[1]:
> + *
> + * @sram: bb in SRAM
> + * @vram: bb in VRAM
> + *
> + * arg[2]:
> + *
> + * @sram: target surface in SRAM
> + * @vram: target surface in VRAM
> + */
> +static void long_shader(int fd, struct drm_xe_engine_class_instance *hwe,
> +			bool bb_in_vram, bool target_in_vram)
> +{
> +	const uint64_t target_offset = 0x1a000000;
> +	const uint64_t bb_offset = 0x1b000000;
> +	const size_t bb_size = 32768;
> +	uint32_t vm_id;
> +	uint32_t exec_queue;
> +	const unsigned int instruction_count = 128;
> +	const unsigned int walker_dim_x = 4;
> +	const unsigned int walker_dim_y = 8;
> +	const unsigned int surface_dim_x = 64;
> +	const unsigned int surface_dim_y = instruction_count;
> +	struct gpgpu_shader *shader;
> +	struct intel_buf *buf;
> +	struct intel_bb *ibb;
> +	uint32_t *ptr;
> +	uint64_t bb_region;
> +	uint64_t target_region;
> +
> +	if (bb_in_vram || target_in_vram)
> +		igt_skip_on_f(!xe_has_vram(fd), "Device does not have VRAM.\n");
> +
> +	bb_region = bb_in_vram ? vram_memory(fd, hwe->gt_id) : system_memory(fd);
> +	target_region = target_in_vram ? vram_memory(fd, hwe->gt_id) : system_memory(fd);
> +
> +	buf = intel_buf_create_full(buf_ops_create(fd), 0, surface_dim_x / 4, surface_dim_y,
> +				    32, 0, I915_TILING_NONE, 0, 0, 0, target_region,
> +				    DEFAULT_PAT_INDEX, DEFAULT_MOCS_INDEX);
> +	buf->addr.offset = target_offset;
> +
> +	vm_id = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> +	exec_queue = xe_exec_queue_create(fd, vm_id, hwe, 0);
> +
> +	ibb = intel_bb_create_with_context_in_region(fd, exec_queue, vm_id, NULL, bb_size, bb_region);
> +	intel_bb_remove_object(ibb, ibb->handle, ibb->batch_offset, ibb->size);
> +	intel_bb_add_object(ibb, ibb->handle, ibb->size, bb_offset, ibb->alignment, false);
> +	ibb->batch_offset = bb_offset;
> +
> +	intel_bb_set_lr_mode(ibb, true);
> +
> +	shader = gpgpu_shader_create(fd);
> +	gpgpu_shader__nop(shader);
> +	for (int i = 0; i < instruction_count; i++)
> +		gpgpu_shader__common_target_write_u32(shader, i, LONG_SHADER_VALUE(i));
> +	gpgpu_shader__nop(shader);
> +	gpgpu_shader__eot(shader);
> +
> +	gpgpu_shader_exec(ibb, buf, walker_dim_x, walker_dim_y, shader, NULL, 0, 0);
> +	intel_bb_sync(ibb);
> +
> +	ptr = xe_bo_map(fd, ibb->handle, ibb->size);
> +	igt_assert_f(memmem(ptr, ibb->size, shader->code, shader->size * sizeof(uint32_t)),
> +		     "Could not find kernel in bb!\n");
> +	gem_munmap(ptr, ibb->size);
> +
> +	gpgpu_shader_destroy(shader);
> +
> +	ptr = xe_bo_map(fd, buf->handle, buf->surface[0].size);
> +	for (int i = 0; i < buf->surface[0].size / 4; i += 16)
> +		for (int j = 0; j < 4; j++)
> +			igt_assert(ptr[i + j] == LONG_SHADER_VALUE(i / 16));
> +	gem_munmap(ptr, buf->surface[0].size);
> +
> +	intel_bb_destroy(ibb);
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	xe_vm_destroy(fd, vm_id);
> +	free(buf);
> +}
> +
> +#define is_compute_on_gt(__e, __gt) (((__e)->engine_class == DRM_XE_ENGINE_CLASS_RENDER || \
> +				      (__e)->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) && \
> +				      (__e)->gt_id == (__gt))
> +
> +static struct drm_xe_engine_class_instance *pick_compute(int fd, int gt)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	int count = 0;
> +
> +	xe_for_each_engine(fd, hwe)
> +		if (is_compute_on_gt(hwe, gt))
> +			count++;
> +
> +	xe_for_each_engine(fd, hwe)
> +		if (is_compute_on_gt(hwe, gt) && rand() % count-- == 0)
> +			return hwe;
> +
> +	return NULL;
> +}
> +
> +#define test_gt_render_or_compute(t, fd, __hwe) \
> +	igt_subtest_with_dynamic(t) \
> +		for (int gt = 0; (__hwe = pick_compute(fd, gt)); gt++) \
> +			igt_dynamic_f("%s%d", xe_engine_class_string(__hwe->engine_class), \
> +				      hwe->engine_instance)
> +
>  igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe;
> @@ -378,6 +496,18 @@ igt_main
>  	igt_subtest("persistent")
>  		persistent(fd);
>  
> +	test_gt_render_or_compute("long-shader-bb-sram-target-sram", fd, hwe)
> +		long_shader(fd, hwe, false, false);
> +
> +	test_gt_render_or_compute("long-shader-bb-sram-target-vram", fd, hwe)
> +		long_shader(fd, hwe, false, true);
> +
> +	test_gt_render_or_compute("long-shader-bb-vram-target-sram", fd, hwe)
> +		long_shader(fd, hwe, true, false);
> +
> +	test_gt_render_or_compute("long-shader-bb-vram-target-vram", fd, hwe)
> +		long_shader(fd, hwe, true, true);

I prefer single subtest like 'long-shader-bb-check' with dynamic
subtests which depends on number of accessible memory regions.
In above calls hwe seems to be 'some' engine, which is some dangling
engine selected from previous test. I bet noone will take a look to
your test if some additional will be added in between.

I see you've properly selected vram accessible for gt in the test.
I think you should iterate over all accessible memory regions, especially
if there's more than single gt.

--
Zbigniew

> +
>  	igt_fixture {
>  		xe_device_put(fd);
>  		close(fd);
> -- 
> 2.34.1
> 
