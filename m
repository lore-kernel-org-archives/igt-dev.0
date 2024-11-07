Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD346D5D67D
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 17:49:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC048826D;
	Thu,  7 Nov 2024 17:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IoTVeyJs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3995C10E084
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 17:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731001739; x=1762537739;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+qG3LO3ePL4s1n3G+NSxTmXbEMWUJFmiMSxl6CR8oSk=;
 b=IoTVeyJsW462U3azESmWTvngaJiEU6szzvHKX5tBirWp6QsdSzyb4b7k
 /28peF19wIZOPaowSyvIYdRNPYQuwM9tTLWLGoUwudWazkyav8TXq0pCj
 BtbsoA+fqyvQ25QzdvlUOxpb3quzYIK4O8+A4IM1UaxSxNp0oXZjr8iAY
 AAmcW9WuH1MLd9CHBDNwszpM6603rhDw1A1WJ8i12y+D/n+O8zY2qgUo1
 0GAJCGbIir4oylOESip1kIy5LBzLvOKC8mD2H5nJ4CBqmYFb0zh1HS+Ks
 IUwKiDfmCz8DSCu7kUDZ1+eCSjvx0ffJ91zbwVrkiTr04sChLxGHxhR6W w==;
X-CSE-ConnectionGUID: 2FqQX1vwSL2uvJt2n1uSpg==
X-CSE-MsgGUID: PgWChk9IQpuqhmGPQLFmSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="42235374"
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; d="scan'208";a="42235374"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 09:48:45 -0800
X-CSE-ConnectionGUID: 6qhOTen0Tci6dGcvMpDRug==
X-CSE-MsgGUID: b0G5208vQtaD+D1uw8iqmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; d="scan'208";a="85972955"
Received: from ogreene-mobl1.amr.corp.intel.com (HELO [10.213.195.176])
 ([10.213.195.176])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 09:48:43 -0800
Message-ID: <5a7f1522-b060-4721-a3b8-bdda40e3a7d9@linux.intel.com>
Date: Thu, 7 Nov 2024 18:48:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] igt-runner fact checking
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 ryszard.knop@intel.com
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <tmbhd2nam5xibqejlcpqo53zeiv543jkfokfh4yly63yjhpqf7@ruf6limclqyh>
 <8029d6ce-2d38-40a6-a574-00b6607805d8@linux.intel.com>
 <qkr5xhm23dbziwp53m2xwjciqeghfe4zdtlurnpgphyxplx5pk@dkwxqwdymu77>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <qkr5xhm23dbziwp53m2xwjciqeghfe4zdtlurnpgphyxplx5pk@dkwxqwdymu77>
Content-Type: text/plain; charset=UTF-8
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

Hi Lucas,

Thank you for your reply.

On 07.11.2024 16:55, Lucas De Marchi wrote:
> +Ryszard to know if the CI part would be doable.
> 
> On Thu, Nov 07, 2024 at 08:18:52AM +0100, Peter Senna Tschudin wrote:
>>>> +    scan_kernel_loaded_kmods(list, last_test);
>>>
>>>
>>> So... igt_facts() hardcodes what is the info collected. Maybe we
>>> should rather plug this into the hooks framework as part of
>>> "built-in hooks".
>>
>> I do not follow what you are trying to communicate here. Also, please see what Zbigniew said here*. Facts are not test requirements, but the line is blurry. In the context here a fact is something in the environment that can change but that should not. An example is the disappearing GPU.
> 
> $ ./build/runner/igt_runner --help | grep -A1 hook
>   --hook HOOK_STR
>                         Forward HOOK_STR to the --hook option of each test.
>   --help-hook
>                         Show detailed usage information for --hook.
> 
> So... today we already have "generic support" for running arbitrary
> things before/after each test/subtest/dynamic-subtest.
> 
>     $ cat << EOF > testlist.txt
>     igt@xe_exec_basic@once-basic
>     EOF
>     $ chmod +x lspci.sh
>     $ sudo ./build/runner/igt_runner \
>         --hook 'post-subtest:lspci -vv -d 8086:*:03xx' \
>         --test-list testlist.txt build/tests/ results/
>     $ head -n4 results/0/out.txt
>     03:00.0 VGA compatible controller: Intel Corporation DG2 [Arc A580] (rev 08) (prog-if 00 [VGA controller])
>         Subsystem: Intel Corporation Device 1425
>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 
> So, instead of creating a separate thing called "igt_facts", what I'm
> proposing is that we build this on top of the hooks and these "facts"
> are simply built-in hooks that are commonly used. We may even keep them
> as scripts rather than translate to C.

I fail to understand why one would want to do that. It feels hackish and misses the point. I would support your suggestion if we were talking about a temporary debug tool.

The igt-facts are not meant to be temporary, I dislike the overhead, and I dislike the hackish nature of this mechanism. Can you tell me what are the benefits of using these hooks? This is an honest question, I do not understand.

> 
> What I'd like is something liked this (with whatever name we decide):
> 
>     sudo ./build/runner/igt_runner --builtin-hooks lspci,drm-cards

This is far from what I am proposing in purpose and in architecture.

> 
> which is a shorthand or equivalent to:
> 
>     sudo ./build/runner/igt_runner \
>         --hook post-subtest:$PWD/scripts/built-in-hooks/lspci.sh \
>         --hook post-subtest:$PWD/scripts/built-in-hooks/drm-cards.sh \
>         --test-list testlist.txt build/tests/ results/

For me this feels like a bad idea. It is probably an order of magnitude slower to run, and it is also granular in a way that I fail to understand. igt-facts should not be selected at runtime by the user because we do not know when the facts will change. Again, think of the disappearing GPU: it is a 1 in 1'000'000 kind of event, but is super valuable to know when it happens.

> 
> The cherry on top would be for CI to parse the cover letter and
> enable those ondemand, so we only do that in CI when we want to:
> 
> /ci-built-in-hooks: lspci,drm-cards
> 
> Could also be:
> 
> /ci-hook: 'post-subtest:lspci -vv -d 8086:*:03xx'

Very different from what I am proposing and I fail to understand how this can have potential to add value. Sorry :/

> 
> (note that the current way we have is "Test-with:", but that is
> problematic as it's then parsed as a git-trailer and added to the
> patches by some tools)
> 
> Lucas De Marchi

[...]
