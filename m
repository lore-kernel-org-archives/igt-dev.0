Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76E510E0B5
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Nov 2023 03:36:16 +0000 (UTC)
Message-ID: <310e8d63-05d0-df64-f500-e32f01a3b248@intel.com>
Date: Thu, 16 Nov 2023 09:05:29 +0530
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>
References: <20231115133923.1539402-1-bhanuprakash.modem@intel.com>
 <20231115162058.z55w7pywj3y2npwl@kamilkon-desk.igk.intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20231115162058.z55w7pywj3y2npwl@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] lib/igt_draw: Check for Rendercopy support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Kamil,

On Wed-15-11-2023 09:50 pm, Kamil Konieczny wrote:
> Hi Bhanuprakash,
> On 2023-11-15 at 19:09:23 +0530, Bhanuprakash Modem wrote:
>> igt_draw_supports_method() is initially designed to identify
>> that the given driver (i915/xe) supports the slected draw
> ----------------------------------------------- ^
> s/slected/selected/
> 
>> method.
>>
>> Even though Rendercopy support in IGT is not present for few
>> latest platforms, this api assums that Rendercopy is present.
> --------------------------------- ^
> s/assums/assumes/
> 
> With that
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 

Thanks for the review, I'll fix these typos while merging.

>> Add a check if Rendercopy supports on given platform or not.
>>
>> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   lib/igt_draw.c | 3 +++
> 
> Btw this sits in main lib/ but is intel-centric.

Yep, we need a cleanup as there are many other intel specific helpers 
are in main lib.

I'll try to work on this activity.

- Bhanu

> 
> Regards,
> Kamil
> 
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/lib/igt_draw.c b/lib/igt_draw.c
>> index 9a7664a37..498c69a56 100644
>> --- a/lib/igt_draw.c
>> +++ b/lib/igt_draw.c
>> @@ -950,5 +950,8 @@ bool igt_draw_supports_method(int fd, enum igt_draw_method method)
>>   	if (method == IGT_DRAW_MMAP_CPU || method == IGT_DRAW_PWRITE)
>>   		return is_i915_device(fd);
>>   
>> +	if (method == IGT_DRAW_RENDER)
>> +		return !!igt_get_render_copyfunc(intel_get_drm_devid(fd));
>> +
>>   	return true;
>>   }
>> -- 
>> 2.40.0
>>
