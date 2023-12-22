Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A0010E751
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Dec 2023 07:05:21 +0000 (UTC)
Message-ID: <b52a2b39-cc88-4655-955b-f7739f0a778b@intel.com>
Date: Fri, 22 Dec 2023 12:34:43 +0530
Subject: Re: [PATCH i-g-t] tests/kms_lease: Cache xe_device info for lease fd
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20231212100712.3301571-1-mohammed.thasleem@intel.com>
 <4dadb6ba-89e5-48bd-9de3-548533864c01@intel.com>
In-Reply-To: <4dadb6ba-89e5-48bd-9de3-548533864c01@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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


On 12/13/2023 11:20 AM, Nautiyal, Ankit K wrote:
>
> On 12/12/2023 3:37 PM, Mohammed Thasleem wrote:
>> Cache xe_device struct info for lease fd before perpare crtc
>> with lessee's fd.
>
> I think we should add why this is required for this test.
>
>
>>
>> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
>> ---
>>   tests/kms_lease.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
>> index 8ac58af38..e57aea2a2 100644
>> --- a/tests/kms_lease.c
>> +++ b/tests/kms_lease.c
>> @@ -48,6 +48,8 @@
>>     #include <drm.h>
>>   #include "igt_device.h"
>> +#include "xe_drm.h"
>> +#include "xe/xe_query.h"
>>     /**
>>    * SUBTEST: atomic-implicit-crtc
>> @@ -305,6 +307,10 @@ static void simple_lease(data_t *data)
>>       /* Create a valid lease */
>>       igt_assert_eq(make_lease(data), 0);
>>   +    /* Cache xe_device struct */
>> +    if (is_xe_device(data->lease.fd))
>> +        xe_device_get(data->lease.fd);
>
>
> I wonder this will be required for other subtests too.
>
> I think we should call this in make_lease(), after create_lease() is 
> successful and we get file descriptor for the lease.


Missed to mention, we also need to remove it with xe_device_put, while 
terminating the lease.

Regards,

Ankit

>
>
> Regards,
>
> Ankit
>
>
>
>> +
>>       igt_display_require(&data->lease.display, data->lease.fd);
>>         /* Set a mode on the leased output */
>> @@ -772,6 +778,10 @@ static void lease_revoke(data_t *data)
>>       /* Create a valid lease */
>>       igt_assert_eq(make_lease(data), 0);
>>   +    /* Cache xe_device struct */
>> +    if (is_xe_device(data->lease.fd))
>> +        xe_device_get(data->lease.fd);
>> +
>>       igt_display_require(&data->lease.display, data->lease.fd);
>>         /* try to revoke an invalid lease */
