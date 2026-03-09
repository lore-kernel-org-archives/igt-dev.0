Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0813FF3C26D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 14:25:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDD710E15A;
	Mon,  9 Mar 2026 14:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GJ4IFe6U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB27A10E15A
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 14:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773066307; x=1804602307;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=pujtpZhluLRbJVqhzIOtPXCh2sysTLwX6iv8SmOpON8=;
 b=GJ4IFe6Uts9wUgs5gTmGmBjOzBNOqmy0c+cxPzZMr0WekF86OUx4Tkon
 QRZ2GC8uUq8j3gj94Gg3AM82zDqiVjDsEZ08YqDGfsQgqz3q5ui2uw7PA
 jaQWItFIbIGDleut2xecKPvebP8jJ7DMiEoTBKmoubMBgbiBYhJOufpks
 nE8RhH3djDBqbvPG4hSnQQzVoApr4N0nye6NIfQr9a3v/jSqswB4XTpSn
 8ayxbqQLx+bg+Z89K/5eLd/G5YsbYM6ZE6r9xDOkkxY1pEr0YII6uiqep
 V6ue6fTz3bPIf9vXFrmU2JDWcuzXl7rtxOBD13+qb+P+s7oazanizPKgw Q==;
X-CSE-ConnectionGUID: tGOs5w62R9mGhCqPkvutFw==
X-CSE-MsgGUID: k92Yj9JPRwm0UcMfvu8cag==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73287321"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="73287321"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 07:25:07 -0700
X-CSE-ConnectionGUID: GwPJKJZZSfCkYTr0CoH04w==
X-CSE-MsgGUID: yx6J14VDSjqU9LrrhSx4pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="216279679"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.239])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 07:25:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com
Subject: Re: [PATCH i-g-t 05/10] tests/kms_cursor_edge_walk: use CRTC
 indexes instead of pipes for CRTC tracking
In-Reply-To: <c95cad26d78f52c2102a9bdedeb4062af5257f21.1773066012.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1773066012.git.jani.nikula@intel.com>
 <c95cad26d78f52c2102a9bdedeb4062af5257f21.1773066012.git.jani.nikula@intel.com>
Date: Mon, 09 Mar 2026 16:25:02 +0200
Message-ID: <e93bb7158f8d7bd6b2a2247c82306aeff8e528f7@intel.com>
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

Apparently copy-pasted some tabs here and other commit messages
accidentally.

>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  tests/kms_cursor_edge_walk.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
> index 08c9de601ce3..8036d43d5eef 100644
> --- a/tests/kms_cursor_edge_walk.c
> +++ b/tests/kms_cursor_edge_walk.c
> @@ -87,8 +87,8 @@ enum {
>  };
>  
>  static bool extended;
> -static enum pipe active_pipes[IGT_MAX_PIPES];
> -static uint32_t last_pipe;
> +static int active_crtcs[IGT_MAX_PIPES];
> +static uint32_t last_crtc_index;
>  
>  static void create_cursor_fb(data_t *data, int cur_w, int cur_h)
>  {
> @@ -377,10 +377,10 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
>  		kmstest_set_vt_graphics_mode();
>  
>  		/* Get active pipes. */
> -		last_pipe = 0;
> +		last_crtc_index = 0;
>  		for_each_crtc(&data.display, crtc)
> -			active_pipes[last_pipe++] = crtc->pipe;
> -		last_pipe--;
> +			active_crtcs[last_crtc_index++] = crtc->crtc_index;
> +		last_crtc_index--;
>  	}
>  
>  	for (i = 0; i < ARRAY_SIZE(tests); i++) {
> @@ -397,8 +397,8 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
>  								 crtc,
>  								 data.output) {
>  					data.crtc = crtc;
> -					if (!extended && crtc->pipe != active_pipes[0] &&
> -					    crtc->pipe != active_pipes[last_pipe])
> +					if (!extended && crtc->crtc_index != active_crtcs[0] &&
> +					    crtc->crtc_index != active_crtcs[last_crtc_index])
>  						continue;
>  
>  					igt_display_reset(&data.display);

-- 
Jani Nikula, Intel
