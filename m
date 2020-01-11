Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A8D6E175
 for <igt-dev@lists.freedesktop.org>; Sat, 11 Jan 2020 01:05:41 +0000 (UTC)
References: <20191223221959.12814-1-robert.m.fosha@intel.com>
 <20200110174146.15480-1-robert.m.fosha@intel.com>
 <157868089371.10140.10254349676452972062@skylake-alporthouse-com>
 <5315c347-7ebc-1519-73d6-16eb0d409ec9@intel.com>
 <157868607106.10140.11425210605146276060@skylake-alporthouse-com>
From: "Ye, Tony" <tony.ye@intel.com>
Message-ID: <7d163c70-d814-4c96-271f-3e6092ca53e8@intel.com>
Date: Fri, 10 Jan 2020 17:05:38 -0800
MIME-Version: 1.0
In-Reply-To: <157868607106.10140.11425210605146276060@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v4] tests/i915/gem_huc_copy: Enable a
 HuC copy test
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
To: Chris Wilson <chris@chris-wilson.co.uk>, "Robert M. Fosha" <robert.m.fosha@intel.com>, igt-dev@lists.freedesktop.org
Cc: Sally Qi <feng.qi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



On 1/10/2020 11:54 AM, Chris Wilson wrote:
> Quoting Ye, Tony (2020-01-10 19:51:58)
>>
>>
>> On 1/10/2020 10:28 AM, Chris Wilson wrote:
>>> Quoting Robert M. Fosha (2020-01-10 17:41:46)
>>>> +static bool
>>>> +check_huc_enabled(int fd)
>>>> +{
>>>> +       int dir;
>>>> +       dir = igt_sysfs_open_parameters(fd);
>>>> +
>>>> +       if (dir < 0)
>>>> +               return 0;
>>>> +
>>>> +       if (igt_sysfs_get_u32(dir, "enable_guc") & 2)
>>>> +               return 1;
>>>> +       else
>>>> +               return 0;
>>>
>>> No. If you have this in your userspace, please immediately remove it,
>>> and backport that to any and all stable branches and releases.
>>> -Chris
>>
>> The code is to skip the test when HuC is disabled by the enable_guc
>> module parameter. If HuC is disabled by the enable_guc param, then skip
>> the test. If the HuC failed to load due to a real error, then fail the
>> test.
>>
>> Could you suggest how to handle HUC_STATUS failure properly without this
>> code?
> 
> Look at the error code from querying HUC_STATUS.
> -Chris

Agree that the check should be done via uAPI instead of the sysfs. 
Thanks for the feedback.
Tony
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
