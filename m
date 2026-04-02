Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53981D39409
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 10:16:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0963110F19B;
	Thu,  2 Apr 2026 10:16:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EMouNiDa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B7910F19B
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 10:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775124994; x=1806660994;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DQPEDjx+YWJN5wJJ7WWfbZMonokKF94oTqt9ylZUun4=;
 b=EMouNiDazcFAl50fYCqkKLsjB6Ir9Jn2Ul2mJaZmYK8v8Wr9JubW7UaE
 ZuBOlXh5OlNrv49FEuu82SyxFa/dwVVNCV/7yZxtfyQ/0QwT2D+tXOoc+
 lhVYF5Cql3sACycIjtqDJiuwHSNKvvSDKvsdXIhQFDii99gED0+NT7Iox
 A/KXMQkmr5PTfHRxaTPfwrqy6JhDbJcWN8MKXJVCh9h5RfQ0XRxO4jzuy
 /2h2IoJ33A3ohNc2EFZ7G2bpPWrqjpMWOXsyndbe3LgPaSLUzEDCaggbs
 37NsOd2b73KNcTEeKREir3jweb3TATnoFkn0hMWYE6ylqz4V+DF0HzWur A==;
X-CSE-ConnectionGUID: Da968pxTTjCSMALcHe+A3A==
X-CSE-MsgGUID: Omo1Ctq9SxKD5G3TzeLXwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76300380"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="76300380"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 03:16:33 -0700
X-CSE-ConnectionGUID: 1syVR5JeQSy4JyeyoI91jg==
X-CSE-MsgGUID: TSGLqfRmQKSGJk0NWASDHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="257420839"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.61])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 03:16:32 -0700
Date: Thu, 2 Apr 2026 13:16:29 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sowmiya S <sowmiya.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 swati2.sharma@intel.com
Subject: Re: [PATCH i-g-t v1] tests/intel/kms_frontbuffer_tracking: Improve
 skip message
Message-ID: <ac5B_Qg-DRA5Q9P8@intel.com>
References: <20260402043702.914845-1-sowmiya.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260402043702.914845-1-sowmiya.s@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Thu, Apr 02, 2026 at 10:07:02AM +0530, Sowmiya S wrote:
> Replace vague or negative skip messages with standardized,
> explicit descriptions that clearly state why a test is
> being skipped.
> 
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/intel/kms_frontbuffer_tracking.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index c16f63199..6a7017256 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -2548,20 +2548,20 @@ static void check_test_requirements(const struct test_mode *t)
>  {
>  	if (t->pipes == PIPE_DUAL)
>  		igt_require_f(scnd_mode_params.output,
> -			    "Can't test dual pipes with the current outputs\n");
> +			      "no valid secondary output available for dual-pipe tests\n");
>  
>  	if (t->feature & FEATURE_FBC)
>  		igt_require_f(fbc.can_test,
> -			      "Can't test FBC with this chipset\n");
> +			      "feature not supported (feature: fbc)\n");
>  
>  	if (t->feature & FEATURE_PSR) {
>  		igt_require_f(psr.can_test,
> -			      "Can't test PSR with the current outputs\n");
> +			      "feature not supported (feature: psr)\n");
>  	}
>  
>  	if (t->feature & FEATURE_DRRS)
>  		igt_require_f(drrs.can_test,
> -			      "Can't test DRRS with the current outputs\n");
> +			      "feature not supported (feature: drrs)\n");
>  
>  	/*
>  	 * In kernel, When PSR is enabled, DRRS will be disabled. So If a test
> @@ -2569,7 +2569,7 @@ static void check_test_requirements(const struct test_mode *t)
>  	 */
>  	igt_require_f(!((t->feature & FEATURE_PSR) &&
>  		      (t->feature & FEATURE_DRRS)),
> -		      "Can't test PSR and DRRS together\n");
> +		      "incompatible features (feature: psr & drrs)\n");

This doesn't look like an improvement to me. The old one clearly
says what happened, this new one form looks like something meant
to confuses humans and be parsed by some machine.

>  
>  	if (opt.only_pipes != PIPE_COUNT)
>  		igt_require(t->pipes == opt.only_pipes);
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
