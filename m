Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D02F10E9C9
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Sep 2022 15:54:43 +0000 (UTC)
Message-ID: <daf8094a-a906-c115-ee8a-d87babcc768d@intel.com>
Date: Wed, 21 Sep 2022 21:24:25 +0530
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Melissa
 Wen" <mwen@igalia.com>
References: <20220831101100.1242315-1-mwen@igalia.com>
 <c97e81d2-3aaa-db11-ebb1-b6df5bf0b1ce@intel.com>
 <20220919155421.nauj7e4dp2dwmqza@mail.igalia.com>
 <9c8f18bc-a815-84a0-93eb-698a4083bbe0@intel.com> <YyrBrDSeogdOq4zs@intel.com>
 <20220921103613.jizg5rumtcrgvhy5@mail.igalia.com>
 <Yyrsfb8V5UxDBxbm@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <Yyrsfb8V5UxDBxbm@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_color: fix crc assert
 condition
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed-21-09-2022 04:20 pm, Ville Syrjälä wrote:
> On Wed, Sep 21, 2022 at 09:36:13AM -0100, Melissa Wen wrote:
>> On 09/21, Ville Syrjälä wrote:
>>> On Tue, Sep 20, 2022 at 03:32:39PM +0530, Modem, Bhanuprakash wrote:
>>>> On Mon-19-09-2022 09:24 pm, Melissa Wen wrote:
>>>>> On 09/01, Modem, Bhanuprakash wrote:
>>>>>> On Wed-31-08-2022 03:41 pm, Melissa Wen wrote:
>>>>>>> In test_pipe_degamma/gamma/ctm, igt_assert_crc_equal() was replaced by
>>>>>>>
>>>>>>> ret = !igt_skip_crc_compare || igt_check_crc_equal()
>>>>>>> and then igt_assert(ret)
>>>>>>>
>>>>>>> where igt_check_crc_equal returns !mismatch, and therefore we can
>>>>>>> translate as:
>>>>>>>
>>>>>>> ret = !igt_skip_crc_compare || !mismatch
>>>>>>>
>>>>>>> However, the original igt_assert_crc_equal() assertion does:
>>>>>>>
>>>>>>> igt_assert(!mismatch || igt_skip_crc_compare)
>>>>>>>
>>>>>>> That means, the replacement changes the original assertion. Moreover,
>>>>>>> negating `igt_skip_crc_compare` makes the test assertion to be always
>>>>>>> true (sucessful) by default and reverses the logic of
>>>>>>> --skip-crc-compare.
>>>>>>>
>>>>>>> Fixes: d61e4598142 ("tests/kms_color: Convert tests to dynamic")
>>>>>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>>>>>
>>>>>> LGTM
>>>>>> Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>>>>>
>>>>>> - Bhanu
>>>>>
>>>>> Thanks for reviewing, Bhanu.
>>>>>
>>>>> Siqueira,
>>>>>
>>>>> Is it okay from AMD side? If so, can you apply it?
>>>>
>>>> Applied.
>>>
>>> It did _not_ pass CI and so should not have been pushed!
>>
>> Hi Ville,
>>
>> So, this change "not passed" because the test was not actually assessing
>> the CRC results (i.e. !igt_skip_crc_compare makes the assertion always
>> successful - a false PASS). In this context, I think CI testlist should be
>> updated, instead of not applying this change, right?
> 
> No. Either the test never worked correctly or there was an earlier
> regression hidden by the thing this is now fixing. Either way it
> needs to be fixed. Just reverting the whole sordid mess and starting
> from scratch may be the easiest option.

I have floated a patch to revert this.
https://patchwork.freedesktop.org/series/108835/

Ville/Melissa, Can I have an Ack to merge this?

- Bhanu

> 
