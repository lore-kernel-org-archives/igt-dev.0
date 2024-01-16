Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2079.outbound.protection.outlook.com [40.107.223.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2925910E3E3
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jan 2024 04:18:37 +0000 (UTC)
Message-ID: <4a5c81ae-e562-45a0-bd7c-40f00f777984@amd.com>
Date: Mon, 15 Jan 2024 23:18:14 -0500
Subject: Re: [PATCH 1/2] lib/amdgpu: add secure flag to sdma packet
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, vitaly.prosyak@amd.com,
 Jesse Zhang <jesse.zhang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20240111192553.113902-1-vitaly.prosyak@amd.com>
 <20240115151619.2r65k52bwlaypvbo@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20240115151619.2r65k52bwlaypvbo@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
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


On 2024-01-15 10:16, Kamil Konieczny wrote:
> Hi,
>
> On 2024-01-11 at 14:25:52 -0500, vitaly.prosyak@amd.com wrote:
>> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>
>> The change is required to handle the security flag for
>> trusted memory zone copy operation(TMZ feature).
>> Previously the security test was its own hardcoded version,
>> now we are allowed to use ASIC -the dependent version function
> ------------------------------------- ^^^^^^^^^
> Small nit:
> 'dependant' may be misspelled - perhaps 'dependent'?
Thanks for paying attention to this, yes, you are correct, the 'dependent' word is required.

The main difference is that a 'dependant' is a person, whereas a 'dependent' is an adjective describing a status and that is what we want.

Vitaly

>
> Regards,
> Kamil
>
>> to create the SDMA packet.
>>
>> v2 : added description to commit message (Kamil)
>>
>> Cc: Jesse Zhang <jesse.zhang@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Christian Koenig <christian.koenig@amd.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>
>> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
>> Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>
>> ---
>>  lib/amdgpu/amd_ip_blocks.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
>> index 1adea6987..a7ccfa38b 100644
>> --- a/lib/amdgpu/amd_ip_blocks.c
>> +++ b/lib/amdgpu/amd_ip_blocks.c
>> @@ -139,7 +139,7 @@ sdma_ring_copy_linear(const struct amdgpu_ip_funcs *func,
>>  	} else {
>>  		context->pm4[i++] = SDMA_PACKET(SDMA_OPCODE_COPY,
>>  				       SDMA_COPY_SUB_OPCODE_LINEAR,
>> -				       0);
>> +					context->secure ? 0x4 : 0);
>>  		if (func->family_id >= AMDGPU_FAMILY_AI)
>>  			context->pm4[i++] = context->write_length - 1;
>>  		else
>> -- 
>> 2.25.1
>>
