Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E300C47422
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 14:15:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4CE10E7F2;
	Thu, 18 Jan 2024 14:15:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA1310E7F2
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 14:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705587357; x=1737123357;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=z5BmA//eWOWBH1iEyhLQMKt+M6tmmTvP5GZvxUXLl30=;
 b=B8vL1gAMBElTHVMH2kJk6DAbuSZhIVIEU/i0eYUzfQaHTw6vQpH/3/OZ
 ZUbEt/5F8DV1JOaXzNWBXPC4QMcBOvp0nmIixjI9Hq9Ya8YHiLz+QsUmO
 Uwf0BLaSiKJA6hiNQZFHP+8mmuH/2mR9PcNZCHAVPKskDtl1p4dMDrxe2
 ztWyw9ry3BHg4cLzj/6SNssiyTHHN2gh1V2oMOpiz1kFZaGhg0QuEexDg
 wQNe9OC4xOb5D7eldDkDgLRVbyejbNEA4jDuj+8uimM7PTmhUAqj/n3PY
 +UzrxIr5NKPjb2R96jqZVtIB0ntZSGrpMspfTME5Gt9+Z8TQgesVTkyxD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7856779"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="7856779"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 06:15:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="26489248"
Received: from swatish2-mobl2.gar.corp.intel.com (HELO [10.213.81.131])
 ([10.213.81.131])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 06:15:49 -0800
Message-ID: <f51a848f-a9e9-4a14-9257-495c918631c6@intel.com>
Date: Thu, 18 Jan 2024 19:45:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] lib/igt_kms: add support for choosing big
 joiner mode
Content-Language: en-US
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "Joshi, Kunal1" <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
References: <20240115105854.827266-1-kunal1.joshi@intel.com>
 <20240115105854.827266-3-kunal1.joshi@intel.com>
 <b5389ad8-8b98-4c04-b337-e39e7d20f5cb@intel.com>
 <0173fd3b-cf12-4aa1-977e-a994af9c91b0@intel.com>
 <6f95475b-1d5c-43ba-9fe3-310475ef7898@intel.com>
 <8fbaa612-67e2-4d7d-9f0b-eefd394ddf93@intel.com>
 <407a6e9e-b0be-4b67-bbde-94f51a46fe52@intel.com>
 <c5ebf27a-ef80-4ebc-b1d5-95ddd7a629d7@intel.com>
 <29fe498d-56b7-4d65-b3e4-42172c17f404@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <29fe498d-56b7-4d65-b3e4-42172c17f404@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Bhanu,

On 18-Jan-24 2:40 PM, Modem, Bhanuprakash wrote:
> 
> On 17-01-2024 02:44 pm, Joshi, Kunal1 wrote:
>> Hello Swati and Bhanu,
>>
>> On 1/17/2024 2:25 PM, Sharma, Swati2 wrote:
>>> Hi Kunal,
>>>
>>> On 17-Jan-24 11:14 AM, Joshi, Kunal1 wrote:
>>>> Hello Swati,
>>>>
>>>> On 1/16/2024 5:33 PM, Sharma, Swati2 wrote:
>>>>> Hi Kunal,
>>>>>
>>>>> On 16-Jan-24 5:29 PM, Joshi, Kunal1 wrote:
>>>>>> Hello Swati,
>>>>>>
>>>>>> On 1/16/2024 4:34 PM, Sharma, Swati2 wrote:
>>>>>>> Hi Kunal,
>>>>>>>
>>>>>>> On 15-Jan-24 4:28 PM, Kunal Joshi wrote:
>>>>>>>> add support to choose big joiner mode with environment
>>>>>>>> variable, use mode with highest clock if no mode with big joiner
>>>>>>>> found.
>>>>>>>>
>>>>>>>> v2: reuse bigjoiner_mode_found (Bhanu)
>>>>>>>> v3: avoid returning from multiple places (Bhanu)
>>>>>>>>      avoid frequent debugfs reads (Bhanu)
>>>>>>>>
>>>>>>>> Cc: Karthik B S <karthik.b.s@intel.com>
>>>>>>>> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>>>>>>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>>>>>>>> ---
>>>>>>>>   lib/igt_kms.c | 24 +++++++++++++++++++-----
>>>>>>>>   1 file changed, 19 insertions(+), 5 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>>>>>>>> index cb6d57c2d..2c4210d4b 100644
>>>>>>>> --- a/lib/igt_kms.c
>>>>>>>> +++ b/lib/igt_kms.c
>>>>>>>> @@ -1771,8 +1771,9 @@ void 
>>>>>>>> igt_sort_connector_modes(drmModeConnector *connector,
>>>>>>>>   bool kmstest_get_connector_default_mode(int drm_fd, 
>>>>>>>> drmModeConnector *connector,
>>>>>>>>                       drmModeModeInfo *mode)
>>>>>>>>   {
>>>>>>>> +    bool found;
>>>>>>>>       char *env;
>>>>>>>> -    int i;
>>>>>>>> +    int i, max_dotclock;
>>>>>>>>         if (!connector->count_modes) {
>>>>>>>>           igt_warn("no modes for connector %d\n",
>>>>>>>> @@ -1781,21 +1782,34 @@ bool 
>>>>>>>> kmstest_get_connector_default_mode(int drm_fd, drmModeConnector 
>>>>>>>> *connector,
>>>>>>>>       }
>>>>>>>>         env = getenv("IGT_KMS_RESOLUTION");
>>>>>>>> +    max_dotclock = igt_get_max_dotclock(drm_fd);
>>>>>>>>       if (env) {
>>>>>>>>           /*
>>>>>>>> -         * Only (0 or 1) and (lowest or highest) are allowed.
>>>>>>>> +         * Only (0 or 1 or 2) and (lowest or highest or joiner) 
>>>>>>>> are allowed.
>>>>>>>>            *
>>>>>>>>            * 0/lowest: Choose connector mode with lowest 
>>>>>>>> possible resolution.
>>>>>>>>            * 1/highest: Choose connector mode with highest 
>>>>>>>> possible resolution.
>>>>>>>> +         * 2/joiner: Choose connector mode with bigjoiner 
>>>>>>>> support or with
>>>>>>>> +                 highest clock if can't support  big joiner
>>>>>>>
>>>>>>> Shouldn't this be only joiner mode?
>>>>>>>
>>>>>>>
>>>>>> You mean can be named as joiner mode because same can be used for 
>>>>>> big joiner / ultra joiner?
>>>>>
>>>>> I guess this should be bigjoiner mode only. For ultra there might 
>>>>> be other restrictions which we need to look at.
>>>>>
>>>>>> or
>>>>>> We are returning the highest clock mode if no big joiner mode found?
>>>>>
>>>>> Yes, this is my query here. Why are we returning highest clock mode 
>>>>> if no big joiner mode found?
>>>>>
>>>> We can return either with highest clock or highest resolution or 
>>>> default mode,
>>>> Since we have the other two already covered used highest clock.
>>>
>>> But why we need to return something if bigjoiner mode not found?
>>> If its not found, then we won't get to know only bigjoiner mode not 
>>> found and we are falling back to default mode.
>>> @bhanu what you suggest here?
>>>
>> Consider a setup with two display's with one having mode with big 
>> joiner support and other doesn't have any mode
>> for enabling big joiner.
>>
>> In such case we expect the tests to run.
>> We can discuss on what mode to use on the display (highest_clock, 
>> highest_res, default) which doesn't support big joiner, but we need to 
>> have a mode there is
>> what i understand.
> 
> IMHO, We should fall back to default mode if there is no bigjoiner 
> supported mode available.

Makes sense.

Should we have
igt_info("Using IGT_KMS_RESOLUTION=%d as default mode\n", env);
like something we have for IGT_SRANDOM env var.
igt_info("Using IGT_SRANDOM=%d for randomisation\n", seed);
> 
> As per my understanding, Pick the mode that exercises the max bandwidth 
> if there is no bigjoiner mode available is the expectation from Kunal.
> 
> - Bhanu
> 
>>>>>>>>            */
>>>>>>>> -        if (!strcmp(env, "highest") || !strcmp(env, "1"))
>>>>>>>> +        if (!strcmp(env, "joiner") || !strcmp(env, "2"))
>>>>>>>> +            found = bigjoiner_mode_found(drm_fd, connector,
>>>>>>>> + sort_drm_modes_by_clk_dsc,mode,
>>>>>>>> +                             max_dotclock) ||
>>>>>>>> +                bigjoiner_mode_found(drm_fd, connector,
>>>>>>>> +                             sort_drm_modes_by_res_dsc, mode,
>>>>>>>> +                             max_dotclock) ||
>>>>>>>> +                bigjoiner_mode_found(drm_fd, connector,
>>>>>>>> +                             sort_drm_modes_by_clk_dsc, mode,
>>>>>>>> +                             max_dotclock);
>>>>>>>> +        else if (!strcmp(env, "highest") || !strcmp(env, "1"))
>>>>>>>>               igt_sort_connector_modes(connector, 
>>>>>>>> sort_drm_modes_by_res_dsc);
>>>>>>>>           else if (!strcmp(env, "lowest") || !strcmp(env, "0"))
>>>>>>>>               igt_sort_connector_modes(connector, 
>>>>>>>> sort_drm_modes_by_res_asc);
>>>>>>>>           else
>>>>>>>>               goto default_mode;
>>>>>>>> -
>>>>>>>> -        *mode = connector->modes[0];
>>>>>>>> +        if (!found)
>>>>>>>> +            *mode = connector->modes[0];
>>>>>>>>           return true;
>>>>>>>>       }
>> Thanks and Regards
>> Kunal Joshi
