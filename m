Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <dac6e857-1a8d-3140-c07c-2f6f7a06eb87@intel.com>
Date: Wed, 3 Nov 2021 11:36:11 -0700
Content-Language: en-GB
References: <20211021234044.3071069-1-John.C.Harrison@Intel.com>
 <20211021234044.3071069-6-John.C.Harrison@Intel.com>
 <9f929931-a782-7cfa-dbe0-1e7080eb75c8@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <9f929931-a782-7cfa-dbe0-1e7080eb75c8@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 5/8]
 tests/i915/gem_exec_capture: Check for memory allocation failure
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

On 11/3/2021 07:00, Tvrtko Ursulin wrote:
> On 22/10/2021 00:40, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> The sysfs file read helper does not actually report any errors if a
>> realloc fails. It just silently returns a 'valid' but truncated
>> buffer. This then leads to the decode of the buffer failing in random
>> ways. So, add a check for ENOMEM being generated during the read.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   tests/i915/gem_exec_capture.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/tests/i915/gem_exec_capture.c 
>> b/tests/i915/gem_exec_capture.c
>> index e373d24ed..8997125ee 100644
>> --- a/tests/i915/gem_exec_capture.c
>> +++ b/tests/i915/gem_exec_capture.c
>> @@ -131,9 +131,11 @@ static int check_error_state(int dir, struct 
>> offset *obj_offsets, int obj_count,
>>       char *error, *str;
>>       int blobs = 0;
>>   +    errno = 0;
>>       error = igt_sysfs_get(dir, "error");
>>       igt_sysfs_set(dir, "error", "Begone!");
>>       igt_assert(error);
>> +    igt_assert(errno != ENOMEM);
>
> igt_sysfs_get:
>
>     len = 64;
> ...
>                 newbuf = realloc(buf, 2*len);
>
> Maybe the problem is doubling goes out of hand. How big are your 
> buffers? Perhaps you could improve the library function instead to 
> grow less aggressively.
The buffers are generally ending at 2GB in size with the capture being 
about 1.8GB (on the particular system I happen to be testing on).

I considered various options such as doubling until a given size and 
then just incrementing by fixed amounts. But where do you draw the line? 
1MB, 128MB, 1GB, 128GB? If the final result needs to be 128GB (which you 
cannot know until you have finished reading and resizing) and you are 
allocating in 1MB chunks then it is going to take a very long time to 
get there. I ended up leaving it as a straight double on the grounds 
that it is the best compromise between overallocation and taking 
ridiculous numbers of steps.



>
> And at the same time perhaps the bug is this:
>
>                 if (igt_debug_on(!newbuf))
>                         break;
> ...
>         return buf;
>
> So failures to grow the buffer are ignored, while failure to allocate 
> the initial one are not. Perhaps both should return NULL and then 
> callers would not be surprised.
>
> Or you think someone relies on this current odd behaviour?
>
As per the commit description, this is exactly the problem. However, I 
do not know for certain this is not intentional behaviour and something 
somewhere is relying on it. And I really do not have the time to audit 
this. The vast majority of uses are reading teeny tiny files and don't 
care but who knows what might not be in some particular 
test/config/platform/etc. The fact that it is explicitly saying 
'igt_debug_on' means that someone must have made a conscious decision to 
not assert. It's not like they just forgot to check for null being 
returned. Which implies it is intentional and required.

John.


> Regards,
>
> Tvrtko
>
>>       igt_debug("%s\n", error);
>>         /* render ring --- user = 0x00000000 ffffd000 */
>>
