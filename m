Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B3F10E0F1
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Jan 2023 05:28:34 +0000 (UTC)
Message-ID: <324d68f2-2d9d-6b81-3d5d-73e86930a1f8@intel.com>
Date: Sat, 21 Jan 2023 10:58:28 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
References: <20230120174119.3937-1-swati2.sharma@intel.com>
 <20230120174119.3937-6-swati2.sharma@intel.com>
 <20230120181243.oysvrqxat3vs7gzh@kamilkon-desk1>
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <20230120181243.oysvrqxat3vs7gzh@kamilkon-desk1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 5/5] lib/igt_fb: add missing include in
 header
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

Thanks for the patch Kamil!
https://patchwork.freedesktop.org/series/113170/ gitlab pipeline is 
success now.

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 20-Jan-23 11:42 PM, Kamil Konieczny wrote:
> Hi,
> 
> On 2023-01-20 at 23:11:19 +0530, Swati Sharma wrote:
>> From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>
>> Direct include of lib igt_fb header breaks builds with errors
>>
>> xf86drmMode.h:533:2: error: unknown type name ‘uint32_t’
>>
>> Fixed it with adding proper include in heade
> 
> This one should be first in series, not last one.

I can re-float if required.

> 
> Petri: there is also no [igt-dev] in subject ?
> 
> Regards,
> Kamil
> 
>>
>> Cc: Swati Sharma <swati2.sharma@intel.com>
>> Cc: Petri Latvala <petri.latvala@intel.com>
>> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> ---
>>   lib/igt_fb.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/lib/igt_fb.h b/lib/igt_fb.h
>> index 6995b14b..73bdfc86 100644
>> --- a/lib/igt_fb.h
>> +++ b/lib/igt_fb.h
>> @@ -32,6 +32,7 @@
>>   #include <cairo.h>
>>   #include <stddef.h>
>>   #include <stdbool.h>
>> +#include <stdint.h>
>>   #include <drm_fourcc.h>
>>   #include <xf86drmMode.h>
>>   
>> -- 
>> 2.25.1
>>

-- 
~Swati Sharma
