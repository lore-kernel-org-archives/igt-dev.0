Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1E1D3C91A
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 14:48:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC98210E262;
	Wed, 10 Dec 2025 14:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XyoMbD5d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A6B10E262
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 14:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765378105; x=1796914105;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+qtZ3+y6t1WHeowrsQYklUyNKZtdFOPFHQAmZ05hi2w=;
 b=XyoMbD5dYo4mdF/6/MQX+C4t+x6GiZyvi1mNaLs5xQz2NkCIw+rcJVTK
 OYDweckdUPOPFc4OLbTKkk3A8Mz282j0CVAhPVFsxJeDiWEVV3LnBk5uN
 g/lR4gTQwlMV5V45Y1E1YPD3PGE8VMd25yD7Q2B3BIb5KFPetO4WtzCXw
 zveUlWR5X/qFsawws3lmQwPf8LI6nfnKdRCJXWKgrFZrqKLRTafr1/ama
 XkvaeAU3QleIkEYQfRlXrTdMrZr9UOuGAzPpD1LlEma1Ya3pFNr2t6g85
 +EG6ecn2wDDb65k28x639FhwdTyE8tCFMdf69YxLM6cpVHan/DghUfQxb Q==;
X-CSE-ConnectionGUID: 47jRhMv2TyC9fkDRUmj7XQ==
X-CSE-MsgGUID: zI+ScSz7Rs6hSRxGuFxgTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67397064"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="67397064"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 06:48:25 -0800
X-CSE-ConnectionGUID: LbGhTMblR1avg//LZHqrWA==
X-CSE-MsgGUID: qZJv0cIXSiunoxo9sX3NAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="196530501"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.21])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 06:48:23 -0800
Date: Wed, 10 Dec 2025 16:48:20 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 08/10] lib/kms: Introduce igt_output_set_crtc()
Message-ID: <aTmINMHnnFEQbwXH@intel.com>
References: <20251210093903.15934-1-ville.syrjala@linux.intel.com>
 <20251210093903.15934-9-ville.syrjala@linux.intel.com>
 <d1e219d0430f467035ee6ff53cdebba072d85695@intel.com>
 <f1e8fe6765549ed9d2c0786292b84d6d542de911@intel.com>
 <f0e5716d96404aa75e67fe200a7c0e9804dd6d39@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f0e5716d96404aa75e67fe200a7c0e9804dd6d39@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Wed, Dec 10, 2025 at 04:38:38PM +0200, Jani Nikula wrote:
> On Wed, 10 Dec 2025, Jani Nikula <jani.nikula@intel.com> wrote:
> > On Wed, 10 Dec 2025, Jani Nikula <jani.nikula@intel.com> wrote:
> >> On Wed, 10 Dec 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> >>> +/**
> >>> + * igt_output_set_pipe:
> >>> + * @output: Target output for which the pipe is being set to
> >>> + * @pipe_obj: Display pipe to set to
> >>> + *
> >>> + * This function sets a @pipe to a specific @output connector by
> >>> + * setting the CRTC_ID property of the @pipe. The pipe
> >>> + * is only activated for all pipes except PIPE_NONE.
> >>> + */
> >>> +void igt_output_set_pipe(igt_output_t *output, enum pipe pipe)
> >>> +{
> >>> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
> >>
> >> How does that work for the igt_output_set_pipe(output, PIPE_NONE) calls?
> >> Seems like the idea was to pass NULL here? Or should igt_crtc_for_pipe()
> >> handle PIPE_NONE and return NULL?
> >
> > Okay, so it's just this one commit that's busted, as the whole function
> > is removed in the next patch.
> 
> I think igt_crtc_for_pipe() should handle PIPE_NONE, as there are a
> bunch of places in the next patch that pass, say, data->pipe_id to it,
> and it's a nightmare to check where all those come from.

Ack. I thought I did that already, but apparently not.

> 
> >
> >>
> >>> +}
> >>> +
> >>>  static
> >>>  bool __override_all_active_output_modes_to_fit_bw(igt_display_t *display,
> >>>  						  igt_output_t *outputs[IGT_MAX_PIPES],
> >>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> >>> index a9d2d9027ae8..9ec0f08ada24 100644
> >>> --- a/lib/igt_kms.h
> >>> +++ b/lib/igt_kms.h
> >>> @@ -589,6 +589,7 @@ drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output);
> >>>  drmModeModeInfo *igt_output_get_lowres_mode(igt_output_t *output);
> >>>  void igt_output_override_mode(igt_output_t *output, const drmModeModeInfo *mode);
> >>>  int igt_output_preferred_vrefresh(igt_output_t *output);
> >>> +void igt_output_set_crtc(igt_output_t *output, igt_pipe_t *pipe_obj);
> >>>  void igt_output_set_pipe(igt_output_t *output, enum pipe pipe);
> >>>  igt_plane_t *igt_output_get_plane(igt_output_t *output, int plane_idx);
> >>>  igt_plane_t *igt_output_get_plane_type(igt_output_t *output, int plane_type);
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
