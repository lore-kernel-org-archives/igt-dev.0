Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31245C54E65
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 11:30:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F2B10EA47;
	Thu, 22 May 2025 11:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mwObEvzn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD46C10ED54
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 11:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747913433; x=1779449433;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ge+6AE4KHNmnZ+rfvVs0yEWWWj4ec3uedbjiYWtIaTY=;
 b=mwObEvznS6v8m6lkPO2a1Df51gjC/IQZaORP77VyHBZ0jkIzSY7Df/9W
 tQUVbN52Sbf4xjpnpdxnoHCHdTgOKUODCI1QBVCtMpsrLYjidBTy+XCYV
 Rjm2vb0htaRKfjQee2u+Ih2ctrePbYCkNVhzZUArKyxTlS3T2wW9fmW+d
 ofzRSH8uJsvTXJKSWJlXEdq6+iUQAC0zzCy2kfktC7Xs12SIz3PAifI0r
 bbqG1XhhQ3AIrufhTkXpp9cCs2qnEnwIaaD8G5WWv15UWdisswILvxtbr
 zqymqKstfznfzpIuw5bRpBodPHUCTSnbw/WiexIaTaQydwJtVgFLkBSMG A==;
X-CSE-ConnectionGUID: iQ+4ew0NStWfUzqdPSkqJg==
X-CSE-MsgGUID: aDVCz0C7QsOf6C0O+wY+IQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="53742083"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="53742083"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 04:30:33 -0700
X-CSE-ConnectionGUID: jtLGMgB8QlevtkcfFjXbkw==
X-CSE-MsgGUID: AA2HoCfrTXebAUGXLXXCwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="141484455"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 04:30:32 -0700
Date: Thu, 22 May 2025 13:30:17 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH v2 2/2] tests/intel/kms_frontbuffer_tracking: Enable the
 tests support variations based on the WAs
Message-ID: <20250522113017.nyjm263jrtylx6hu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250519123135.1307174-1-mohammed.thasleem@intel.com>
 <20250519123135.1307174-3-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250519123135.1307174-3-mohammed.thasleem@intel.com>
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

Hi Mohammed,
On 2025-05-19 at 18:01:35 +0530, Mohammed Thasleem wrote:
> This update stops skipping fbc-* tests support variations based on the WAs
> 
> v2: Use WA_FBC_DISABLED instead CHECK_WA. (Vinod)
>     Update igt_skip_on_f discription. (Vinod)
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/kms_frontbuffer_tracking.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index 0809352cb..aebee7048 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -781,6 +781,7 @@
>   */
>  
>  #define TIME SLOW_QUICK(1000, 10000)
> +#define WA_FBC_DISABLED "16023588340"
>  
>  IGT_TEST_DESCRIPTION("Test the Kernel's frontbuffer tracking mechanism and "
>  		     "its related features: FBC, PSR and DRRS");
> @@ -2248,6 +2249,20 @@ static void do_flush(const struct test_mode *t)
>  
>  #define ASSERT_NO_IDLE_GPU		(1 << 11)
>  
> +static void check_fbc_support(int devid, const struct test_mode *t)
> +{
> +	int wa;
> +
> +	if (IS_BATTLEMAGE(drm.devid) && t->feature == FEATURE_FBC) {
> +		wa = igt_has_intel_wa(drm.fd, WA_FBC_DISABLED);
> +
> +		if (wa == 1)
> +			igt_skip("WA has disabled FBC on BMG\n");
> +		else if (wa == -1)
> +			igt_assert_f(wa >= 0, "WA path not found on GTs\n");

This is the same as:
		if (wa == 1)
			igt_skip("WA has disabled FBC on BMG\n");

		igt_assert_f(wa >= 0, "WA path not found on GTs\n");

Regards,
Kamil

> +	}
> +}
> +
>  static int adjust_assertion_flags(const struct test_mode *t, int flags)
>  {
>  	if (!(flags & DONT_ASSERT_FEATURE_STATUS)) {
> @@ -2610,8 +2625,7 @@ static void prepare_subtest_data(const struct test_mode *t,
>  static void prepare_subtest_screens(const struct test_mode *t)
>  {
>  	/* FBC disabled: Wa_16023588340 */
> -	igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t->feature == FEATURE_FBC),
> -		      "FBC isn't supported on BMG\n");
> +	check_fbc_support(drm.devid, t);
>  
>  	if (t->pipes == PIPE_DUAL)
>  		enable_both_screens_and_wait(t);
> @@ -2658,8 +2672,7 @@ static void prepare_subtest(const struct test_mode *t,
>  static void rte_subtest(const struct test_mode *t)
>  {
>  	/* FBC disabled: Wa_16023588340 */
> -	igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t->feature == FEATURE_FBC),
> -		      "FBC isn't supported on BMG\n");
> +	check_fbc_support(drm.devid, t);
>  
>  	prepare_subtest_data(t, NULL);
>  
> @@ -4157,8 +4170,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  			t.tiling = opt.tiling;
>  
>  			/* FBC disabled: Wa_16023588340 */
> -			igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t.feature == FEATURE_FBC),
> -				      "FBC isn't supported on BMG\n");
> +			check_fbc_support(drm.devid, &t);
>  
>  			for_each_pipe(&drm.display, pipe) {
>  				if (pipe == default_pipe) {
> -- 
> 2.34.1
> 
