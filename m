Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E3310E448
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jan 2024 08:49:55 +0000 (UTC)
Message-ID: <960382c0-a8ef-464b-ada5-c9d66a58561e@linux.intel.com>
Date: Tue, 16 Jan 2024 08:49:50 +0000
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t] tools/intel_gpu_top: Fix misaligned rendering
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, anonymoustranquillity@proton.me
References: <cPSpR9MXRhQ1yFaJm1l9QDoVT9SiH_resuKtBB52HnpHOiI5AO2BPTNYg3Srfj_vaU8_u-cSp5u7luqyAUta-9p8EjyIGKhizxL4hCwMNpY=@proton.me>
 <20240115152907.ilhrhy5zhegt4b7l@kamilkon-desk.igk.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20240115152907.ilhrhy5zhegt4b7l@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


Hi,

On 15/01/2024 15:29, Kamil Konieczny wrote:
> Hi anonymoustranquillity,
> On 2024-01-14 at 21:26:36 +0000, anonymoustranquillity@proton.me wrote:
>> Hello,
>>
>> there seems to be a problem with rendering in the interactive
>> mode in intel_gpu_top, seems to be a simple off-by-one. Below
>> is a patch. I am new to contributing via email, so I apologize
>> if I did something wrong - I tried to follow CONTRIBUTING.md
>> to the best of my ability.

What renders incorrectly? Asking since locally things look fine for me.

Regards,

Tvrtko

>>
>> Have a nice day,
>> - Ity.
> 
> Thank you for patch, if you would like to use git and re-send
> with the help of 'git format-patch -1' and then
> 'git send e-mail 0001-your-first.patch'
> 
> Before that setup your real name and e-mail in git configuration,
> like "First Last <your@email-address.me>"
> 
> If it is too much bother someone can take it from here
> but without your real name we cannot give you contribution
> (except for link into patchwork).
> 
> +cc Tvrtko
> 
> Regards,
> Kamil
> 
>>
>> ---
>>   tools/intel_gpu_top.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
>> index 046ead15a..24363e72f 100644
>> --- a/tools/intel_gpu_top.c
>> +++ b/tools/intel_gpu_top.c
>> @@ -2178,7 +2178,7 @@ print_client(struct igt_drm_client *c, struct engines *engines, double t, int li
>>   			len += *class_w;
>>   		}
>>   
>> -		printf(" %-*s\n", con_w - len - 1, c->print_name);
>> +		printf(" %-*s\n", con_w - len - 2, c->print_name);
>>   	} else if (output_mode == JSON) {
>>   		char buf[64];
>>   
>> -- 
>> 2.43.0
>>
