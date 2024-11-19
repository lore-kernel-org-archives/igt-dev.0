Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336F2D44140
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 11:03:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E48BD10E618;
	Tue, 19 Nov 2024 11:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HL+rCyJZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F9E810E618
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 11:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732014183; x=1763550183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cLtmmS85UPy72pvVDKfomvw4fMRrW9eCml49UcU+7Xo=;
 b=HL+rCyJZ0SLHt4JFBUhvV8bKDzJP1aSU5CqBlAgExIFPylri2czS4jbo
 abL9WRLfTlfSFDsiVB8IfMEHhQ6He1m1FTWUOOKXdMOsVJ94xNaafXWsg
 sNnQsCX8cdylmYO+RvwFz2HdrwvBJUS+fOaNZaRw0mY1AECsJRakBspGP
 VH/aRca702wmVBI8wseyL40v74VZI9rAqsAyR5+CwakyXSkKExOWI1Y43
 8w1d0KcaU6rPTQTNs1agUBvMOCbpmZ5Gy+JPESz7TWmFRXOdPvWOUCtmU
 YojsY+QcSPzI8Xa4D/hkNOTifA/QN45k+NywUsUG48xg637cQRpj5+Qci w==;
X-CSE-ConnectionGUID: 4di6dPpTQkiZOilnwO55NQ==
X-CSE-MsgGUID: IUt6L2ddSDmnWF5GuGsu+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32113692"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="32113692"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 03:03:03 -0800
X-CSE-ConnectionGUID: s756WQNdQDu7xe2y1hxiZQ==
X-CSE-MsgGUID: 9PVuyaXtTQOjmXbbuwi4rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="90326548"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.215])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 03:03:01 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t v4 3/6] lib/igt_kmod: Let the fixture open/close
 debugfs
Date: Tue, 19 Nov 2024 12:02:58 +0100
Message-ID: <14083402.RDIVbhacDa@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241119052954.1993905-4-lucas.demarchi@intel.com>
References: <20241119052954.1993905-1-lucas.demarchi@intel.com>
 <20241119052954.1993905-4-lucas.demarchi@intel.com>
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

On Tuesday, 19 November 2024 06:29:51 CET Lucas De Marchi wrote:
> Do not pass as argument and let the called function open/close since the
> caller also has to deal with fallouts due to igt_require() and the like.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/igt_kmod.c | 27 +++++++++++----------------
>  1 file changed, 11 insertions(+), 16 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 3729a053c..51032502f 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -1038,17 +1038,13 @@ static void kunit_get_tests(struct igt_list_head *tests,
>  			    const char *suite,
>  			    const char *opts,
>  			    const char *debugfs_path,
> -			    DIR **debugfs_dir,
> +			    DIR *debugfs_dir,
>  			    struct igt_ktap_results **ktap)
>  {
>  	struct igt_ktap_result *r, *rn;
>  	struct dirent *subdir;
>  	unsigned long taints;
>  
> -	*debugfs_dir = opendir(debugfs_path);
> -	if (igt_debug_on(!*debugfs_dir))
> -		return;
> -
>  	/*
>  	 * To get a list of test cases provided by a kunit test module, ask the
>  	 * generic kunit module to respond with SKIP result for each test found.
> @@ -1061,17 +1057,17 @@ static void kunit_get_tests(struct igt_list_head *tests,
>  		return;
>  
>  	if (!suite) {
> -		seekdir(*debugfs_dir, 2);	/* directory itself and its parent */
> +		seekdir(debugfs_dir, 2);	/* directory itself and its parent */
>  		errno = 0;
> -		igt_skip_on_f(readdir(*debugfs_dir) || errno,
> +		igt_skip_on_f(readdir(debugfs_dir) || errno,
>  			      "Require empty KUnit debugfs directory\n");
> -		rewinddir(*debugfs_dir);
> +		rewinddir(debugfs_dir);
>  	}
>  
>  	igt_skip_on(modprobe(tst->kmod, opts));
>  	igt_skip_on(igt_kernel_tainted(&taints));
>  
> -	while (subdir = readdir(*debugfs_dir), subdir) {
> +	while (subdir = readdir(debugfs_dir), subdir) {
>  		if (!(subdir->d_type & DT_DIR))
>  			continue;
>  
> @@ -1089,9 +1085,6 @@ static void kunit_get_tests(struct igt_list_head *tests,
>  			break;
>  	}
>  
> -	closedir(*debugfs_dir);
> -	*debugfs_dir = NULL;
> -
>  	igt_list_for_each_entry_safe(r, rn, tests, link)
>  		igt_require_f(r->code == IGT_EXIT_SKIP,
>  			      "Unexpected non-SKIP result while listing test cases\n");
> @@ -1226,13 +1219,16 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
>  	kunit_debugfs_path(debugfs_path);
>  
>  	igt_fixture {
> +		igt_assert(igt_list_empty(&tests));
> +
>  		igt_require(subtest);
>  		igt_require(*debugfs_path);
>  
>  		igt_skip_on(igt_ktest_init(&tst, module_name));
>  		igt_skip_on(igt_ktest_begin(&tst));
>  
> -		igt_assert(igt_list_empty(&tests));
> +		debugfs_dir = opendir(debugfs_path);
> +		igt_skip_on(!debugfs_dir);

I shouldn't complain because that's exactly what I suggested, but now looking 
at it again, I'm still not satisfied, sorry.

In my original version of that opening igt_fixture section, there were no 
other skips nor fails after the igt_kip_on(igt_ktest_begin()).

Looking at an equivalent code in igt_kselftest(), my assumption was that it 
was safe to call igt_ktest_fini() unconditionally, even if igt_ktest_init() 
failed, and that was not the case with igt_ktest_end(), which could be called 
safely only if igt_ktest_begin() succeeded.  That's why I placed 
igt_ktest_end() inside, and igt_ktest_fini() outside a closing igt_fixture 
section.

Then, in one of my patches I added that unfortunate igt_assert() to the end of 
the section and introduced a risk of the closing igt_fixture not executed, 
then igt_ktest_end() not being called, and some resources stored in tst 
leaked.  That needs to be fixed, in a separate patch, I believe, e.g. by 
moving that igt_assert() in front of igt_ktest_begin().  I would also add a 
comment like:
   /* no further igt_skips or igt_fails to avoid leaking of tst resources */
right after the call to igt_ktest_begin().

Taking that into account, your igt_skip_on(!debugfs_dir) may be called either 
before igt_ktest_begin(), or from the top of igt_subtest_with_dynamic() body, 
and closedir(debugfs_dir) should be moved out of the closing igt_fixture 
section, and still called conditionally to be on the safe side.

Thanks,
Janusz

>  	}
>  
>  	/*
> @@ -1244,7 +1240,7 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
>  	 */
>  	igt_subtest_with_dynamic(subtest) {
>  		kunit_get_tests(&tests, &tst, suite, opts,
> -				debugfs_path, &debugfs_dir, &ktap);
> +				debugfs_path, debugfs_dir, &ktap);
>  		__igt_kunit(&tst, subtest, opts, debugfs_path, &tests, &ktap);
>  	}
>  
> @@ -1255,8 +1251,7 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
>  
>  		kunit_results_free(&tests, &suite_name, &case_name);
>  
> -		if (debugfs_dir)
> -			closedir(debugfs_dir);
> +		closedir(debugfs_dir);
>  
>  		igt_ktest_end(&tst);
>  	}
> 




