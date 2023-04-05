Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE4810E95D
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Apr 2023 13:26:41 +0000 (UTC)
Message-ID: <1842dbd4-c8a4-9d15-1615-469bfbddc79d@intel.com>
Date: Wed, 5 Apr 2023 14:26:37 +0100
MIME-Version: 1.0
Content-Language: en-GB
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20230404120042.146323-1-matthew.auld@intel.com>
 <ZCygn7zOgqdKPzHL@nvishwa1-DESK>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZCygn7zOgqdKPzHL@nvishwa1-DESK>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/xe_query: fix vram_memory()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 04/04/2023 23:11, Niranjana Vishwanathapura wrote:
> On Tue, Apr 04, 2023 at 01:00:41PM +0100, Matthew Auld wrote:
>> It looks like this is meant to return VRAM if supported. If we call this
>> on igpu it should return zero. There is at least one user relying on
>> this in xe_mmap@vram, where we want to skip if the mask here is zero.
>>
> 
> Below patch was sent before, but never got merged.
> https://patchwork.freedesktop.org/series/115409/
> 
> There are some minor differences. Can you pick those
> changes?

Ok, missed that... Let me check.

> 
> Also, cover letter seems to be missing for this series.
> Or, we can simple merge them into a single patch as they
> are related?

Ok, will squash.

> 
> Niranjana
> 
>> Reported-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>> lib/xe/xe_query.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
>> index 24a258a5e..253164d6b 100644
>> --- a/lib/xe/xe_query.c
>> +++ b/lib/xe/xe_query.c
>> @@ -380,7 +380,7 @@ uint64_t vram_memory(int fd, int gt)
>>     igt_assert(xe_dev);
>>     igt_assert(gt >= 0 && gt < xe_dev->number_gt);
>>
>> -    return native_region_for_gt(xe_dev->gts, gt);
>> +    return native_region_for_gt(xe_dev->gts, gt) & (~0x1);
>> }
>>
>> /**
>> -- 
>> 2.39.2
>>
