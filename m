Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3820AD767D8
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 14:58:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20DA10E8BD;
	Thu, 31 Oct 2024 14:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hmuOErhx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D4010E8BD
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 14:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730386696; x=1761922696;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zEhAd/uDk8xCwfTzKLkjmQ7vBVgjJDp1itJHI5Bk3Nk=;
 b=hmuOErhx476flLbJkfelN7RS0eqAN1IP6URgAN+VHixb0+ZhdkBitZkP
 rUPlajGNaiPvAC0Qv/5WX+tkob61fhQ8bp+RbMfGEu+Oi8Gk7Eus9zBZc
 mGHvh7AghETuNwtPgpNcClcSTqwh0jBEynO9FTT+HRCE1ZdpU8qEbgd1b
 j+mvWDUyqScWdW/pWnItNW9Pc99M2+B959F4JHNMYsGBwZCBioCbBux+k
 MIb0E7h0m8dE0HhTxDW6dL+7Oin2HZR+Rpy9QJ1h58oJK4w3j4XDskILa
 099bsEoVW+lYW18qvUH6kQWHpo7VXsEMoSC7TQ9s8IqznonEJSXMsEpV4 A==;
X-CSE-ConnectionGUID: N73DEKDqSKO6Lndm9hBdyQ==
X-CSE-MsgGUID: mtzG/GDdQOqb0etuOSWxPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="34059827"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="34059827"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 07:58:15 -0700
X-CSE-ConnectionGUID: AFNZPK0nR/mWIdZw1xEE8g==
X-CSE-MsgGUID: KRNzarp5ROCfA14qLQEVcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="87785085"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.202])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 07:58:14 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/2] lib/igt_kmod: Drop legacy kunit fallback
Date: Thu, 31 Oct 2024 15:58:11 +0100
Message-ID: <2672104.tIAgqjz4sF@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <t5p33w3s2bzaddakwcagzaab7ys2epo2bile3ubtanzuuqh4fb@5ypkaql3wtn7>
References: <20241031003142.863437-1-lucas.demarchi@intel.com>
 <3310304.N7aMVyhfb1@jkrzyszt-mobl2.ger.corp.intel.com>
 <t5p33w3s2bzaddakwcagzaab7ys2epo2bile3ubtanzuuqh4fb@5ypkaql3wtn7>
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

On Thursday, 31 October 2024 14:18:25 CET Lucas De Marchi wrote:
> On Thu, Oct 31, 2024 at 11:42:58AM +0100, Janusz Krzysztofik wrote:
> >Hi Lucas,
> >
> >On Thursday, 31 October 2024 01:31:41 CET Lucas De Marchi wrote:
> >> Kunit has support for listing tests with debugfs for quite some time,
> >> there's no need for the fallback to be happening: let's just start
> >> failing the tests if we can't get the list of tests from debugfs.
> >
> >We must not fail, we may skip, see below.
> >
> >>
> >> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >> ---
> >>  lib/igt_kmod.c | 278 ++-----------------------------------------------
> >>  1 file changed, 10 insertions(+), 268 deletions(-)
> >>
> >> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> >> index 75a0d057c..4cb9e886d 100644
> >> --- a/lib/igt_kmod.c
> >> +++ b/lib/igt_kmod.c
> >...
> >> @@ -1523,25 +1268,22 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
> >>
> >>  	/*
> >>  	 * We need to use igt_subtest here, as otherwise it may crash with:
> >> -	 *  skipping is allowed only in fixtures, subtests or igt_simple_main
> >> +	 * "skipping is allowed only in fixtures, subtests or igt_simple_main"
> >>  	 * if used on igt_main. This is also needed in order to provide
> >>  	 * proper namespace for dynamic subtests, with is required for CI
> >>  	 * and for documentation.
> >>  	 */
> >>  	igt_subtest_with_dynamic(subtest) {
> >> -		/*
> >> -		 * TODO: As soon as no longer needed by major Linux
> >> -		 *	 distributions, replace the fallback to
> >> -		 *	 __igt_kunit_legacy() processing path, required by
> >> -		 *	 LTS kernels not capable of using KUnit filters for
> >> -		 *	 listing test cases in KTAP format, with igt_require.
> >> -		 */
> >> +		bool has_tests;
> >> +
> >>  		kunit_debugfs_path(debugfs_path);
> >> -		if (igt_debug_on(!*debugfs_path) ||
> >> -		    !kunit_get_tests(&tests, &tst, suite, opts, debugfs_path, &debugfs_dir, &ktap))
> >> -			__igt_kunit_legacy(&tst, subtest, opts);
> >> -		else
> >> -			__igt_kunit(&tst, subtest, opts, debugfs_path, &tests, &ktap);
> >> +		igt_assert(*debugfs_path);
> >
> >According to a comment followed by respective assert() inside
> >lib/igt_core.c:igt_fail():
> >
> >	/* Dynamic subtest containers must not fail explicitly */
> >
> >that's why I suggested replacing the fallback with igt_require(), not with
> >igt_assert().
> 
> where did you suggest that?

In the above TODO comment you are addressing with this patch.

Janusz

> 
> >
> >But maybe we could go a step forward and replace all
> >
> >	if (igt_debug_on(...))
> >		return;
> >
> >inside kunit_debugfs_path() with
> >
> >	igt_skip_on(...);
> 
> 
> I'd rather not skip and have a big red FAIL since it's not a valid
> setup.
> 
> >
> >then we needed neither igt_require() nor igt_assert() here.
> >
> >> +
> >> +		has_tests = kunit_get_tests(&tests, &tst, suite, opts,
> >> +					    debugfs_path, &debugfs_dir, &ktap);
> >> +		igt_assert(has_tests);
> >
> >Ditto, optionally with all
> >
> >	if (igt_debug_on(...))
> >		return false;
> >
> >inside kunit_get_tests() replaced with
> >
> >	igt_skip_on(...);
> 
> if those writes fail for whatever reason, I don't want the test to skip,
> I want them to fail so we can fix them.
> 
> a skip is a valid thing when there's difference in behavior from
> platform to platform or when it's a valid difference in env setup. Here
> it's not.
> 
> Lucas De Marchi
> 
> >
> >and kunit_get_tests() returning void.
> >
> >Thanks,
> >Janusz
> >
> >> +
> >> +		__igt_kunit(&tst, subtest, opts, debugfs_path, &tests, &ktap);
> >>  	}
> >>
> >>  	igt_fixture {
> >>
> >
> >
> >
> >
> 




