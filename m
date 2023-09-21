Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84EFA10E149
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Sep 2023 17:16:28 +0000 (UTC)
Message-ID: <f8b4d2fa-e2e5-4b6e-acb5-247edef5a475@amd.com>
Date: Thu, 21 Sep 2023 13:16:20 -0400
Content-Language: en-CA, en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, vitaly.prosyak@amd.com,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20230920223905.268940-1-vitaly.prosyak@amd.com>
 <20230921124631.yfxjfmfkou7gwn6n@kamilkon-desk.igk.intel.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20230921124631.yfxjfmfkou7gwn6n@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/amdgpu: add GFX11 to tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-09-21 08:46, Kamil Konieczny wrote:
> Hi Vitaly,
> 
> On 2023-09-20 at 18:39:05 -0400, vitaly.prosyak@amd.com wrote:
>> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>
>> Add GFX11 to basic and GPU reset tests.
>> Improve GPU reset tests by validating flags, if no reset or
>> reset is still in progress then avoid asserting the status.
>>
>> Cc: Jesse Zhang <Jesse.Zhang@amd.com>
>> Cc: Luben Tuikov <luben.tuikov@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Christian Koenig <christian.koenig@amd.com>
>>
>> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
>> ---
>>  include/drm-uapi/amdgpu_drm.h |  2 ++
>>  lib/amdgpu/amd_dispatch.c     | 21 +++++++++++++++++----
>>  2 files changed, 19 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
>> index 0cbd1540a..323137f42 100644
>> --- a/include/drm-uapi/amdgpu_drm.h
>> +++ b/include/drm-uapi/amdgpu_drm.h
>> @@ -225,6 +225,8 @@ union drm_amdgpu_bo_list {
>>  /* indicate some errors are detected by RAS */
>>  #define AMDGPU_CTX_QUERY2_FLAGS_RAS_CE   (1<<3)
>>  #define AMDGPU_CTX_QUERY2_FLAGS_RAS_UE   (1<<4)
>> +/* indicate that the reset hasn't completed yet */
>> +#define AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS (1<<5)
>>  
>>  /* Context priority level */
>>  #define AMDGPU_CTX_PRIORITY_UNSET       -2048
>> diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
>> index f17240f5c..b337646d3 100644
>> --- a/lib/amdgpu/amd_dispatch.c
>> +++ b/lib/amdgpu/amd_dispatch.c
>> @@ -103,6 +103,8 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
>>  		base_cmd->emit(base_cmd, 0x74fac);
>>  	else if (version == 10)
>>  		base_cmd->emit(base_cmd, 0x1104bfac);
>> +	else if (version == 11)
>> +		base_cmd->emit(base_cmd, 0x1003dfac);
>>  
>>  	/* Sets a range of pixel shader constants */
>>  	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
>> @@ -351,9 +353,9 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
>>  	void *ptr_shader;
>>  	unsigned char *ptr_src;
>>  	uint32_t *ptr_cmd;
>> -	uint64_t mc_address_src, mc_address_dst, mc_address_shader, mc_address_cmd;
>> +	uint64_t mc_address_src, mc_address_dst, mc_address_shader, mc_address_cmd, reset_flags;
>>  	amdgpu_va_handle va_src, va_dst, va_shader, va_cmd;
>> -	int r;
>> +	int r, r2;
>>  
>>  	int bo_dst_size = 0x4000000;
>>  	int bo_shader_size = 0x400000;
>> @@ -425,6 +427,8 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
>>  		base_cmd->emit(base_cmd, 0x74fac);
>>  	else if (version == 10)
>>  		base_cmd->emit(base_cmd, 0x1104bfac);
>> +	else if (version == 11)
>> +		base_cmd->emit(base_cmd, 0x1003dfac);
>>  
>>  
>>  	/* Writes the UAV constant data to the SGPRs. */
>> @@ -485,7 +489,16 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
>>  
>>  	r = amdgpu_cs_query_reset_state(context_handle, &hang_state, &hangs);
>>  	igt_assert_eq(r, 0);
>> -	igt_assert_eq(hang_state, gpu_reset_status_equel);
>> +	r2 = amdgpu_cs_query_reset_state2(context_handle, &reset_flags);
>> +	igt_assert_eq(r2, 0);
>> +
>> +	if (!(reset_flags == 0 ||
>> +		  reset_flags & AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS)) {
>> +		/*
>> +		 *  Check reset_state only when reset is occured and not in progress
> 
> Spotted by checkpatch.pl:
> 
> WARNING: 'occured' may be misspelled - perhaps 'occurred'?
> #79: FILE: lib/amdgpu/amd_dispatch.c:498:
> +                *  Check reset_state only when reset is occured and not in progress
>                                                          ^^^^^^^
> Btw your patch didn't build on debian image, see gitlab warning.

Good catch!

1. Now, since we're fixing this comment, we might as well say:

	/* If we're in reset and reset hasn't occurred, then check
	 * that the hang state is equal to the GPU reset status and
	 * assert otherwise.
	 */
	igt_assert_eq(hang_state, gpu_reset_status_equel);

2. Could we please also fix the spelling of,

gpu_reset_status_equel --> gpu_reset_status_equal ?

It's just not a good impression when there are spelling mistakes in code.

Thanks!
-- 
Regards,
Luben
