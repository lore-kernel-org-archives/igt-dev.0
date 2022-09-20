Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671AE10E71C
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Sep 2022 16:51:44 +0000 (UTC)
Message-ID: <0ad2e467-b62e-fa4b-e3b3-968c8d08a8c9@intel.com>
Date: Tue, 20 Sep 2022 22:21:30 +0530
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20220915135739.3542117-1-riana.tauro@intel.com>
 <20220915135739.3542117-2-riana.tauro@intel.com>
 <87tu52ca09.wl-ashutosh.dixit@intel.com>
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <87tu52ca09.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] lib/igt_device_scan: clear
 igt_devs.devs_scanned in igt_devices_free
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Ashutosh

This is seen after

https://patchwork.freedesktop.org/patch/502118/?series=108305&rev=2

The changes that were made in the i915_suspend@basic-s2idle-without-i915 
to disable d3cold_allowed uses the functions igt_devices_scan(false) and 
igt_devices_free() to get the first discrete card

https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6659/bat-dg2-9/igt@i915_suspend@basic-s3-without-i915.html

The issue is only seen when a device filter is used. 
igt_devices_scan(true) can be used too after module_load, but it will 
not be necessary if filter is not used


On 9/20/2022 9:29 PM, Dixit, Ashutosh wrote:
> On Thu, 15 Sep 2022 06:57:39 -0700, Riana Tauro wrote:
>>
> 
> Hi Riana,
> 
>> igt_devices_scan returns with empty list if devs_scanned
>> is true and function is called after igt_devices_free
>>
>> clear igt_devs.devs_scanned in igt_devices_free.
> 
> The patch seems reasonable but could you please describe where you saw this
> issue? It seems 'igt_devices_scan(true)' (called with force == true) will
> get past this issue. Not too familiar with igt_devices_scan() usage so
> copying some more people.
> 
> Also I am not sure why igt_devices_scan() doesn't simply do this:
> 
> void igt_devices_scan(bool force)
> {
> 	if (force && igt_devs.devs_scanned) {
> 		igt_devices_free();
> 
> 		/* Not needed after this patch */
> 		igt_devs.devs_scanned = false;
> 	}
> 
> 
> 
> Thanks.
> --
> Ashutosh
> 
> 
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   lib/igt_device_scan.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
>> index eb6b45b8..e7c05d5c 100644
>> --- a/lib/igt_device_scan.c
>> +++ b/lib/igt_device_scan.c
>> @@ -1030,6 +1030,7 @@ void igt_devices_free(void)
>> 		igt_device_free(dev);
>> 		free(dev);
>> 	}
>> +	igt_devs.devs_scanned = false;
>>   }
>>
>>   /**
>> --
>> 2.25.1
>>

Thanks
Riana Tauro
