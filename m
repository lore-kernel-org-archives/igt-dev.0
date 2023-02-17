Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E4D10E439
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Feb 2023 08:20:43 +0000 (UTC)
Message-ID: <6371584d-3244-b452-46f9-787fa55eb2ae@intel.com>
Date: Fri, 17 Feb 2023 13:50:39 +0530
MIME-Version: 1.0
Content-Language: en-US
To: juhapekka.heikkila@gmail.com, igt-dev@lists.freedesktop.org
References: <20230215165947.15421-1-swati2.sharma@intel.com>
 <20230215165947.15421-3-swati2.sharma@intel.com>
 <7e7644dc-488d-2f88-2c93-c089b8a3af01@gmail.com>
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <7e7644dc-488d-2f88-2c93-c089b8a3af01@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] tests/kms_plane_scaling: Remove
 extra newline
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



On 16-Feb-23 9:01 PM, Juha-Pekka Heikkila wrote:
> On 15.2.2023 18.59, Swati Sharma wrote:
>> Remove extra newline.
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   tests/kms_plane_scaling.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
>> index 382d199e0..9737d8645 100644
>> --- a/tests/kms_plane_scaling.c
>> +++ b/tests/kms_plane_scaling.c
>> @@ -872,7 +872,6 @@ static void invalid_parameter_tests(data_t *d)
>>                               paramtests[i].planesize[0],
>>                               paramtests[i].planesize[1]);
>> -
>>                   for (uint32_t j = 0; paramtests[i].params[j].prop != 
>> ~0; j++)
>>                       igt_plane_set_prop_value(plane,
>>                                       paramtests[i].params[j].prop,
> 
> While doing these fixes you could also fix that indentation on this 
> igt_plane_set_prop_value(..) with those following lines having parameters.

Done. Sent the new series with fixes 
https://patchwork.freedesktop.org/series/114059/
> 

-- 
~Swati Sharma
