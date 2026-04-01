Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876D4D35162
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 11:45:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3316D10ED6A;
	Wed,  1 Apr 2026 11:45:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YlSWEcc+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FFB010ED6A
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 11:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775043902; x=1806579902;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=eDF1w4hrvbb5LFIglkm8LpoEHKaAn/s+q0iWa1kZwOk=;
 b=YlSWEcc+jmjXWQFI/X82o9niW3qgqnrNvLEVOQk5E5UMvwOYxYfHkusO
 kHEOvsJkDuDTCg03GP5Zm93apxoU1eWQOcPTb9sipg66DWBuszQOq2Y1h
 EgI+c3YNU9hdnFy/Xwsps6emwVjydFS6t3x9TjSMljlcXz4p+oI2Bn6Ey
 ABxCBUJLQ161x99vRvhcH79sfrOvqcQYeciVpmXh7emHP6fwpaImHT/Ij
 o0CWn8mgr7xvy6/3npRVUMc6jzFntIHR1bwGboS+Pa7o3q/MjKAxcxmm5
 /8woh8Mui3WnWU8GII5Gxde6w6dd0qF2+44t6Wcz84mRqAWKIWFTnCKxo w==;
X-CSE-ConnectionGUID: iZ7y+Eh5QAWl9zxtt9Htew==
X-CSE-MsgGUID: p2tketmnTUWfTsc0LWFtvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79684530"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="79684530"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 04:45:01 -0700
X-CSE-ConnectionGUID: OCZd51ZqQBaRfX6/fik4wA==
X-CSE-MsgGUID: iecx4haIR620vBtbG+RVKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="230707862"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.152])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 04:44:59 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Mohammed Thasleem
 <mohammed.thasleem@intel.com>, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH i-g-t 3/6] lib/igt_kms: Fix max_non_joiner_mode_found
In-Reply-To: <20260401115542.1074290-4-kunal1.joshi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260401115542.1074290-1-kunal1.joshi@intel.com>
 <20260401115542.1074290-4-kunal1.joshi@intel.com>
Date: Wed, 01 Apr 2026 14:44:55 +0300
Message-ID: <be0e25ff0c1c0af619c3e774dba96d137fb6b200@intel.com>
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

On Wed, 01 Apr 2026, Kunal Joshi <kunal1.joshi@intel.com> wrote:
> Previously the function, instead of giving the highest possible mode the
> connector could support, started the check by looking if the mode was
> equal to max_pipe_hdisplay. There may be corner cases where a connector never supports the highest mode our source can
> drive (e.g. a 4K mode on a 5K-capable platform).
>
> Fix this by iterating all modes and tracking the best one (highest
> hdisplay, then highest clock as a tiebreaker) that does not require a
> big joiner, as determined by igt_bigjoiner_possible(). This correctly
> handles connectors with any max resolution.

I'm not requesting changes right now, but I keep wondering about having
the joiner code in igt_kms.[ch] at all. It's an Intel implementation
detail. Why is so much of that in the generic file instead of hidden in
some Intel specific file or directory?

BR,
Jani.


>
> v2: Reword commit message (Suraj)
>
> Fixes: 3830ca6a5068 ("lib/igt_kms: Add support to check joiner mode limit")
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  lib/igt_kms.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 04b1f3972..dbd419a9b 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6979,21 +6979,26 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   * false otherwise.
>   */
>  bool max_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
> -			   int max_dotclock, drmModeModeInfo *mode)
> +			       int max_dotclock, drmModeModeInfo *mode)
>  {
> -	int max_hdisplay = get_max_pipe_hdisplay(drm_fd);
> +	bool found = false;
>  
>  	for (int i = 0; i < connector->count_modes; i++) {
>  		drmModeModeInfo *current_mode = &connector->modes[i];
>  
> -		if (current_mode->hdisplay == max_hdisplay &&
> -		    current_mode->clock < max_dotclock) {
> +		if (igt_bigjoiner_possible(drm_fd, current_mode, max_dotclock))
> +			continue;
> +
> +		if (!found ||
> +		    current_mode->hdisplay > mode->hdisplay ||
> +		    (current_mode->hdisplay == mode->hdisplay &&
> +		     current_mode->clock > mode->clock)) {
>  			*mode = *current_mode;
> -			return true;
> +			found = true;
>  		}
>  	}
>  
> -	return false;
> +	return found;
>  }
>  
>  /* TODO: Move these lib functions to the joiner-specific library file

-- 
Jani Nikula, Intel
