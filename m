Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AF6C02198
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 07:37:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBD410E1B9;
	Tue, 18 Feb 2025 07:37:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U+JjogpO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE3410E1B9
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 07:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739864245; x=1771400245;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=kxvCwhCH1lag7RpYsAHQYTh75WX1aSZknq3uzSgH2oc=;
 b=U+JjogpOK98r01Os+4i3lnoBdhaxN+hibb+692SvgxU3TjdmsUn11OWn
 1mHmiTFhIWFPdD9oCz4wWc955fg91jrjTemGqSWIklqrzVOfkl8j9wkLF
 rsR8Wo34sh/yiM9Q55/T0+v3yaB8/UDZ7z+r0zME/lZ7pfRBBbk2ICqRX
 EE7YakD39ZB1aARac5CJBN/xLi3HyuDTvo6CqixC/L8I7/DY0fuflti1X
 YmmVz0zifdUeTbXGspjaW/4SN6vs8ZsQweQDvc/sG0mPzH3Zsk8GQ93AF
 SdctGgs5ZGbiCzInfDe63xQ0Y71MjeSimCSQfEIgIEb+iE3tsaTTy05ga A==;
X-CSE-ConnectionGUID: UB5an4vvQZi51jYGx12hUw==
X-CSE-MsgGUID: Znw3LSNHT3SqT+bUPnRwnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="65903038"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; d="scan'208";a="65903038"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 23:37:24 -0800
X-CSE-ConnectionGUID: 9SZwDE7xSr2uCjdlc94kfw==
X-CSE-MsgGUID: ezRWM2Z8Q0GHkg8A9y/DUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115216385"
Received: from debadity-mobl.ger.corp.intel.com (HELO [10.245.114.21])
 ([10.245.114.21])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 23:37:22 -0800
Message-ID: <854f3252-689f-44e3-bd77-b671d2c5fe6a@linux.intel.com>
Date: Tue, 18 Feb 2025 08:37:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tools: rename lsfacts into igt_facts
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Jordan Justen <jljusten@debian.org>,
 Jordan Justen <jordan.l.justen@intel.com>
References: <20250217133229.104948-1-kamil.konieczny@linux.intel.com>
 <32a9510b-a18b-40c7-8f70-8d59b501df48@linux.intel.com>
Content-Language: en-US
In-Reply-To: <32a9510b-a18b-40c7-8f70-8d59b501df48@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 18.02.2025 08:32, Peter Senna Tschudin wrote:
> On 17.02.2025 14:32, Kamil Konieczny wrote:
>> This is a follow up to GitLab issue 168 where name 'power' was
>> a little too generic. Similarly, name lsfacts looks also a little
>> too generic, so rename it into igt_facts.
> 
> Would you consider keeping the 'ls' part of the name so that it would
> be called 'igt_lsfacts'? The reason is that the tool simply list facts,
> while the integration with igt_runner report changes instead of listing
> facts.

The '_' is optional, so 'igtlsfacts' is fine too.

> 
> May I ask why the lsgpu tool did not get a rename too? Would a rename to
> 'igt_lsgpu' help prevent name collisions with system wide tools that have
> similar objectives?

Same here, the '_' is optional, so 'igtlsgpu' is fine too.

> 
> 
>>
>> Cc: Jordan Justen <jljusten@debian.org>
>> Cc: Jordan Justen <jordan.l.justen@intel.com>
>> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Acked-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
>> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> ---
>>  tools/{lsfacts.c => igt_facts.c} | 12 ++++++------
>>  tools/meson.build                |  2 +-
>>  2 files changed, 7 insertions(+), 7 deletions(-)
>>  rename tools/{lsfacts.c => igt_facts.c} (71%)
>>
>> diff --git a/tools/lsfacts.c b/tools/igt_facts.c
>> similarity index 71%
>> rename from tools/lsfacts.c
>> rename to tools/igt_facts.c
>> index bbe77717a..af3ea2a61 100644
>> --- a/tools/lsfacts.c
>> +++ b/tools/igt_facts.c
>> @@ -7,12 +7,12 @@
>>  #include "igt_facts.h"
>>  
>>  /**
>> - * SECTION:lsfacts
>> - * @short_description: lsfacts
>> - * @title: lsfacts
>> - * @include: lsfacts.c
>> + * SECTION:igt_facts
>> + * @short_description: igt_facts
>> + * @title: igt_facts
>> + * @include: igt_facts.c
>>   *
>> - * # lsfacts
>> + * # igtfacts
>>   *
>>   * Scan for igt-facts and print them on screen. Indicate if no facts are found.
>>   */
>> @@ -20,7 +20,7 @@ int main(int argc, char *argv[])
>>  {
>>  	igt_facts_lists_init();
>>  
>> -	igt_facts("lsfacts");
>> +	igt_facts("igt_facts");
>>  
>>  	if (igt_facts_are_all_lists_empty())
>>  		igt_info("No facts found...\n");
>> diff --git a/tools/meson.build b/tools/meson.build
>> index f091af380..1dfe1f839 100644
>> --- a/tools/meson.build
>> +++ b/tools/meson.build
>> @@ -12,6 +12,7 @@ foreach prog : tools_progs_noisnt
>>  endforeach
>>  
>>  tools_progs = [
>> +	'igt_facts',
>>  	'igt_power',
>>  	'igt_stats',
>>  	'intel_audio_dump',
>> @@ -43,7 +44,6 @@ tools_progs = [
>>  	'intel_gem_info',
>>  	'intel_gvtg_test',
>>  	'dpcd_reg',
>> -	'lsfacts',
>>  	'lsgpu',
>>  ]
>>  tool_deps = igt_deps
> 

