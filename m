Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48F6CFD2E0
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 08:42:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AEFA10EA87;
	Fri, 11 Oct 2024 08:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T3lPjBYY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21CCC10EA86
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 08:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728636174; x=1760172174;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+40UoUZXFcs7IjtEgeL4EGNvqmONJHEPgpYsnN5y0YQ=;
 b=T3lPjBYYqNWECi/4CyNwk+/micgXDdY+9fVStL4/UWISQJayvNj6PeSD
 vxL0sHDUZ5AVpUEXwfEJ41brqMUVzwQQ2Jydi34hzYhlW6/Sdh+j1gOtD
 pLbjUFSk4TElU19CVRk2AaZwLcH6qGBiGWECWtemsdsq1+rMg2oZ6rP6D
 Oc1Sqc2BNxQub1pnDNo33LdP4wqnBEov3NGjGmz3lVjOLrO3RGl9IIhRW
 lrOPgi+D095XvvTbXfo9s8VbZOx5CyhqpCwfxz/rP74qyRv68QRy6EcAv
 IiLIjHfru2+211M3ZUqti65e2xaR+FGQZMCPpcliUrXQCoaZQdZsf0qAm Q==;
X-CSE-ConnectionGUID: +1jcs+OHTauEKMOLxHDL1w==
X-CSE-MsgGUID: 6EF9o76IRW+nbPJnBW/ocA==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="31728779"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="31728779"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 01:42:53 -0700
X-CSE-ConnectionGUID: 8eujQYVqSASLafr95jhl3A==
X-CSE-MsgGUID: 41uoY//XQoWsfIJj9MBagA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="114307644"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 01:42:52 -0700
Date: Fri, 11 Oct 2024 10:42:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/4] lib/intel: Unify MI_STORE_DWORD secure batch
 checks
Message-ID: <20241011084248.ksjxi5cylnzpdfj3@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20241002104515.32164-1-ville.syrjala@linux.intel.com>
 <20241002104515.32164-2-ville.syrjala@linux.intel.com>
 <20241002144348.zuo7qs4k6zrn7zfc@kamilkon-DESK.igk.intel.com>
 <ZwWj0o2YCsKIqKcA@intel.com> <Zwgh07L_aov1MYbh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zwgh07L_aov1MYbh@intel.com>
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

Hi Ville,
On 2024-10-10 at 21:49:55 +0300, Ville Syrjälä wrote:
> On Wed, Oct 09, 2024 at 12:27:46AM +0300, Ville Syrjälä wrote:
> > On Wed, Oct 02, 2024 at 04:43:48PM +0200, Kamil Konieczny wrote:
> > > Hi Ville,
> > > On 2024-10-02 at 13:45:13 +0300, Ville Syrjala wrote:
> > > > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > 
> > > > A bunch of tests use a 'gen<6' check to determine if
> > > > MI_STORE_DWORD needs a secure batch or not. Other places
> > > > have a more correct check written in different styles.
> > > > Unify all of it to use a common helper.
> > > > 
> > > > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > ---
> > > >  lib/igt_dummyload.c             |  2 +-
> > > >  lib/igt_gt.c                    | 20 ++++++++++++++++++++
> > > >  lib/igt_gt.h                    |  1 +
> > > >  lib/igt_store.c                 |  2 +-
> > > >  tests/intel/gem_ctx_shared.c    |  4 ++--
> > > >  tests/intel/gem_exec_async.c    |  2 +-
> > > >  tests/intel/gem_exec_capture.c  |  9 +++------
> > > >  tests/intel/gem_exec_fence.c    |  4 ++--
> > > >  tests/intel/gem_exec_flush.c    |  4 ++--
> > > >  tests/intel/gem_exec_gttfill.c  |  2 +-
> > > >  tests/intel/gem_exec_nop.c      |  4 ++--
> > > >  tests/intel/gem_exec_parallel.c |  2 +-
> > > >  tests/intel/gem_exec_params.c   |  2 +-
> > > >  tests/intel/gem_exec_reloc.c    |  8 +++++---
> > > >  tests/intel/gem_exec_schedule.c |  4 ++--
> > > >  tests/intel/gem_exec_store.c    | 16 ++++++----------
> > > >  tests/intel/gem_exec_suspend.c  |  2 +-
> > > >  tests/intel/gem_exec_whisper.c  |  2 +-
> > > >  tests/intel/gem_ringfill.c      |  2 +-
> > > >  tests/intel/gem_softpin.c       |  4 ++--
> > > >  tests/intel/gem_sync.c          |  8 ++++----
> > > >  tests/intel/gem_userptr_blits.c |  4 ++--
> > > >  tests/intel/i915_module_load.c  |  2 +-
> > > >  tests/prime_vgem.c              |  2 +-
> > > >  24 files changed, 64 insertions(+), 48 deletions(-)
> > > > 
> > > > diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
> > > > index a9a2de077698..3cf80b762921 100644
> > > > --- a/lib/igt_dummyload.c
> > > > +++ b/lib/igt_dummyload.c
> > > > @@ -217,7 +217,7 @@ emit_recursive_batch(igt_spin_t *spin,
> > > >  	} else if (opts->flags & IGT_SPIN_POLL_RUN) {
> > > >  		igt_assert(!opts->dependency);
> > > >  
> > > > -		if (gen == 4 || gen == 5) {
> > > > +		if (gem_store_dword_needs_secure(fd)) {
> > > >  			execbuf->flags |= I915_EXEC_SECURE;
> > > >  			igt_require(__igt_device_set_master(fd) == 0);
> > > >  		}
> > > > diff --git a/lib/igt_gt.c b/lib/igt_gt.c
> > > > index 331783e49acf..a1075e8bbed1 100644
> > > > --- a/lib/igt_gt.c
> > > > +++ b/lib/igt_gt.c
> > > > @@ -691,6 +691,26 @@ bool gem_can_store_dword(int fd, unsigned int engine)
> > > >  				gem_execbuf_flags_to_engine_class(engine));
> > > >  }
> > > >  
> > > > +/**
> > > > + * gem_store_dword_needs_secure:
> > > > + * @fd: open i915 drm file descriptor
> > > > + *
> > > > + * Does the MI_STORE_DWORD need to be executed from a secure batch?
> > > 
> > > Imho better write a statement, not a question, so:
> > > 
> > > * True if the MI_STORE_DWORD needs to be executed from a secure batch
> > > 
> > > > + */
> > > > +bool gem_store_dword_needs_secure(int fd)
> > > > +{
> > > > +	const struct intel_device_info *info =
> > > > +		intel_get_device_info(intel_get_drm_devid(fd));
> > > > +
> > > > +	switch (info->graphics_ver) {
> > > > +	case 4:
> > > > +	case 5:
> > > > +		return true;
> > > > +	default:
> > > > +		return false;
> > > > +	}
> > > > +}
> > > > +
> > > >  const struct intel_execution_engine2 intel_execution_engines2[] = {
> > > >  	{ "rcs0", I915_ENGINE_CLASS_RENDER, 0, I915_EXEC_RENDER },
> > > >  	{ "bcs0", I915_ENGINE_CLASS_COPY, 0, I915_EXEC_BLT },
> > > > diff --git a/lib/igt_gt.h b/lib/igt_gt.h
> > > > index 4a67cd9f038e..d3213123d6ac 100644
> > > > --- a/lib/igt_gt.h
> > > > +++ b/lib/igt_gt.h
> > > > @@ -76,6 +76,7 @@ unsigned intel_detect_and_clear_missed_interrupts(int fd);
> > > >  
> > > >  bool gem_can_store_dword(int fd, unsigned int engine);
> > > >  bool gem_class_can_store_dword(int fd, int class);
> > > > +bool gem_store_dword_needs_secure(int fd);
> > > >  
> > > >  extern const struct intel_execution_engine2 {
> > > >  	char name[16];
> > > > diff --git a/lib/igt_store.c b/lib/igt_store.c
> > > > index 538405e7f594..42ffdc5cdbe4 100644
> > > > --- a/lib/igt_store.c
> > > > +++ b/lib/igt_store.c
> > > > @@ -48,7 +48,7 @@ void igt_store_word(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
> > > >  		execbuf.flags |= I915_EXEC_FENCE_IN;
> > > >  		execbuf.rsvd2 = fence;
> > > >  	}
> > > > -	if (gen < 6)
> > > > +	if (gem_store_dword_needs_secure(fd))
> > > >  		execbuf.flags |= I915_EXEC_SECURE;
> > > 
> > > What about just one function returning this flag or zero?
> > > So it would be used like:
> > > 
> > > 	execbuf.flags |= gem_store_dword_secure_batch(fd);
> > > 
> > > Even less code.
> > 
> > I suppose that'd work. Thought the name would probably need 
> > more work. gem_store_dword_exec_secure() or maybe even
> > gem_store_dword_execbuf_flags()...
> 
> Actually it might be a bit more awkward for the cases where we
> do other stuff based on the result. So I think we should just go
> with the straightforward conversion for now, and maybe think more
> about further simplifications afterwards.

I agree, this is not a blocker, with a fix in description

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>


> 
> -- 
> Ville Syrjälä
> Intel
