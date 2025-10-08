Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8ABCCA470
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 11:24:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A970410E0EE;
	Wed,  8 Oct 2025 11:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n621c+WW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17F210E0EE
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 11:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759922672; x=1791458672;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sY69vblcqf0Srijpy6P3EKeoyt/qRnaZ6H8ynBDC7xQ=;
 b=n621c+WWcUkV/57hrBzPlJoxdPxvDwyHZ8yL7u1VU8cgOwErnfEGQY+O
 b7UgCcEkLozdXzX/1NYpWYZfQRXHw/rVofuG5OUBp3cjxZM1aKBaGKr0V
 XrY9+ycPgRlYkqLYwpTp8HyCy1YAp3Rrxrqz0/PR7SOCOPNXlZVAsauhw
 vNtIXhyWphG9tqqOvdaMQidei86f2dCkvrPuVwDlnf+wVuBMthyW3fCf7
 Wgp6YSXbZ83OomT7FDClijLEjW9+t3RZ2qioN7wlPtx2JQ3GPysd3GMPu
 j61tsczcFEPiyRqEHtEt9pY7JATWpF/zsHWvJdaTYyiYfLDhMDP1in0mj w==;
X-CSE-ConnectionGUID: AL3FT8TRRfS3Lspo/heOgA==
X-CSE-MsgGUID: JyCSxYPaRauP2XOhShGCbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="72789204"
X-IronPort-AV: E=Sophos;i="6.19,323,1754982000"; d="scan'208";a="72789204"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 04:24:31 -0700
X-CSE-ConnectionGUID: IuIgXu62S7ie7EX4T5fK4Q==
X-CSE-MsgGUID: Flx5wJpUTJiuC3gg5WzMjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,323,1754982000"; d="scan'208";a="179550780"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2025 04:24:30 -0700
Date: Wed, 8 Oct 2025 13:24:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Fix typo
Message-ID: <20251008112414.fgsqmturyrkrmagk@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org,
 swati2.sharma@intel.com
References: <20251008092530.1537245-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251008092530.1537245-1-jeevan.b@intel.com>
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

Hi Jeevan,
On 2025-10-08 at 14:55:30 +0530, Jeevan B wrote:

small nit:

> fix typo : %s/offscren/offscreen

Fix typo : s/offscren/offscreen/

No need for resend, could be done at merge, you already
have r-b so I will not add any.

Regards,
Kamil

> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/intel/kms_frontbuffer_tracking.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index a29da1d43..03428b373 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -76,19 +76,19 @@
>   */
>  
>  /**
> - * SUBTEST: drrs-1p-offscren-pri-%s-draw-%s
> + * SUBTEST: drrs-1p-offscreen-pri-%s-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provided method
>   *
> - * SUBTEST: fbc-1p-offscren-pri-%s-draw-%s
> + * SUBTEST: fbc-1p-offscreen-pri-%s-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provided method
>   *
> - * SUBTEST: psr-1p-offscren-pri-%s-draw-%s
> + * SUBTEST: psr-1p-offscreen-pri-%s-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provided method
>   *
> - * SUBTEST: fbcdrrs-1p-offscren-pri-%s-draw-%s
> + * SUBTEST: fbcdrrs-1p-offscreen-pri-%s-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provided method
>   *
> - * SUBTEST: fbcpsr-1p-offscren-pri-%s-draw-%s
> + * SUBTEST: fbcpsr-1p-offscreen-pri-%s-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provided method
>   *
>   * arg[1]:
> @@ -104,23 +104,23 @@
>   */
>  
>  /**
> - * SUBTEST: drrs-1p-offscren-pri-%s-draw-%s
> + * SUBTEST: drrs-1p-offscreen-pri-%s-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provided method
>   * Driver requirement: i915
>   *
> - * SUBTEST: fbc-1p-offscren-pri-%s-draw-%s
> + * SUBTEST: fbc-1p-offscreen-pri-%s-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provided method
>   * Driver requirement: i915
>   *
> - * SUBTEST: psr-1p-offscren-pri-%s-draw-%s
> + * SUBTEST: psr-1p-offscreen-pri-%s-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provided method
>   * Driver requirement: i915
>   *
> - * SUBTEST: fbcdrrs-1p-offscren-pri-%s-draw-%s
> + * SUBTEST: fbcdrrs-1p-offscreen-pri-%s-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provided method
>   * Driver requirement: i915
>   *
> - * SUBTEST: fbcpsr-1p-offscren-pri-%s-draw-%s
> + * SUBTEST: fbcpsr-1p-offscreen-pri-%s-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provided method
>   * Driver requirement: i915
>   *
> @@ -3948,7 +3948,7 @@ static const char *screen_str(int screen)
>  	case SCREEN_SCND:
>  		return "scndscrn";
>  	case SCREEN_OFFSCREEN:
> -		return "offscren";
> +		return "offscreen";
>  	default:
>  		igt_assert(false);
>  	}
> -- 
> 2.43.0
> 
