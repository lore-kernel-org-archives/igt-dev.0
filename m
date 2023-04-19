Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DD910E05F
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Apr 2023 04:41:22 +0000 (UTC)
Message-ID: <a00b7aa6-7229-8930-c94a-e28a48665190@intel.com>
Date: Wed, 19 Apr 2023 10:11:07 +0530
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Zack Rusin <zackr@vmware.com>,
 <krastevm@vmware.com>, <mombasawalam@vmware.com>, <banackm@vmware.com>,
 <adrinael@adrinael.net>, <iforbes@vmware.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
References: <20230413012426.503658-1-zack@kde.org>
 <20230413012426.503658-9-zack@kde.org>
 <20230417123911.mcrcvgvfes4ritsi@kamilkon-desk1>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230417123911.mcrcvgvfes4ritsi@kamilkon-desk1>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v4 8/8] lib: Fix igt_kms for drivers
 with 8 crtc's
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


On 4/17/2023 6:09 PM, Kamil Konieczny wrote:
> Hi,
>
> On 2023-04-12 at 21:24:26 -0400, Zack Rusin wrote:
>> From: Zack Rusin <zackr@vmware.com>
>>
>> To avoid crashes in multiple tests on vmwgfx we need to extend the
>> number of available pipe's to be at least as big as the the number
>> returned by the virtualized drivers (which is 8).
>>
>> Signed-off-by: Zack Rusin <zackr@vmware.com>
>> Reviewed-by: Martin Krastev <krastevm@vmware.com>
>> Reviewed-by: Maaz Mombasawala <mombasawalam@vmware.com>
> imho this should have no impact on kms tests but I will ask also
> Bhanuprakash, Ville and Karthik so +cc them on this.

Agreed.

Acked-by: Karthik B S <karthik.b.s@intel.com>

>
> Regards,
> Kamil
>
>> ---
>>   lib/igt_kms.c | 2 +-
>>   lib/igt_kms.h | 2 ++
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 50655f13..a23999cb 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -840,7 +840,7 @@ static igt_plane_t *igt_get_assigned_primary(igt_output_t *output, igt_pipe_t *p
>>    */
>>   const char *kmstest_pipe_name(enum pipe pipe)
>>   {
>> -	static const char str[] = "A\0B\0C\0D\0E\0F";
>> +	static const char str[] = "A\0B\0C\0D\0E\0F\0G\0H";
>>   
>>   	_Static_assert(sizeof(str) == IGT_MAX_PIPES * 2,
>>   		       "Missing pipe name");
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index 2b917925..d3a39e24 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -62,6 +62,8 @@ enum pipe {
>>           PIPE_D,
>>           PIPE_E,
>>           PIPE_F,
>> +	PIPE_G,
>> +	PIPE_H,
>>           IGT_MAX_PIPES
>>   };
>>   const char *kmstest_pipe_name(enum pipe pipe);
>> -- 
>> 2.39.2
>>
