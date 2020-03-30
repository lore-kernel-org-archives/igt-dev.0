Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719AC6E40F
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2020 14:39:14 +0000 (UTC)
References: <20200330124834.43038-1-lionel.g.landwerlin@intel.com>
 <158557648695.3228.12905531047246276873@build.alporthouse.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <16e5476c-74a4-2aeb-19a4-9612fcc29369@intel.com>
Date: Mon, 30 Mar 2020 17:39:11 +0300
MIME-Version: 1.0
In-Reply-To: <158557648695.3228.12905531047246276873@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/perf: dramatically loosen
 expectations on oa-exponents
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 30/03/2020 16:54, Chris Wilson wrote:
> Quoting Lionel Landwerlin (2020-03-30 13:48:34)
>> This test really quite flaky because it expects HW to emit reports
>> following pretty much exactly the specified timer. And there are lots
>> of reasons the HW might not be able to meet the timer deadline. The
>> design is such that it's expected to not always meet the timer.
>>
>> We just want to verify that the HW was configured properly, so loosen
>> the checks to half the reports (of 30) meeting the timer deadline.
>>
>> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>> ---
>>   tests/perf.c | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/perf.c b/tests/perf.c
>> index 442d89fb..023829fc 100644
>> --- a/tests/perf.c
>> +++ b/tests/perf.c
>> @@ -1742,8 +1742,14 @@ test_oa_exponents(void)
>>   
>>                  igt_debug("matches=%u/%u\n", matches, n_timer_reports - 1);
>>   
>> -               /* Allow for a couple of errors. */
>> -               igt_assert_lte(n_timer_reports - 3, matches);
>> +               /*
>> +                * Expect half the reports to match the timing
>> +                * expectation. The results are quite erratic because
>> +                * the condition under which the HW reaches
>> +                * expectations depends on memory controller pressure
>> +                * etc...
>> +                */
>> +               igt_assert_lte(n_timer_reports / 2, matches);
> Acked-by: Chris Wilson <chris@chris-wilson.co.uk>
>
> This will check for gross errors and so detect if we misconfigure the
> HW.
>
> What you might like to try is to look at the distribution of intervals,
> and compare the median against your expectations.
> -Chris

Yeah... It's quite annoying, sometimes the unit skips a deadline and 
tries to make it up right after...

Last time I checked the median didn't really help.


-Lionel

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
