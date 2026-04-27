Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65261FF8860
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 15:30:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D360410E7C1;
	Mon, 27 Apr 2026 15:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i7BNJOpf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0DA10E7C3
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 15:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777303832; x=1808839832;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WYufej/WOkQFk6/i2rQ8jBG7WR1eb4vgaGXrAr/EB+c=;
 b=i7BNJOpfLDfaAMnMmaynvK7qe+hOTJ/lD7MRTabSkxeHDWB5q1NggEhe
 EO5nP5x1PCtrvXBIXZcVPeRH0zryXBs4y4SqcnTIXaBuyUY4YLK9Z6ima
 iaKuU+mB4e8VZHuGpBXHlAshqc6rbKj+lutE+Qdq76Vy+D4NdsO6XKwOl
 rrrlm7eEKADHapE3tUTRjVTnEdggroh0CeTPZRIWN/1MWnlswlQflBUh2
 yM3io4VMgSvN92yx0TBtbd52BMLgPYImcuitxkWxXlXjekcu6/vhVh1ne
 Np/FrbHLjLIEMmwvWNZ0xyMDbcrwa8kPrwpV+IFxSB67+SfB6LIEGUnb1 A==;
X-CSE-ConnectionGUID: TqcqM4/bSl+gEoQS1BFfqg==
X-CSE-MsgGUID: b0eENetBQGS3m/pxV6UHYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78253711"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="78253711"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 08:30:31 -0700
X-CSE-ConnectionGUID: ddxN0ta2QzK46FJGmfnfvw==
X-CSE-MsgGUID: JzO9sYFsSgqdhChhwP1ySg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="231028960"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 08:30:30 -0700
Date: Mon, 27 Apr 2026 17:30:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jing-Ping Jan <jingpingjan@google.com>
Subject: Re: [PATCH i-g-t 2/3] lib/igt_kms: Fix assert in
 igt_display_reset_outputs()
Message-ID: <20260427153028.myw3ocsmsxlfccri@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jing-Ping Jan <jingpingjan@google.com>
References: <20260424151355.129423-1-kamil.konieczny@linux.intel.com>
 <20260424151355.129423-3-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260424151355.129423-3-kamil.konieczny@linux.intel.com>
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

Hi,
On 2026-04-24 at 17:13:54 +0200, Kamil Konieczny wrote:
> There is an error manifesting by assert, when primary plane was
> not a first one:
> 
> sudo ./kms_getfb
> INFO: IGT-Version: IGT_VERSION-GIT (arm64) (Linux:
> 	6.6.118-android15-8-g34da635f9b82-ab14801981-4k aarch64)
> ...
> CRITICAL: Test assertion failure function igt_display_reset_outputs,
> 	file external/igt-gpu-tools/lib/igt_kms.c:2985:
> CRITICAL: Failed assertion: old_primary->index != 0
> CRITICAL: error: 0 == 0
> 
> It turns out that after swapping data and index, it should also
> swap pointers itself so asserts will be correct checks.
> 
> Cc: Jani Nikula <jani.nikula@intel.com>
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Reported-by: Jing-Ping Jan <jingpingjan@google.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Thank you all, pushed.

Regards,
Kamil

> ---
>  lib/igt_kms.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 2d758b63c..33092fc85 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2980,6 +2980,7 @@ void igt_display_reset_outputs(igt_display_t *display)
>  
>  				igt_swap(*old_primary, *new_primary);
>  				igt_swap(old_primary->index, new_primary->index);
> +				igt_swap(old_primary, new_primary);
>  
>  				igt_assert_neq(old_primary->index, 0);
>  				igt_assert_eq(new_primary->index, 0);
> -- 
> 2.54.0
> 
