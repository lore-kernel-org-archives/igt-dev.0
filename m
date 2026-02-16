Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CAEE81A29
	for <igt-dev@archiver.kernel.org>; Mon, 16 Feb 2026 14:04:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D57AD10E035;
	Mon, 16 Feb 2026 14:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iqq513r9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E103E10E035
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Feb 2026 14:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771250670; x=1802786670;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TDAHKvh81JyutuBJKhOtBd9hfzy8F9uPXhb1/W/pHow=;
 b=Iqq513r9wXfg+u3GhJUMEd5r0HeEMtXn35oXrqBQndL9f/3maY+7iX7L
 8AhHqJ63xQf9nGNrTVJcVqj/9O+uXn+xFYGfOGEZp2rYTpQTbBWkxHd7j
 j6DNZbiItWVGREFMd9PsGrv1D8ffFeWV4FIHMAeF4PBZs7Q3cHYKPnqsN
 AS9g02jL+V/zv78uQ1qdQ/P1mWo2dj5tv1ycxCssaHteVnrWDuQKKgGGb
 ng0bZif9OhRfycqsHLL2z0jSypJ5ehR3U5hhmfwrba23WZEc3KSaVfUQZ
 c+zq+eq9bVbl2SKcsF9GiTl+dAgThVl5bObrlUV62ivWEhNW1089NZy+L w==;
X-CSE-ConnectionGUID: U5ojVZJeQvCR2+U7Sd1KhQ==
X-CSE-MsgGUID: 6DFLRyZYQi2VDW45ZJKdHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72425372"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="72425372"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 06:04:30 -0800
X-CSE-ConnectionGUID: zgOD+ihLRqOd00BmK0fQ9A==
X-CSE-MsgGUID: h1ke3ikgTAWDQsdIhSPdbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="212173260"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 06:04:29 -0800
Date: Mon, 16 Feb 2026 15:04:26 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/kms_invalid_mode: Add informative skip for
 connectors with fixed mode
Message-ID: <20260216140426.evaomt23troj5hei@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260213081059.450804-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260213081059.450804-1-swati2.sharma@intel.com>
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

Hi Swati,
On 2026-02-13 at 13:40:59 +0530, Swati Sharma wrote:
> Currently adjust_mode_clock_too_high() silently returns when the
> connector exposes a scaling mode property. On such connectors the
> kernel ignores user-specified timings (except hdisplay/vdisplay).
> 
> Instead of silently returning, add an explicit igt_skip() with a
> clear message indicating that fixed mode connectors are not
> suitable for this test.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/kms_invalid_mode.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
> index 9f6b2df9e..2c4fbe8c0 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -136,8 +136,11 @@ adjust_mode_clock_too_high(data_t *data, drmModeModeInfoPtr mode)
>  	 * roughly match the user will get. For now skip the
>  	 * test on  any connector with a fixed mode.
>  	 */
> -	if (has_scaling_mode_prop(data))
> +	if (has_scaling_mode_prop(data)) {
> +		igt_skip("Skipping: connector %s exposes a fixed mode; kernel"

imho better s/;/,/

> +		         "ignores user timings (clock/refresh not honored)\n", data->output->name);

Add space before 'ignores'

>  		return false;

Skip will end flow so this 'return false' is not needed, unless you change
'igt_skip' into 'igt_info'.

Regards,
Kamil

> +	}
>  
>  	/*
>  	 * Newer platforms can support modes higher than the maximum dot clock
> -- 
> 2.25.1
> 
