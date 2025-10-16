Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81696CCD183
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 11:12:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DFB910E274;
	Thu, 16 Oct 2025 11:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="feecTrlB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188C910E274
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 11:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760613170; x=1792149170;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SWmP0Nyahd6kLw6F25Rv+kYw2MBOcJUxFz/46EgwZuA=;
 b=feecTrlB6tKyautfSC4PokyRvGUPr7ltOtSCLzv092A3P1PIJZIQIhet
 P0ujF3kV08UIJChqmgHHYKQ+fYZPVG9MGym2gXWhp08bno1dZYc8dVWFA
 VJEBA1h+wywp8yeBZUDy5jQHJeSYPT5Z8E5yzh5v6NDUVuTt2rgoZr4dp
 ivDOHUJSoS//koc3adV4cpUqTwM1iuDtVSXCDQS8J6pRExfAVilkANu5F
 nd0sWLs+8OidG8VebEz1MKunWnCwetW7R/kb8KmdAUxRG9Tuhr+R6lhMM
 OOSXXSEF6tTMI66L16BCTx+lb34BOce/igWo4dphzp8c04NwLTHK16/BW A==;
X-CSE-ConnectionGUID: 6iRSFzTxSli2/FpMYj4/+w==
X-CSE-MsgGUID: 8cIBPef1SSSdBry3eQ38Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62896221"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="62896221"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 04:12:39 -0700
X-CSE-ConnectionGUID: To32q0QFRVuaCV+t7RZtMQ==
X-CSE-MsgGUID: Yrl4NKKXR4WoGFLHjQPo4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="182900328"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 04:12:37 -0700
Date: Thu, 16 Oct 2025 13:12:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org, jeevaka.badrappan@intel.com,
 zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t v5 2/2] tests/kms_concurrent: Fix for msg_queue
 failure
Message-ID: <20251016111234.6pggsks7dhtvf4bq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 S Sebinraj <s.sebinraj@intel.com>, igt-dev@lists.freedesktop.org,
 jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com
References: <20251010073009.821335-1-s.sebinraj@intel.com>
 <20251010073009.821335-3-s.sebinraj@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251010073009.821335-3-s.sebinraj@intel.com>
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

Hi S,
On 2025-10-10 at 13:00:09 +0530, S Sebinraj wrote:
> Adds supports to check if the system supports SYSVIPC
> and if not found it skips the test. This removes test
> failures with msg_queue creation for systems that
> don't support SYSVIPC.
> 
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>  tests/kms_concurrent.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index 4f16f8b89..35e7b4328 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -396,7 +396,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  		igt_require(data.display.is_atomic);
>  		igt_display_require_output(&data.display);
>  		if (is_intel_device(data.drm_fd))
> -			intel_allocator_multiprocess_start();
> +			igt_require_f(!intel_allocator_multiprocess_start(),

The syntax is that you want it to succeed, so no '!' here.
With this tests which were passing now started skipping,
see i915.Full report from CI.
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13886/index.html?testfilter=kms_concurrent

> +						"Allocator failure, no SYSV IPC\n");

Align, so it will be:

			igt_require_f(intel_allocator_multiprocess_start(),
				      "Allocator failure, no SYSV IPC\n");

Regards,
Kamil

>  	}
>  
>  	run_tests_for_pipe(&data);
> -- 
> 2.43.0
> 
