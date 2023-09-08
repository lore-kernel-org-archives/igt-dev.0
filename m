Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56FB10E91A
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 17:18:13 +0000 (UTC)
Date: Fri, 8 Sep 2023 19:18:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230908171809.vrylau75am6iqxn5@kamilkon-desk.igk.intel.com>
References: <20230908025038.217934-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230908025038.217934-1-vitaly.prosyak@amd.com>
Subject: Re: [igt-dev] [PATCH] lib/amdgpu: fix typo in function
 compare_pattern
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Vitaly,

some nit about description: 
[PATCH] lib/amdgpu: fix typo in function
----------------------- ^
looks rather like fixing a bug

On 2023-09-07 at 22:50:38 -0400, vitaly.prosyak@amd.com wrote:
> From: Jesse Zhang <jesse.zhang@amd.com>
> 
>  In function compare_pattern check the destination buffer (bo2_cpu),
>  instead of source buffer(bo_cpu).
>  Add validation of the return value in the eviction test.
-- ^^^^^^^^^^^^^^
And this is unrelated to your desription and unexpected change
in other test, imho should be separate patch.

Regards,
Kamil

> 
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  lib/amdgpu/amd_ip_blocks.c | 2 +-
>  tests/amdgpu/amd_basic.c   | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
> index be9ff38c6..7f8d4a4cd 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -296,7 +296,7 @@ x_compare_pattern(const struct amdgpu_ip_funcs *func,
>  	int num_compare = ring_context->write_length/div;
>  
>  	while (i < num_compare) {
> -		if (ring_context->bo_cpu[i++] != func->pattern) {
> +		if (ring_context->bo2_cpu[i++] != func->pattern) {
>  			ret = -1;
>  			break;
>  		}
> diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
> index dfe11995f..e7a42a335 100644
> --- a/tests/amdgpu/amd_basic.c
> +++ b/tests/amdgpu/amd_basic.c
> @@ -411,6 +411,7 @@ amdgpu_bo_eviction_test(amdgpu_device_handle device_handle)
>  			amdgpu_test_exec_cs_helper(device_handle, ip_block->type, ring_context);
>  			/* fulfill PM4: test DMA copy linear */
>  			r = ip_block->funcs->compare_pattern(ip_block->funcs, ring_context, sdma_write_length);
> +			igt_assert_eq(r, 0);
>  			amdgpu_bo_unmap_and_free(ring_context->bo, ring_context->va_handle, ring_context->bo_mc,
>  						 ring_context->write_length);
>  			amdgpu_bo_unmap_and_free(ring_context->bo2, ring_context->va_handle2, ring_context->bo_mc2,
> -- 
> 2.25.1
> 
