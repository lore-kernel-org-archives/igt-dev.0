Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EFE910E6B9
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Sep 2022 14:19:59 +0000 (UTC)
Message-ID: <1e91d755-3b98-c7ff-1ade-4fc348a5a5df@intel.com>
Date: Mon, 26 Sep 2022 19:49:41 +0530
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20220925160050.2149579-1-bhanuprakash.modem@intel.com>
 <YzFxsBVY80ntHxHz@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <YzFxsBVY80ntHxHz@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] tests/kms_color: Fix ctm-0.* tests
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

On Mon-26-09-2022 03:02 pm, Ville Syrjälä wrote:
> On Sun, Sep 25, 2022 at 09:30:50PM +0530, Bhanuprakash Modem wrote:
>> As we are testing with a few values around the expected result
>> because of the hardware rounded values, fix the logic to generate
>> the expected values to deal with those hardware rounding issues.
>>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> 
> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
>> ---
>>   tests/kms_color.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/kms_color.c b/tests/kms_color.c
>> index ab285af8..2804bde8 100644
>> --- a/tests/kms_color.c
>> +++ b/tests/kms_color.c
>> @@ -770,7 +770,7 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
>>   			expected_colors[0].r =
>>   				expected_colors[1].g =
>>   				expected_colors[2].b =
>> -				0.5 + delta * (i - 2);
>> +				ctm[0] + delta * (i - (iter / 2));
> 
> The name 'iter' is not a particularly great choice here.
> Based on that name I would expect it to be an iterator
> of some sort.
> 
> Another thing I don't really like here is that this guy is
> mutating expected_colors, which was passed all the way from
> the top and really should be const (since the whole ctm_tests[]
> should be const). would be much better to have a local thing
> to mutate here.

Sure, I'll float a new patch to include this.

- Bhanu

> 
>>   			if (test_pipe_ctm(data, data->primary, red_green_blue,
>>   					  expected_colors, ctm)) {
>>   				success = true;
>> -- 
>> 2.37.3
> 
