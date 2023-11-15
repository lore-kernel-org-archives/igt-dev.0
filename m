Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A96010E070
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Nov 2023 12:02:07 +0000 (UTC)
Message-ID: <73973ce7-da93-4085-2dd1-5a2e5188b107@intel.com>
Date: Wed, 15 Nov 2023 17:31:47 +0530
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20231115090605.1506704-1-bhanuprakash.modem@intel.com>
 <ZVSmcDIr7pVS_odg@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <ZVSmcDIr7pVS_odg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] lib/igt_kms: Don't read max dotclock on
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


On Wed-15-11-2023 04:37 pm, Ville Syrjälä wrote:
> On Wed, Nov 15, 2023 at 02:36:05PM +0530, Bhanuprakash Modem wrote:
>> On non-display platforms, there is no point in checking for
>> max dotclock.
>>
>> Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/9672
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   lib/igt_kms.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 89510ff22..2073fae53 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -6056,7 +6056,8 @@ int igt_get_max_dotclock(int fd)
>>   	char *s;
>>   	int dir, res, max_dotclock = 0;
>>   
>> -	if (!is_intel_device(fd))
>> +	/* If there is no display, then no point to check for dotclock. */
>> +	if (!is_intel_device(fd) || !drmModeGetResources(fd))
> 
> That will leak.

I'm really sorry I couldn't get you. Can you elaborate, please? :-)

- Bhanu

> 
>>   		return max_dotclock;
>>   
>>   	dir = igt_debugfs_dir(fd);
>> -- 
>> 2.40.0
> 
