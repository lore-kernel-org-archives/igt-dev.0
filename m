Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC0210E587
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 06:58:42 +0000 (UTC)
Message-ID: <34cfc694-8196-27c1-91f9-ab310af4ca31@intel.com>
Date: Fri, 20 Oct 2023 08:58:26 +0200
Content-Language: en-US
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
References: <20231017143654.617723-1-marcin.bernatowicz@linux.intel.com>
 <c9d57a2d-5c2b-0d80-7c52-cfb66fc0e866@intel.com>
 <966a8a76-cf95-48ed-888f-d3b13417a8b5@linux.intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <966a8a76-cf95-48ed-888f-d3b13417a8b5@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/intel_blt.c: ensure uint64_t result
 of multiplication
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

On 19.10.2023 16:41, Bernatowicz, Marcin wrote:
> Hi,
> 
> On 10/18/2023 11:08 AM, Karolina Stolarek wrote:
>> On 17.10.2023 16:36, Marcin Bernatowicz wrote:
>>> Additionally check for overflow.
>>>
>>> This should allow to exercise large buffers
>>> ex. xe_exercise_blt -W 16384 -H 16384
>>
>> I think it would be good to add a dedicated (sub)test case to test 
>> large buffers.
>>
> Maybe, but it's not the purpose of this patch.

Yes, I agree, but your change suggests that we've missed a test case 
that should be there. To be clear, this suggestion won't block the patch.

> 
>>>
>>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>>> ---
>>>   lib/intel_blt.c | 8 +++++++-
>>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
>>> index a76c7a404..f46c85e91 100644
>>> --- a/lib/intel_blt.c
>>> +++ b/lib/intel_blt.c
>>> @@ -1607,12 +1607,18 @@ blt_create_object(const struct blt_copy_data 
>>> *blt, uint32_t region,
>>>             bool create_mapping)
>>>   {
>>>       struct blt_copy_object *obj;
>>> -    uint64_t size = width * height * bpp / 8;
>>>       uint32_t stride = tiling == T_LINEAR ? width * 4 : width;
>>>       uint32_t handle;
>>> +    uint64_t size;
>>>       igt_assert_f(blt->driver, "Driver isn't set, have you called 
>>> blt_copy_init()?\n");
>>> +    igt_assert_f((UINT64_MAX / 8) >= width &&
>>> +             (UINT64_MAX / width) >= height &&
>>> +             (UINT64_MAX / (width * height)) >= bpp, "Overflow 
>>> detected!\n");
>>
>> OK, it took a bit for me to parse it... So, we first check if we have 
>> enough space to at least fit width, then compare it against height, 
>> and then compare all of this to what's left for bpp. Is that correct?
> 
> This one is to check if (width * height * bpp / 8) fits in UINT64_MAX
> and is just a paranoid check.

I understand the purpose, I was just checking if it does it right, one 
step at a time...

> 
>>
>> But still, width and height is limited by surface_with and 
>> surface_height field that are u14 iirc. I don't think that overflow is 
>> possible here?
> 
> Where do we limit width and height to u14 ? I see uint32_t is used for 
> width, height and bpp input params.

True that we don't limit the output.

Looking at this now, I think we should reject widths and heights that 
don't fit into u14, because both block copy won't be able to handle it. 
Fast copy expect pitches, and these are u16. When preparing the command 
submission, we use helper structs which definitions would truncate the 
width and height, for example:

dw16 of gen12_block_copy_data_ext:
	uint32_t dst_surface_height:		BITRANGE(0, 13);
	uint32_t dst_surface_width:		BITRANGE(14, 27);

dw07 of gen12_fast_copy_data:
	uint32_t src_pitch:			BITRANGE(0, 15);

So, I think, that while we should ensure there's no overflow, we should 
give folks a heads up if they wish to copy bigger buffers (the latter is 
more to a note to myself, don't worry). There was a similar issue 
connected to display, and the only sensible solution was to use render 
copy that has no such limitations.

All the best,
Karolina
> 
> The current code overflows uint32_t when width = height = 16384 and bpp 
> = 32 => 16384 * 16384 * 32 / 8 => 0 => size == 0 :(
> 
> We need (uint64_t) cast to ensure the entire multiplication is done in 
> 64-bit arithmetic. >
> -- 
> marcin
>>
>>> +
>>> +    size = (uint64_t)width * height * bpp / 8;
>>
>> Cast takes precedence over *, but this line doesn't trigger any 
>> warnings, so I think we don't have to add extra ().
>>
>> All the best,
>> Karolina
>>
>>> +
>>>       obj = calloc(1, sizeof(*obj));
>>>       obj->size = size;
