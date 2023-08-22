Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::60f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69ED10E0B5
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Aug 2023 20:57:56 +0000 (UTC)
Message-ID: <a5c62ee7-b17b-4d03-83ff-e8e579009679@amd.com>
Date: Tue, 22 Aug 2023 16:57:54 -0400
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, hersenxs.wu@amd.com,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Petri Latvala <adrinael@adrinael.net>
References: <20230822201833.29474-1-aurabindo.pillai@amd.com>
 <20230822204709.zuoxonzyn5ij42jy@kamilkon-desk.igk.intel.com>
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20230822204709.zuoxonzyn5ij42jy@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v4] tests/amdgpu: Fix build error due to
 external file include
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



On 2023-08-22 16:47, Kamil Konieczny wrote:
> Hi Aurabindo,
> 
> On 2023-08-22 at 16:18:33 -0400, Aurabindo Pillai wrote:
>> Remove the external file include that causes build error
>> on certain systems configured in the CI.
>>
>> Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
>> ---
>>   tests/amdgpu/amd_odm.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/tests/amdgpu/amd_odm.c b/tests/amdgpu/amd_odm.c
>> index 2781ad1c2..839f2de3f 100644
>> --- a/tests/amdgpu/amd_odm.c
>> +++ b/tests/amdgpu/amd_odm.c
>> @@ -5,7 +5,6 @@
>>   
>>   #include <fcntl.h>
>>   #include <stdio.h>
>> -#include <xf86drmMode.h>
> 
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Will this test work without xf86drmMode.h?
> If it is kms test you may just include igt_kms.h but first
> apply fix (or revert).

Yes, looks like IGT already includes all the necessary headers.

> 
> Regards,
> Kamil
> 
>>   
>>   #include "igt.h"
>>   #include "igt_amd.h"
>> -- 
>> 2.41.0
>>

-- 
--

Thanks & Regards,
Jay
