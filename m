Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17CAD10E51F
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Jul 2022 06:20:53 +0000 (UTC)
Message-ID: <f1c609cc-4453-13e4-fa78-f1ca5cbd4354@amd.com>
Date: Fri, 8 Jul 2022 08:20:44 +0200
Content-Language: en-US
To: vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org
References: <20220707182811.3805-1-vitaly.prosyak@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220707182811.3805-1-vitaly.prosyak@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/7] lib/amdgpu: increase number of resources
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: alexander.deucher@amd.com, marek.olsak@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Am 07.07.22 um 20:28 schrieb vitaly.prosyak@amd.com:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> Add arrays of bo's for VRAM and GTT.
> Eviction test uses 4 bo resources.
>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

Of hand that looks totally clean and well organized.

Feel free to add an Acked-by: Christian König <christian.koenig@amd.com> 
to the whole series.

Regards,
Christian.

> ---
>   lib/amdgpu/amd_ip_blocks.h | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
> index cb7d1474..c16ad179 100644
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
