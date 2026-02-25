Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA868F357D5
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 07:44:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C3210E6C4;
	Wed, 25 Feb 2026 07:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iWEd609i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF20E10E6C9
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 07:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772005496; x=1803541496;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=KbhmijgJhXKoJ2CIhNZ6Q+SpImZMpkedz8iXe95DR2c=;
 b=iWEd609it6/AnpDX7ReTEHA9+GkU+1BTIY7XINohCIgQyv+x9QXLua/e
 AAhlRZoshyWz7Sf37m3K4lHaCiWzhHfm5dXIj1w93cKre182lHFT+CDeD
 IyzKnZ/SlGjCoCLV4Ma14uqKncQNWO3LzsJKfSbTTvb+Q0Egzu2XOsPvU
 xEBmB+7f3LaacYhV1UzcUXuy5e8wZbnkpFvcDREGGgi3duqB8UCPmmV/M
 FSXc1V08NJ7ks+SS3Cd4pOvBkrQdxOpkZO0+jn1pjouL3CGTEUHbbcuuK
 mX4JcKdT9402oEOQFcoG90+MneuyhsGLJGGdTNThChHUSJK85Wsn2sete Q==;
X-CSE-ConnectionGUID: 7W6QJwPTRyCml5v9+I5jSA==
X-CSE-MsgGUID: iMrv++6eT02bcTdfwYYKUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72073899"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="72073899"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 23:44:56 -0800
X-CSE-ConnectionGUID: h+iPTQ0CSOeqK7+uaVC8UQ==
X-CSE-MsgGUID: s56GNXXoTheOm9aSjjcNjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="220751811"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.16])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 23:44:55 -0800
Date: Wed, 25 Feb 2026 09:44:53 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 15/23] tests/kms_plane_multiple: Use igt_crtc_t
 instead of enum pipe
Message-ID: <aZ6odcnNT9cCmna2@intel.com>
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
 <20260221032003.30936-16-ville.syrjala@linux.intel.com>
 <76b6d4764d2864f5de61d91412b46ec0343cc13b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76b6d4764d2864f5de61d91412b46ec0343cc13b@intel.com>
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

On Tue, Feb 24, 2026 at 03:48:13PM +0200, Jani Nikula wrote:
> On Sat, 21 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Convert kms_plane_multiple from 'enum pipe' to 'igt_crtc_t'.
> >
> > The use of multiple crtcs in some places causes some extra
> > complications here.
> >
> >  #include "scripts/iterators.cocci"
> 
> ...
> 
> > @@ -554,8 +567,9 @@ static void run_2_display_test(data_t *data, uint64_t modifier, const char *name
> >  						       igt_crtc_name(crtc2),
> >  						       output2->name)
> >  						test_plane_position_2_display(data,
> > -									      crtc->pipe,
> > -									      crtc2->pipe,
> > +									      crtc
> > +									      ,
> 
> I wonder what happened here with the newlines. Can be fixed while
> applying.

Cocci just going mad as usual. It's really inconsistent with newlines.
After who knows how many spatch reruns I got fed up cleaning up after
it.

> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> 
> > +									      crtc2,
> >  									      output1, output2,
> >  									      modifier);
> >  
> > @@ -584,7 +598,9 @@ static void run_test(data_t *data, uint64_t modifier, const char *name)
> >  			continue;
> >  
> >  		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), output->name)
> > -			test_plane_position(data, crtc->pipe, output,
> > +			test_plane_position(data,
> > +					    crtc,
> > +					    output,
> >  					    modifier);
> >  	}
> >  }
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
