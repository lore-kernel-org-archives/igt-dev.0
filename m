Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875A789C82
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Mar 2022 12:34:28 +0000 (UTC)
Message-ID: <48fd4a84-2d72-862f-6863-6beead5a227c@amd.com>
Date: Wed, 16 Mar 2022 08:34:19 -0400
Content-Language: en-US
To: Petri Latvala <petri.latvala@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20220308142205.275928-1-bhanuprakash.modem@intel.com>
 <20220308142205.275928-2-bhanuprakash.modem@intel.com>
 <3e9ab021-3650-0acc-191d-8fce611aa199@amd.com>
 <YjCaLLlVuBJ4V+da@platvala-desk.ger.corp.intel.com>
From: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
In-Reply-To: <YjCaLLlVuBJ4V+da@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [v2 i-g-t 1/3] tests/kms_setmode: Use dynamic subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org,
 Hayden Goodfellow <hayden.goodfellow@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 2022-03-15 09:52, Petri Latvala wrote:
> On Tue, Mar 15, 2022 at 09:37:31AM -0400, Rodrigo Siqueira Jordao wrote:
>>
>>
>> On 2022-03-08 09:22, Bhanuprakash Modem wrote:
>>> Add support to use dynamic subtests.
>>>
>>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>> Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
>>> ---
>>>    tests/kms_setmode.c | 37 ++++++++++++++++++++++++++++++++++---
>>>    1 file changed, 34 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
>>> index 18d81ee4f3..a47d47e5ab 100644
>>> --- a/tests/kms_setmode.c
>>> +++ b/tests/kms_setmode.c
>>> @@ -653,6 +653,26 @@ static void test_crtc_config(const struct test_config *tconf,
>>>    	return;
>>>    }
>>> +static int get_test_name_str(struct crtc_config *crtc, char *buf,
>>> +				size_t buf_size)
>>> +{
>>> +	int pos;
>>> +	int i;
>>> +
>>> +	pos = snprintf(buf, buf_size, "pipe-%s-", kmstest_pipe_name(crtc->pipe_id));
>>> +
>>> +	for (i = 0; i < crtc->connector_count; i++) {
>>> +		drmModeConnector *connector = crtc->cconfs[i].connector;
>>> +
>>> +		pos += snprintf(&buf[pos], buf_size - pos,
>>> +			"%s%s-%d", i ? "-" : "",
>>> +			kmstest_connector_type_str(connector->connector_type),
>>> +			connector->connector_type_id);
>>> +	}
>>> +
>>> +	return pos;
>>> +}
>>> +
>>>    static void test_one_combination(const struct test_config *tconf,
>>>    				 struct connector_config *cconfs,
>>>    				 int connector_count)
>>> @@ -664,8 +684,19 @@ static void test_one_combination(const struct test_config *tconf,
>>>    	setup_crtcs(tconf, cconfs, connector_count, crtcs,
>>>    		    &crtc_count, &config_valid);
>>> -	if (config_valid == !(tconf->flags & TEST_INVALID))
>>> -		test_crtc_config(tconf, crtcs, crtc_count);
>>> +	if (config_valid == !(tconf->flags & TEST_INVALID)) {
>>> +		int i, pos = 0;
>>> +		char test_name[256];
>>> +
>>> +		for (i = 0; i < crtc_count; i++) {
>>> +			if (i > 0)
>>> +				pos += snprintf(&test_name[pos], ARRAY_SIZE(test_name) - pos, "-");
>>> +			pos += get_test_name_str(&crtcs[i], &test_name[pos], ARRAY_SIZE(test_name) - pos);
>>> +		}
>>> +
>>> +		igt_dynamic_f("%s", test_name)
>>> +			test_crtc_config(tconf, crtcs, crtc_count);
>>> +	}
>>>    	cleanup_crtcs(crtcs, crtc_count);
>>>    }
>>> @@ -939,7 +970,7 @@ igt_main_args("det:", NULL, help_str, opt_handler, NULL)
>>>    	for (i = 0; i < ARRAY_SIZE(tests); i++) {
>>>    		igt_describe("Tests the mode by iterating through all valid/invalid crtc/connector combinations");
>>> -		igt_subtest(tests[i].name) {
>>> +		igt_subtest_with_dynamic(tests[i].name) {
>>
>> Hi Bhanuprakash,
>>
>> The above change causes a regression in AMD CI. Previously, all the below
>> tests were passing, but now they are skipping.
>>
>> basic-clone-single-crtc
>> clone-exclusive-crtc
>> invalid-clone-exclusive-crtc
>> invalid-clone-single-crtc
>> invalid-clone-single-crtc-stealing
>> basic-clone-single-crtc
>>
>> If we use igt_subtest instead of igt_subtest_with_dynamic, everything gets
>> back to normal. Can we reintroduce igt_subtest? Or is there a better way to
>> fix this issue?
> 
> What is the skip message? If it's "no dynamic subtests executed", then
> you don't have any valid configs. Previously that would just silently
> give a pass even when the test did absolutely nothing.
> 
> 

Hi Petri/Bhanuprakash

Thanks for the explanation. I checked with other ASICs on our side, and 
it looks like we have different results per device, which makes sense 
based on your explanation. We already updated our baseline.

Thanks again
Siqueira
