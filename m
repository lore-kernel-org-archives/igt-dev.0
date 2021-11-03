Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <45336ecd-4d94-b8eb-c9f3-889b1411c937@intel.com>
Date: Wed, 3 Nov 2021 11:44:19 -0700
Content-Language: en-GB
References: <20211021234044.3071069-1-John.C.Harrison@Intel.com>
 <20211021234044.3071069-2-John.C.Harrison@Intel.com>
 <426daa00-746e-31d5-d90b-9cf161738b9d@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <426daa00-746e-31d5-d90b-9cf161738b9d@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 1/8]
 tests/i915/gem_exec_capture: Remove pointless assert
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, IGT-Dev@Lists.FreeDesktop.Org
Cc: Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

On 11/3/2021 06:50, Tvrtko Ursulin wrote:
> On 22/10/2021 00:40, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> The 'many' test ended with an 'assert(count)', presumably meaning to
>> ensure that some objects were actually captured. However, 'count' is
>> the number of objects created not how many were captured. Plus, there
>> is already a 'require(count > 1)' at the start and count is invarient
>> so the final assert is basically pointless.
>>
>> General concensus appears to be that the test should not fail
>> irrespective of how many blobs are captured as low memory situations
>> could cause the capture to be abbreviated. So just remove the
>> pointless assert completely.
>
> Hm the test appears to be using intel_get_avail_ram_mb() to size the 
> working set. Suggesting problems with low memory situations should not 
> apply unless bugs. In which case would a better fix be improving the 
> sizing logic and changing the assert to igt_assert(blobs)?
After fixing the sysfs read code to cope with large files, I don't ever 
see abbreviated captures any more. However, other reviewers objected to 
asserting anything at all about the final count (whether full size, zero 
or whatever) on the grounds that low memory issues *might* still occur. 
And some in quite blunt language as I recall. If you think different, 
feel free to start your own patch set.

John.

>
> Regards,
>
> Tvrtko
>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   tests/i915/gem_exec_capture.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/tests/i915/gem_exec_capture.c 
>> b/tests/i915/gem_exec_capture.c
>> index 7e0a8b8ad..53649cdb2 100644
>> --- a/tests/i915/gem_exec_capture.c
>> +++ b/tests/i915/gem_exec_capture.c
>> @@ -524,7 +524,6 @@ static void many(int fd, int dir, uint64_t size, 
>> unsigned int flags)
>>       }
>>       igt_info("Captured %lu %"PRId64"-blobs out of a total of %lu\n",
>>            blobs, size >> 12, count);
>> -    igt_assert(count);
>>         free(error);
>>       free(offsets);
>>
