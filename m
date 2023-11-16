Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD6710E056
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Nov 2023 03:30:33 +0000 (UTC)
Message-ID: <ca267d44-ed70-d69c-5329-b02ee54c81a6@intel.com>
Date: Thu, 16 Nov 2023 09:00:12 +0530
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20231115140231.1555702-1-bhanuprakash.modem@intel.com>
 <ZVUuIAIYjmYkQQDb@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <ZVUuIAIYjmYkQQDb@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V2] lib/igt_kms: Don't read max dotclock on
 non-display platforms
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


On Thu-16-11-2023 02:16 am, Ville Syrjälä wrote:
> On Wed, Nov 15, 2023 at 07:32:31PM +0530, Bhanuprakash Modem wrote:
>> On non-display platforms, there is no point in checking for
>> max dotclock.
>>
>> V2: Fix resource leak
>>
>> Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/9672
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   lib/igt_kms.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 89510ff22..0aa8f4a46 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -6055,10 +6055,18 @@ int igt_get_max_dotclock(int fd)
>>   	char buf[4096];
>>   	char *s;
>>   	int dir, res, max_dotclock = 0;
>> +	drmModeRes *resources;
>>   
>>   	if (!is_intel_device(fd))
>>   		return max_dotclock;
>>   
>> +	/* If there is no display, then no point to check for dotclock. */
>> +	resources = drmModeGetResources(fd);
>> +	if (!resources)
>> +		return max_dotclock;
>> +	else
>> +		drmModeFreeResources(resources);
> 
> Not a big fan of the use of 'else' here. So I'd drop that.
> 
> But otherwise looks fine, so
> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> However a simpler approach could be to just drop the old
> i915_frequency_info fallback and simply return 0 on failure
> to read i915_cdclk_info.

Sure, I'll float a separate patch for this change.

- Bhanu

> 
>> +
>>   	dir = igt_debugfs_dir(fd);
>>   	igt_require(dir);
>>   
>> -- 
>> 2.40.0
> 
