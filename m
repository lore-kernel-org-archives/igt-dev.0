Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85CB810EDA8
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Aug 2022 10:12:58 +0000 (UTC)
Message-ID: <be3c8ba6-5ce1-3004-81f6-ab2c1dd6aca4@intel.com>
Date: Thu, 25 Aug 2022 15:42:30 +0530
Content-Language: en-US
To: <juhapekka.heikkila@gmail.com>, <igt-dev@lists.freedesktop.org>,
 <swati2.sharma@intel.com>
References: <20220809165832.1717990-1-bhanuprakash.modem@intel.com>
 <ec05b082-6bee-366c-9bf1-c50d5fd7a408@gmail.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <ec05b082-6bee-366c-9bf1-c50d5fd7a408@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] tests/kms_cursor_crc: Add max-size test back
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

On Tue-23-08-2022 12:49 am, Juha-Pekka Heikkila wrote:
> On 9.8.2022 19.58, Bhanuprakash Modem wrote:
>> This patch reverts the max-size test but keeps the clean-up
>> part of the original commit.
>>
>> This reverts commit 5a8fa05a824032aab4c8980727a075f71065e27c.
>>
>> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   tests/kms_cursor_crc.c | 22 +++++++++++++++++++++-
>>   1 file changed, 21 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
>> index 14d4c4ca..cf8d4b68 100644
>> --- a/tests/kms_cursor_crc.c
>> +++ b/tests/kms_cursor_crc.c
>> @@ -693,7 +693,24 @@ static void run_size_tests(data_t *data, void 
>> (*testfunc)(data_t *),
>>       char name[32];
>>       enum pipe pipe;
>> -    snprintf(name, sizeof(name), "%dx%d", w, h);
>> +    if (w == 0 && h == 0)
>> +        strcpy(name, "max-size");
>> +    else
>> +        snprintf(name, sizeof(name), "%dx%d", w, h);
>> +
>> +    if (w == 0 && h == 0) {
>> +        w = data->cursor_max_w;
>> +        h = data->cursor_max_h;
>> +        /*
>> +         * No point in doing the "max-size" test if
>> +         * it was already covered by the other tests.
>> +         */
>> +        if ((w == h) && (w <= 512) && (h <= 512) &&
>> +            is_power_of_two(w) && is_power_of_two(h)) {
>> +            igt_debug("Cursor max size %dx%d already covered by other 
>> tests\n", w, h);
>> +            return;
> 
> Now these maximum cursor size test will not show up in list of tests if 
> these rules match and above debug message will go somewhere. Ie. max 
> size test and what happened with them are not seen here
> 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7626/shards-all.html?testfilter=cursor_crc.*max 
> 
> 
> Originally above check was saying:
> igt_require_f(w != h || w > 512 || h > 512 || !is_power_of_two(w) || 
> !is_power_of_two(h), "Cursor max size %dx%d already covered by other 
> tests\n", w, h);
> 
> And I think it is needed here to know what happen with maximum cursor 
> size tests. Maximum cursor size is special case that is wanted to be 
> known what happen with it, will driver reported largest possible cursor 
> work.

Thanks for the review JP,

I have floated a new rev to have a separate subtest for max-size.
https://patchwork.freedesktop.org/series/107096/

Still, it'll skip (with above mentioned info) if we already covered that 
size in different subtest.

- Bhanu

> 
> /Juha-Pekka
> 
>> +        }
>> +    }
>>       create_cursor_fb(data, w, h);
>>       if (require_cursor_size(data, w, h)) {
>> @@ -855,6 +872,9 @@ static void run_tests_on_pipe(data_t *data)
>>                       igt_subtest_group
>>                           run_size_tests(data, size_tests[i].testfunc, 
>> w, h);
>>                   }
>> +
>> +                igt_subtest_group
>> +                    run_size_tests(data, size_tests[i].testfunc, 0, 0);
>>               }
>>           }
>>       }
> 
