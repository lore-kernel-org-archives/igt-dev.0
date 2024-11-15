Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B115DD6A25C
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 14:24:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 622A110E061;
	Fri, 15 Nov 2024 14:24:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J23jRQNy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C38110E061
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 14:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731680684; x=1763216684;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WUAre3d1YxAZc+XYjcGAdLma14yerpDX+ZqontGBiw4=;
 b=J23jRQNynwrg87QGU5CAJKRg5Os7eHxGMCnaRR6L+h2iHd/5iTXzueir
 X5089wXTyXl9M0ecLbiVGbJQz1TGGJtSvfM91NPlH0FIbzzc6jieuwRMj
 Txiurpc1RwYbOifEsV3Mp53OuYNjKdLLI8teLfZC39dUQzaHxjX5zBzbG
 y5sqE9q8Wm2Sa/17m2IulNt0w0BK1vnGRQoDxPMvoN91FjO3miRbE6yYE
 ZS11UMP8BbOsH//sSKNEjgOMEXB6avDobVVnCJ61qoa9DUMNzVGEriHfO
 /WpzOWtYy6Oc5NuajOGjY3ZOmkr7Wv6fnaGq3lVGMZFepqmRrIAEWf87e A==;
X-CSE-ConnectionGUID: z5p0wgbiSpSey2ZMrPZBOA==
X-CSE-MsgGUID: Dcm4dcntTIiprDH8RSQDow==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="42321115"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="42321115"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 06:24:44 -0800
X-CSE-ConnectionGUID: mnAWAZ6pQ2SZv4BP2O66Ug==
X-CSE-MsgGUID: +5I2ODLgT+qlOUA5BfrE/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="119526693"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.84])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 06:24:42 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t v3 3/6] lib/igt_kmod: Stop passing debugfs_dir around
Date: Fri, 15 Nov 2024 15:24:39 +0100
Message-ID: <3841632.kQq0lBPeGt@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <ifbkjfee5mxgsfd2cb2iujwsbvjs7ihcaawh5744rykp7iyauj@gkz37h7x2uhq>
References: <20241107055254.3129207-1-lucas.demarchi@intel.com>
 <yjqplst5ycsfcggndbipsgkeke75n6nqao3rthdja3273u5xju@agdth5sqx7pk>
 <ifbkjfee5mxgsfd2cb2iujwsbvjs7ihcaawh5744rykp7iyauj@gkz37h7x2uhq>
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

On Thursday, 14 November 2024 22:45:31 CET Lucas De Marchi wrote:
> On Thu, Nov 14, 2024 at 02:58:49PM -0600, Lucas De Marchi wrote:
> >On Thu, Nov 14, 2024 at 03:24:39PM +0100, Janusz Krzysztofik wrote:
> >>Hi Lucas,
> >>
> >>On Thursday, 7 November 2024 06:52:51 CET Lucas De Marchi wrote:
> >>>Just open and closes it while getting the list of tests.
> >>>
> >>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >>>---
> >>> lib/igt_kmod.c | 27 ++++++++++++---------------
> >>> 1 file changed, 12 insertions(+), 15 deletions(-)
> >>>
> >>>diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> >>>index 3729a053c..36578aa68 100644
> >>>--- a/lib/igt_kmod.c
> >>>+++ b/lib/igt_kmod.c
> >>>@@ -1038,15 +1038,15 @@ static void kunit_get_tests(struct igt_list_head 
*tests,
> >>> 			    const char *suite,
> >>> 			    const char *opts,
> >>> 			    const char *debugfs_path,
> >>>-			    DIR **debugfs_dir,
> >>> 			    struct igt_ktap_results **ktap)
> >>> {
> >>> 	struct igt_ktap_result *r, *rn;
> >>> 	struct dirent *subdir;
> >>> 	unsigned long taints;
> >>>+	DIR *debugfs_dir;
> >>>
> >>>-	*debugfs_dir = opendir(debugfs_path);
> >>>-	if (igt_debug_on(!*debugfs_dir))
> >>>+	debugfs_dir = opendir(debugfs_path);
> >>>+	if (igt_debug_on(!debugfs_dir))
> >>> 		return;
> >>>
> >>> 	/*
> >>>@@ -1057,21 +1057,23 @@ static void kunit_get_tests(struct igt_list_head 
*tests,
> >>> 	 * we already can do perfectly -- seems to be more safe than 
extracting
> >>> 	 * a free text list of unknown length from /dev/kmsg.
> >>> 	 */
> >>>-	if (igt_debug_on(!kunit_set_filtering(suite, "module=none", 
"skip")))
> >>>+	if (igt_debug_on(!kunit_set_filtering(suite, "module=none", 
"skip"))) {
> >>>+		closedir(debugfs_dir);
> >>> 		return;
> >>>+	}
> >>>
> >>> 	if (!suite) {
> >>>-		seekdir(*debugfs_dir, 2);	/* directory itself and its 
parent */
> >>>+		seekdir(debugfs_dir, 2);	/* directory itself and its 
parent */
> >>> 		errno = 0;
> >>>-		igt_skip_on_f(readdir(*debugfs_dir) || errno,
> >>>+		igt_skip_on_f(readdir(debugfs_dir) || errno,
> >>> 			      "Require empty KUnit debugfs 
directory\n");
> >>>-		rewinddir(*debugfs_dir);
> >>>+		rewinddir(debugfs_dir);
> >>> 	}
> >>>
> >>> 	igt_skip_on(modprobe(tst->kmod, opts));
> >>> 	igt_skip_on(igt_kernel_tainted(&taints));
> >>
> >>How are we going to avoid leaking the open debugfs_dir descriptor if one 
of
> >>those igt_skips triggers a longjmp?
> >
> >ugh, you're right. I hate these longjmp :(. I wish the require/assert
> >would be left to the *tests* and lib code act as lib code :-/
> >
> >I will drop this.
> 
> humn.... what do you think about keeping open/close in the fixture and
> just removing the pointer to pointer? Something like this:
> 
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 3729a053c..2b96d2c45 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -1038,17 +1038,13 @@ static void kunit_get_tests(struct igt_list_head 
*tests,
>   			    const char *suite,
>   			    const char *opts,
>   			    const char *debugfs_path,
> -			    DIR **debugfs_dir,
> +			    DIR *debugfs_dir,
>   			    struct igt_ktap_results **ktap)
>   {
>   	struct igt_ktap_result *r, *rn;
>   	struct dirent *subdir;
>   	unsigned long taints;
>   
> -	*debugfs_dir = opendir(debugfs_path);
> -	if (igt_debug_on(!*debugfs_dir))
> -		return;
> -
>   	/*
>   	 * To get a list of test cases provided by a kunit test module, ask 
the
>   	 * generic kunit module to respond with SKIP result for each test 
found.
> @@ -1061,17 +1057,17 @@ static void kunit_get_tests(struct igt_list_head 
*tests,
>   		return;
>   
>   	if (!suite) {
> -		seekdir(*debugfs_dir, 2);	/* directory itself and its 
parent */
> +		seekdir(debugfs_dir, 2);	/* directory itself and its 
parent */
>   		errno = 0;
> -		igt_skip_on_f(readdir(*debugfs_dir) || errno,
> +		igt_skip_on_f(readdir(debugfs_dir) || errno,
>   			      "Require empty KUnit debugfs 
directory\n");
> -		rewinddir(*debugfs_dir);
> +		rewinddir(debugfs_dir);
>   	}
>   
>   	igt_skip_on(modprobe(tst->kmod, opts));
>   	igt_skip_on(igt_kernel_tainted(&taints));
>   
> -	while (subdir = readdir(*debugfs_dir), subdir) {
> +	while (subdir = readdir(debugfs_dir), subdir) {
>   		if (!(subdir->d_type & DT_DIR))
>   			continue;
>   
> @@ -1089,9 +1085,6 @@ static void kunit_get_tests(struct igt_list_head 
*tests,
>   			break;
>   	}
>   
> -	closedir(*debugfs_dir);
> -	*debugfs_dir = NULL;
> -
>   	igt_list_for_each_entry_safe(r, rn, tests, link)
>   		igt_require_f(r->code == IGT_EXIT_SKIP,
>   			      "Unexpected non-SKIP result while listing 
test cases\n");
> @@ -1232,6 +1225,9 @@ void igt_kunit(const char *module_name, const char 
*suite, const char *opts)
>   		igt_skip_on(igt_ktest_init(&tst, module_name));
>   		igt_skip_on(igt_ktest_begin(&tst));
>   
> +		debugfs_dir = opendir(debugfs_path);
> +		igt_skip_on(!debugfs_dir);
> +
>   		igt_assert(igt_list_empty(&tests));

The idea looks good, but, while this should never happen in practice, there is 
an imaginary risk of the closing igt_fixture section, from where you are going 
to close debugfs_dir, not executed should this igt_assert() happen to fail.  I 
would drop this igt_assert(), or move it to the top of the igt_fixture 
section.

Thanks,
Janusz

>   	}
>   
> @@ -1244,7 +1240,7 @@ void igt_kunit(const char *module_name, const char 
*suite, const char *opts)
>   	 */
>   	igt_subtest_with_dynamic(subtest) {
>   		kunit_get_tests(&tests, &tst, suite, opts,
> -				debugfs_path, &debugfs_dir, &ktap);
> +				debugfs_path, debugfs_dir, &ktap);
>   		__igt_kunit(&tst, subtest, opts, debugfs_path, &tests, 
&ktap);
>   	}
>   
> @@ -1255,8 +1251,7 @@ void igt_kunit(const char *module_name, const char 
*suite, const char *opts)
>   
>   		kunit_results_free(&tests, &suite_name, &case_name);
>   
> -		if (debugfs_dir)
> -			closedir(debugfs_dir);
> +		closedir(debugfs_dir);
>   
>   		igt_ktest_end(&tst);
>   	}
> 
> 
> 
> >
> >Thanks
> >Lucas De Marchi
> >
> >>
> >>Thanks,
> >>Janusz
> >>
> >>>
> >>>-	while (subdir = readdir(*debugfs_dir), subdir) {
> >>>+	while (subdir = readdir(debugfs_dir), subdir) {
> >>> 		if (!(subdir->d_type & DT_DIR))
> >>> 			continue;
> >>>
> >>>@@ -1089,8 +1091,7 @@ static void kunit_get_tests(struct igt_list_head 
*tests,
> >>> 			break;
> >>> 	}
> >>>
> >>>-	closedir(*debugfs_dir);
> >>>-	*debugfs_dir = NULL;
> >>>+	closedir(debugfs_dir);
> >>>
> >>> 	igt_list_for_each_entry_safe(r, rn, tests, link)
> >>> 		igt_require_f(r->code == IGT_EXIT_SKIP,
> >>>@@ -1197,7 +1198,6 @@ void igt_kunit(const char *module_name, const char 
*suite, const char *opts)
> >>> 	char debugfs_path[PATH_MAX] = { '\0', };
> >>> 	struct igt_ktest tst = { .kmsg = -1, };
> >>> 	struct igt_ktap_results *ktap = NULL;
> >>>-	DIR *debugfs_dir = NULL;
> >>> 	char *subtest;
> >>> 	IGT_LIST_HEAD(tests);
> >>>
> >>>@@ -1244,7 +1244,7 @@ void igt_kunit(const char *module_name, const char 
*suite, const char *opts)
> >>> 	 */
> >>> 	igt_subtest_with_dynamic(subtest) {
> >>> 		kunit_get_tests(&tests, &tst, suite, opts,
> >>>-				debugfs_path, &debugfs_dir, &ktap);
> >>>+				debugfs_path, &ktap);
> >>> 		__igt_kunit(&tst, subtest, opts, debugfs_path, &tests, 
&ktap);
> >>> 	}
> >>>
> >>>@@ -1255,9 +1255,6 @@ void igt_kunit(const char *module_name, const char 
*suite, const char *opts)
> >>>
> >>> 		kunit_results_free(&tests, &suite_name, &case_name);
> >>>
> >>>-		if (debugfs_dir)
> >>>-			closedir(debugfs_dir);
> >>>-
> >>> 		igt_ktest_end(&tst);
> >>> 	}
> >>>
> >>>
> >>
> >>
> >>
> >>
> 




