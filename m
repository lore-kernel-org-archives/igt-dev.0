Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C1DE7DEEE
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 15:31:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFD810E2C0;
	Mon,  2 Feb 2026 15:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fqpiyEdn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD5110E2C0
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 15:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770046296; x=1801582296;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5/kRES9KOs+FYV5McVs/oh5XwA4qC3L3IjnljWwLRHk=;
 b=fqpiyEdnw8YX6Z6j49XYGfbFk8HKNMMTgnItVkGCsYH4Z5VHH1p0uN+4
 qv9OaxzS6jF1JZVDCYukuozxN7Eu0qNmBZXBwED222r7DCtbQ9ea1hfHC
 Z/rQd5ouy4j91op1JT4ONtp1ChX+HH+fAXyx7JRTEvyuh6ie3mYwfDzuy
 XAuZjoakRhh6Tcf/Okp77ErtLQjnCcDQtWX+TthmL+OKyPsYhrPJEZQPY
 vDbIxkiHgq/SDGcfvk3o03oXz+2k/aOfMLMB4sF1qavhs0xvjibhgaHlE
 sbC6EW+oyEjmj7CtGjoxssHyClvhszFqL35uP98LPJjWyRXXkRIzDqWE+ w==;
X-CSE-ConnectionGUID: ajyAfzGkQWOVJK0KI/l0yA==
X-CSE-MsgGUID: H/nyYEe3THid2Jc0RiILkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82631165"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="82631165"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 07:31:36 -0800
X-CSE-ConnectionGUID: MO3SDFxHS1uPyCqzDP0ENQ==
X-CSE-MsgGUID: FLaA5YdESxmPy/H4QEuz8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="232470208"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.247])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 07:31:34 -0800
Date: Mon, 2 Feb 2026 17:31:32 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 01/15] lib/kms: Introduce for_each_crtc*()
Message-ID: <aYDDVPwt1zZd7478@intel.com>
References: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
 <20260130105237.14481-2-ville.syrjala@linux.intel.com>
 <8ce09d54c3f0208797f5b256e8aa27d29c6f4fbf@intel.com>
 <aXzP4wDaz9hCkKKi@intel.com>
 <70db2072688f084cff3321a97b02ac561a1eeb0e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70db2072688f084cff3321a97b02ac561a1eeb0e@intel.com>
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

On Mon, Feb 02, 2026 at 01:10:35PM +0200, Jani Nikula wrote:
> On Fri, 30 Jan 2026, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Fri, Jan 30, 2026 at 03:38:03PM +0200, Jani Nikula wrote:
> >> On Fri, 30 Jan 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> >> > +/**
> >> > + * for_each_crtc:
> >> > + * @display: a pointer to an #igt_display_t structure
> >> > + * @crtc: The CRTC
> >> > + *
> >> > + * This for loop iterates over all CRTCs.
> >> > + *
> >> > + * Note that this cannot be used to enumerate per-CRTC subtest names since it
> >> > + * depends upon runtime probing of the actual kms driver that is being tested.
> >> > + * Use #for_each_pipe_static instead.
> >> > + */
> >> > +#define for_each_crtc(display, crtc) \
> >> > +	for ((crtc) = &(display)->crtcs[0]; \
> >> > +	     (crtc) < &(display)->crtcs[(display)->n_crtcs]; \
> >> > +	     (crtc)++) \
> >> > +		for_each_if ((crtc)->valid)
> >> 
> >> I feel like for_each_crtc() should iterate the CRTCs in CRTC order, not
> >> pipe order. What's the plan? Are we eventually going to have ->crtcs[]
> >> in CRTC order?
> >
> > I don't even know what it means to have them in pipe order. It should be
> > one and the same right now because the kernel anyway has them in the
> > same order. I guess it just means we could theoeretically have holes
> > in the array with crtc->valid==false for fused off pipes?
> >
> > But yeah, if/when we start to reorder the pipes, I think we should keep
> > this stuff in CRTC order, and get rid of the holes.
> 
> In igt_display_require(), the loop is:
> 
> 	for (i = 0; i < resources->count_crtcs; i++) {
> 		igt_crtc_t *crtc;
> 		int pipe_enum = is_intel_dev ? __intel_get_pipe_from_crtc_index(drm_fd, i) : i;
> 
> 		crtc = igt_crtc_for_pipe(display, pipe_enum);
> 		crtc->pipe = pipe_enum;
> 
> 		crtc->valid = true;
> 		crtc->crtc_id = resources->crtcs[i];
> 		/* offset of a pipe in crtcs list */
> 		crtc->crtc_offset = i;
> 	}
> 
> And igt_crtc_for_pipe() returns &display->crtcs[pipe] i.e. the
> display->crtcs is currently in pipe order, and it could have holes if
> pipes have been fused off.
> 
> Feels like this is so convoluted all over the place that we'd be better
> off resetting everything back to assuming pipe === crtc index, and
> fixing stuff from ground up. :/

Yeah, pretty much.

I guess once the bigger cocci stuff is done we should do something
like:
- leave most crtc->pipe vs. PIPE_<whatever> checks alone as those
  are probably looking for a specific hardware pipe
- most other crtc->pipe usages should just be converted to
  crtc_index instead

That could perhaps be done with cocci as well.

And then we can start cleaning igt_kms itself:
- make display->crtcs[] keep the kernel crtc order and get rid of
  the holes, and have igt_crtc_for_pipe() just search through the
  array for the right crtc
- change all the pending_pipe/valid_crtc_idx_mask/etc. stuff to use
  igt_crtc_t or crtc_index
- etc.

-- 
Ville Syrjälä
Intel
