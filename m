Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05CF610E569
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 05:31:45 +0000 (UTC)
Message-ID: <c944c9a4-da9a-b639-248e-08e0615fb3ca@intel.com>
Date: Thu, 22 Sep 2022 11:01:25 +0530
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
References: <20220831101100.1242315-1-mwen@igalia.com>
 <c97e81d2-3aaa-db11-ebb1-b6df5bf0b1ce@intel.com>
 <20220919155421.nauj7e4dp2dwmqza@mail.igalia.com>
 <9c8f18bc-a815-84a0-93eb-698a4083bbe0@intel.com> <YyrBrDSeogdOq4zs@intel.com>
 <20220921103613.jizg5rumtcrgvhy5@mail.igalia.com>
 <Yyrsfb8V5UxDBxbm@intel.com> <daf8094a-a906-c115-ee8a-d87babcc768d@intel.com>
 <Yys/TUJxVEx77Wp6@intel.com>
 <20220921173122.nfebujuj5qxcj2fm@mail.igalia.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220921173122.nfebujuj5qxcj2fm@mail.igalia.com>
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

On Wed-21-09-2022 11:01 pm, Melissa Wen wrote:
> On 09/21, Ville Syrjälä wrote:
>> On Wed, Sep 21, 2022 at 09:24:25PM +0530, Modem, Bhanuprakash wrote:
>>> On Wed-21-09-2022 04:20 pm, Ville Syrjälä wrote:
>>>> On Wed, Sep 21, 2022 at 09:36:13AM -0100, Melissa Wen wrote:
>>>>> On 09/21, Ville Syrjälä wrote:
>>>>>> On Tue, Sep 20, 2022 at 03:32:39PM +0530, Modem, Bhanuprakash wrote:
>>>>>>> On Mon-19-09-2022 09:24 pm, Melissa Wen wrote:
>>>>>>>> On 09/01, Modem, Bhanuprakash wrote:
>>>>>>>>> On Wed-31-08-2022 03:41 pm, Melissa Wen wrote:
>>>>>>>>>> In test_pipe_degamma/gamma/ctm, igt_assert_crc_equal() was replaced by
>>>>>>>>>>
>>>>>>>>>> ret = !igt_skip_crc_compare || igt_check_crc_equal()
>>>>>>>>>> and then igt_assert(ret)
>>>>>>>>>>
>>>>>>>>>> where igt_check_crc_equal returns !mismatch, and therefore we can
>>>>>>>>>> translate as:
>>>>>>>>>>
>>>>>>>>>> ret = !igt_skip_crc_compare || !mismatch
>>>>>>>>>>
>>>>>>>>>> However, the original igt_assert_crc_equal() assertion does:
>>>>>>>>>>
>>>>>>>>>> igt_assert(!mismatch || igt_skip_crc_compare)
>>>>>>>>>>
>>>>>>>>>> That means, the replacement changes the original assertion. Moreover,
>>>>>>>>>> negating `igt_skip_crc_compare` makes the test assertion to be always
>>>>>>>>>> true (sucessful) by default and reverses the logic of
>>>>>>>>>> --skip-crc-compare.
>>>>>>>>>>
>>>>>>>>>> Fixes: d61e4598142 ("tests/kms_color: Convert tests to dynamic")
>>>>>>>>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>>>>>>>>
>>>>>>>>> LGTM
>>>>>>>>> Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>>>>>>>>
>>>>>>>>> - Bhanu
>>>>>>>>
>>>>>>>> Thanks for reviewing, Bhanu.
>>>>>>>>
>>>>>>>> Siqueira,
>>>>>>>>
>>>>>>>> Is it okay from AMD side? If so, can you apply it?
>>>>>>>
>>>>>>> Applied.
>>>>>>
>>>>>> It did _not_ pass CI and so should not have been pushed!
>>>>>
>>>>> Hi Ville,
>>>>>
>>>>> So, this change "not passed" because the test was not actually assessing
>>>>> the CRC results (i.e. !igt_skip_crc_compare makes the assertion always
>>>>> successful - a false PASS). In this context, I think CI testlist should be
>>>>> updated, instead of not applying this change, right?
>>>>
>>>> No. Either the test never worked correctly or there was an earlier
>>>> regression hidden by the thing this is now fixing. Either way it
>>>> needs to be fixed. Just reverting the whole sordid mess and starting
>>>> from scratch may be the easiest option.
>>>
>>> I have floated a patch to revert this.
>>> https://patchwork.freedesktop.org/series/108835/
>>>
>>> Ville/Melissa, Can I have an Ack to merge this?
>>
>> I mean we have to revert all the way back to before the
>> dunamic subtest conversion. AIUI that is when we started
>> to ignore real test failures, and so we don't even know
>> whether it was that commit itself or something later that
>> really broke the test.
> 
> It's clear to me that the regression was introduced by:
> d61e4598142 ("tests/kms_color: Convert tests to dynamic")
> 
> As I explained in the commit message, we can see it in the patchwork
> diff [1] (or gitlab commit diff, but the patchwork just displays it
> clear enough), as here:
> 
> ---
> @@ -285,7 +286,7 @@  static void test_pipe_legacy_gamma(data_t *data,
>   	/* Verify that the CRC of the software computed output is
>   	 * equal to the CRC of the gamma LUT transformation output.
>   	 */
> -	igt_assert_crc_equal(&crc_fullgamma, &crc_fullcolors);
> +	ret = !igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, &crc_fullcolors);

I have adopted this piece of code from CTM test & blindly applied to 
other tests :-(

This check in CTM test was introduced by:
1a42910d tests/kms_color: Don't opencode igt_check_crc_equal()

Means, we were hiding this CTM failures from ages.
If we observe the latest test results [1], it is clear that only ctm 
(0.25 & 0.75) tests are failing.
To confirm this, I have floated a patch to IGT [2]:
Revert dynamic subtests + Fix above crc check

[1] 
https://intel-gfx-ci.01.org/tree/drm-tip/shards-all.html?testfilter=kms_color 

[2] https://patchwork.freedesktop.org/series/108864/

> 
>   	/* Reset output. */
>   	for (i = 1; i < legacy_lut_size; i++)
> ---
> 
> [1] https://patchwork.freedesktop.org/patch/491540/
> 
> btw, I'm okay with the approach of reverting both. So, I understand
> Bhanuprakash will submit a new patch with a dynamic test conversion that
> handles the assertions correctly, right?
> 
> BR,
> 
> Melissa
> 
>>
>> -- 
>> Ville Syrjälä
>> Intel
