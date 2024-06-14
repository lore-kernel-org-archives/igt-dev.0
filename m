Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D97C27C75
	for <igt-dev@archiver.kernel.org>; Fri, 14 Jun 2024 10:18:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC1A10E073;
	Fri, 14 Jun 2024 10:18:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ngz443iE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0020610E073
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jun 2024 10:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718360287; x=1749896287;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=wKcWH9KseqVCLAfe2POA6rsbnHA5o/RtNL56O0EQb1E=;
 b=Ngz443iEa3d0ilOHDZBz/V/1znLace8Jji1u88L9XWoMz34iC7+HG5+g
 4wEjoAh4EqwG6ADq5UFXUrELd+nHfpOeNOD/f4i7wtpnlujB32dN28R42
 EGukQfrpdya9A8BJUU39h6drwnSm5boEqstwd1auf2FB6l/5sAG0YrImo
 Q7SwD+YbgbOa9ku6L+fqqNXHB0d5w79MTnUXiJ1ZrGef5i8z7oAgAaQ0w
 zaS9TL+DNFEGEIh0XXBigBkhQgg1EXwP+eBdf16Cl5O2J7MwFkP0XLLQ+
 JyW8BSCFlDTyDw/LwKbcnh1iZ0OurFO08MKooyC8Cs9hqrN8Xzhe++Zb6 g==;
X-CSE-ConnectionGUID: 1CjtFlY6TiKNVvkiyxBk9w==
X-CSE-MsgGUID: 8x1yul6BTW6Kz1yx7SbFZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="37763300"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="37763300"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 03:18:07 -0700
X-CSE-ConnectionGUID: KMkjjuq5QMaonLSvIck4NA==
X-CSE-MsgGUID: YWUKO0LuTs6DzY2H+Bx2GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="45375702"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.221])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 03:18:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>, Kunal Joshi
 <kunal1.joshi@intel.com>
Subject: Re: [i-g-t V5 1/8] lib/igt_kms: Split the bigjoiner check into
 multiple
In-Reply-To: <20240429090930.1905110-2-bhanuprakash.modem@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240429090930.1905110-1-bhanuprakash.modem@intel.com>
 <20240429090930.1905110-2-bhanuprakash.modem@intel.com>
Date: Fri, 14 Jun 2024 13:18:01 +0300
Message-ID: <87a5jnj09y.fsf@intel.com>
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

On Mon, 29 Apr 2024, Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:
> To increase the readabilty, split the bigjoiner check
> into multiple small ones. So that it would be easy to
> extend/fix the logic further.

Please use primary/secondary instead of master/slave terminology.

BR,
Jani.


>
> Cc: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  lib/igt_kms.c | 57 ++++++++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 47 insertions(+), 10 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 98d3fb79c..6a41b535b 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6357,6 +6357,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>  	struct {
>  		enum pipe idx;
>  		drmModeModeInfo *mode;
> +		igt_output_t *output;
>  	} pipes[IGT_MAX_PIPES];
>  	int max_dotclock;
>  
> @@ -6374,11 +6375,12 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>  
>  		pipes[pipes_in_use].idx = output->pending_pipe;
>  		pipes[pipes_in_use].mode = igt_output_get_mode(output);
> +		pipes[pipes_in_use].output = output;
>  		pipes_in_use++;
>  	}
>  
>  	if (!pipes_in_use) {
> -		igt_debug("We must set at least one output to pipe.\n");
> +		igt_info("We must set at least one output to pipe.\n");
>  		return true;
>  	}
>  
> @@ -6395,16 +6397,51 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>  	 *  - current & previous crtcs are consecutive
>  	 */
>  	for (i = 0; i < pipes_in_use; i++) {
> -		if ((igt_bigjoiner_possible(pipes[i].mode, max_dotclock) &&
> -		     ((pipes[i].idx >= (total_pipes - 1)) ||
> -		      (!display->pipes[pipes[i].idx + 1].enabled) ||
> -		      ((i < (pipes_in_use - 1)) && (abs(pipes[i + 1].idx - pipes[i].idx) <= 1)))) ||
> -		    ((i > 0) && igt_bigjoiner_possible(pipes[i - 1].mode, max_dotclock) &&
> -		     ((!display->pipes[pipes[i - 1].idx + 1].enabled) ||
> -		      (abs(pipes[i].idx - pipes[i - 1].idx) <= 1)))) {
> -			igt_debug("Pipe/Output combo is not possible with selected mode(s).\n");
> +		if (igt_bigjoiner_possible(pipes[i].mode, max_dotclock)) {
> +			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz)",
> +				 kmstest_pipe_name(pipes[i].idx),
> +				 igt_output_name(pipes[i].output),
> +				 max_dotclock);
> +			kmstest_dump_mode(pipes[i].mode);
> +
> +			if (pipes[i].idx >= (total_pipes - 1)) {
> +				igt_info("pipe-%s: Last pipe couldn't be used as a bigjoiner master.\n",
> +					 kmstest_pipe_name(pipes[i].idx));
> +				return false;
> +			}
>  
> -			return false;
> +			if (!display->pipes[pipes[i].idx + 1].enabled) {
> +				igt_info("Consecutive pipe-%s: not available to use it as a bigjoiner slave.\n",
> +					 kmstest_pipe_name(display->pipes[pipes[i].idx + 1].pipe));
> +				return false;
> +			}
> +
> +			if ((i < (pipes_in_use - 1)) &&
> +			    (abs(pipes[i + 1].idx - pipes[i].idx) <= 1)) {
> +				igt_info("Consecutive pipe-%s: not free to use it as a bigjoiner slave.\n",
> +					 kmstest_pipe_name(pipes[i + 1].idx));
> +				return false;
> +			}
> +		}
> +
> +		if ((i > 0) && igt_bigjoiner_possible(pipes[i - 1].mode, max_dotclock)) {
> +			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz)",
> +				 kmstest_pipe_name(pipes[i - 1].idx),
> +				 igt_output_name(pipes[i - 1].output),
> +				 max_dotclock);
> +			kmstest_dump_mode(pipes[i - 1].mode);
> +
> +			if (!display->pipes[pipes[i - 1].idx + 1].enabled) {
> +				igt_info("Consecutive pipe-%s: not available to use it as a bigjoiner slave.\n",
> +					 kmstest_pipe_name(display->pipes[pipes[i - 1].idx + 1].pipe));
> +				return false;
> +			}
> +
> +			if (abs(pipes[i].idx - pipes[i - 1].idx) <= 1) {
> +				igt_info("Consecutive pipe-%s: not free to use it as a bigjoiner slave.\n",
> +					 kmstest_pipe_name(pipes[i].idx));
> +				return false;
> +			}
>  		}
>  	}

-- 
Jani Nikula, Intel
