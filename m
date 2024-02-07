Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826DCC4828D
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 18:57:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A3410E3C3;
	Wed,  7 Feb 2024 18:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="enut4uCA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695F910E3C3
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2024 18:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707332259; x=1738868259;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0NHNqdVeTt8tvveIuqn4YEAxTuFoAuLCgji9hWgRshg=;
 b=enut4uCASUHXxmoHlLdWsn7XlwSq11rvpwyP+1ney3AbyFt4XkP0i6zC
 Ohb9aZlTWgBN5I2SHqdhZfbpt2lRFy3jpvv6Oo68mYaGmNywfhhFarwbR
 JwAcbBz9R7R67iwKnQiFSxXMBDlWlgi70KxjRUG9AqrXGOY1Glpw8lT5j
 wgLfrDr1kmFhlzgivltrFEF8DS4aoQVnxT+HMiqKSpP6yQbu7CmL+/DDk
 2dQKIO87lrGiZuRPgGlUYGy0qfh0M4GuwBdGxJmJDrMyoJo8UDzZ0hQgH
 P3PpZLa1BKch9DoqnZ9hT5m4lByTWbvg7NPYR/bfTZ40k4SUk0ApH6F5V w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="26501709"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; d="scan'208";a="26501709"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 10:57:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="910073913"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; d="scan'208";a="910073913"
Received: from ahamill-mobl2.ger.corp.intel.com (HELO [10.213.228.167])
 ([10.213.228.167])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 10:57:38 -0800
Message-ID: <14f171bf-da6b-4959-8aec-84f3633f33f9@linux.intel.com>
Date: Wed, 7 Feb 2024 18:57:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/igt_drm_fdinfo: Use longest match first
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240201004744.352041-1-lucas.demarchi@intel.com>
 <20240201004744.352041-2-lucas.demarchi@intel.com>
 <20240201124321.53t4qbtlswisipoe@kamilkon-desk.igk.intel.com>
 <4givrfsdv4rnga6f4ezqp27huz5dvlgxkb65wmr2j3hx5yh3vk@wbi7soq6dihy>
 <75d148b4-7227-4757-9e67-5558b087c1fb@linux.intel.com>
 <tsybklkeuyt3jvwcnnjgkcnlfpmxjmrzbccba2ujhr4frp2flq@xerfdtftqh47>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <tsybklkeuyt3jvwcnnjgkcnlfpmxjmrzbccba2ujhr4frp2flq@xerfdtftqh47>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>


On 07/02/2024 17:50, Lucas De Marchi wrote:
> On Wed, Feb 07, 2024 at 10:32:24AM +0000, Tvrtko Ursulin wrote:
>>
>> On 01/02/2024 14:09, Lucas De Marchi wrote:
>>> On Thu, Feb 01, 2024 at 01:43:21PM +0100, Kamil Konieczny wrote:
>>>> Hi Lucas,
>>>> On 2024-01-31 at 16:46:24 -0800, Lucas De Marchi wrote:
>>>>> Instead of checking twice the match, just use longest match first.
>>>>
>>>> Nice catch, LGTM.
>>>>
>>>> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>
>> +1 looks like that was a confused change I did when adding capacity.
>>
>> Going forward feel free to copy me when changing this code, given I 
>> mostly wrote it after all..
> 
> will do, sorry for missing that for this series.
> 
> 
>>
>>>>
>>>>>
>>>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>> ---
>>>>>  lib/igt_drm_fdinfo.c | 19 +++++++++----------
>>>>>  1 file changed, 9 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>>>>> index 222ccbfb1..5c0ccf624 100644
>>>>> --- a/lib/igt_drm_fdinfo.c
>>>>> +++ b/lib/igt_drm_fdinfo.c
>>>>> @@ -239,8 +239,15 @@ __igt_parse_drm_fdinfo(int dir, const char 
>>>>> *fd, struct drm_client_fdinfo *info,
>>>>>                       strlen("drm-client-id")))) {
>>>>>              info->id = atol(v);
>>>>>              good++;
>>>>> -        } else if (!strncmp(l, "drm-engine-", 11) &&
>>>>> -               strncmp(l, "drm-engine-capacity-", 20)) {
>>>>> +        } else if (!strncmp(l, "drm-engine-capacity-", 20)) {
>>>>
>>>> One more thing to eventually fix is removing "20" which is exact
>>>> len of string, with something like
>>>>
>>>> bool str_begins(char *src, char *pattern)
>>>>
>>>> One source of errors is counting letters in strings or changing
>>>> string itself without changing corresponding len. This can be
>>>> done in separate patch.
>>>
>>> I had a patch for something similar. I usually use a strstartswith()
>>> that's commonly used in other projects and also matches the python name.
>>>
>>> However I decided to drop that for now. I may have a bigger refactor in
>>> this function soon reworking parse_engine() and other functions: Worse
>>> than manually counting the chars for the strncmp() is to call strlen()
>>> in the same string just in the line below that to feed to parse_engine()
>>> :-/. As I said, still undecided what to change here and if it's worth
>>> it.
>>
>> AFAIR hardcoded strlens were because strangely const strings fail to 
>> be evaluated at compile time and when I tested it and strlen was 
> 
> humn... strlen("foo") should always be optimized out.
> Testing with gcc 12.3 here, but it's something I always looked at:
> 
>      $ cat /tmp/a.c
>      #include <string.h>
> 
>      int foo(void)
>      {
>          return strlen("foo");
>      }
>      $ gcc -c -g -O0 -o /tmp/a.o /tmp/a.c
>      $ objdump -d /tmp/a.o
>      /tmp/a.o:     file format elf64-x86-64
> 
> 
>      Disassembly of section .text:
> 
>      0000000000000000 <foo>:
>         0:   f3 0f 1e fa             endbr64
>         4:   55                      push   %rbp
>         5:   48 89 e5                mov    %rsp,%rbp
>         8:   b8 03 00 00 00          mov    $0x3,%eax
>         d:   5d                      pop    %rbp
>         e:   c3                      ret
> 
>

Yeah I don't know, I was perplexed too. I tried it now and it works as 
expected. Maybe some weirdness on my local build machine at the time.

>> showing in the profile. Given how gputop sucked with CPU usage quite 
>> badly (relative to top) I was motivated to improve it.
>>
>> The "top-level" strncmp checks are the more expensive ones because 
>> they all run for all lines in a given fdinfo file, while the inside 
>> the branch strlen runs fewer times.
>>
>> Nevertheless some cleanup of this function would probably be good, 
>> just while doing so keep in mind how bad gputop looks compared to top 
>> in the profiles, not to make it much worse.
> 
> 
> will keep that in mind, but I'm not sure I will be able to work on this
> soon.

No rush, I only mentioned this since you announced you have reworks in 
your sights.

Regards,

Tvrtko
