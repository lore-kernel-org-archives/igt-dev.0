Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D0AC02198
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 07:32:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 589A410E1B9;
	Tue, 18 Feb 2025 07:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lFrL3ggd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445E710E1B9
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 07:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739863934; x=1771399934;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BJjnqA5yk0MkCpdHEqMDOTh5UGmCfm6wqex+jX4Zt9Q=;
 b=lFrL3ggdxCGLqJK83aY8trP3EK9hFn4+ROqFwWE+RtAzD4m65IJiZF+9
 nt1NcZGrWtrJpjY02QbpXQTssvlm04hQX0fqmtabwG8u1qEo+RD+v9tiW
 reCZ27U5WC/VFLRerSyzkAPiBk/lgK5hN1r2e4Oaee9PD04B/K3o5VqeN
 tldsLsPdYyHRYW77ZuTgQOi7nax61Ii95kNXM44oIhz6WCXuKHIbZC3zo
 KDTKg3mrDRr1X29n88S1oy+PC4Fe5Mjj9UwWjipTvcQ4jLvsjaZhci/y2
 iKqvFsU9vdaWRSLkGlQkPJIWrqVz+l0wC/yzeyGl6d7yA8wOFfrU/CaRg A==;
X-CSE-ConnectionGUID: NuYkgn/oSW+QwimLc/eRCw==
X-CSE-MsgGUID: cUjwGbaIT2igg8m/2BhSeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="51953031"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; d="scan'208";a="51953031"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 23:32:13 -0800
X-CSE-ConnectionGUID: g7AKhO52QdWvKQAIM6pn9Q==
X-CSE-MsgGUID: OEkSvDT4S5qfc1RRG5OZFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; d="scan'208";a="145154322"
Received: from debadity-mobl.ger.corp.intel.com (HELO [10.245.114.21])
 ([10.245.114.21])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 23:32:11 -0800
Message-ID: <32a9510b-a18b-40c7-8f70-8d59b501df48@linux.intel.com>
Date: Tue, 18 Feb 2025 08:32:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tools: rename lsfacts into igt_facts
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Jordan Justen <jljusten@debian.org>,
 Jordan Justen <jordan.l.justen@intel.com>
References: <20250217133229.104948-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250217133229.104948-1-kamil.konieczny@linux.intel.com>
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

On 17.02.2025 14:32, Kamil Konieczny wrote:
> This is a follow up to GitLab issue 168 where name 'power' was
> a little too generic. Similarly, name lsfacts looks also a little
> too generic, so rename it into igt_facts.

Would you consider keeping the 'ls' part of the name so that it would
be called 'igt_lsfacts'? The reason is that the tool simply list facts,
while the integration with igt_runner report changes instead of listing
facts.

May I ask why the lsgpu tool did not get a rename too? Would a rename to
'igt_lsgpu' help prevent name collisions with system wide tools that have
similar objectives?


> 
> Cc: Jordan Justen <jljusten@debian.org>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Acked-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tools/{lsfacts.c => igt_facts.c} | 12 ++++++------
>  tools/meson.build                |  2 +-
>  2 files changed, 7 insertions(+), 7 deletions(-)
>  rename tools/{lsfacts.c => igt_facts.c} (71%)
> 
> diff --git a/tools/lsfacts.c b/tools/igt_facts.c
> similarity index 71%
> rename from tools/lsfacts.c
> rename to tools/igt_facts.c
> index bbe77717a..af3ea2a61 100644
> --- a/tools/lsfacts.c
> +++ b/tools/igt_facts.c
> @@ -7,12 +7,12 @@
>  #include "igt_facts.h"
>  
>  /**
> - * SECTION:lsfacts
> - * @short_description: lsfacts
> - * @title: lsfacts
> - * @include: lsfacts.c
> + * SECTION:igt_facts
> + * @short_description: igt_facts
> + * @title: igt_facts
> + * @include: igt_facts.c
>   *
> - * # lsfacts
> + * # igtfacts
>   *
>   * Scan for igt-facts and print them on screen. Indicate if no facts are found.
>   */
> @@ -20,7 +20,7 @@ int main(int argc, char *argv[])
>  {
>  	igt_facts_lists_init();
>  
> -	igt_facts("lsfacts");
> +	igt_facts("igt_facts");
>  
>  	if (igt_facts_are_all_lists_empty())
>  		igt_info("No facts found...\n");
> diff --git a/tools/meson.build b/tools/meson.build
> index f091af380..1dfe1f839 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -12,6 +12,7 @@ foreach prog : tools_progs_noisnt
>  endforeach
>  
>  tools_progs = [
> +	'igt_facts',
>  	'igt_power',
>  	'igt_stats',
>  	'intel_audio_dump',
> @@ -43,7 +44,6 @@ tools_progs = [
>  	'intel_gem_info',
>  	'intel_gvtg_test',
>  	'dpcd_reg',
> -	'lsfacts',
>  	'lsgpu',
>  ]
>  tool_deps = igt_deps

