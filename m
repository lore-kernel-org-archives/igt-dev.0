Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8AAE7719D
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 14:19:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C4510F0DB;
	Fri, 10 Jan 2025 14:19:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h4XWX+1y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE0910F0DB
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 14:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736518768; x=1768054768;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=L8s5Litni8k0on9zYxbDg6sUJTvRgTAsvAfVDTNIpQY=;
 b=h4XWX+1yFFBvrIOIUHRL+c9ILhAnlACycjYG/oa7hXnPdrYl2sudm8ax
 2Xs+jDfDA3Da1vgALz0POo8vFx2roAB/WNH/JMEH5+y/LYgpESeWvqHM8
 IrduEekUbJjCUxyUGnexwR94o0pqInquYCk+ZxZ3F0kdiGehqt4WHWy6z
 ac1AaQj1ud++wJljgszsqTAHqealPOB03mum51XasvoaWyCpFQDuCaedu
 irry1JpUgk9i4b2Hpv8bHYrjN4uWBDvs6HCteR95S1pYanzWD1F5YctJj
 kNz2zX7yTVkHaj2cGj4bttyTRYVz3CnNCw9Ry/tBrfeX7z2ziqopu6N9o A==;
X-CSE-ConnectionGUID: Xroq/xgATc2vF9ZoTm3nQw==
X-CSE-MsgGUID: PJIRhzghRXmLoRVezzJCvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36972615"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="36972615"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 06:19:28 -0800
X-CSE-ConnectionGUID: P6tMmyUWSkm8rEUuZOVjXw==
X-CSE-MsgGUID: 01cftmxQRfmkGl/4c+PJHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="108748967"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 06:19:27 -0800
Date: Fri, 10 Jan 2025 15:19:12 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH v3 1/2] tests/intel/kms_frontbuffer_tracking: Add skip
 condition for bmg platform
Message-ID: <20250110141912.3vehhww6tz6fxg52@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org,
 Swati Sharma <swati2.sharma@intel.com>
References: <20250109055652.405793-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250109055652.405793-1-mohammed.thasleem@intel.com>
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
On 2025-01-09 at 11:26:51 +0530, Mohammed Thasleem wrote:

please also improve subject so we know it from beginning
which skips you added, so better:

[PATCH v3 1/2] tests/intel/kms_frontbuffer_tracking: Skip fbc* tests on BMG

Same note for your other patches, if you know which ones skipped
just write it in subject. The only exception would be if there
are many different tests names skipped, then you could use
generic.

Regards,
Kamil

> FBC test isn't supported on bmg, skip the test on this platform.
> 
> v2: Add workaround id: Wa_16023588340. (Swati)
> v3: Add workaround id in code.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/kms_frontbuffer_tracking.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index e41ee0a80..2d47194dd 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -2756,6 +2756,10 @@ static void prepare_subtest_data(const struct test_mode *t,
>  
>  static void prepare_subtest_screens(const struct test_mode *t)
>  {
> +	/* FBC disabled: Wa_16023588340 */
> +	igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t->feature == FEATURE_FBC),
> +		      "FBC isn't supported on BMG\n");
> +
>  	if (t->pipes == PIPE_DUAL)
>  		enable_both_screens_and_wait(t);
>  	else
> @@ -2800,6 +2804,10 @@ static void prepare_subtest(const struct test_mode *t,
>   */
>  static void rte_subtest(const struct test_mode *t)
>  {
> +	/* FBC disabled: Wa_16023588340 */
> +	igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t->feature == FEATURE_FBC),
> +		      "FBC isn't supported on BMG\n");
> +
>  	prepare_subtest_data(t, NULL);
>  
>  	unset_all_crtcs();
> @@ -4285,6 +4293,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  			t.flip = -1;
>  			t.tiling = opt.tiling;
>  
> +			/* FBC disabled: Wa_16023588340 */
> +			igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t.feature == FEATURE_FBC),
> +				      "FBC isn't supported on BMG\n");
> +
>  			for_each_pipe(&drm.display, pipe) {
>  				if (pipe == default_pipe) {
>  					igt_info("pipe-%s: FBC validated in other subtest\n", kmstest_pipe_name(pipe));
> -- 
> 2.43.0
> 
