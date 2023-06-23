Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C18D10E5D0
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jun 2023 03:53:14 +0000 (UTC)
Message-ID: <fb4bf754-3a4e-7857-b341-8df458ee21bc@intel.com>
Date: Fri, 23 Jun 2023 09:22:53 +0530
Content-Language: en-US
To: "B, Jeevan" <jeevan.b@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
References: <20230622111651.9040-1-jeevan.b@intel.com>
 <20230622125534.cski2zzude2c2o6n@kamilkon-desk1>
 <DM4PR11MB6312D2BF62243D9C688C0FD29022A@DM4PR11MB6312.namprd11.prod.outlook.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <DM4PR11MB6312D2BF62243D9C688C0FD29022A@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_setmode: Fix dynamic subtests
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

Hi Jeevan,

On Thu-22-06-2023 06:32 pm, B, Jeevan wrote:
> Hi Kamil,
> 
>> -----Original Message-----
>> From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Sent: Thursday, June 22, 2023 6:26 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: B, Jeevan <jeevan.b@intel.com>; Modem, Bhanuprakash
>> <bhanuprakash.modem@intel.com>
>> Subject: Re: [PATCH i-g-t] tests/kms_setmode: Fix dynamic subtests
>>
>> Hi Jeevan,
>>
>> On 2023-06-22 at 16:46:51 +0530, Jeevan B wrote:
>>> basic-clone-single-crtc and invalid-clone-exclusive-crtc were not part
>>> of dynamic subtest so tests were getting skipped. fixed the test to
>>> execute skipping tests as expected.
>>>
>>> v2: add missing call.
>>>
>>> Signed-off-by: Jeevan B <jeevan.b@intel.com>
>>> ---
>>>   tests/kms_setmode.c | 26 +++++++++++++-------------
>>>   1 file changed, 13 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c index
>>> a611d938..96fb0b4b 100644
>>> --- a/tests/kms_setmode.c
>>> +++ b/tests/kms_setmode.c
>>> @@ -647,20 +647,19 @@ static void test_one_combination(const struct
>> test_config *tconf,
>>>   	struct crtc_config crtcs[MAX_CRTCS];
>>>   	int crtc_count;
>>>   	bool config_valid;
>>> +	int i, pos = 0;
>>> +	char test_name[256];
>>>
>>>   	setup_crtcs(tconf, cconfs, connector_count, crtcs,
>>>   		    &crtc_count, &config_valid);
>>>
>>> -	if (config_valid == !(tconf->flags & TEST_INVALID)) {
>>> -		int i, pos = 0;
>>> -		char test_name[256];
>>> -
>>> -		for (i = 0; i < crtc_count; i++) {
>>> -			if (i > 0)
>>> -				pos += snprintf(&test_name[pos],
>> ARRAY_SIZE(test_name) - pos, "-");
>>> -			pos += get_test_name_str(&crtcs[i],
>> &test_name[pos], ARRAY_SIZE(test_name) - pos);
>>> -		}
>>> +	for (i = 0; i < crtc_count; i++) {
>>> +		if (i > 0)
>>> +			pos += snprintf(&test_name[pos],
>> ARRAY_SIZE(test_name) - pos, "-");
>>> +		pos += get_test_name_str(&crtcs[i], &test_name[pos],
>> ARRAY_SIZE(test_name) - pos);
>>> +	}
>>>
>>> +	if (config_valid == !(tconf->flags & TEST_INVALID)) {
>>>   		for (i = 0; i < crtc_count; i++) {
>>>   			struct crtc_config *crtc = &crtcs[i];
>>>
>>> @@ -679,16 +678,17 @@ static void test_one_combination(const struct
>> test_config *tconf,
>>>   			    ((i > 0) && (crtc[i - 1].mode.hdisplay >
>> MAX_HDISPLAY_PER_CRTC) &&
>>>   			     (abs(crtc->crtc_idx - crtcs[i - 1].crtc_idx) <= 1))) {
>>>   				igt_info("Combo: %s is not possible with
>> selected mode(s).\n", test_name);
>>> -				goto out;
>>> +				cleanup_crtcs(crtcs, crtc_count);
>>> +				return;
>>>   			}
>>>   		}
>>>
>>>   		igt_dynamic_f("%s", test_name)
>>>   			test_crtc_config(tconf, crtcs, crtc_count);
>>> +	} else {
>>> +		igt_dynamic_f("%s", test_name)
>>> +			cleanup_crtcs(crtcs, crtc_count);
>> ----------------------- ^
>> The name of function and its placement just before function end suggest it is
>> a cleanup, not a test.
>>
>> I would advise going with git log and finding when these two tests where
>> executed with "normal", non-dynamic way and then adjusting this function,
>> or adding them as separate subtests with proper configuration.
>>
> This was before tests were converted to dynamic. (9f32d552afd7e7bb34b4cc3542e184b3be1a1dc8)
> @@ -664,8 +684,19 @@ static void test_one_combination(const struct test_config *tconf,
>          setup_crtcs(tconf, cconfs, connector_count, crtcs,
>                      &crtc_count, &config_valid);
> 
> -       if (config_valid == !(tconf->flags & TEST_INVALID))
> -               test_crtc_config(tconf, crtcs, crtc_count);
> +       if (config_valid == !(tconf->flags & TEST_INVALID)) {
> +               int i, pos = 0;
> +               char test_name[256];
> +
> +               for (i = 0; i < crtc_count; i++) {
> +                       if (i > 0)
> +                               pos += snprintf(&test_name[pos], ARRAY_SIZE(test_name) - pos, "-");
> +                       pos += get_test_name_str(&crtcs[i], &test_name[pos], ARRAY_SIZE(test_name) - pos);
> +               }
> +
> +               igt_dynamic_f("%s", test_name)
> +                       test_crtc_config(tconf, crtcs, crtc_count);
> +       }

What is wrong in this logic & how your patch fixes that?

- Bhanu

> 
>          cleanup_crtcs(crtcs, crtc_count);
>   }
> 
>>>   	}
>>> -
>>> -out:
>>> -	cleanup_crtcs(crtcs, crtc_count);
>>
>> Drop this change, looks dangereous.
>>
>> Regards,
>> Kamil
> 
>>
>>>   }
>>>
>>>   static int assign_crtc_to_connectors(const struct test_config *tconf,
>>> --
>>> 2.41.0
>>>
