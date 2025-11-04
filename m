Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9313CCCFA04
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 12:14:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4950710E5CC;
	Tue,  4 Nov 2025 12:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cmYeW945";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8031E10E5CB
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 12:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762258471; x=1793794471;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Fc1gyPmZNuAzIzmeU+acoQA238/b1j2Vbi9SYVh1wWs=;
 b=cmYeW945AG8gK2v6eEw3us6YCll2XBiZWSyLn7n+qUJz0VWGM+KAKMTL
 VZsX0kACvNjjdKukzLArLt9VTuSW2JuW70rr2WAXq/WjzBWNkpba831jL
 PIQNH1gxoPuViN/CM1EhcHPYqCHu7hdGfxMjgkxgc0gpBeO9Nt74Q+S7b
 pbk4eDKkN/17cUZE7SEARL+noVUrKmQU336QVD4lxrum9PcOqto4QS1bI
 79puWrKS5iO0FdBmMd5b/sUvQJlFblZb5oZcMY0ZKzR5J6yV5uT8Qjnhi
 EVBm+UisLE1xokeoBah6FJoNSjMhQio6Q8SNMSi1SEjD5umCSNky1Vpli Q==;
X-CSE-ConnectionGUID: j8ryl3iPRa6lPPf75Jr7eg==
X-CSE-MsgGUID: 4OG7IB0lTHSc1/ZPY8wGpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="75029403"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="75029403"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 04:14:31 -0800
X-CSE-ConnectionGUID: CRyRwGxuRLadfj76YJst4Q==
X-CSE-MsgGUID: 2Uftw9HDQla3M+ZDRY+cvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="187092991"
Received: from cmanszew-mobl2.igk.intel.com (HELO [172.28.180.197])
 ([172.28.180.197])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 04:14:30 -0800
Message-ID: <3d6a9de9-203f-478d-bf11-f0095ed78820@intel.com>
Date: Tue, 4 Nov 2025 13:14:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/7] lib/xe/xe_eudebug: Fix token to str
To: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20251014093848.2394531-3-mika.kuoppala@linux.intel.com>
 <20251014134825.2398331-1-mika.kuoppala@linux.intel.com>
 <DS0PR11MB72645EA54513F8230C4CDFE6D9E8A@DS0PR11MB7264.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <DS0PR11MB72645EA54513F8230C4CDFE6D9E8A@DS0PR11MB7264.namprd11.prod.outlook.com>
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

Hi Mika and Dominik,

On 15.10.2025 11:36, Piatkowski, Dominik Karol wrote:
> Reviewed-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> 
>> -----Original Message-----
>> From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> Sent: Tuesday, October 14, 2025 3:48 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>; Piatkowski, Dominik
>> Karol <dominik.karol.piatkowski@intel.com>
>> Subject: [PATCH i-g-t 2/7] lib/xe/xe_eudebug: Fix token to str
>>
>> We print token types to see client/server flow. The printouts were off
>> by one. Fix array indexing.
>>
>> v2: remove client_fd (Dominik)
>>
>> Cc: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
>> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> ---
>>   lib/xe/xe_eudebug.c | 22 +++++++++++++++++++---
>>   1 file changed, 19 insertions(+), 3 deletions(-)
>>
>> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
>> index 4bf697a45e..f1dffe4ffb 100644
>> --- a/lib/xe/xe_eudebug.c
>> +++ b/lib/xe/xe_eudebug.c
>> @@ -41,6 +41,7 @@ struct match_dto {
>>   	uint64_t *bind_op_seqno;
>>   };
>>
>> +#define TOKEN_NONE  0
>>   #define CLIENT_PID  1
>>   #define CLIENT_RUN  2
>>   #define CLIENT_FINI 3
>> @@ -51,6 +52,7 @@ struct match_dto {
>>   static const char *token_to_str(uint64_t token)
>>   {
>>   	static const char * const s[] = {
>> +		"none",
>>   		"client pid",
>>   		"client run",
>>   		"client fini",
>> @@ -59,8 +61,12 @@ static const char *token_to_str(uint64_t token)
>>   		"debugger stage",
>>   	};
>>
>> -	if (token >= ARRAY_SIZE(s))
>> +	igt_assert(token);
>> +
>> +	if (token >= ARRAY_SIZE(s)) {
>> +		igt_warn("token outside of bounds %ld\n", token);

Maybe:
```
igt_warn("token '%ld' out of bounds\n", token);
```

>>   		return "unknown";
>> +	}
>>
>>   	return s[token];
>>   }
>> @@ -334,18 +340,25 @@ static uint64_t __wait_token(int pipe[2], const
>> uint64_t token, int timeout_ms)
>>
>>   static uint64_t client_wait_token(struct xe_eudebug_client *c, const uint64_t
>> token)
>>   {
>> -	uint64_t ret = __wait_token(c->p_in, token, c->timeout_ms);
>> +	uint64_t ret = 0;
>> +
>> +	igt_debug("client: %d waiting token %s\n", c->pid,
>> token_to_str(token));

Maybe:
```
igt_debug("client: %d waiting for token '%s'\n", getpid(), 
token_to_str(token));
```

>>
>> +	ret = __wait_token(c->p_in, token, c->timeout_ms);
>>   	if (ret == DEAD_CLIENT)
>>   		igt_assert(c->allow_dead_client);
>>
>>   	return ret;
>> +
>>   }
>>
>>   static uint64_t wait_from_client(struct xe_eudebug_client *c, const uint64_t
>> token)
>>   {
>> -	uint64_t ret = __wait_token(c->p_out, token, c->timeout_ms);
>> +	uint64_t ret = 0;
>> +
>> +	igt_debug("debugger: %d waiting token %s\n", getpid(),
>> token_to_str(token));

Maybe:
```
igt_debug("debugger: %d waiting for token '%s'\n", getpid(), 
token_to_str(token));
```

>>
>> +	ret = __wait_token(c->p_out, token, c->timeout_ms);
>>   	if (ret == DEAD_CLIENT)
>>   		igt_assert(c->allow_dead_client);
>>
>> @@ -354,6 +367,9 @@ static uint64_t wait_from_client(struct
>> xe_eudebug_client *c, const uint64_t tok
>>
>>   static void token_signal(int pipe[2], const uint64_t token, const uint64_t
>> value)
>>   {
>> +	igt_debug("%d signalling token %s with %ld\n",
>> +		  getpid(), token_to_str(token), value);
>> +

Thinking out loud - would be good to have token_signal funcs matching 
the wait_client and wait_from client functions. Aaand fix the naming on 
those. But let's keep this battle for another day.

Also maybe:
```
igt_debug("%d signalling token '%s' with value '%ld'\n", getpid(), 
token_to_str(token));
```

Regards,
Christoph
>>   	pipe_signal(pipe, token);
>>   	pipe_signal(pipe, value);
>>   }
>> --
>> 2.43.0
> 

