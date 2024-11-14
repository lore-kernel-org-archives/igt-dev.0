Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C454D68B2D
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 15:00:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411A510E7EE;
	Thu, 14 Nov 2024 15:00:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H9jpUrTe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF17810E7EE
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 15:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731596435; x=1763132435;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UNYAOqXryvtSgussWQurUg08yXtsEA95eiVJLmeITV0=;
 b=H9jpUrTemiSRoFtMCyxBCjxsZcONZ3Wr5G3vMuMVoI3x0dpR/iwLxYM2
 LZthK6oN/l3v5nOuZjR3fPxFmKSz6nE/eHCc/LZX2s0uZ2Zt+voWvJmpT
 TI3rFSWFzUv0vIkXQTHBHiqBgqKowpFU9FX5VkLIQiR7Jg4Gg5WIo0SpE
 iqupdYMIoEiEpwIq27lgrcRNhaImUU+C6GCaylOsd69+lUeADipS6XyB3
 5Wi0X0+dj2PNDEhX2/OcLXB09iL/SXi+VYRYxE5MHjz8zPf1mL0z0OC8Q
 +k5oRbDKAexB0VFdKnvg8UEDrY18ZhrXS4NExDTWxHz0L49y2OMN7Awir g==;
X-CSE-ConnectionGUID: 4BSA60tJQee9GMhKlzVVPw==
X-CSE-MsgGUID: 5/zvu2tfTN2Upy3VSPQWGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31325570"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31325570"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 07:00:33 -0800
X-CSE-ConnectionGUID: nGdDsfKzTByGVsvvgJXaQw==
X-CSE-MsgGUID: MBAH60acTkuHAPlQVFKfMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="111533060"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.16])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 07:00:31 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v3 4/6] lib/igt_kmod: Stop passing ktap around
Date: Thu, 14 Nov 2024 16:00:29 +0100
Message-ID: <6796408.GXAFRqVoOG@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241107055254.3129207-5-lucas.demarchi@intel.com>
References: <20241107055254.3129207-1-lucas.demarchi@intel.com>
 <20241107055254.3129207-5-lucas.demarchi@intel.com>
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

On Thursday, 7 November 2024 06:52:52 CET Lucas De Marchi wrote:
> Just allocate and free in the only function it's needed.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Looks safe.

Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

> ---
>  lib/igt_kmod.c | 29 ++++++++++++-----------------
>  1 file changed, 12 insertions(+), 17 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 36578aa68..fd79e8739 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -995,8 +995,9 @@ static void kunit_results_free(struct igt_list_head *results,
>  }
>  
>  static int kunit_get_results(struct igt_list_head *results, const char *debugfs_path,
> -			     const char *suite, struct igt_ktap_results **ktap)
> +			     const char *suite)
>  {
> +	struct igt_ktap_results *ktap;
>  	char results_path[PATH_MAX];
>  	FILE *results_stream;
>  	char *buf = NULL;
> @@ -1012,21 +1013,21 @@ static int kunit_get_results(struct igt_list_head *results, const char *debugfs_
>  	if (igt_debug_on(!results_stream))
>  		return -errno;
>  
> -	*ktap = igt_ktap_alloc(results);
> -	if (igt_debug_on(!*ktap)) {
> +	ktap = igt_ktap_alloc(results);
> +	if (igt_debug_on(!ktap)) {
>  		err = -ENOMEM;
>  		goto out_fclose;
>  	}
>  
>  	while (len = getline(&buf, &size, results_stream), len > 0) {
> -		err = igt_ktap_parse(buf, *ktap);
> +		err = igt_ktap_parse(buf, ktap);
>  		if (err != -EINPROGRESS)
>  			break;
>  	}
>  
>  	free(buf);
> +	igt_ktap_free(&ktap);
>  
> -	igt_ktap_free(ktap);
>  out_fclose:
>  	fclose(results_stream);
>  
> @@ -1037,8 +1038,7 @@ static void kunit_get_tests(struct igt_list_head *tests,
>  			    struct igt_ktest *tst,
>  			    const char *suite,
>  			    const char *opts,
> -			    const char *debugfs_path,
> -			    struct igt_ktap_results **ktap)
> +			    const char *debugfs_path)
>  {
>  	struct igt_ktap_result *r, *rn;
>  	struct dirent *subdir;
> @@ -1083,7 +1083,7 @@ static void kunit_get_tests(struct igt_list_head *tests,
>  		if (suite && strcmp(subdir->d_name, suite))
>  			continue;
>  
> -		igt_warn_on_f(kunit_get_results(tests, debugfs_path, subdir->d_name, ktap),
> +		igt_warn_on_f(kunit_get_results(tests, debugfs_path, subdir->d_name),
>  			      "parsing KTAP report from test suite \"%s\" failed\n",
>  			      subdir->d_name);
>  
> @@ -1102,8 +1102,7 @@ static void __igt_kunit(struct igt_ktest *tst,
>  			const char *subtest,
>  			const char *opts,
>  			const char *debugfs_path,
> -			struct igt_list_head *tests,
> -			struct igt_ktap_results **ktap)
> +			struct igt_list_head *tests)
>  {
>  	struct igt_ktap_result *t;
>  
> @@ -1133,7 +1132,7 @@ static void __igt_kunit(struct igt_ktest *tst,
>  			igt_assert_eq(igt_kernel_tainted(&taints), 0);
>  
>  			igt_assert_eq(kunit_get_results(&results, debugfs_path,
> -							t->suite_name, ktap), 0);
> +							t->suite_name), 0);
>  
>  			for (i = 0; i < 2; i++) {
>  				kunit_result_free(&r, &suite_name, &case_name);
> @@ -1197,7 +1196,6 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
>  {
>  	char debugfs_path[PATH_MAX] = { '\0', };
>  	struct igt_ktest tst = { .kmsg = -1, };
> -	struct igt_ktap_results *ktap = NULL;
>  	char *subtest;
>  	IGT_LIST_HEAD(tests);
>  
> @@ -1243,16 +1241,13 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
>  	 * and for documentation.
>  	 */
>  	igt_subtest_with_dynamic(subtest) {
> -		kunit_get_tests(&tests, &tst, suite, opts,
> -				debugfs_path, &ktap);
> -		__igt_kunit(&tst, subtest, opts, debugfs_path, &tests, &ktap);
> +		kunit_get_tests(&tests, &tst, suite, opts, debugfs_path);
> +		__igt_kunit(&tst, subtest, opts, debugfs_path, &tests);
>  	}
>  
>  	igt_fixture {
>  		char *suite_name = NULL, *case_name = NULL;
>  
> -		igt_ktap_free(&ktap);
> -
>  		kunit_results_free(&tests, &suite_name, &case_name);
>  
>  		igt_ktest_end(&tst);
> 




