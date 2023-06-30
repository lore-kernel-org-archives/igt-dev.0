Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545DF10E428
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jun 2023 11:00:27 +0000 (UTC)
Message-ID: <f82bf4ea-abdd-4584-d8a6-146df1bb2220@intel.com>
Date: Fri, 30 Jun 2023 16:30:06 +0530
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230622093718.1689978-1-badal.nilawar@intel.com>
 <87352dddnn.wl-ashutosh.dixit@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <87352dddnn.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/xe: When GT is in RC6 donot
 assert if act freq is 0
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



On 27-06-2023 04:39, Dixit, Ashutosh wrote:
> On Thu, 22 Jun 2023 02:37:18 -0700, Badal Nilawar wrote:
>>
>> @@ -223,13 +244,15 @@ static void test_freq_fixed(int sysfs, int gt_id)
>> 	igt_assert(set_freq(sysfs, gt_id, "max", rpn) > 0);
>> 	usleep(ACT_FREQ_LATENCY_US);
>> 	igt_assert(get_freq(sysfs, gt_id, "cur") == rpn);
>> -	igt_assert(get_freq(sysfs, gt_id, "act") == rpn);
>> +	if (!in_rc6(sysfs, gt_id))
>> +		igt_assert(get_freq(sysfs, gt_id, "act") == rpn);
>>
>> 	igt_assert(set_freq(sysfs, gt_id, "min", rpe) > 0);
>> 	igt_assert(set_freq(sysfs, gt_id, "max", rpe) > 0);
>> 	usleep(ACT_FREQ_LATENCY_US);
>> 	igt_assert(get_freq(sysfs, gt_id, "cur") == rpe);
>> -	igt_assert(get_freq(sysfs, gt_id, "act") == rpe);
>> +	if (!in_rc6(sysfs, gt_id))
>> +		igt_assert(get_freq(sysfs, gt_id, "act") == rpe);
>>
>> 	igt_assert(set_freq(sysfs, gt_id, "min", rp0) > 0);
>> 	igt_assert(set_freq(sysfs, gt_id, "max", rp0) > 0);
>> @@ -269,7 +292,8 @@ static void test_freq_range(int sysfs, int gt_id)
>> 	cur = get_freq(sysfs, gt_id, "cur");
>> 	igt_assert(rpn <= cur && cur <= rpe);
>> 	act = get_freq(sysfs, gt_id, "act");
>> -	igt_assert(rpn <= act && act <= rpe);
>> +	if (!in_rc6(sysfs, gt_id))
>> +		igt_assert(rpn <= act && act <= rpe);
> 
> Basically slightly racy because in_rc6() and get_freq() are not done
> atomically, but maybe ok here if not causing false positives?
Not sure how to handle race here. Not observed any false positives.
> 
> Further, do we need to add the following else's here:
> 
> 	if (!in_rc6(sysfs, gt_id))
> 		igt_assert(rpn <= act && act <= rpe);
> 	else
> 		igt_assert(act == 0);
Instead of this to accommodate idle and exec test should we pass flag 
(is_idle) here. So this will be.
if (is_idle)
	igt_assert(act == 0);
else
	igt_assert(rpn <= act && act <= rpe);

Regards,
Badal
> 
> Or is that likely to blow up
> 
> Ashutosh
