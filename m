Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C985610E7C5
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Nov 2023 09:04:47 +0000 (UTC)
Message-ID: <dfc1e93d-6d75-4b61-b04a-9e3f361609ed@intel.com>
Date: Fri, 24 Nov 2023 10:04:41 +0100
Content-Language: pl
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <marcin.bernatowicz@linux.intel.com>,
 <zbigniew.kempczynski@intel.com>
References: <20231122124052.16906-1-lukasz.laguna@intel.com>
 <20231122124052.16906-2-lukasz.laguna@intel.com>
 <20231123173520.vrgapopkcmmmbqnb@kamilkon-desk.igk.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20231123173520.vrgapopkcmmmbqnb@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] lib/igt_core: initialize srandom
 seed on startup
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

On 11/23/2023 18:35, Kamil Konieczny wrote:
> Hi Lukasz,
> On 2023-11-22 at 13:40:52 +0100, Lukasz Laguna wrote:
>> Init seed for random number generator on IGT startup.
>>
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> LGTM
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Hi Kamil,
Thanks for review. I've just sent a patch with rb added. Can you please 
merge it?
>> ---
>>   lib/igt_core.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/lib/igt_core.c b/lib/igt_core.c
>> index 041e4b328..1abe3d337 100644
>> --- a/lib/igt_core.c
>> +++ b/lib/igt_core.c
>> @@ -1283,6 +1283,7 @@ out:
>>   		bind_fbcon(false);
>>   		igt_kmsg(KMSG_INFO "%s: executing\n", command_str);
>>   		print_version();
>> +		igt_srandom();
>>   
>>   		sync();
>>   		oom_adjust_for_doom();
>> -- 
>> 2.40.0
>>
