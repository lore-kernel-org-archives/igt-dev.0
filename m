Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FD9E68974
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 10:43:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CCC10E09D;
	Thu, 31 Oct 2024 10:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f4hVr/hf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1B410E09D
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 10:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730371383; x=1761907383;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v/3Pz6jk54++GGz7iqIQ8iRzRPHdfQQiP9x8kPEVUN4=;
 b=f4hVr/hfLUrCzTxIuRiNnthcKOHOs+X5QCd6QdOLMj3w2UTA/CzO5CRY
 aD6t6RRpGXPX+35qeLZ+L36vizbGX7HVQ/Nod1d1O4ybxSqTJ+k8qzYBv
 SP+fSp4Uh10kTTfyAMGYPFtY7d46S9Tj3tKVdh9L+kVY3gP2LMJerYOAk
 btJFBw3TONrd89p6mJ/s+LeWbn28nkYvweoTPBfym4tzkLDBi0DYiUhvj
 bqjIayxUsqy0KTlnXhF/jRjksISXRYpqJP2k14QjMHnYiO1NdKBmLGOOD
 mRmBNhWAEXkCLZMbxZabt5b+dhzsLvn7PxhitnTDlOrF5A3urI1A+jAbr Q==;
X-CSE-ConnectionGUID: 6XWiTRoORdevcoTrxUophw==
X-CSE-MsgGUID: 1j0D6M11QJ2TP7fJYWdxQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29960087"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29960087"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 03:43:03 -0700
X-CSE-ConnectionGUID: BCjMBKIrSfq6wvDe0u0ZYw==
X-CSE-MsgGUID: 3yUnKg3zSBeP+Zc7tEM4sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="87384374"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.187])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 03:43:01 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/2] lib/igt_kmod: Drop legacy kunit fallback
Date: Thu, 31 Oct 2024 11:42:58 +0100
Message-ID: <3310304.N7aMVyhfb1@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241031003142.863437-2-lucas.demarchi@intel.com>
References: <20241031003142.863437-1-lucas.demarchi@intel.com>
 <20241031003142.863437-2-lucas.demarchi@intel.com>
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

On Thursday, 31 October 2024 01:31:41 CET Lucas De Marchi wrote:
> Kunit has support for listing tests with debugfs for quite some time,
> there's no need for the fallback to be happening: let's just start
> failing the tests if we can't get the list of tests from debugfs.

We must not fail, we may skip, see below.

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/igt_kmod.c | 278 ++-----------------------------------------------
>  1 file changed, 10 insertions(+), 268 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 75a0d057c..4cb9e886d 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
...
> @@ -1523,25 +1268,22 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
>  
>  	/*
>  	 * We need to use igt_subtest here, as otherwise it may crash with:
> -	 *  skipping is allowed only in fixtures, subtests or igt_simple_main
> +	 * "skipping is allowed only in fixtures, subtests or igt_simple_main"
>  	 * if used on igt_main. This is also needed in order to provide
>  	 * proper namespace for dynamic subtests, with is required for CI
>  	 * and for documentation.
>  	 */
>  	igt_subtest_with_dynamic(subtest) {
> -		/*
> -		 * TODO: As soon as no longer needed by major Linux
> -		 *	 distributions, replace the fallback to
> -		 *	 __igt_kunit_legacy() processing path, required by
> -		 *	 LTS kernels not capable of using KUnit filters for
> -		 *	 listing test cases in KTAP format, with igt_require.
> -		 */
> +		bool has_tests;
> +
>  		kunit_debugfs_path(debugfs_path);
> -		if (igt_debug_on(!*debugfs_path) ||
> -		    !kunit_get_tests(&tests, &tst, suite, opts, debugfs_path, &debugfs_dir, &ktap))
> -			__igt_kunit_legacy(&tst, subtest, opts);
> -		else
> -			__igt_kunit(&tst, subtest, opts, debugfs_path, &tests, &ktap);
> +		igt_assert(*debugfs_path);

According to a comment followed by respective assert() inside 
lib/igt_core.c:igt_fail():

	/* Dynamic subtest containers must not fail explicitly */

that's why I suggested replacing the fallback with igt_require(), not with 
igt_assert().

But maybe we could go a step forward and replace all

	if (igt_debug_on(...))
		return;

inside kunit_debugfs_path() with

	igt_skip_on(...);

then we needed neither igt_require() nor igt_assert() here.

> +
> +		has_tests = kunit_get_tests(&tests, &tst, suite, opts,
> +					    debugfs_path, &debugfs_dir, &ktap);
> +		igt_assert(has_tests);

Ditto, optionally with all 

	if (igt_debug_on(...))
		return false;

inside kunit_get_tests() replaced with

	igt_skip_on(...);

and kunit_get_tests() returning void.

Thanks,
Janusz

> +
> +		__igt_kunit(&tst, subtest, opts, debugfs_path, &tests, &ktap);
>  	}
>  
>  	igt_fixture {
> 




