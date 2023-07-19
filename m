Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B3910E040
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Jul 2023 05:54:54 +0000 (UTC)
Message-ID: <5471e751-f249-bbd3-b622-a408dd04efc1@intel.com>
Date: Wed, 19 Jul 2023 11:24:41 +0530
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230718111736.3324211-1-badal.nilawar@intel.com>
 <87edl5hybs.wl-ashutosh.dixit@intel.com>
 <87cz0phy5u.wl-ashutosh.dixit@intel.com>
 <db5db432-54b1-71d2-28e2-765897acf451@intel.com>
In-Reply-To: <db5db432-54b1-71d2-28e2-765897acf451@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3] tests/xe: Verify actual frequency on
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



On 19-07-2023 11:05, Nilawar, Badal wrote:
> 
> 
> On 18-07-2023 23:58, Dixit, Ashutosh wrote:
>> On Tue, 18 Jul 2023 11:24:55 -0700, Dixit, Ashutosh wrote:
>>>
>>> Sorry I missed this yesterday. Basically why do we have the
>>> igt_wait(xe_is_gt_in_c6()) above at the top when we are waking up the gt
>>> when reading cur freq later?
>>>
>>> Maybe instead of this usleep, we can this do here:
>>>
>>>         igt_assert(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 1));
>>
>> Actually, maybe:
>>
>>         igt_assert(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 10))Sure 
>> I will make this change.
Is it ok to use igt_warn_on here. igt_assert is anyway being done in 
next instruction while checking act freq?
>>
>>>
>>> And get rid of the igt_require(igt_wait()) at the top?
> This is added to skip test if RC6 disabled or not working. As discussed 
> offline I will move this to igt_main.
> 
> Regards,
> Badal
>>>
>>> Thanks.
>>> -- 
>>> Ashutosh
