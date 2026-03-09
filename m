Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA0AF3C26E
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 14:25:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448AF10E15A;
	Mon,  9 Mar 2026 14:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MOxIJDB5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410E110E15A
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 14:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773066343; x=1804602343;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=L1VMncctwmQYTdNaOB3o+U4PL3Sn1QsaTJ3XAyO9NBc=;
 b=MOxIJDB5hb+lPtZm+qV0IxtLbnsKqMlZq36ai+r3NJa7Euk0pUuSlmV/
 eau8eLbJNC/W1AkObYhHooPG1Q/zcBrgSgcGl0E1+JAK+C9QehDcBcxM1
 PXFxaEoqo+DHXSDG4WC940+Lx3eVsOfaHekZ3u4x5XhPfixdzYHX2h56G
 hOWR5dgP6GegHMjudTGmRak9CJ5FHqqBMf3QVNmcjz5B358/TBs78tMFW
 3QdaK622RFz317xSE2D0oYcxgbv1jKIBcCX4P9sFLUp7xFWrdIOgkP1qu
 fm9OjmgZ8lsJKC2Y9gxPnriq5u0Ax2xJl6XpqZWvxOEsDPVzOCmxbmIC8 g==;
X-CSE-ConnectionGUID: 2QFWVW9nRBSZ8iN+zASS3A==
X-CSE-MsgGUID: 2ZrJMGRmT9yHL3JJ6RzMqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="85178821"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="85178821"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 07:25:43 -0700
X-CSE-ConnectionGUID: 8yPJcv5PR+qJNaHL7YJv3g==
X-CSE-MsgGUID: ZtV7qtlqRSm0LGLCwBS2EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="224212644"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.239])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 07:25:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com
Subject: Re: [PATCH i-g-t 08/10] tests/kms_vblank: use CRTC indexes instead
 of pipes for CRTC tracking
In-Reply-To: <e5066cc6d24aad560a51f9de37e5d26a46e4dd47.1773066012.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1773066012.git.jani.nikula@intel.com>
 <e5066cc6d24aad560a51f9de37e5d26a46e4dd47.1773066012.git.jani.nikula@intel.com>
Date: Mon, 09 Mar 2026 16:25:38 +0200
Message-ID: <afbad5d884c8c21009146876aab0a43d4cd668ae@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 09 Mar 2026, Jani Nikula <jani.nikula@intel.com> wrote:
> The test tracks	"active" CRTCs in a dedicated array. This does not
> depend on pipes in any way. Switch to using CRTC indexes instead.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  tests/kms_vblank.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index e79b2535c599..395a722bdb13 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -110,8 +110,8 @@ typedef struct {
>  } data_t;
>  
>  static bool all_pipes;
> -static enum pipe active_pipes[IGT_MAX_PIPES];
> -static uint32_t last_pipe;
> +static enum pipe active_crtcs[IGT_MAX_PIPES];

This should be switched to int.

> +static uint32_t last_crtc_index;
>  
>  static double elapsed(const struct timespec *start,
>  		      const struct timespec *end,
> @@ -522,8 +522,8 @@ static void run_subtests(data_t *data)
>  					if (!crtc_output_combo_valid(&data->display, crtc, data->output))
>  						continue;
>  
> -					if (!all_pipes && crtc->pipe != active_pipes[0] &&
> -					    crtc->pipe != active_pipes[last_pipe]) {
> +					if (!all_pipes && crtc->crtc_index != active_crtcs[0] &&
> +					    crtc->crtc_index != active_crtcs[last_crtc_index]) {
>  						igt_info("Skipping pipe %s\n",
>  							 igt_crtc_name(crtc));
>  						continue;
> @@ -554,8 +554,8 @@ static void run_subtests(data_t *data)
>  					if (!crtc_output_combo_valid(&data->display, crtc, data->output))
>  						continue;
>  
> -					if (!all_pipes && crtc->pipe != active_pipes[0] &&
> -					    crtc->pipe != active_pipes[last_pipe]) {
> +					if (!all_pipes && crtc->crtc_index != active_crtcs[0] &&
> +					    crtc->crtc_index != active_crtcs[last_crtc_index]) {
>  						igt_info("Skipping pipe %s\n",
>  							 igt_crtc_name(crtc));
>  						continue;
> @@ -650,9 +650,9 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  		/* Get active pipes. */
>  		for_each_crtc(&data.display, crtc) {
>  			data.crtc = crtc;
> -			active_pipes[last_pipe++] = crtc->pipe;
> +			active_crtcs[last_crtc_index++] = crtc->crtc_index;
>  		}
> -		last_pipe--;
> +		last_crtc_index--;
>  	}
>  
>  	igt_describe("Negative test for vblank request.");
> @@ -679,8 +679,8 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  			if (!crtc_output_combo_valid(&data.display, crtc, data.output))
>  				continue;
>  
> -			if (!all_pipes && crtc->pipe != active_pipes[0] &&
> -					  crtc->pipe != active_pipes[last_pipe]) {
> +			if (!all_pipes && crtc->crtc_index != active_crtcs[0] &&
> +					  crtc->crtc_index != active_crtcs[last_crtc_index]) {
>  				igt_info("Skipping pipe %s\n",
>  					 igt_crtc_name(crtc));
>  				continue;

-- 
Jani Nikula, Intel
