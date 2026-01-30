Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0D4E6BF1F
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 15:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8759410E375;
	Fri, 30 Jan 2026 15:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="drvqNdzO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9D210EA1A
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 15:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769787368; x=1801323368;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=67A+EYnnO5tsyOQcrwx18oPhBQVKflN8LpCmQ1T68Z8=;
 b=drvqNdzOYLRbNTpfY1tjk1x9+KQSz5Z12iLQbSyWJ74/dPTxkwl0l3Cl
 oVAtsr9nuldMTvQtmzfCe6Y4A0NAnQ/wlCpPydzdXh9ECBGHahIYrwJRA
 I0uLQ6jDFMl3461tP+/QBpFwWI45OZVAo6I9+6HL1mR3VyHARhwdNGx0w
 pG+USydzMcMeIwKTu15n4ludxRU/EppmubJfBPNzBRGDy0+HsBD8oPNp/
 jGKnqslZntWHI50BuZKChqn+h9Dp2M09dItM7Crn1zavFT6PIpYvf6xri
 Yes/PZZn1o3bvEC0Xlk4+7qd3z/5rYSYbvOE+5+6AfjO0npcQjSFVDvQo A==;
X-CSE-ConnectionGUID: 9pzeKYaYSZuBczKaO8+nGA==
X-CSE-MsgGUID: S7Q/TNTQSH+DO9PbqmmIZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="73640926"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="73640926"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 07:36:08 -0800
X-CSE-ConnectionGUID: /BCQQeb4SeqOApx8yr7c3Q==
X-CSE-MsgGUID: XupREpxAQ3aAJbD9TfAF4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="208119265"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.42])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 07:36:07 -0800
Date: Fri, 30 Jan 2026 17:36:03 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 01/15] lib/kms: Introduce for_each_crtc*()
Message-ID: <aXzP4wDaz9hCkKKi@intel.com>
References: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
 <20260130105237.14481-2-ville.syrjala@linux.intel.com>
 <8ce09d54c3f0208797f5b256e8aa27d29c6f4fbf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ce09d54c3f0208797f5b256e8aa27d29c6f4fbf@intel.com>
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

On Fri, Jan 30, 2026 at 03:38:03PM +0200, Jani Nikula wrote:
> On Fri, 30 Jan 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Add for_each_crtc*() as the crtc based replacement for
> > the for_each_pipe*() iterators (which will eventually get
> > nuked).
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  lib/igt_kms.h | 68 +++++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 68 insertions(+)
> >
> > diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> > index 432c67d11780..a4857ea0e574 100644
> > --- a/lib/igt_kms.h
> > +++ b/lib/igt_kms.h
> > @@ -682,6 +682,19 @@ static inline bool igt_pipe_connector_valid(enum pipe pipe, igt_output_t *output
> >  		output->config.valid_crtc_idx_mask & (1 << (pipe));
> >  }
> >  
> > +/**
> > + * igt_crtc_connector_valid:
> > + * @crtc: CRTC to check.
> > + * @output: #igt_output_t to check.
> > + *
> > + * Checks whether the given CRTC and output can be used together.
> > + */
> > +static inline bool igt_crtc_connector_valid(igt_crtc_t *crtc, igt_output_t *output)
> > +{
> > +	return igt_output_is_connected(output) &&
> > +		output->config.valid_crtc_idx_mask & (1 << crtc->pipe);
> 
> So should this use crtc->crtc_offset instead of crtc->pipe? Or will that
> bring complications during the conversions that try to remain
> functionally unchanged?

I wasn't thinking too had at this point. Just trying to mostly preserve
the behaviour until we can get to the point where we only have to
modify igt_kms.[ch] to change things.

> 
> (And should crtc->crtc_offset really be named crtc_index?)

Yeah, I think so. But not worrying about it right now.

> 
> > +}
> > +
> >  #define for_each_if(condition) if (!(condition)) {} else
> >  
> >  /**
> > @@ -744,6 +757,23 @@ static inline bool igt_pipe_connector_valid(enum pipe pipe, igt_output_t *output
> >  	for_each_pipe_static(pipe) \
> >  		for_each_if(igt_crtc_for_pipe((display), (pipe))->valid)
> >  
> > +/**
> > + * for_each_crtc:
> > + * @display: a pointer to an #igt_display_t structure
> > + * @crtc: The CRTC
> > + *
> > + * This for loop iterates over all CRTCs.
> > + *
> > + * Note that this cannot be used to enumerate per-CRTC subtest names since it
> > + * depends upon runtime probing of the actual kms driver that is being tested.
> > + * Use #for_each_pipe_static instead.
> > + */
> > +#define for_each_crtc(display, crtc) \
> > +	for ((crtc) = &(display)->crtcs[0]; \
> > +	     (crtc) < &(display)->crtcs[(display)->n_crtcs]; \
> > +	     (crtc)++) \
> > +		for_each_if ((crtc)->valid)
> 
> I feel like for_each_crtc() should iterate the CRTCs in CRTC order, not
> pipe order. What's the plan? Are we eventually going to have ->crtcs[]
> in CRTC order?

I don't even know what it means to have them in pipe order. It should be
one and the same right now because the kernel anyway has them in the
same order. I guess it just means we could theoeretically have holes
in the array with crtc->valid==false for fused off pipes?

But yeah, if/when we start to reorder the pipes, I think we should keep
this stuff in CRTC order, and get rid of the holes.

> And then do something special when some tests want to use
> pipe order?

Something like that. Or make sure the tests don't have some
silly assumptions where the order matters.

> The other day I was looking at making ->n_crtcs and thus
> igt_display_n_crtcs() reflect the actual CRTC count, not IGT_MAX_PIPES,
> and it's also complicated because too many places depend on
> igt_display_n_crtcs() indicating the size of ->crtcs[] and that being
> indexed by pipe instead of CRTC index. So that's also dependent on
> indexing ->crtcs[] with CRTC index.

Yeah, it all needs to get fixed properly to get rid of the pipe
indexing/holes. And then we can nuke that silly crtc->valid thing
as well. Though I admit I didn't really look to closely at what
it all entails.

> Anyway, the loops here make my head spin, but it's all

Yeah, they ugly. for_each_crtc_with_single_output() in particular since
it still shares __igt_pipe_populate_outputs() with the pipe based thing
but I didn't want to start rewriting that stuff until the old iterator
is gone.

> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> I'd just like to hear what the plan is wrt the above questions, perhaps
> recorded in the commit message.

I suppose I don't really have a real solid plane yet, other than
to try to limit the damage to lib/igt_kms.[ch] when we need to
do those changes.

> 
> BR,
> Jani.
> 
> 
> > +
> >  /**
> >   * for_each_pipe_with_valid_output:
> >   * @display: a pointer to an #igt_display_t structure
> > @@ -765,6 +795,27 @@ static inline bool igt_pipe_connector_valid(enum pipe pipe, igt_output_t *output
> >  			for_each_if ((((output) = &(display)->outputs[con__]), \
> >  						igt_pipe_connector_valid((pipe), (output))))
> >  
> > +/**
> > + * for_each_crtc_with_valid_output:
> > + * @display: a pointer to an #igt_display_t structure
> > + * @crtc: CRTC for which this @crtc / @output combination is valid.
> > + * @output: The output for which this @crtc / @output combination is valid.
> > + *
> > + * This for loop is called over all connected outputs. This function
> > + * will try every combination of @crtc and @output.
> > + *
> > + * If you only need to test a single output for each pipe, use
> > + * for_each_crtc_with_single_output(), if you only need an
> > + * output for a single CRTC, use igt_get_single_output_for_pipe().
> > + */
> > +#define for_each_crtc_with_valid_output(display, crtc, output) \
> > +	for ((output) = &(display)->outputs[0], (crtc) = &(display)->crtcs[0]; \
> > +	     assert(igt_can_fail()), (crtc) < &(display)->crtcs[(display)->n_crtcs] && \
> > +		     (output) < &(display)->outputs[(display)->n_outputs]; \
> > +	     (output) = (output) + 1 < &(display)->outputs[(display)->n_outputs] ? \
> > +		     (output) + 1 : ((crtc)++, &(display)->outputs[0])) \
> > +		for_each_if ((crtc)->valid && igt_crtc_connector_valid((crtc), (output)))
> > +
> >  igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display,
> >  					   igt_output_t **chosen_outputs);
> >  
> > @@ -785,6 +836,23 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display,
> >  		for_each_if (*__output && \
> >  			     ((pipe) = (__output - __outputs), (output) = *__output, 1))
> >  
> > +/**
> > + * for_each_crtc_with_single_output:
> > + * @display: a pointer to an #igt_display_t structure
> > + * @crtc: The CRTC for which this @crtc / @output combination is valid.
> > + * @output: The output for which this @crtc / @output combination is valid.
> > + *
> > + * This loop is called over all CRTCs, and will try to find a compatible output
> > + * for each CRTC. Unlike for_each_pipe_with_valid_output(), this function will
> > + * be called at most once for each pipe.
> > + */
> > +#define for_each_crtc_with_single_output(display, crtc, output) \
> > +	for (igt_output_t *__outputs[igt_display_n_crtcs(display)], \
> > +	     **__output = __igt_pipe_populate_outputs((display), __outputs); \
> > +		 __output < &__outputs[igt_display_n_crtcs(display)]; __output++) \
> > +		for_each_if (*__output && \
> > +			     ((crtc) = igt_crtc_for_pipe((display), (__output - __outputs)), (output) = *__output, 1))
> > +
> >  /**
> >   * for_each_valid_output_on_pipe:
> >   * @display: a pointer to an #igt_display_t structure
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
