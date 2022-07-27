Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81C494BF3
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Jul 2022 15:47:13 +0000 (UTC)
Message-ID: <aaceb82a-1465-d1c0-b8bd-73a5d1d99a84@amd.com>
Date: Wed, 27 Jul 2022 11:47:10 -0400
Content-Language: en-US
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
References: <20220721003922.3679-1-vitaly.prosyak@amd.com>
 <c74dde7f-c50b-06a1-ac4e-8615d3ae428f@amd.com>
 <DM4PR11MB62138CF424E5F9EF4B03F51CEC959@DM4PR11MB6213.namprd11.prod.outlook.com>
 <DM5PR12MB1897E27D428388B696C4407D81979@DM5PR12MB1897.namprd12.prod.outlook.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <DM5PR12MB1897E27D428388B696C4407D81979@DM5PR12MB1897.namprd12.prod.outlook.com>
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Olsak,
 Marek" <Marek.Olsak@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Thanks Lakshmi for re-report.

Vitaly,
I merged your changes in the upstream, see:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commits/master

Thanks
Siqueira

On 2022-07-26 23:14, Prosyak, Vitaly wrote:
> [AMD Official Use Only - General]
> 
> 
> Hi guys
> 
> What is wrong with the following patches:
> https://patchwork.freedesktop.org/series/106558/ 
> <https://patchwork.freedesktop.org/series/106558/>
> 
> Thanks in advance
> 
> Vitaly
> ------------------------------------------------------------------------
> *From:* Vudum, Lakshminarayana <lakshminarayana.vudum@intel.com>
> *Sent:* Monday, July 25, 2022 12:26 AM
> *To:* Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>
> *Cc:* Olsak, Marek <Marek.Olsak@amd.com>; Koenig, Christian 
> <Christian.Koenig@amd.com>; Deucher, Alexander 
> <Alexander.Deucher@amd.com>; igt-dev@lists.freedesktop.org 
> <igt-dev@lists.freedesktop.org>; Prosyak, Vitaly <Vitaly.Prosyak@amd.com>
> *Subject:* RE: [PATCH 1/7] lib/amdgpu: increase number of resources
> Re-reported.
> 
> -----Original Message-----
> From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
> Sent: Friday, July 22, 2022 1:26 PM
> To: Vudum, Lakshminarayana <lakshminarayana.vudum@intel.com>
> Cc: marek.olsak@amd.com; christian.koenig@amd.com; 
> alexander.deucher@amd.com; igt-dev@lists.freedesktop.org; 
> vitaly.prosyak@amd.com
> Subject: Re: [PATCH 1/7] lib/amdgpu: increase number of resources
> 
> Hi Lakshmi,
> 
> I think we have a false positive result for this patchset. Could you 
> trigger the CI again?
> 
> Btw, this is the patchwork link:
> 
> https://patchwork.freedesktop.org/series/106558/ 
> <https://patchwork.freedesktop.org/series/106558/>> 
> Thanks
> Siqueira
> 
> On 2022-07-20 20:39, vitaly.prosyak@amd.com wrote:
>> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>> 
>> Add arrays of bo's for VRAM and GTT.
>> Eviction test uses 4 bo resources.
>> 
>> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
>> ---
>>   lib/amdgpu/amd_ip_blocks.h | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>> 
>> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h 
>> index cb7d14747..c16ad1794 100644
>> --- a/lib/amdgpu/amd_ip_blocks.h
>> +++ b/lib/amdgpu/amd_ip_blocks.h
>> @@ -58,11 +58,13 @@ struct amdgpu_ring_context {
>>   
>>        amdgpu_bo_handle bo;
>>        amdgpu_bo_handle bo2;
>> +     amdgpu_bo_handle boa_vram[2];
>> +     amdgpu_bo_handle boa_gtt[2];
>>   
>>        amdgpu_context_handle context_handle;
>>        struct drm_amdgpu_info_hw_ip hw_ip_info;  /* result of 
>> amdgpu_query_hw_ip_info */
>>   
>> -     amdgpu_bo_handle resources[2]; /* amdgpu_bo_alloc_and_map */
>> +     amdgpu_bo_handle resources[4]; /* amdgpu_bo_alloc_and_map */
>>        amdgpu_va_handle va_handle;    /* amdgpu_bo_alloc_and_map */
>>        amdgpu_va_handle va_handle2;   /* amdgpu_bo_alloc_and_map */
>>   
> 
