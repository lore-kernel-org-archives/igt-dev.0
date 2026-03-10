Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4ACF3C27D
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 10:08:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1D010E226;
	Tue, 10 Mar 2026 10:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gdQtqjKg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1B410E226
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 10:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773137294; x=1804673294;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QRdVn/g7J6CnZzoapyb5Q1Ny1TnPZUEqidAfLzZnYZg=;
 b=gdQtqjKgZCgcnjtN05rbHw3DxfyqhX7aGWa3nZ06snEIXHjlo+uwBSgg
 LUNH7iSG0eHH6T6IZrP1pA55MkTAwddvZ3xshUnkN0LoDnskog025Z21n
 UqQQg8BCY/gbtRPeXXsf8foWJIBu4HwnRVxczAqovnUg/+NuyNeTj+qmf
 82qAzUTrU+k2V0Ad/T0DNxCH8lNhnry9RJmfdmKfKo5E3SpcM9QlG5W+R
 EM7mpceeWBCD90VL4oMr3Uf/isZgHrSEHoAzIJdWsbaAuHurZk4v4v0lO
 +CZFDwxmWEVIpQIHASXtpc3zGlhwPnq3AaOWwGeM1s772W/soBTSnd0U9 g==;
X-CSE-ConnectionGUID: BX93rl8gTUOg/gJXkToLOQ==
X-CSE-MsgGUID: 9tXDY/8DQRungIeqOCVn0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="85535483"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="85535483"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:08:14 -0700
X-CSE-ConnectionGUID: uMFrBU75RcSVLeG5CC+ZPg==
X-CSE-MsgGUID: UlRVgrUNRjGXMjDR7GgPGQ==
X-ExtLoop1: 1
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.33])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:08:13 -0700
Date: Tue, 10 Mar 2026 12:08:10 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 10/10] tests/kms_debugfs: use CRTC indexes instead
 of pipes for fb tracking
Message-ID: <aa_tim2mbtdMxVjE@intel.com>
References: <cover.1773066012.git.jani.nikula@intel.com>
 <7b0649218f36ca55c278af343de3170ae039e11d.1773066012.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b0649218f36ca55c278af343de3170ae039e11d.1773066012.git.jani.nikula@intel.com>
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

On Mon, Mar 09, 2026 at 04:21:44PM +0200, Jani Nikula wrote:
> Store fbs in an array indexed by CRTC indexes rather than pipes, as
> pipes are irrelevant for the test.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  tests/kms_debugfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_debugfs.c b/tests/kms_debugfs.c
> index 2b0e9e6b1720..f398b54594a2 100644
> --- a/tests/kms_debugfs.c
> +++ b/tests/kms_debugfs.c
> @@ -58,12 +58,12 @@ static void igt_display_all_on(igt_display_t *display)
>  					      mode->hdisplay, mode->vdisplay,
>  					      DRM_FORMAT_XRGB8888,
>  					      DRM_FORMAT_MOD_LINEAR,
> -					      &fb[crtc->pipe]);
> +					      &fb[crtc->crtc_index]);
>  
>  			/* Set a valid fb as some debugfs like to
>  			 * inspect it on a active pipe
>  			 */
> -			igt_plane_set_fb(primary, &fb[crtc->pipe]);
> +			igt_plane_set_fb(primary, &fb[crtc->crtc_index]);

fb[] isn't even used after this. So we could just nuke the array
and have a singular 'fb' inside the loop. That's assuming we're
happy with the current "let's not bother with cleanup" approach.

>  			break;
>  		}
>  	}
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
