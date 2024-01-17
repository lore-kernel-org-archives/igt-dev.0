Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D4B10E611
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jan 2024 08:55:18 +0000 (UTC)
Message-ID: <407a6e9e-b0be-4b67-bbde-94f51a46fe52@intel.com>
Date: Wed, 17 Jan 2024 14:25:00 +0530
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t 2/2] lib/igt_kms: add support for choosing big
 joiner mode
Content-Language: en-US
References: <20240115105854.827266-1-kunal1.joshi@intel.com>
 <20240115105854.827266-3-kunal1.joshi@intel.com>
 <b5389ad8-8b98-4c04-b337-e39e7d20f5cb@intel.com>
 <0173fd3b-cf12-4aa1-977e-a994af9c91b0@intel.com>
 <6f95475b-1d5c-43ba-9fe3-310475ef7898@intel.com>
 <8fbaa612-67e2-4d7d-9f0b-eefd394ddf93@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <8fbaa612-67e2-4d7d-9f0b-eefd394ddf93@intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org, Bhanuprakash Modem <bhanuprakash.modem@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Kunal,

On 17-Jan-24 11:14 AM, Joshi, Kunal1 wrote:
> Hello Swati,
> 
> On 1/16/2024 5:33 PM, Sharma, Swati2 wrote:
>> Hi Kunal,
>>
>> On 16-Jan-24 5:29 PM, Joshi, Kunal1 wrote:
>>> Hello Swati,
>>>
>>> On 1/16/2024 4:34 PM, Sharma, Swati2 wrote:
>>>> Hi Kunal,
>>>>
>>>> On 15-Jan-24 4:28 PM, Kunal Joshi wrote:
>>>>> add support to choose big joiner mode with environment
>>>>> variable, use mode with highest clock if no mode with big joiner
>>>>> found.
>>>>>
>>>>> v2: reuse bigjoiner_mode_found (Bhanu)
>>>>> v3: avoid returning from multiple places (Bhanu)
>>>>>      avoid frequent debugfs reads (Bhanu)
>>>>>
>>>>> Cc: Karthik B S <karthik.b.s@intel.com>
>>>>> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>>>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>>>>> ---
>>>>>   lib/igt_kms.c | 24 +++++++++++++++++++-----
>>>>>   1 file changed, 19 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>>>>> index cb6d57c2d..2c4210d4b 100644
>>>>> --- a/lib/igt_kms.c
>>>>> +++ b/lib/igt_kms.c
>>>>> @@ -1771,8 +1771,9 @@ void 
>>>>> igt_sort_connector_modes(drmModeConnector *connector,
>>>>>   bool kmstest_get_connector_default_mode(int drm_fd, 
>>>>> drmModeConnector *connector,
>>>>>                       drmModeModeInfo *mode)
>>>>>   {
>>>>> +    bool found;
>>>>>       char *env;
>>>>> -    int i;
>>>>> +    int i, max_dotclock;
>>>>>         if (!connector->count_modes) {
>>>>>           igt_warn("no modes for connector %d\n",
>>>>> @@ -1781,21 +1782,34 @@ bool kmstest_get_connector_default_mode(int 
>>>>> drm_fd, drmModeConnector *connector,
>>>>>       }
>>>>>         env = getenv("IGT_KMS_RESOLUTION");
>>>>> +    max_dotclock = igt_get_max_dotclock(drm_fd);
>>>>>       if (env) {
>>>>>           /*
>>>>> -         * Only (0 or 1) and (lowest or highest) are allowed.
>>>>> +         * Only (0 or 1 or 2) and (lowest or highest or joiner) 
>>>>> are allowed.
>>>>>            *
>>>>>            * 0/lowest: Choose connector mode with lowest possible 
>>>>> resolution.
>>>>>            * 1/highest: Choose connector mode with highest possible 
>>>>> resolution.
>>>>> +         * 2/joiner: Choose connector mode with bigjoiner support 
>>>>> or with
>>>>> +                 highest clock if can't support  big joiner
>>>>
>>>> Shouldn't this be only joiner mode?
>>>>
>>>>
>>> You mean can be named as joiner mode because same can be used for big 
>>> joiner / ultra joiner?
>>
>> I guess this should be bigjoiner mode only. For ultra there might be 
>> other restrictions which we need to look at.
>>
>>> or
>>> We are returning the highest clock mode if no big joiner mode found?
>>
>> Yes, this is my query here. Why are we returning highest clock mode if 
>> no big joiner mode found?
>>
> We can return either with highest clock or highest resolution or default 
> mode,
> Since we have the other two already covered used highest clock.

But why we need to return something if bigjoiner mode not found?
If its not found, then we won't get to know only bigjoiner mode not 
found and we are falling back to default mode.
@bhanu what you suggest here?

>>>>>            */
>>>>> -        if (!strcmp(env, "highest") || !strcmp(env, "1"))
>>>>> +        if (!strcmp(env, "joiner") || !strcmp(env, "2"))
>>>>> +            found = bigjoiner_mode_found(drm_fd, connector,
>>>>> + sort_drm_modes_by_clk_dsc,mode,
>>>>> +                             max_dotclock) ||
>>>>> +                bigjoiner_mode_found(drm_fd, connector,
>>>>> +                             sort_drm_modes_by_res_dsc, mode,
>>>>> +                             max_dotclock) ||
>>>>> +                bigjoiner_mode_found(drm_fd, connector,
>>>>> +                             sort_drm_modes_by_clk_dsc, mode,
>>>>> +                             max_dotclock);
>>>>> +        else if (!strcmp(env, "highest") || !strcmp(env, "1"))
>>>>>               igt_sort_connector_modes(connector, 
>>>>> sort_drm_modes_by_res_dsc);
>>>>>           else if (!strcmp(env, "lowest") || !strcmp(env, "0"))
>>>>>               igt_sort_connector_modes(connector, 
>>>>> sort_drm_modes_by_res_asc);
>>>>>           else
>>>>>               goto default_mode;
>>>>> -
>>>>> -        *mode = connector->modes[0];
>>>>> +        if (!found)
>>>>> +            *mode = connector->modes[0];
>>>>>           return true;
>>>>>       }

