Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85B610E6C7
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jan 2024 00:39:24 +0000 (UTC)
Message-ID: <95c141f0-ed84-42ac-abf9-5c6e9e0404f2@amd.com>
Date: Wed, 10 Jan 2024 19:39:16 -0500
Subject: Re: [PATCH i-g-t] tests/amd_security: fix secure bounce test issue
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20231204030007.326044-1-jesse.zhang@amd.com>
 <DM4PR12MB51524419519645808B321A18E3692@DM4PR12MB5152.namprd12.prod.outlook.com>
 <98f0eaf7-a449-437b-a3d5-1d2e21f5137c@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <98f0eaf7-a449-437b-a3d5-1d2e21f5137c@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 2024-01-10 05:15, Christian König wrote:
>  From coding style etc it looks good and of hand it seems to make sense.
>
> But I don't understand the background of the test and why that direction 
> needs to be reverted.
>
> So Vitaly can you take a look?
Hi Christian,

The issue was real.
The typo was hidden in the fact that the same pattern was used for
both buffers and even when the second copy did not occur due to an
incorrect address, the problem did not pop up. To address the issue

i use the second pattern for the second copy.

I reworked and posted Jesse's finding with 2 patches. There is some improvement like using ASIC-dependent linear copy function vs hard coded earlier.

Thanks, Vitaly

>
> Thanks,
> Christian.
>
> Am 10.01.24 um 10:13 schrieb Zhang, Jesse(Jie):
>> [AMD Official Use Only - General]
>>
>> Ping ...
>> Can anyone help review this.
>> -----Original Message-----
>> From: Jesse Zhang <jesse.zhang@amd.com>
>> Sent: Monday, December 4, 2023 11:00 AM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Tuikov, Luben <Luben.Tuikov@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>; Kamil Konieczny <kamil.konieczny@linux.intel.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>
>> Subject: [PATCH i-g-t] tests/amd_security: fix secure bounce test issue
>>
>> When it copy from scr (bo) to destination (bo2), and move bo2 from vram to gtt.
>> Then it need to copy from bo2(src)
>> to bo (destination) for verification.
>>
>> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>> Cc: Luben Tuikov <luben.tuikov@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Christian Koenig <christian.koenig@amd.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>
>> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
>> ---
>>   tests/amdgpu/amd_security.c | 17 ++++++++++++-----
>>   1 file changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c index d1146a7ce..7fb6df3b6 100644
>> --- a/tests/amdgpu/amd_security.c
>> +++ b/tests/amdgpu/amd_security.c
>> @@ -99,7 +99,7 @@ static void
>>   amdgpu_bo_lcopy(amdgpu_device_handle device,
>>                  struct amdgpu_ring_context *ring_context,
>>                  const struct amdgpu_ip_block_version *ip_block, uint32_t size,
>> -               uint32_t secure)
>> +               uint32_t secure, int direction)
>>   {
>>          ring_context->pm4 = calloc(PACKET_LCOPY_SIZE, sizeof(*ring_context->pm4));
>>          ring_context->secure = secure;
>> @@ -108,8 +108,15 @@ amdgpu_bo_lcopy(amdgpu_device_handle device,
>>          ring_context->res_cnt = 2;
>>          igt_assert(ring_context->pm4);
>>
>> -       amdgpu_sdma_lcopy(ring_context->pm4, ring_context->bo_mc2,
>> -                       ring_context->bo_mc, size, secure);
>> +       if (direction) {
>> +               /* copy from bo2 to bo */
>> +               amdgpu_sdma_lcopy(ring_context->pm4, ring_context->bo_mc,
>> +                               ring_context->bo_mc2, size, secure);
>> +       } else {
>> +               /* copy from bo to bo bo2 */
>> +               amdgpu_sdma_lcopy(ring_context->pm4, ring_context->bo_mc2,
>> +                               ring_context->bo_mc, size, secure);
>> +       }
>>          amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context, 0);
>>          free(ring_context->pm4);
>>   }
>> @@ -222,7 +229,7 @@ amdgpu_secure_bounce(amdgpu_device_handle device_handle, int fd,
>>          ring_context->resources[1] = ring_context->bo;  // Alice
>>
>>          amdgpu_bo_lcopy(device_handle, ring_context, ip_block, SECURE_BUFFER_SIZE,
>> -                       secure == true ? 1 : 0);
>> +                       secure == true ? 1 : 0, 0);
>>
>>          /* Verify the contents of Bob. */
>>          for (pp = (__typeof__(pp))ring_context->bo2_cpu;
>> @@ -249,7 +256,7 @@ amdgpu_secure_bounce(amdgpu_device_handle device_handle, int fd,
>>
>>          /* sDMA TMZ copy from Bob to Alice. */
>>          amdgpu_bo_lcopy(device_handle, ring_context, ip_block, SECURE_BUFFER_SIZE,
>> -                       secure == true ? 1 : 0);
>> +                       secure == true ? 1 : 0, 1);
>>
>>          /* Verify the contents of Alice */
>>          for (pp = (__typeof__(pp))ring_context->bo_cpu;
>> --
>> 2.25.1
>>
