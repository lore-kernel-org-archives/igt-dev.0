Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF8CC4828F
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 10:32:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E5A113201;
	Wed,  7 Feb 2024 10:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k+EGxCcd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED18113201
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2024 10:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707301954; x=1738837954;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=yeQ4FQIYmgoZMoru9gM0htCDIUuaFiuzdzseRXkPu8s=;
 b=k+EGxCcdgVDSfMh5MlUr3CLEdk18qugsgyN6UxH/QU3gph9FKTKQALNp
 KRfHiqvwDifLB8rRdscjcQ+rBtJqDy3jEGNAkKQeqAFSXcOJuMWSuB/gA
 PatBCa2KH2ry5iSAFJqjXh7XONHuCOUpJ74MmM28oDD2ogvtzHL6vVWYT
 7tJR3b5qlHQTOEe33dHm0j9ZX7XHk7KGN3cpky3WWugv7G6Ovpvx7wSRL
 eUEtsls8xj4IK1bu/x93hXu1rvXFW1LLY5RTNl4XdKZNdUn6dL4UsCuFS
 4KssTQOpk0lc3zi9J2u3NClcwGpNfxAhN4dMTaxjSJ/dWGH7pClmEDfIb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="868983"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="868983"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 02:32:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1528967"
Received: from ahamill-mobl2.ger.corp.intel.com (HELO [10.213.228.167])
 ([10.213.228.167])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 02:32:27 -0800
Message-ID: <75d148b4-7227-4757-9e67-5558b087c1fb@linux.intel.com>
Date: Wed, 7 Feb 2024 10:32:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/igt_drm_fdinfo: Use longest match first
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240201004744.352041-1-lucas.demarchi@intel.com>
 <20240201004744.352041-2-lucas.demarchi@intel.com>
 <20240201124321.53t4qbtlswisipoe@kamilkon-desk.igk.intel.com>
 <4givrfsdv4rnga6f4ezqp27huz5dvlgxkb65wmr2j3hx5yh3vk@wbi7soq6dihy>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <4givrfsdv4rnga6f4ezqp27huz5dvlgxkb65wmr2j3hx5yh3vk@wbi7soq6dihy>
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


On 01/02/2024 14:09, Lucas De Marchi wrote:
> On Thu, Feb 01, 2024 at 01:43:21PM +0100, Kamil Konieczny wrote:
>> Hi Lucas,
>> On 2024-01-31 at 16:46:24 -0800, Lucas De Marchi wrote:
>>> Instead of checking twice the match, just use longest match first.
>>
>> Nice catch, LGTM.
>>
>> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

+1 looks like that was a confused change I did when adding capacity.

Going forward feel free to copy me when changing this code, given I 
mostly wrote it after all..

>>
>>>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>  lib/igt_drm_fdinfo.c | 19 +++++++++----------
>>>  1 file changed, 9 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>>> index 222ccbfb1..5c0ccf624 100644
>>> --- a/lib/igt_drm_fdinfo.c
>>> +++ b/lib/igt_drm_fdinfo.c
>>> @@ -239,8 +239,15 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, 
>>> struct drm_client_fdinfo *info,
>>>                       strlen("drm-client-id")))) {
>>>              info->id = atol(v);
>>>              good++;
>>> -        } else if (!strncmp(l, "drm-engine-", 11) &&
>>> -               strncmp(l, "drm-engine-capacity-", 20)) {
>>> +        } else if (!strncmp(l, "drm-engine-capacity-", 20)) {
>>
>> One more thing to eventually fix is removing "20" which is exact
>> len of string, with something like
>>
>> bool str_begins(char *src, char *pattern)
>>
>> One source of errors is counting letters in strings or changing
>> string itself without changing corresponding len. This can be
>> done in separate patch.
> 
> I had a patch for something similar. I usually use a strstartswith()
> that's commonly used in other projects and also matches the python name.
> 
> However I decided to drop that for now. I may have a bigger refactor in
> this function soon reworking parse_engine() and other functions: Worse
> than manually counting the chars for the strncmp() is to call strlen()
> in the same string just in the line below that to feed to parse_engine()
> :-/. As I said, still undecided what to change here and if it's worth
> it.

AFAIR hardcoded strlens were because strangely const strings fail to be 
evaluated at compile time and when I tested it and strlen was showing in 
the profile. Given how gputop sucked with CPU usage quite badly 
(relative to top) I was motivated to improve it.

The "top-level" strncmp checks are the more expensive ones because they 
all run for all lines in a given fdinfo file, while the inside the 
branch strlen runs fewer times.

Nevertheless some cleanup of this function would probably be good, just 
while doing so keep in mind how bad gputop looks compared to top in the 
profiles, not to make it much worse.

Regards,

Tvrtko

> 
> 
> Lucas De Marchi
> 
>>
>> Regards,
>> Kamil
>>
>>> +            idx = parse_engine(l, info,
>>> +                       strlen("drm-engine-capacity-"),
>>> +                       name_map, map_entries, &val);
>>> +            if (idx >= 0) {
>>> +                info->capacity[idx] = val;
>>> +                num_capacity++;
>>> +            }
>>> +        } else if (!strncmp(l, "drm-engine-", 11)) {
>>>              idx = parse_engine(l, info, strlen("drm-engine-"),
>>>                         name_map, map_entries, &val);
>>>              if (idx >= 0) {
>>> @@ -251,14 +258,6 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, 
>>> struct drm_client_fdinfo *info,
>>>                  if (idx > info->last_engine_index)
>>>                      info->last_engine_index = idx;
>>>              }
>>> -        } else if (!strncmp(l, "drm-engine-capacity-", 20)) {
>>> -            idx = parse_engine(l, info,
>>> -                       strlen("drm-engine-capacity-"),
>>> -                       name_map, map_entries, &val);
>>> -            if (idx >= 0) {
>>> -                info->capacity[idx] = val;
>>> -                num_capacity++;
>>> -            }
>>>          } else if (!strncmp(l, "drm-total-", 10)) {
>>>              idx = parse_region(l, info, strlen("drm-total-"),
>>>                         region_map, region_entries, &val);
>>> -- 
>>> 2.43.0
>>>
