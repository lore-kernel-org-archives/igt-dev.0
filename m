Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7FE10E0B6
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Oct 2023 08:59:15 +0000 (UTC)
Message-ID: <26811181-c8c3-eaf2-914e-22ae336638ab@linux.intel.com>
Date: Fri, 6 Oct 2023 10:59:11 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
References: <20231002121428.3827-1-nirmoy.das@intel.com>
 <20231005110156.uhj24eusferydmcz@kamilkon-desk.igk.intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20231005110156.uhj24eusferydmcz@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/prime_vgem: Use correct blitter
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


On 10/5/2023 1:01 PM, Kamil Konieczny wrote:
> Hi Nirmoy,
> On 2023-10-02 at 14:14:28 +0200, Nirmoy Das wrote:
>> Use igt_blitter_copy() which picks a correct blitter
>> command depending on platform.
>>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Here also please ask bug filing for masking BAT error
> and spin full testing.

Will do that.


> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Thanks, Kamil!


Nirmoy

>
> Regards,
> Kamil
>
>> ---
>>   tests/prime_vgem.c | 52 +++++++++++++++++++++++-----------------------
>>   1 file changed, 26 insertions(+), 26 deletions(-)
>>
>> diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
>> index 876e04ed0..551a731f5 100644
>> --- a/tests/prime_vgem.c
>> +++ b/tests/prime_vgem.c
>> @@ -29,7 +29,7 @@
>>   #include "i915/gem_create.h"
>>   #include "igt.h"
>>   #include "igt_vgem.h"
>> -#include "intel_batchbuffer.h"	/* igt_blitter_src_copy() */
>> +#include "intel_batchbuffer.h"	/* igt_blitter_copy() */
>>   /**
>>    * TEST: prime vgem
>>    * Description: Basic check of polling for prime/vgem fences.
>> @@ -351,11 +351,11 @@ static void test_fence_blt(int i915, int vgem)
>>   		write(master[1], &child, sizeof(child));
>>   		read(slave[0], &child, sizeof(child));
>>   
>> -		igt_blitter_src_copy(i915, ahnd, 0, NULL, prime, 0, scratch.pitch,
>> -				     I915_TILING_NONE, 0, 0, scratch.size,
>> -				     scratch.width, scratch.height, scratch.bpp,
>> -				     native, 0, scratch.pitch,
>> -				     I915_TILING_NONE, 0, 0, scratch.size);
>> +		igt_blitter_copy(i915, ahnd, 0, NULL, prime, 0, scratch.pitch,
>> +				 I915_TILING_NONE, 0, 0, scratch.size,
>> +				 scratch.width, scratch.height, scratch.bpp,
>> +				 native, 0, scratch.pitch,
>> +				 I915_TILING_NONE, 0, 0, scratch.size);
>>   		gem_sync(i915, native);
>>   
>>   		for (i = 0; i < scratch.height; i++)
>> @@ -480,11 +480,11 @@ static void test_blt(int vgem, int i915)
>>   		ptr[scratch.pitch * i / sizeof(*ptr)] = i;
>>   	munmap(ptr, scratch.size);
>>   
>> -	igt_blitter_src_copy(i915, ahnd, 0, NULL, native, 0, scratch.pitch,
>> -			     I915_TILING_NONE, 0, 0, scratch.size,
>> -			     scratch.width, scratch.height, scratch.bpp,
>> -			     prime, 0, scratch.pitch, I915_TILING_NONE, 0, 0,
>> -			     scratch.size);
>> +	igt_blitter_copy(i915, ahnd, 0, NULL, native, 0, scratch.pitch,
>> +			 I915_TILING_NONE, 0, 0, scratch.size,
>> +			 scratch.width, scratch.height, scratch.bpp,
>> +			 prime, 0, scratch.pitch, I915_TILING_NONE, 0, 0,
>> +			 scratch.size);
>>   	prime_sync_start(dmabuf, true);
>>   	prime_sync_end(dmabuf, true);
>>   	close(dmabuf);
>> @@ -496,11 +496,11 @@ static void test_blt(int vgem, int i915)
>>   	}
>>   	munmap(ptr, scratch.size);
>>   
>> -	igt_blitter_src_copy(i915, ahnd, 0, NULL, prime, 0, scratch.pitch,
>> -			     I915_TILING_NONE, 0, 0, scratch.size,
>> -			     scratch.width, scratch.height, scratch.bpp,
>> -			     native, 0, scratch.pitch, I915_TILING_NONE, 0, 0,
>> -			     scratch.size);
>> +	igt_blitter_copy(i915, ahnd, 0, NULL, prime, 0, scratch.pitch,
>> +			 I915_TILING_NONE, 0, 0, scratch.size,
>> +			 scratch.width, scratch.height, scratch.bpp,
>> +			 native, 0, scratch.pitch, I915_TILING_NONE, 0, 0,
>> +			 scratch.size);
>>   	gem_sync(i915, native);
>>   
>>   	ptr = gem_mmap__device_coherent(i915, native, 0, scratch.size, PROT_READ);
>> @@ -620,22 +620,22 @@ static void test_blt_interleaved(int vgem, int i915)
>>   
>>   	for (i = 0; i < SLOW_QUICK(scratch.height, 64); i++) {
>>   		local[scratch.pitch * i / sizeof(*local)] = i;
>> -		igt_blitter_src_copy(i915, ahnd, 0, NULL, native, 0,
>> -				     scratch.pitch, I915_TILING_NONE, 0, i,
>> -				     scratch.size, scratch.width, 1,
>> -				     scratch.bpp, prime, 0, scratch.pitch,
>> -				     I915_TILING_NONE, 0, i, scratch.size);
>> +		igt_blitter_copy(i915, ahnd, 0, NULL, native, 0,
>> +				 scratch.pitch, I915_TILING_NONE, 0, i,
>> +				 scratch.size, scratch.width, 1,
>> +				 scratch.bpp, prime, 0, scratch.pitch,
>> +				 I915_TILING_NONE, 0, i, scratch.size);
>>   		prime_sync_start(dmabuf, true);
>>   		igt_assert_eq_u32(foreign[scratch.pitch * i / sizeof(*foreign)],
>>   				  i);
>>   		prime_sync_end(dmabuf, true);
>>   
>>   		foreign[scratch.pitch * i / sizeof(*foreign)] = ~i;
>> -		igt_blitter_src_copy(i915, ahnd, 0, NULL, prime, 0, scratch.pitch,
>> -				     I915_TILING_NONE, 0, i, scratch.size,
>> -				     scratch.width, 1,
>> -				     scratch.bpp, native, 0, scratch.pitch,
>> -				     I915_TILING_NONE, 0, i, scratch.size);
>> +		igt_blitter_copy(i915, ahnd, 0, NULL, prime, 0, scratch.pitch,
>> +				 I915_TILING_NONE, 0, i, scratch.size,
>> +				 scratch.width, 1,
>> +				 scratch.bpp, native, 0, scratch.pitch,
>> +				 I915_TILING_NONE, 0, i, scratch.size);
>>   		gem_sync(i915, native);
>>   		igt_assert_eq_u32(local[scratch.pitch * i / sizeof(*local)],
>>   				  ~i);
>> -- 
>> 2.41.0
>>
