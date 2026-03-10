Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7319FF3C27D
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 10:05:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212A610E6B4;
	Tue, 10 Mar 2026 10:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BX0PkeTy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBAB10E6B0
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 10:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773137152; x=1804673152;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=UmmU/acRgzmobQ0dNEwhMHnL2Iw1Ycvaf6bML2pNAVM=;
 b=BX0PkeTynNcNl35qyTg9CQv4eSJLiAga6jBAQKhlsqYGc38fgPSCnLp4
 Gqq4FxXDemkYKEGHR6RfQoehdtITXHKez1XUfPDh2oJy6p33co4C0DTlh
 HItQBQrXOc1pvEYBQa5YmDATN5k1i+mk6OhD4qyYp1Mf/nLIoPNu3eQdm
 khRap9O849z1Z4I8zqB+mKL1Ef8GxstYV/ES4Nbi6zxVYIWbM/RqqQJ3k
 PMm1AQxMX84YjSqvf1tH8gFWqmoKOHTniH8S5x3apCvD7QtWwPDMIewzE
 I+AXxwloJT5V7/yUgQxIlGMpxjpXCQ/dYk9oxhXd1oBQPFbGImLJvmF/1 A==;
X-CSE-ConnectionGUID: n9gYzGrYQUK8TumRnEEvcw==
X-CSE-MsgGUID: 6Yqrtp/ISza1wiJfKNQ6nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="78031281"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="78031281"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:05:52 -0700
X-CSE-ConnectionGUID: vdFjOaQFRcmK+ht/Jlf8Uw==
X-CSE-MsgGUID: /Wz8hkqYSF2iGjLUEFnjrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="220099865"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.33])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:05:49 -0700
Date: Tue, 10 Mar 2026 12:05:46 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 04/10] tests/kms_cursor_crc: use CRTC indexes
 instead of pipes for CRTC tracking
Message-ID: <aa_s-h2k_J0GpCuh@intel.com>
References: <cover.1773066012.git.jani.nikula@intel.com>
 <788880adc41b3640311190a8dbf794c6226d25e2.1773066012.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <788880adc41b3640311190a8dbf794c6226d25e2.1773066012.git.jani.nikula@intel.com>
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

On Mon, Mar 09, 2026 at 04:21:38PM +0200, Jani Nikula wrote:
> The test tracks "active" CRTCs in a dedicated array. This does not
> depend on pipes in any way. Switch to using CRTC indexes instead.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  tests/kms_cursor_crc.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index bd0226c4800f..1e062c38b668 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -165,8 +165,8 @@ typedef struct {
>  } data_t;
>  
>  static bool extended;
> -static enum pipe active_pipes[IGT_MAX_PIPES];
> -static uint32_t last_pipe;
> +static int active_crtcs[IGT_MAX_PIPES];
> +static uint32_t last_crtc_index;
>  
>  #define TEST_DPMS (1<<0)
>  #define TEST_SUSPEND (1<<1)
> @@ -900,12 +900,12 @@ static bool valid_pipe_output_combo(data_t *data)
>  static bool execution_constraint(igt_crtc_t *crtc)
>  {
>  	if (!extended &&
> -	    crtc->pipe != active_pipes[0] &&
> -	    crtc->pipe != active_pipes[last_pipe])
> +	    crtc->crtc_index != active_crtcs[0] &&
> +	    crtc->crtc_index != active_crtcs[last_crtc_index])
>  		return true;
>  
>  	if (!extended && igt_run_in_simulation() &&
> -	    crtc->pipe != active_pipes[0])
> +	    crtc->crtc_index != active_crtcs[0])
>  		return true;
>  
>  	return false;
> @@ -1278,7 +1278,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  	igt_fixture() {
>  		igt_crtc_t *crtc;
>  
> -		last_pipe = 0;
> +		last_crtc_index = 0;
>  
>  		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>  
> @@ -1286,8 +1286,8 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  		igt_display_require_output(&data.display);
>  		/* Get active pipes. */
>  		for_each_crtc(&data.display, crtc)
> -			active_pipes[last_pipe++] = crtc->pipe;
> -		last_pipe--;
> +			active_crtcs[last_crtc_index++] = crtc->crtc_index;
> +		last_crtc_index--;

It looks like when we get rid of the n_crtcs==MAX_PIPES mess
all of these array things could just be nuked. But I suppose
we're not quite there yet.

>  
>  		ret = drmGetCap(data.drm_fd, DRM_CAP_CURSOR_WIDTH, &cursor_width);
>  		igt_assert(ret == 0 || errno == EINVAL);
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
