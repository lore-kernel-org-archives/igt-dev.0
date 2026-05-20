Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D5ACD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 07:55:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A410310E099;
	Wed, 20 May 2026 07:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WTLShn02";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4271D10E099
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 07:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779263738; x=1810799738;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=QnajomMbAI3Vtm4GPkFl3aH/in/pSkw4TgBRE0tBaw0=;
 b=WTLShn02cgTIYgmiBKl8gXvlswEY2m3gReGl0whriefAKV20nE0le+6C
 MXwh1bTUvTMKVUamDF7uHErC/kgScIWMBKgLd42BQqbi8iFs5qaNJrCwZ
 eKZ+xb0GMu4sIzNun5i0TdqHJyBnbY2WaNxNAkYPs7qAQPMma948ZJ+Sx
 6ZskNPIiF4S2ljHC4tkLrUCClHyLj4niaR9Z2omNOpZM3ZlLcSEo9K7+m
 cLeLhuXrOmOyNfyF0cZCV5T3pj9AHxKfCZayTuyVFX/Lpf60ay26gVX1G
 Ke9+rIOalLUFK7yLHISjNK9lhCjEQoKIPjXU5nWR4T/GgQzz34BFB9OpG Q==;
X-CSE-ConnectionGUID: mZNCSWLdRYWP7h6ZwSMftg==
X-CSE-MsgGUID: jsnyGuVkS+yxOGeRcz0N1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="82725686"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="82725686"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 00:55:38 -0700
X-CSE-ConnectionGUID: dVDYHWR4TBC/us01nX9fNw==
X-CSE-MsgGUID: WUTW8Kn6Q+W9D5YXPtrTyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="244068330"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.148])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 00:55:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Caden Chien <chih-wei.chien@amd.com>, igt-dev@lists.freedesktop.org,
 vitaly.prosyak@amd.com, jesse.zhang@amd.com
Cc: Solomon.Chiu@amd.com, Peyton.Lee@amd.com, HaoPing.Liu@amd.com,
 Yu.Wang4@amd.com, Caden Chien <chih-wei.chien@amd.com>
Subject: Re: [PATCH i-g-t 3/3] tests/amdgpu/vpe: refactor VPE1 blit test
In-Reply-To: <20260520073320.14656-4-chih-wei.chien@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260520073320.14656-1-chih-wei.chien@amd.com>
 <20260520073320.14656-4-chih-wei.chien@amd.com>
Date: Wed, 20 May 2026 10:55:31 +0300
Message-ID: <666767d95d982b77158724018ae5d2e830e09153@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 20 May 2026, Caden Chien <chih-wei.chien@amd.com> wrote:
> Commands are moved to new header file to clean up source file. New
> commands added in the future will follow the same way, so source file
> won't be flooded with commands.
>
> Frame size setup is moved into test case to be per test case, instead of
> global, as more tests will be added in the future. Variable naming are
> revised to align with coding style guide and be consistent with VPE2 blit
> test.
>
> Signed-off-by: Caden Chien <chih-wei.chien@amd.com>
> ---
>  tests/amdgpu/amd_vpe.c | 88 ++++++++++++++----------------------------
>  tests/amdgpu/amd_vpe.h | 36 +++++++++++++++++
>  2 files changed, 65 insertions(+), 59 deletions(-)
>
> diff --git a/tests/amdgpu/amd_vpe.c b/tests/amdgpu/amd_vpe.c
> index d5b9f403e..3a1eab9fc 100644
> --- a/tests/amdgpu/amd_vpe.c
> +++ b/tests/amdgpu/amd_vpe.c
> @@ -14,41 +14,6 @@ IGT_TEST_DESCRIPTION("Test VPE functionality");
>  
>  #define MAX_RESOURCES		16
>  
> -#define PLANE_WIDTH		1024
> -#define PLANE_HEIGHT		256
> -#define PLANE_SIZE		(PLANE_WIDTH*PLANE_HEIGHT*4)
> -
> -#define SRC_PLANE_PATTERN	0x12345678
> -#define DST_PLANE_PATTERN	0xff123456
> -
> -static uint32_t vpe_descriptor[] = {
> -0x00000001, 0x33002200, 0xff000021, 0x00000003, 0x33002234, 0xff000021, 0x33002328, 0xff000021,
> -0x33002384, 0xff000021, 0x330023c0, 0xff000021,
> -};
> -
> -static uint32_t vpe_config[] = {
> -0x00000002, 0x00000000, 0xbeefbe00, 0xff005678, 0x000003ff, 0x00000000, 0x00ff43ff, 0x00000000,
> -0xbeefbe00, 0xff005679, 0x000003ff, 0x00000000, 0x00ff43ff, 0x003b0003, 0x00047808, 0x00000809,
> -0x0004780c, 0x000000e4, 0x00047d10, 0x00000009, 0x00047d14, 0x00000101, 0x00047d18, 0x00000000,
> -0x00047d1c, 0x00000000, 0x00047d20, 0x00000000, 0x00047d24, 0x0001f010, 0x00047d28, 0x0001f010,
> -0x00047d2c, 0x0001f010, 0x00547ee9, 0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000,
> -0x00002000, 0x00047ee4, 0x00000001, 0x00047ee0, 0x00000000, 0x00047f24, 0x00000000, 0x00047fc4,
> -0x00000000, 0x00547f05, 0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000, 0x00002000,
> -0x00047f00, 0x00000001, 0x00049700, 0x00000000, 0x00049704, 0x0000000f, 0x00049f30, 0x00000000,
> -0x00049708, 0x00000000, 0x0004970c, 0xffff0462, 0x0004a208, 0x00000000, 0x0004971c, 0x00000000,
> -0x00047fc0, 0x0001f000, 0x00150003, 0x00047df8, 0x00000001, 0x00047dfc, 0x00000001, 0x00047da8,
> -0x00000006, 0x00047e18, 0x00000000, 0x0004970c, 0xffff0422, 0x00049710, 0x0001f000, 0x00049714,
> -0x0001f000, 0x00049718, 0x0001f000, 0x00049720, 0x00000000, 0x00049724, 0x00000000, 0x00049728,
> -0x00000000, 0x000d0003, 0x00047810, 0x00000000, 0x00047814, 0x01000400, 0x00047818, 0x00000000,
> -0x0004781c, 0x01000400, 0x00047e00, 0x00000000, 0x00047e04, 0x01000400, 0x00047e08, 0x01000400,
> -0x00280003, 0x00047820, 0x00000036, 0x00047824, 0x0960f015, 0x0004972c, 0x00000014, 0x0004972c,
> -0x00000014, 0x0004972c, 0x00000014, 0x00049f90, 0x00000000, 0x00049f94, 0x00000001, 0x00549f99,
> -0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000, 0x00002000, 0x00049850, 0x00000000,
> -0x00049f34, 0x00000000, 0x00049f38, 0x02fff000, 0x00049f3c, 0x00fff000, 0x00049f40, 0x00fff000,
> -0x0004aba0, 0xffff0000, 0x0004aba0, 0xffff0000, 0x0004aacc, 0x00000000, 0x0004aad4, 0x00000013,
> -0x0004aad4, 0x00000013,
> -};
> -
>  static bool is_vpe_tests_enabled(amdgpu_device_handle device_handle,
>  		struct mmd_shared_context *shared_context)
>  {
> @@ -179,17 +144,22 @@ static int check_rgba8888_hmirror(void *addr, uint32_t width, uint32_t height)
>  static void amdgpu_cs_vpe1_csc(amdgpu_device_handle device_handle,
>  				struct mmd_context *context)
>  {
> -	const uint32_t vpep_config_offsets[] = {0x34, 0x128, 0x184, 0x1c0};
> -	struct amdgpu_mmd_bo vpe_config_bo, src_plane_bo, dst_plane_bo;
>  	int r;
> +	uint32_t frame_size;
> +	struct amdgpu_mmd_bo vpep_cmd_bo, src_plane_bo, dst_plane_bo;
> +	/* same height and pitch for input and output */
> +	const uint32_t height = 256;
> +	const uint32_t pitch = 1024;
> +	const uint32_t vpep_config_offsets[] = { 0x34, 0x128, 0x184, 0x1c0, };
>  
> +	frame_size = pitch * height * 4;
>  	context->num_resources = 0;
>  
> -	alloc_resource(device_handle, &vpe_config_bo, sizeof(vpe_config), AMDGPU_GEM_DOMAIN_GTT);
> -	alloc_resource(device_handle, &src_plane_bo, PLANE_SIZE, AMDGPU_GEM_DOMAIN_GTT);
> -	alloc_resource(device_handle, &dst_plane_bo, PLANE_SIZE, AMDGPU_GEM_DOMAIN_GTT);
> +	alloc_resource(device_handle, &vpep_cmd_bo, sizeof(vpep_csc_cmd), AMDGPU_GEM_DOMAIN_GTT);
> +	alloc_resource(device_handle, &src_plane_bo, frame_size, AMDGPU_GEM_DOMAIN_GTT);
> +	alloc_resource(device_handle, &dst_plane_bo, frame_size, AMDGPU_GEM_DOMAIN_GTT);
>  
> -	r = amdgpu_bo_cpu_map(vpe_config_bo.handle, (void **)&vpe_config_bo.ptr);
> +	r = amdgpu_bo_cpu_map(vpep_cmd_bo.handle, (void **)&vpep_cmd_bo.ptr);
>  	igt_assert_eq(r, 0);
>  
>  	r = amdgpu_bo_cpu_map(src_plane_bo.handle, (void **)&src_plane_bo.ptr);
> @@ -198,45 +168,45 @@ static void amdgpu_cs_vpe1_csc(amdgpu_device_handle device_handle,
>  	r = amdgpu_bo_cpu_map(dst_plane_bo.handle, (void **)&dst_plane_bo.ptr);
>  	igt_assert_eq(r, 0);
>  
> -	context->resources[context->num_resources++] = vpe_config_bo.handle;
> +	context->resources[context->num_resources++] = vpep_cmd_bo.handle;
>  	context->resources[context->num_resources++] = src_plane_bo.handle;
>  	context->resources[context->num_resources++] = dst_plane_bo.handle;
>  
>  	// plane config gpu addr
> -	*(uint64_t *)(vpe_descriptor + 1) = vpe_config_bo.addr;
> +	*(uint64_t *)(vpec_csc_cmd + 1) = vpep_cmd_bo.addr;
>  	// vpep config0 gpu addr
> -	*(uint64_t *)(vpe_descriptor + 4) = vpe_config_bo.addr + vpep_config_offsets[0];
> +	*(uint64_t *)(vpec_csc_cmd + 4) = vpep_cmd_bo.addr + vpep_config_offsets[0];
>  	// vpep config1 gpu addr
> -	*(uint64_t *)(vpe_descriptor + 6) = vpe_config_bo.addr + vpep_config_offsets[1];
> +	*(uint64_t *)(vpec_csc_cmd + 6) = vpep_cmd_bo.addr + vpep_config_offsets[1];
>  	// vpep config2 gpu addr
> -	*(uint64_t *)(vpe_descriptor + 8) = vpe_config_bo.addr + vpep_config_offsets[2];
> +	*(uint64_t *)(vpec_csc_cmd + 8) = vpep_cmd_bo.addr + vpep_config_offsets[2];
>  	// vpep config3 gpu addr
> -	*(uint64_t *)(vpe_descriptor + 10) = vpe_config_bo.addr + vpep_config_offsets[3];
> +	*(uint64_t *)(vpec_csc_cmd + 10) = vpep_cmd_bo.addr + vpep_config_offsets[3];
>  
> -	memset(src_plane_bo.ptr, 0, PLANE_SIZE);
> -	memset(dst_plane_bo.ptr, 0, PLANE_SIZE);
> -	create_rgba8888(src_plane_bo.ptr, PLANE_WIDTH, PLANE_HEIGHT);
> +	memset(src_plane_bo.ptr, 0, frame_size);
> +	memset(dst_plane_bo.ptr, 0, frame_size);
> +	create_rgba8888(src_plane_bo.ptr, pitch, height);
>  
>  	/* gpu address of src */
> -	*(uint64_t *)(vpe_config + 2) = src_plane_bo.addr;
> +	*(uint64_t *)(vpep_csc_cmd + 2) = src_plane_bo.addr;
>  	/* gpu address of dst */
> -	*(uint64_t *)(vpe_config + 8) = dst_plane_bo.addr;
> +	*(uint64_t *)(vpep_csc_cmd + 8) = dst_plane_bo.addr;
>  
> -	memset(vpe_config_bo.ptr, 0, sizeof(vpe_config));
> -	memcpy(vpe_config_bo.ptr, vpe_config, sizeof(vpe_config));
> +	memset(vpep_cmd_bo.ptr, 0, sizeof(vpep_csc_cmd));
> +	memcpy(vpep_cmd_bo.ptr, vpep_csc_cmd, sizeof(vpep_csc_cmd));
>  
>  	memset(context->ib_cpu, 0, IB_SIZE);
> -	memcpy(context->ib_cpu, vpe_descriptor, sizeof(vpe_descriptor));
> +	memcpy(context->ib_cpu, vpec_csc_cmd, sizeof(vpec_csc_cmd));
>  
>  	context->resources[context->num_resources++] = context->ib_handle;
>  
> -	r = submit(device_handle, context, sizeof(vpe_descriptor)/4, AMDGPU_HW_IP_VPE);
> +	r = submit(device_handle, context, sizeof(vpec_csc_cmd) / 4, AMDGPU_HW_IP_VPE);
>  	igt_assert_eq(r, 0);
>  
> -	r = check_argb8888(dst_plane_bo.ptr, PLANE_WIDTH, PLANE_HEIGHT);
> +	r = check_argb8888(dst_plane_bo.ptr, pitch, height);
>  	igt_assert_eq(r, 0);
>  
> -	r = amdgpu_bo_cpu_unmap(vpe_config_bo.handle);
> +	r = amdgpu_bo_cpu_unmap(vpep_cmd_bo.handle);
>  	igt_assert_eq(r, 0);
>  
>  	r = amdgpu_bo_cpu_unmap(src_plane_bo.handle);
> @@ -245,7 +215,7 @@ static void amdgpu_cs_vpe1_csc(amdgpu_device_handle device_handle,
>  	r = amdgpu_bo_cpu_unmap(dst_plane_bo.handle);
>  	igt_assert_eq(r, 0);
>  
> -	free_resource(&vpe_config_bo);
> +	free_resource(&vpep_cmd_bo);
>  	free_resource(&src_plane_bo);
>  	free_resource(&dst_plane_bo);
>  }
> diff --git a/tests/amdgpu/amd_vpe.h b/tests/amdgpu/amd_vpe.h
> index 86ad57d14..767750db0 100644
> --- a/tests/amdgpu/amd_vpe.h
> +++ b/tests/amdgpu/amd_vpe.h
> @@ -8,6 +8,42 @@
>  
>  #include <amdgpu.h>
>  
> +/* color space conversion commands
> + * source:      1024(pitch 1024) x 256 RGBA
> + * destination: 1024(pitch 1024) x 256 ARGB
> + */
> +
> +#define SRC_PLANE_PATTERN	0x12345678
> +#define DST_PLANE_PATTERN	0xff123456
> +
> +static uint32_t vpec_csc_cmd[] = {

IMO it's bad form to define arrays in header files.

If you ever need this header in another source file, you'll end up with
the arrays in each.

If you want to declutter a file, the better approach, while a bit more
work, is usually to add another .c file with the data, and provide
functions for access.


BR,
Jani.



> +0x00000001, 0x33002200, 0xff000021, 0x00000003, 0x33002234, 0xff000021, 0x33002328, 0xff000021,
> +0x33002384, 0xff000021, 0x330023c0, 0xff000021,
> +};
> +
> +static uint32_t vpep_csc_cmd[] = {
> +0x00000002, 0x00000000, 0xbeefbe00, 0xff005678, 0x000003ff, 0x00000000, 0x00ff43ff, 0x00000000,
> +0xbeefbe00, 0xff005679, 0x000003ff, 0x00000000, 0x00ff43ff, 0x003b0003, 0x00047808, 0x00000809,
> +0x0004780c, 0x000000e4, 0x00047d10, 0x00000009, 0x00047d14, 0x00000101, 0x00047d18, 0x00000000,
> +0x00047d1c, 0x00000000, 0x00047d20, 0x00000000, 0x00047d24, 0x0001f010, 0x00047d28, 0x0001f010,
> +0x00047d2c, 0x0001f010, 0x00547ee9, 0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000,
> +0x00002000, 0x00047ee4, 0x00000001, 0x00047ee0, 0x00000000, 0x00047f24, 0x00000000, 0x00047fc4,
> +0x00000000, 0x00547f05, 0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000, 0x00002000,
> +0x00047f00, 0x00000001, 0x00049700, 0x00000000, 0x00049704, 0x0000000f, 0x00049f30, 0x00000000,
> +0x00049708, 0x00000000, 0x0004970c, 0xffff0462, 0x0004a208, 0x00000000, 0x0004971c, 0x00000000,
> +0x00047fc0, 0x0001f000, 0x00150003, 0x00047df8, 0x00000001, 0x00047dfc, 0x00000001, 0x00047da8,
> +0x00000006, 0x00047e18, 0x00000000, 0x0004970c, 0xffff0422, 0x00049710, 0x0001f000, 0x00049714,
> +0x0001f000, 0x00049718, 0x0001f000, 0x00049720, 0x00000000, 0x00049724, 0x00000000, 0x00049728,
> +0x00000000, 0x000d0003, 0x00047810, 0x00000000, 0x00047814, 0x01000400, 0x00047818, 0x00000000,
> +0x0004781c, 0x01000400, 0x00047e00, 0x00000000, 0x00047e04, 0x01000400, 0x00047e08, 0x01000400,
> +0x00280003, 0x00047820, 0x00000036, 0x00047824, 0x0960f015, 0x0004972c, 0x00000014, 0x0004972c,
> +0x00000014, 0x0004972c, 0x00000014, 0x00049f90, 0x00000000, 0x00049f94, 0x00000001, 0x00549f99,
> +0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000, 0x00002000, 0x00049850, 0x00000000,
> +0x00049f34, 0x00000000, 0x00049f38, 0x02fff000, 0x00049f3c, 0x00fff000, 0x00049f40, 0x00fff000,
> +0x0004aba0, 0xffff0000, 0x0004aba0, 0xffff0000, 0x0004aacc, 0x00000000, 0x0004aad4, 0x00000013,
> +0x0004aad4, 0x00000013,
> +};
> +
>  /* horizontal mirror commands
>   * source:      1024(pitch 1024) x 256 RGBA
>   * destination: 1024(pitch 1024) x 256 RGBA

-- 
Jani Nikula, Intel
