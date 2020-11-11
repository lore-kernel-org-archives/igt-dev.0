Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ACC86E038
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2020 09:42:22 +0000 (UTC)
References: <20201106092757.21505-1-nidhi1.gupta@intel.com>
 <20201106093436.GV7444@platvala-desk.ger.corp.intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <150da36c-cb0a-f308-c6b1-bf2cf336c9ae@intel.com>
Date: Wed, 11 Nov 2020 15:12:12 +0530
MIME-Version: 1.0
In-Reply-To: <20201106093436.GV7444@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [RFC, i-g-t] Added dynamic Subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>, nidhi1.gupta@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 11/6/2020 3:04 PM, Petri Latvala wrote:
> On Fri, Nov 06, 2020 at 02:57:57PM +0530, nidhi1.gupta@intel.com wrote:
>> From: Nidhi Gupta <nidhi1.gupta@intel.com>
>>
>> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
>> ---
>>   tests/kms_atomic_transition.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
>> index a71bbe10..aa2afe02 100644
>> --- a/tests/kms_atomic_transition.c
>> +++ b/tests/kms_atomic_transition.c
>> @@ -1025,16 +1025,16 @@ igt_main
>>   			run_transition_test(&display, pipe, output, TRANSITION_MODESET_DISABLE, false, false);
>>   
>>   	for (i = 1; i <= IGT_MAX_PIPES; i++) {

Since we're now anyway planning to use dynamic subtests for this,

Could we just have a count of the number of outputs connected and use 
this, instead of using IGT_MAX_PIPES to populate the subtests and 
eventually skipping them?

@Petri,

Does this sound good?

Thanks,
Karthik.B.S
>> -		igt_subtest_f("%ix-modeset-transitions", i)
>> +		igt_subtest_with_dynamic_f("%ix-modeset-transitions", i)
>>   			run_modeset_transition(&display, i, false, false);
>>   
>> -		igt_subtest_f("%ix-modeset-transitions-nonblocking", i)
>> +		igt_subtest_with_dynamic_f("%ix-modeset-transitions-nonblocking", i)
>>   			run_modeset_transition(&display, i, true, false);
>>   
>> -		igt_subtest_f("%ix-modeset-transitions-fencing", i)
>> +		igt_subtest_with_dynamic_f("%ix-modeset-transitions-fencing", i)
>>   			run_modeset_transition(&display, i, false, true);
>>   
>> -		igt_subtest_f("%ix-modeset-transitions-nonblocking-fencing", i)
>> +		igt_subtest_with_dynamic_f("%ix-modeset-transitions-nonblocking-fencing", i)
>>   			run_modeset_transition(&display, i, true, true);
> Where are the igt_dynamic() blocks for these?
>
>
> --
> Petri Latvala
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
