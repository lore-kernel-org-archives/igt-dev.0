Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D203FD12680
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 10:59:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86FB410E578;
	Tue,  5 Nov 2024 10:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dAaE9eBN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479CB10E56C
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 10:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730804389; x=1762340389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I08ctTrR3LRV1pLGW5whHYgNa3mOxevRicZfCt+UVJU=;
 b=dAaE9eBNiWLojjkyZhxDPTYwpvZiyjLpxi6Omr+ltjtwjiKy4aTaQdfC
 XVaB+t5UDEXYvfYp5SKmSbJRD5utwWAWs0DYgI8H9gaROch4Mkap6q6aN
 KjX1Lcx1YaYFQMBeSTYMqoHHoGdyE1/PZZa1PPhSq8ULN+s7UvW2Yvctz
 EkSMUo9ILAiBGwJtzC9MNGPI7YmGzegu/2PtM7h8D/CgrP0MhfkaWG2l5
 naJozf2Db0ZuvQsWCO2P3oMgT6Yc09NiE2zAWAOje+PRhejUNuXwuQ5i/
 AS0dMMgQ8sIdB6sHGgXXAgtgYaezEGKKmxsHPEvpg3J+vBO7ZT8TBoIxV Q==;
X-CSE-ConnectionGUID: QhtjNgx9S4WSx8WarRcdmQ==
X-CSE-MsgGUID: eSLaCMlFSriudeCZ8t2EXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="34328472"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="34328472"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 02:59:49 -0800
X-CSE-ConnectionGUID: GV6YHNMqRkC10BYGyOCcMw==
X-CSE-MsgGUID: 1Gd9cm70SfC1mxvfZ2u7LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="84306404"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.89])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 02:59:47 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t 3/3] lib/igt_kmod: Fix leaking subtest name
Date: Tue, 05 Nov 2024 11:59:44 +0100
Message-ID: <3382232.KgjxqYA5nG@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241105055255.2466236-4-lucas.demarchi@intel.com>
References: <20241105055255.2466236-1-lucas.demarchi@intel.com>
 <20241105055255.2466236-4-lucas.demarchi@intel.com>
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

On Tuesday, 5 November 2024 06:52:55 CET Lucas De Marchi wrote:
> Keep it simple, checking by !suite and then assigning subtest
> accordingly. Since this is done only once, always call strdup()
> and free().

Yes, apparently I missed that leak.

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/igt_kmod.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 58edac8fa..fb83f17c0 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -1199,7 +1199,7 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
>  	char debugfs_path[PATH_MAX] = { '\0', };
>  	struct igt_ktest tst = { .kmsg = -1, };
>  	struct igt_ktap_results *ktap = NULL;
> -	const char *subtest = suite;
> +	char *subtest = NULL;
>  	DIR *debugfs_dir = NULL;
>  	IGT_LIST_HEAD(tests);
>  
> @@ -1208,7 +1208,7 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
>  	 * we take the module name, drop the trailing "_test" or "_kunit"
>  	 * suffix, if any, and use the result as our IGT subtest name.
>  	 */
> -	if (!subtest) {
> +	if (!suite) {
>  		subtest = strdup(module_name);
>  		if (!igt_debug_on(!subtest)) {
>  			char *suffix = strstr(subtest, "_test");
> @@ -1216,6 +1216,8 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
>  			if (suffix)
>  				*suffix = '\0';
>  		}
> +	} else {
> +		subtest = strdup(suite);

NIT: For me it would be still more readable if we reverted the condition and 
reordered the bodies of this conditional construct.

Anyway,

Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Thanks,
Janusz

>  	}
>  
>  	/* We need the base KUnit module loaded if not built-in */
> @@ -1262,6 +1264,7 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
>  		igt_ktest_end(&tst);
>  	}
>  
> +	free(subtest);
>  	igt_ktest_fini(&tst);
>  }
>  
> 




