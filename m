Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8461610FDF8
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Jul 2022 20:26:24 +0000 (UTC)
Message-ID: <c74dde7f-c50b-06a1-ac4e-8615d3ae428f@amd.com>
Date: Fri, 22 Jul 2022 16:26:18 -0400
Content-Language: en-US
To: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
References: <20220721003922.3679-1-vitaly.prosyak@amd.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20220721003922.3679-1-vitaly.prosyak@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/7] lib/amdgpu: increase number of resources
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: alexander.deucher@amd.com, igt-dev@lists.freedesktop.org,
 marek.olsak@amd.com, christian.koenig@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lakshmi,

I think we have a false positive result for this patchset. Could you 
trigger the CI again?

Btw, this is the patchwork link:

    https://patchwork.freedesktop.org/series/106558/

Thanks
Siqueira

On 2022-07-20 20:39, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> Add arrays of bo's for VRAM and GTT.
> Eviction test uses 4 bo resources.
> 
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>   lib/amdgpu/amd_ip_blocks.h | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
> index cb7d14747..c16ad1794 100644
> --- a/lib/amdgpu/amd_ip_blocks.h
> +++ b/lib/amdgpu/amd_ip_blocks.h
> @@ -58,11 +58,13 @@ struct amdgpu_ring_context {
>   
>   	amdgpu_bo_handle bo;
>   	amdgpu_bo_handle bo2;
> +	amdgpu_bo_handle boa_vram[2];
> +	amdgpu_bo_handle boa_gtt[2];
>   
>   	amdgpu_context_handle context_handle;
>   	struct drm_amdgpu_info_hw_ip hw_ip_info;  /* result of amdgpu_query_hw_ip_info */
>   
> -	amdgpu_bo_handle resources[2]; /* amdgpu_bo_alloc_and_map */
> +	amdgpu_bo_handle resources[4]; /* amdgpu_bo_alloc_and_map */
>   	amdgpu_va_handle va_handle;    /* amdgpu_bo_alloc_and_map */
>   	amdgpu_va_handle va_handle2;   /* amdgpu_bo_alloc_and_map */
>   
