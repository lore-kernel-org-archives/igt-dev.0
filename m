Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796F5112FB5
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Aug 2022 08:21:26 +0000 (UTC)
Message-ID: <65adb1f4-1e3d-e94f-459c-bae0e2ff3033@intel.com>
Date: Fri, 5 Aug 2022 10:21:18 +0200
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20220804132617.2179474-1-karolina.drobnik@intel.com>
 <YuwlNYdSnMqTKhY/@kamilkon-desk1>
From: Karolina Drobnik <karolina.drobnik@intel.com>
In-Reply-To: <YuwlNYdSnMqTKhY/@kamilkon-desk1>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] i915/i915_pm_rps: Don't use gem_write
 in batch_create
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Kamil,

Thanks for your swift review.

On 04.08.2022 21:59, Kamil Konieczny wrote:
> Hi,
> 
> On 2022-08-04 at 15:26:17 +0200, Karolina Drobnik wrote:
>> From: Chris Wilson <chris@chris-wilson.co.uk>
>>
>> In fence_order and engine_order we are repeatedly creating big mmaps
>> that are very slow when done via gem_write, causing test timeouts.
>> Rewrite batch_create to mmap the buffer directly instead of using
>> gem_write.
>>
>> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
>> Signed-off-by: Karolina Drobnik <karolina.drobnik@intel.com>
>> ---
>>   tests/i915/i915_pm_rps.c | 10 +++++++---
>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
>> index a45a6905..d06ade27 100644
>> --- a/tests/i915/i915_pm_rps.c
>> +++ b/tests/i915/i915_pm_rps.c
>> @@ -621,11 +621,15 @@ static uint32_t batch_create(int i915, uint64_t sz)
>>   	const uint32_t bbe = MI_BATCH_BUFFER_END;
>>   	const uint32_t chk = 0x5 << 23;
>>   	uint32_t handle = gem_create(i915, sz);
>> +	uint32_t *map;
>>   
>> -	for (uint64_t pg = 4096; pg + 4096 < sz; pg += 4096)
>> -		gem_write(i915, handle, pg, &chk, sizeof(chk));
>> +	map = gem_mmap__device_coherent(i915, handle, 0, sz, PROT_WRITE);
>>   
>> -	gem_write(i915, handle, sz - sizeof(bbe), &bbe, sizeof(bbe));
>> +	for (uint64_t pg = 1; pg * 4096 < sz; pg++)
>> +		map[(pg * 4096) / sizeof(*map)] = chk;
>> +
>> +	map[sz / sizeof(*map) - 1] = bbe;
> 
> Are there any arch where we run igt/i915 and sizeof(*map) == 4 ?
> Just curious.

Do you mean the size of the pointer or the actual value? iiuc, we test 
igts on x86_64, arm64, armhf (which is 32 bit) and mips, so there is at
least one platform with 4 byte-wide pointers; uint32_t is size-fixed

All the best,
Karolina

>> +	munmap(map, sz);
> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
>>   
>>   	return handle;
>>   }
>> -- 
>> 2.25.1
>>
