Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CD2CA6007
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 14:34:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A0410E0E2;
	Thu,  8 Oct 2026 14:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a6t7pUy2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1E310E0E2
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 14:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791470022; x=1823006022;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Gs6WAqEmaB4cHzimCiLcdiIirvvp5AFjmxuu7KeCGo0=;
 b=a6t7pUy2lN7McOpjlomnpBQbBrnkxa8PJmtj3mcr7srCPfPSf+tX9tTP
 pGEJ4JhUa9VexvYnEatt2bTLCc07N8y9kIbqjU7Rgdkp1AM8zptcFPPfi
 +WlWdBe/2JNiOoKdhnijGIO0jCydVwbES+O1R7v1Pc4I3ptf6epuSWW7T
 /p7va4RXw1FvUo3txYdayf73X0lILxH2bMvz5/us3AE1I3sJ5qSttKij0
 xW6CL05H3vJ9orwlawqUZpeVsYIz0eP2yIXU64+t+JGWo/gwKQLA5haAc
 soTOHyeV/5URjWyvRv6tfdkrdfy4K95qfi2lKgckv07xuO3yLGJyhotDc Q==;
X-CSE-ConnectionGUID: IpEhlgbFTXOLetI0JtL2Og==
X-CSE-MsgGUID: sXO7/N5sTAyvVOcQ3/eM0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="159544"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="159544"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 07:33:41 -0700
X-CSE-ConnectionGUID: DviSKuKERRKHZEWD73kyYQ==
X-CSE-MsgGUID: 0S/IQ5hEQnuvpjeDFqb52A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="63232"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 07:33:40 -0700
Date: Thu, 8 Oct 2026 16:33:37 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: igt-dev@lists.freedesktop.org, Nishit Sharma <nishit.sharma@intel.com>
Subject: Re: [PATCH 2/4] tests/intel/xe_wedged: Fix wedged dmesg ignore regex
Message-ID: <20261008143337.b334ysrpgrynmn55@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 igt-dev@lists.freedesktop.org,
 Nishit Sharma <nishit.sharma@intel.com>
References: <20261007210603.1350158-1-shuicheng.lin@intel.com>
 <20261007210603.1350158-3-shuicheng.lin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261007210603.1350158-3-shuicheng.lin@intel.com>
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

Hi Shuicheng,
On 2026-10-07 at 21:06:01 +0000, Shuicheng Lin wrote:
> The kernel now reports the failed GT reset and the device wedge through
> SIGID-based logging:
> 
>   SIGID=106 FATAL (-ECANCELED) Tile0: GT0: GT: reset failed
>   SIGID=102 FATAL (-EIO) WEDGED: Device declared wedged!
> 
> which the existing "reset failed .-ECANCELED" and "declared device ...
> as wedged" patterns no longer match, so these expected errors are
> reported as dmesg-warn. Add patterns for the new messages.
> 
> Also fix the CAT error pattern. igt_emit_ignore_dmesg_regex() passes the

Please give one or few examples of such CAT errors.

> regex to igt_runner through /dev/kmsg, which escapes '\' as "\x5c", so
> "\[" no longer matches a literal '['. The pattern also lacked the space
> before "class=". Use bracket expressions and add the missing space.

You didn't touch regex line with 'class'?

> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  tests/intel/xe_wedged.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index 8c3c8bd36..0cd884450 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -41,6 +41,10 @@ static void ignore_wedged_in_dmesg(void)
>  				    "|GT[0-9A-Fa-f]*: Failed to submit"
>  				    "|Modules linked in:"
>  				    "|__pfx___drm_"
> +				    /* SIGID-based logging (newer kernels) */
> +				    "|[(]-ECANCELED[)] .* GT: reset failed"
> +				    "|[(]-EIO[)] WEDGED: Device declared wedged"

Can you simplify this into:
				    "|-ECANCELED.* GT: reset failed"
				    "|-EIO. WEDGED: Device declared wedged"

> +				    "|IOCTLs and executions are now blocked"
>  				    "|Tile[0-9]+: GT[0-9A-Fa-f]*:$"
>  				    "|ASID: [0-9]+"
>  				    "|Faulted Address: 0x[0-9A-Fa-f]+"
> @@ -50,7 +54,7 @@ static void ignore_wedged_in_dmesg(void)
>  				    "|EngineClass: [0-9]+ [a-z]+"
>  				    "|EngineInstance: [0-9]+"
>  				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Fault response: Unsuccessful -EINVAL"
> -				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error \\[[0-9]+\\]:"
> +				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error [[][0-9]+[]]: "

This also looks complicated, what about:

				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error .[0-9]+.: "

or drop digits from end:

				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error"


Regards,
Kamil

>  				    "class=[a-z]+, logical_mask: 0x[0-9A-Fa-f]+, guc_id=[0-9]+");
>  }
>  
> -- 
> 2.43.0
> 
