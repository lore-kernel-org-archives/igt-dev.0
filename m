Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4A9CEACF3
	for <igt-dev@archiver.kernel.org>; Wed,  2 Oct 2024 19:04:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5ED410E77D;
	Wed,  2 Oct 2024 19:04:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eGvaEsSo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EAC410E77D
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Oct 2024 19:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727895865; x=1759431865;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=ey0eb9JJ7uOBqQ1tPdrJHgOXlEUGw/ZvWCPN9PbldUc=;
 b=eGvaEsSoHzWQAyVq57Vy06xV9FfI5/W1kQXnMk2qG/EgNkYfaJHse7jV
 aUeiSinocFRE6cg89nFZDazHOcBk3QaNFqIqQXiKZ2zLnlim/CzSmcx76
 G16aiMMhiTLNDqQztOu5FQxmnMH+z45lGKTWpmFsB2Ezq/IUQ6YPCIkVw
 UTOI9tpLElb7bw9oLLVrMvTZSnwb6oFeUenzTBns+0R1wu10L0a6Eb2kV
 HgKFom8MFbAzMaWHXFh+CLa7GS04AfYXaWjbgFk9f4q2EYQXkjwsgPLHu
 RB/5Ce4qt4hZx1JnqUy4jdU1pm4j1sgY+fyBkp3CF8UUUeobr4+dLF5Ob A==;
X-CSE-ConnectionGUID: x/M9PG50Ta2f9tBBW/jWjw==
X-CSE-MsgGUID: pCu/x/KVR2WMCGhnFwdQyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="37630450"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="37630450"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 12:04:14 -0700
X-CSE-ConnectionGUID: NjY2cp1SQKmo753fqNmjcw==
X-CSE-MsgGUID: q0Y/iYORQSa0JRAE3jvutA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="74214194"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Oct 2024 12:04:06 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 02 Oct 2024 22:04:05 +0300
Date: Wed, 2 Oct 2024 22:04:05 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/3] tests: Shut gcc up abput _Atomic(uint64_t)
 alignment
Message-ID: <Zv2ZJYdcugROe23f@intel.com>
References: <20240927163307.10159-1-ville.syrjala@linux.intel.com>
 <20240927163307.10159-2-ville.syrjala@linux.intel.com>
 <20241002155041.kdw5gclimpt6nfll@kamilkon-DESK.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241002155041.kdw5gclimpt6nfll@kamilkon-DESK.igk.intel.com>
X-Patchwork-Hint: comment
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

On Wed, Oct 02, 2024 at 05:50:41PM +0200, Kamil Konieczny wrote:
> Hi Ville,
> On 2024-09-27 at 19:33:06 +0300, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> 
> There is a typo in subject, I would also prefer 'Fix' so:
> 
> [PATCH i-g-t 2/3] tests: Fix gcc warnings about _Atomic(uint64_t) alignment
> 
> > x86-32 gcc keeps complaining about some alignment ABI change:
> > "note: the alignment of ‘_Atomic long long unsigned int’ fields changed in GCC 11.1"
> > 
> > State the alignment explicitly to make gcc shut up.
> 
> s/to make gcc shut up/to silence gcc/
> 
> > 
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  tests/dumb_buffer.c           | 2 +-
> >  tests/intel/gem_create.c      | 2 +-
> >  tests/intel/gem_mmap_offset.c | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
> > index e1c18c70b09b..dd237467d3f6 100644
> > --- a/tests/dumb_buffer.c
> > +++ b/tests/dumb_buffer.c
> > @@ -242,7 +242,7 @@ static uint64_t get_npages(_Atomic(uint64_t) *global, uint64_t npages)
> >  }
> >  
> >  struct thread_clear {
> > -	_Atomic(uint64_t) max;
> > +	_Atomic(uint64_t) max __attribute__((aligned(8)));
> 
> >From checkpatch.pl: prefer __aligned(8)

Isn't that a pure kernel thing? Pretty sure it's just a wrapper
around __attribute__.

> 
> With or without this __aligned(8) change (and with above subject
> and description fixed):
> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Ta.

> 
> >  	uint64_t page_size;
> >  	int timeout;
> >  	int fd;
> > diff --git a/tests/intel/gem_create.c b/tests/intel/gem_create.c
> > index ca39a8b64a62..f0749d288dcf 100644
> > --- a/tests/intel/gem_create.c
> > +++ b/tests/intel/gem_create.c
> > @@ -206,7 +206,7 @@ static uint64_t get_npages(_Atomic(uint64_t) *global, uint64_t npages)
> >  }
> >  
> >  struct thread_clear {
> > -	_Atomic(uint64_t) max;
> > +	_Atomic(uint64_t) max __attribute__((aligned(8)));
> >  	struct drm_i915_gem_memory_class_instance region;
> >  	int timeout;
> >  	int i915;
> > diff --git a/tests/intel/gem_mmap_offset.c b/tests/intel/gem_mmap_offset.c
> > index c1a9811ff9d1..3f499abedbbb 100644
> > --- a/tests/intel/gem_mmap_offset.c
> > +++ b/tests/intel/gem_mmap_offset.c
> > @@ -716,7 +716,7 @@ static uint64_t get_npages(_Atomic(uint64_t) *global, uint64_t npages)
> >  }
> >  
> >  struct thread_clear {
> > -	_Atomic(uint64_t) max;
> > +	_Atomic(uint64_t) max __attribute__((aligned(8)));
> >  	struct drm_i915_gem_memory_class_instance region;
> >  	int timeout;
> >  	int i915;
> > -- 
> > 2.45.2
> > 

-- 
Ville Syrjälä
Intel
