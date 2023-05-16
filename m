Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1C010E0A6
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 13:42:03 +0000 (UTC)
Message-ID: <ea7bf812-1a71-f108-352b-d119e790d617@intel.com>
Date: Tue, 16 May 2023 19:11:35 +0530
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20230504045726.2954788-1-bhanuprakash.modem@intel.com>
 <20230504045726.2954788-3-bhanuprakash.modem@intel.com>
 <20230511053006.glmndozicu2zpdf5@zkempczy-mobl2>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230511053006.glmndozicu2zpdf5@zkempczy-mobl2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 2/6] lib: Cache xe_device at driver open/close
 level
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

Hi Zbigniew,

On Thu-11-05-2023 11:00 am, Zbigniew Kempczyński wrote:
> On Thu, May 04, 2023 at 10:27:22AM +0530, Bhanuprakash Modem wrote:
>> Instead of caching the xe_device struct at subtest level, cache
>> just after opening the driver. And remove from the cache just
>> before closing the driver.
>>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   lib/drmtest.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/lib/drmtest.c b/lib/drmtest.c
>> index 03b5239b2..f6cd8e500 100644
>> --- a/lib/drmtest.c
>> +++ b/lib/drmtest.c
>> @@ -63,6 +63,7 @@
>>   #include "intel_reg.h"
>>   #include "ioctl_wrappers.h"
>>   #include "igt_dummyload.h"
>> +#include "xe/xe_query.h"
>>   
>>   /**
>>    * SECTION:drmtest
>> @@ -601,6 +602,10 @@ int drm_open_driver(int chipset)
>>   		}
>>   	}
>>   
>> +	/* Cache xe_device struct. */
>> +	if (is_xe_device(fd))
>> +		xe_device_get(fd);
>> +
>>   	return fd;
>>   }
>>   
> 
> Imo this should land to __drm_open_driver_another() and
> __drm_open_driver_render().

Agreed, will float a new rev with these changes.

> 
> gem_reopen_driver() still requires explicit device get for xe.

This fix is already landed in IGT:
https://cgit.freedesktop.org/drm/igt-gpu-tools/commit/?id=a48277948

- Bhanu

> 
> --
> Zbigniew
> 
> 
>> @@ -618,6 +623,10 @@ int drm_close_driver(int fd)
>>   	if (fd < 3)
>>   		return -1;
>>   
>> +	/* Remove xe_device from cache. */
>> +	if (is_xe_device(fd))
>> +		xe_device_put(fd);
>> +
>>   	return close(fd);
>>   }
>>   
>> -- 
>> 2.40.0
>>
