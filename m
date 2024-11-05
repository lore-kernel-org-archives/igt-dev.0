Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B40D1267E
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 10:50:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7459B10E123;
	Tue,  5 Nov 2024 10:50:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lnrlhSvF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB7910E123
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 10:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730803810; x=1762339810;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hrz5pgFB6usjyv0TYABCuHkR6k7kX9O7u99FeFfiIH8=;
 b=lnrlhSvFJxAudW2EiD8BH5bni1+pL1POcHjGi2KLZSd+1UR/4zWjaHr3
 5VRuF3MsTfBIL3pTNdFhI/WaCTpcvz7XMyVoUQKjldL0j1MpdWeBUuMvY
 57QeHheakX+okryy3L+BfX8AGsOF8NbcvxjOD1DVz5SWyrJ3Cn4UifYTO
 BCInaW76KyK991dD/I8iI5hZhm3T/ccvNNlKvp2zMgpeMiA1zuBoG7sMe
 uZzgDLq9SW43yBBgefYP3xC8/T3n1+bnhBcplvwASYWNUGsSejwlHwS+p
 PX6fJUZFOh/kS1s4Z/yihdIZsbx5LQEIKcq7yMkMKXj6rAZusvdjOxv9X Q==;
X-CSE-ConnectionGUID: /jGg9+RoStm8MIy5o2doOQ==
X-CSE-MsgGUID: CBVtIGQ7S7a3XzRNbY+WiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="29961574"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="29961574"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 02:50:09 -0800
X-CSE-ConnectionGUID: 7xLA0sqZQdqhtHKZmhdFiQ==
X-CSE-MsgGUID: y4U30+k4RpShhR0/Jcq/RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="88741529"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.89])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 02:50:08 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t 2/3] lib/igt_kmod: Stop handling _kunit suffix
Date: Tue, 05 Nov 2024 11:50:05 +0100
Message-ID: <6684395.tM3a2QDmDi@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241105055255.2466236-3-lucas.demarchi@intel.com>
References: <20241105055255.2466236-1-lucas.demarchi@intel.com>
 <20241105055255.2466236-3-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

On Tuesday, 5 November 2024 06:52:54 CET Lucas De Marchi wrote:
> It's not used anywhere anymore. Remove it.

I'm not sure.  I added this option based on KUnit documentation.  Has the 
documentation changed since then?  I haven't been watching it.  Have you 
checked if core drm doesn't use that suffix?   If it is still documented then 
what if we decide to run kunit tests from other subsytems (dma-buf? iommu?) 
and it occurs they still use it?

Thanks,
Janusz

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/igt_kmod.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 4eeab79ec..58edac8fa 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -1189,7 +1189,7 @@ static void __igt_kunit(struct igt_ktest *tst,
>   *	   if NULL then test cases from all test suites provided by the module
>   *	   are executed as dynamic sub-subtests of one IGT subtest, which name
>   *	   is derived from the module name by cutting off its optional trailing
> - *	   _test or _kunit suffix
> + *	   _test suffix
>   * @opts: options to load the module
>   *
>   * Loads the test module, parses its (k)tap dmesg output, then unloads it
> @@ -1213,9 +1213,6 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
>  		if (!igt_debug_on(!subtest)) {
>  			char *suffix = strstr(subtest, "_test");
>  
> -			if (!suffix)
> -				suffix = strstr(subtest, "_kunit");
> -
>  			if (suffix)
>  				*suffix = '\0';
>  		}
> 




