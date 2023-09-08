Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7D910E0DB
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 17:39:50 +0000 (UTC)
Message-ID: <0e66b320-d13c-da95-4f3a-852c17c654d9@linux.intel.com>
Date: Fri, 8 Sep 2023 19:39:46 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 lukasz.laguna@intel.com
References: <20230908125454.2670405-1-marcin.bernatowicz@linux.intel.com>
 <20230908125454.2670405-5-marcin.bernatowicz@linux.intel.com>
 <20230908171021.4pchfq4fbwqa6jib@kamilkon-desk.igk.intel.com>
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20230908171021.4pchfq4fbwqa6jib@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v4 4/4] lib/xe_spin.c: fixed checkpatch
 issue
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

On 9/8/2023 7:10 PM, Kamil Konieczny wrote:
> Hi Marcin,
> 
> now checkpatch complains about subject of your change:
> WARNING: A patch subject line should describe the change not the tool that found it
> #4:
> Subject: [PATCH i-g-t 4/4] lib/xe_spin.c: fixed checkpatch issue
> 
> so I suggest other, like: fixed code style
> 
> with that:
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Regards,
> Kamil

sorry for that, will send corrected v5 with added one missing r-b

--
marcin

> 
> On 2023-09-08 at 12:54:54 +0000, Marcin Bernatowicz wrote:
>> fixed checkpatch reported error
>>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> ---
>>   lib/xe/xe_spin.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
>> index d8e2c07aa..f0d77aed3 100644
>> --- a/lib/xe/xe_spin.c
>> +++ b/lib/xe/xe_spin.c
>> @@ -165,7 +165,8 @@ bool xe_spin_started(struct xe_spin *spin)
>>    */
>>   void xe_spin_wait_started(struct xe_spin *spin)
>>   {
>> -	while(!xe_spin_started(spin));
>> +	while (!xe_spin_started(spin))
>> +		;
>>   }
>>   
>>   void xe_spin_end(struct xe_spin *spin)
>> -- 
>> 2.30.2
>>
