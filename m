Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA23C021A1
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 14:54:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C680710E8D9;
	Wed, 12 Feb 2025 14:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HwGHpqKz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF5710E8D8
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 14:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739372038; x=1770908038;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=HwjCHHnuFQSLWtv8ZN/2/aE92kF+A8ZZKoeDRE8nyjw=;
 b=HwGHpqKz66qOKPd3In4bNEp28SZkeP08Q6CI70x7oubbZvOb7bX4W8vJ
 +Vdmq4Ticnw7TfIckWTJ6PQpu5u5ZYVtathTVR1e20gD3wttKFQD/XGsy
 0dT4WvTXMhN2KZr/Yh1pyYEFC/kzV5lRVn7bB2ZnfgoS4Gq9SXUIuV+0K
 QzHhAiZOHUmwp2vPHzYWbz0EY+/XUa6JuA37cl+Tec6wwT7S9yBMR6MUk
 prItz5vetBsEZVjgpmEseymoXXjVmaCZ28RAM96k2PBtuvd0GeNhcvTiB
 KKzHxZLrkXlo5baLikb2KyRQMcJQerFSh1IczCZ6TgqIKjv12bea5JaXi A==;
X-CSE-ConnectionGUID: iJNWbNkyQKOnarfYDV4iOw==
X-CSE-MsgGUID: H2wtkpiFSEenySqttRnSkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50664133"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="50664133"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 06:53:58 -0800
X-CSE-ConnectionGUID: z2/L73EEQCKLBsET0yulzg==
X-CSE-MsgGUID: HT6p4n+CRbOaTISicRMIFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113746710"
Received: from fzwolins-mobl.ger.corp.intel.com (HELO [10.246.0.226])
 ([10.246.0.226])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 06:53:56 -0800
Message-ID: <aab1271b-5a64-4d9a-b8a7-156ec5b89f68@linux.intel.com>
Date: Wed, 12 Feb 2025 15:53:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 2/2] runner/executor: Integrate igt_kmemleak scans
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, ryszard.knop@intel.com,
 lucas.demarchi@intel.com, katarzyna.piecielska@intel.com,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20250128151537.515639-1-peter.senna@linux.intel.com>
 <20250128151537.515639-3-peter.senna@linux.intel.com>
 <20250131125018.daqboesdcfuvsqrw@kamilkon-desk.igk.intel.com>
 <f766e3af-cdc2-4e9f-a672-c323c19298b5@linux.intel.com>
 <20250212142416.tmzmgwu5mtqo7fxm@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250212142416.tmzmgwu5mtqo7fxm@kamilkon-desk.igk.intel.com>
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

Hi Kamil,

On 12.02.2025 15:24, Kamil Konieczny wrote:
> Hi Peter,
> On 2025-02-03 at 10:10:53 +0100, Peter Senna Tschudin wrote:
>> Hi Kamil,
>>
>> Thank you for the review.
>>
>> [...]
>>
>>>>  		igt_facts_lists_init();
>>>>  
>>>> +	if (settings->kmemleak)
>>>> +		if (!igt_kmemleak_init(NULL)) {
>>>> +			errf("Failed to initialize kmemleak. Is kernel support enabled?\n");
>>>> +			errf("Disabling kmemleak on igt_runner and continuing...\n");
>>>
>>> Make it one errf() call, split string if needed.
>> chekcpatch does not like multi-line strings. Can you show me the code
>> you want me to use here that satisfies you and checkpatch at the same time?
>>
> 
> It is a tool and it do happen when developer could ignore it,
> you have one example here and other is for drm structs which
> use camel case names.

So you want a single errf() with a multi line string and you are happy to ignore
checkpatch complaining about it. Cool, will do.

> 
>>
>> [...]
>>>
>>>> +			settings->kmemleak = settings->kmemleak_each = false;
>>>
>>> Avoid this, write two assinments here.
>>
>> I personally find this very elegant, but sure, I will make the change.
>>
>> [...]
>>
>>>> @@ -718,6 +723,7 @@ igt_main
>>>>  	igt_subtest("parse-clears-old-data") {
>>>>  		const char *argv[] = { "runner",
>>>>  				       "-n", "foo",
>>>> +				       "--overwrite",
>>>
>>> Do not make unrelated changes, add only kmemleak.
>>> You also didn't write about this change in description, if you
>>> think it is a fix it should go in separate patch, not here.
>>
>> These are not unrelated. First as this is unit testing, this has no
>> downstream effects. Second, I am adding --overwrite to grow the argv
>> array. The reason for that is to be able to test the new argument.
> 
> Well, I do no understand why are you doing this in this patch?
> When you added facts you change only small fragment but now it
> looks like an unneccecery big change. Please make this change
> small and consider adding all that bigger unrelated changes
> in separate cleanup patch after this one.

I was lucky that there was a free slot on the array for facts. Now I cannot
unit test facts and kmemleak at the same time without growing the array.
Sorry. Do you see an easy way that I am missing?

Thank you,

Peter
