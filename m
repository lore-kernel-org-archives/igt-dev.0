Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92A310E076
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jul 2023 08:51:27 +0000 (UTC)
Message-ID: <46f8432b-8770-61a8-fc64-c3f3a324f8bd@intel.com>
Date: Tue, 18 Jul 2023 14:21:15 +0530
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230717105711.3277000-1-badal.nilawar@intel.com>
 <87o7kahruu.wl-ashutosh.dixit@intel.com>
 <aa1e803f-f24b-21ff-405e-a1259298daa8@intel.com>
 <87lefdj0ex.wl-ashutosh.dixit@intel.com>
 <87jzuxizzi.wl-ashutosh.dixit@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <87jzuxizzi.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/xe: Verify actual frequency on
 the basis of GT state
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



On 18-07-2023 10:21, Dixit, Ashutosh wrote:
> On Mon, 17 Jul 2023 21:42:14 -0700, Dixit, Ashutosh wrote:
>>
>> On Mon, 17 Jul 2023 21:27:02 -0700, Nilawar, Badal wrote:
>>>
>>>>> @@ -226,6 +226,9 @@ static void test_freq_fixed(int fd, int gt_id)
>>>>>
>>>>> 	igt_debug("Starting testing fixed request\n");
>>>>>
>>>>> +	if (gt_idle)
>>>>> +		igt_require(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 1));
>>>>> +
>>>>> 	/*
>>>>> 	 * For Fixed freq we need to set both min and max to the desired value
>>>>> 	 * Then we check if hardware is actually operating at the desired freq
>>>>> @@ -235,13 +238,25 @@ static void test_freq_fixed(int fd, int gt_id)
>>>>> 	igt_assert(set_freq(fd, gt_id, "max", rpn) > 0);
>>>>> 	usleep(ACT_FREQ_LATENCY_US);
>>>>> 	igt_assert(get_freq(fd, gt_id, "cur") == rpn);
>>>>> -	igt_assert(get_freq(fd, gt_id, "act") == rpn);
>>>>> +
>>>>> +	if (gt_idle) {
>>>>> +		usleep(ACT_FREQ_LATENCY_US);
>>>>
>>>> Looks like this usleep should in the else? Since we've already igt_wait'ed
>>>> above for the idle case? In all places in this patch.
>>>
>>> As get_freq(fd, gt_id, "cur") will forcewake the gt so added usleep to gt
>>> to settle down.
>>
>> Ah good point. I missed that reading requested freq takes forcewake (unlike
>> act freq).
> 
> One idea to remove this extra delay would be to read act freq first and
> then read cur. Otherwise, maybe add a comment in one place saying reading
> cur will take forcewake. Thanks.
Flow wise cur should read first as it tells guc honored the request. I 
will add comment.

Regards,
Badal
