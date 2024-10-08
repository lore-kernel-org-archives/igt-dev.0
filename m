Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01354CF0423
	for <igt-dev@archiver.kernel.org>; Tue,  8 Oct 2024 21:27:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE6A10E5D3;
	Tue,  8 Oct 2024 21:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ECGCW5Ti";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7D810E5D3
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Oct 2024 21:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728422869; x=1759958869;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=1Kf+/oTOh/NFCNQC0W7kN41shNoHdUUtusrlVloE7h8=;
 b=ECGCW5TiquHXrWwfwVHHky9MQ6O0Un0dZRSUaptrnC6ITcsklK1vXawT
 XUw1jJjqU5I29dl6NCfqhT0xtnX/Kl93ut9KKLPVuHMajsLZY0dpKQR2O
 dwe+5STFnSYhpoEtV+vRIALud3ZGFgvWp/+oovfzazTXdfcsvzh6CCvIa
 9Ag6qO7VYZ0WaUjSwO7dKHyMjuvfTUd+ZJkp0HHisd2K6JIvMh+bnZ+c5
 sZkXdnnqZmfHq8Wp6P2VGK+uDGOe3Bz7ANzMieL2CDbVXktOJL/JGxicQ
 Lg6+J3uOTWptTB7ADCW+4/UzmktCFKVoRh+5JNcvDA34nL8qw89CXFeU0 A==;
X-CSE-ConnectionGUID: 4HzIWz/JSXm2JElZK0JsaA==
X-CSE-MsgGUID: Wt60zakhT326GNmcIBNuVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27828920"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="27828920"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 14:27:48 -0700
X-CSE-ConnectionGUID: 8FfgU9LzQ526zTk3WQay2g==
X-CSE-MsgGUID: 4eoIzx/PQz60lqhMgZXggg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="76107019"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 08 Oct 2024 14:27:48 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 09 Oct 2024 00:27:46 +0300
Date: Wed, 9 Oct 2024 00:27:46 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/4] lib/intel: Unify MI_STORE_DWORD secure batch
 checks
Message-ID: <ZwWj0o2YCsKIqKcA@intel.com>
References: <20241002104515.32164-1-ville.syrjala@linux.intel.com>
 <20241002104515.32164-2-ville.syrjala@linux.intel.com>
 <20241002144348.zuo7qs4k6zrn7zfc@kamilkon-DESK.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241002144348.zuo7qs4k6zrn7zfc@kamilkon-DESK.igk.intel.com>
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

On Wed, Oct 02, 2024 at 04:43:48PM +0200, Kamil Konieczny wrote:
> Hi Ville,
> On 2024-10-02 at 13:45:13 +0300, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > A bunch of tests use a 'gen<6' check to determine if
> > MI_STORE_DWORD needs a secure batch or not. Other places
> > have a more correct check written in different styles.
> > Unify all of it to use a common helper.
> > 
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  lib/igt_dummyload.c             |  2 +-
> >  lib/igt_gt.c                    | 20 ++++++++++++++++++++
> >  lib/igt_gt.h                    |  1 +
> >  lib/igt_store.c                 |  2 +-
> >  tests/intel/gem_ctx_shared.c    |  4 ++--
> >  tests/intel/gem_exec_async.c    |  2 +-
> >  tests/intel/gem_exec_capture.c  |  9 +++------
> >  tests/intel/gem_exec_fence.c    |  4 ++--
> >  tests/intel/gem_exec_flush.c    |  4 ++--
> >  tests/intel/gem_exec_gttfill.c  |  2 +-
> >  tests/intel/gem_exec_nop.c      |  4 ++--
> >  tests/intel/gem_exec_parallel.c |  2 +-
> >  tests/intel/gem_exec_params.c   |  2 +-
> >  tests/intel/gem_exec_reloc.c    |  8 +++++---
> >  tests/intel/gem_exec_schedule.c |  4 ++--
> >  tests/intel/gem_exec_store.c    | 16 ++++++----------
> >  tests/intel/gem_exec_suspend.c  |  2 +-
> >  tests/intel/gem_exec_whisper.c  |  2 +-
> >  tests/intel/gem_ringfill.c      |  2 +-
> >  tests/intel/gem_softpin.c       |  4 ++--
> >  tests/intel/gem_sync.c          |  8 ++++----
> >  tests/intel/gem_userptr_blits.c |  4 ++--
> >  tests/intel/i915_module_load.c  |  2 +-
> >  tests/prime_vgem.c              |  2 +-
> >  24 files changed, 64 insertions(+), 48 deletions(-)
> > 
> > diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
> > index a9a2de077698..3cf80b762921 100644
> > --- a/lib/igt_dummyload.c
> > +++ b/lib/igt_dummyload.c
> > @@ -217,7 +217,7 @@ emit_recursive_batch(igt_spin_t *spin,
> >  	} else if (opts->flags & IGT_SPIN_POLL_RUN) {
> >  		igt_assert(!opts->dependency);
> >  
> > -		if (gen == 4 || gen == 5) {
> > +		if (gem_store_dword_needs_secure(fd)) {
> >  			execbuf->flags |= I915_EXEC_SECURE;
> >  			igt_require(__igt_device_set_master(fd) == 0);
> >  		}
> > diff --git a/lib/igt_gt.c b/lib/igt_gt.c
> > index 331783e49acf..a1075e8bbed1 100644
> > --- a/lib/igt_gt.c
> > +++ b/lib/igt_gt.c
> > @@ -691,6 +691,26 @@ bool gem_can_store_dword(int fd, unsigned int engine)
> >  				gem_execbuf_flags_to_engine_class(engine));
> >  }
> >  
> > +/**
> > + * gem_store_dword_needs_secure:
> > + * @fd: open i915 drm file descriptor
> > + *
> > + * Does the MI_STORE_DWORD need to be executed from a secure batch?
> 
> Imho better write a statement, not a question, so:
> 
> * True if the MI_STORE_DWORD needs to be executed from a secure batch
> 
> > + */
> > +bool gem_store_dword_needs_secure(int fd)
> > +{
> > +	const struct intel_device_info *info =
> > +		intel_get_device_info(intel_get_drm_devid(fd));
> > +
> > +	switch (info->graphics_ver) {
> > +	case 4:
> > +	case 5:
> > +		return true;
> > +	default:
> > +		return false;
> > +	}
> > +}
> > +
> >  const struct intel_execution_engine2 intel_execution_engines2[] = {
> >  	{ "rcs0", I915_ENGINE_CLASS_RENDER, 0, I915_EXEC_RENDER },
> >  	{ "bcs0", I915_ENGINE_CLASS_COPY, 0, I915_EXEC_BLT },
> > diff --git a/lib/igt_gt.h b/lib/igt_gt.h
> > index 4a67cd9f038e..d3213123d6ac 100644
> > --- a/lib/igt_gt.h
> > +++ b/lib/igt_gt.h
> > @@ -76,6 +76,7 @@ unsigned intel_detect_and_clear_missed_interrupts(int fd);
> >  
> >  bool gem_can_store_dword(int fd, unsigned int engine);
> >  bool gem_class_can_store_dword(int fd, int class);
> > +bool gem_store_dword_needs_secure(int fd);
> >  
> >  extern const struct intel_execution_engine2 {
> >  	char name[16];
> > diff --git a/lib/igt_store.c b/lib/igt_store.c
> > index 538405e7f594..42ffdc5cdbe4 100644
> > --- a/lib/igt_store.c
> > +++ b/lib/igt_store.c
> > @@ -48,7 +48,7 @@ void igt_store_word(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
> >  		execbuf.flags |= I915_EXEC_FENCE_IN;
> >  		execbuf.rsvd2 = fence;
> >  	}
> > -	if (gen < 6)
> > +	if (gem_store_dword_needs_secure(fd))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> 
> What about just one function returning this flag or zero?
> So it would be used like:
> 
> 	execbuf.flags |= gem_store_dword_secure_batch(fd);
> 
> Even less code.

I suppose that'd work. Thought the name would probably need 
more work. gem_store_dword_exec_secure() or maybe even
gem_store_dword_execbuf_flags()...

> 
> >  
> >  	memset(obj, 0, sizeof(obj));
> > diff --git a/tests/intel/gem_ctx_shared.c b/tests/intel/gem_ctx_shared.c
> > index de06f2d54876..4b9d604f6732 100644
> > --- a/tests/intel/gem_ctx_shared.c
> > +++ b/tests/intel/gem_ctx_shared.c
> > @@ -366,7 +366,7 @@ static void exec_shared_gtt(int i915, const intel_ctx_cfg_t *cfg,
> >  	obj.handle = batch;
> >  	obj.offset += 8192; /* make sure we don't cause an eviction! */
> >  	execbuf.rsvd1 = ctx[1]->id;
> > -	if (gen > 3 && gen < 6)
> > +	if (gem_store_dword_needs_secure(i915))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  	gem_execbuf(i915, &execbuf);
> >  
> > @@ -567,7 +567,7 @@ static void store_dword(int i915, uint64_t ahnd, const intel_ctx_t *ctx,
> >  	execbuf.buffers_ptr = to_user_pointer(obj + !cork);
> >  	execbuf.buffer_count = 2 + !!cork;
> >  	execbuf.flags = ring;
> > -	if (gen < 6)
> > +	if (gem_store_dword_needs_secure(i915))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  	execbuf.rsvd1 = ctx->id;
> >  
> > diff --git a/tests/intel/gem_exec_async.c b/tests/intel/gem_exec_async.c
> > index 573157add648..6d739307cfe6 100644
> > --- a/tests/intel/gem_exec_async.c
> > +++ b/tests/intel/gem_exec_async.c
> > @@ -56,7 +56,7 @@ static void store_dword(int fd, int id, const intel_ctx_t *ctx,
> >  	execbuf.buffers_ptr = to_user_pointer(obj);
> >  	execbuf.buffer_count = 2;
> >  	execbuf.flags = ring;
> > -	if (gen < 6)
> > +	if (gem_store_dword_needs_secure(fd))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  	execbuf.rsvd1 = ctx->id;
> >  
> > diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
> > index 2340ad49520e..37c1f7255046 100644
> > --- a/tests/intel/gem_exec_capture.c
> > +++ b/tests/intel/gem_exec_capture.c
> > @@ -396,7 +396,7 @@ static void __capture1(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
> >  	execbuf.buffers_ptr = (uintptr_t)obj;
> >  	execbuf.buffer_count = ARRAY_SIZE(obj);
> >  	execbuf.flags = e->flags;
> > -	if (gen > 3 && gen < 6)
> > +	if (gem_store_dword_needs_secure(fd))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  	execbuf.flags |= I915_EXEC_FENCE_OUT;
> >  	execbuf.rsvd1 = ctx->id;
> > @@ -586,7 +586,7 @@ __captureN(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
> >  	execbuf.buffers_ptr = (uintptr_t)obj;
> >  	execbuf.buffer_count = count + 2;
> >  	execbuf.flags = e->flags;
> > -	if (gen > 3 && gen < 6)
> > +	if (gem_store_dword_needs_secure(fd))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  	execbuf.flags |= I915_EXEC_FENCE_OUT;
> >  	execbuf.rsvd1 = ctx->id;
> > @@ -968,12 +968,9 @@ igt_main
> >  	uint32_t region;
> >  
> >  	igt_fixture {
> > -		int gen;
> > -
> >  		fd = drm_open_driver(DRIVER_INTEL);
> >  
> > -		gen = intel_gen(intel_get_drm_devid(fd));
> > -		if (gen > 3 && gen < 6) /* ctg and ilk need secure batches */
> > +		if (gem_store_dword_needs_secure(fd))
> >  			igt_device_set_master(fd);
> >  
> >  		igt_require_gem(fd);
> > diff --git a/tests/intel/gem_exec_fence.c b/tests/intel/gem_exec_fence.c
> > index 7f39c73d72fa..c3c462b77dc4 100644
> > --- a/tests/intel/gem_exec_fence.c
> > +++ b/tests/intel/gem_exec_fence.c
> > @@ -796,7 +796,7 @@ static void test_parallel(int i915, const intel_ctx_t *ctx,
> >  		batch[++i] = MI_BATCH_BUFFER_END;
> >  		gem_write(i915, obj[1].handle, 0, batch, sizeof(batch));
> >  
> > -		if (gen < 6)
> > +		if (gem_store_dword_needs_secure(i915))
> >  			execbuf.flags |= I915_EXEC_SECURE;
> >  
> >  		gem_execbuf(i915, &execbuf);
> > @@ -919,7 +919,7 @@ static void test_concurrent(int i915, const intel_ctx_t *ctx,
> >  	tmp_ctx = intel_ctx_create(i915, &ctx->cfg);
> >  	execbuf.rsvd1 = tmp_ctx->id;
> >  	execbuf.rsvd2 = spin->out_fence;
> > -	if (gen < 6)
> > +	if (gem_store_dword_needs_secure(i915))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  
> >  	gem_execbuf(i915, &execbuf);
> > diff --git a/tests/intel/gem_exec_flush.c b/tests/intel/gem_exec_flush.c
> > index 795be929c2e2..027510424b06 100644
> > --- a/tests/intel/gem_exec_flush.c
> > +++ b/tests/intel/gem_exec_flush.c
> > @@ -1668,7 +1668,7 @@ static void run(int fd, unsigned ring, int nchild, int timeout,
> >  		execbuf.buffers_ptr = to_user_pointer(obj);
> >  		execbuf.buffer_count = 3;
> >  		execbuf.flags = ring | (1 << 12);
> > -		if (gen < 6)
> > +		if (gem_store_dword_needs_secure(fd))
> >  			execbuf.flags |= I915_EXEC_SECURE;
> >  
> >  		obj[1].handle = gem_create(fd, 1024*64);
> > @@ -1915,7 +1915,7 @@ static void batch(int fd, unsigned ring, int nchild, int timeout,
> >  		execbuf.buffers_ptr = to_user_pointer(obj);
> >  		execbuf.buffer_count = 2;
> >  		execbuf.flags = ring | (1 << 12);
> > -		if (gen < 6)
> > +		if (gem_store_dword_needs_secure(fd))
> >  			execbuf.flags |= I915_EXEC_SECURE;
> >  
> >  		obj[1].handle = gem_create(fd, 64<<10);
> > diff --git a/tests/intel/gem_exec_gttfill.c b/tests/intel/gem_exec_gttfill.c
> > index 3f05017772af..59a3679fec07 100644
> > --- a/tests/intel/gem_exec_gttfill.c
> > +++ b/tests/intel/gem_exec_gttfill.c
> > @@ -187,7 +187,7 @@ static void fillgtt(int fd, const intel_ctx_t *ctx, unsigned ring, int timeout)
> >  
> >  	memset(&execbuf, 0, sizeof(execbuf));
> >  	execbuf.buffer_count = 1;
> > -	if (gen < 6)
> > +	if (gem_store_dword_needs_secure(fd))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  	execbuf.rsvd1 = ctx->id;
> >  
> > diff --git a/tests/intel/gem_exec_nop.c b/tests/intel/gem_exec_nop.c
> > index 1b20cc870187..652f8deffc3d 100644
> > --- a/tests/intel/gem_exec_nop.c
> > +++ b/tests/intel/gem_exec_nop.c
> > @@ -165,7 +165,7 @@ static void poll_ring(int fd, const intel_ctx_t *ctx,
> >  	uint64_t elapsed;
> >  
> >  	flags = I915_EXEC_NO_RELOC;
> > -	if (gen == 4 || gen == 5)
> > +	if (gem_store_dword_needs_secure(fd))
> >  		flags |= I915_EXEC_SECURE;
> >  
> >  	igt_require(gem_class_can_store_dword(fd, e->class));
> > @@ -278,7 +278,7 @@ static void poll_sequential(int fd, const intel_ctx_t *ctx,
> >  	bool cached;
> >  
> >  	flags = I915_EXEC_NO_RELOC;
> > -	if (gen == 4 || gen == 5)
> > +	if (gem_store_dword_needs_secure(fd))
> >  		flags |= I915_EXEC_SECURE;
> >  
> >  	nengine = 0;
> > diff --git a/tests/intel/gem_exec_parallel.c b/tests/intel/gem_exec_parallel.c
> > index 90c46bf0cb17..9817bcd0ff33 100644
> > --- a/tests/intel/gem_exec_parallel.c
> > +++ b/tests/intel/gem_exec_parallel.c
> > @@ -147,7 +147,7 @@ static void *thread(void *data)
> >  	execbuf.flags = t->engine;
> >  	execbuf.flags |= I915_EXEC_HANDLE_LUT;
> >  	execbuf.flags |= I915_EXEC_NO_RELOC;
> > -	if (t->gen < 6)
> > +	if (gem_store_dword_needs_secure(fd))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  	if (t->flags & (CONTEXTS | FDS)) {
> >  		tmp_ctx = intel_ctx_create(fd, &t->ctx->cfg);
> > diff --git a/tests/intel/gem_exec_params.c b/tests/intel/gem_exec_params.c
> > index d0260d5f1ae6..382d4f6dc39d 100644
> > --- a/tests/intel/gem_exec_params.c
> > +++ b/tests/intel/gem_exec_params.c
> > @@ -248,7 +248,7 @@ static void test_batch_first(int fd)
> >  	memset(&execbuf, 0, sizeof(execbuf));
> >  	execbuf.buffers_ptr = to_user_pointer(obj);
> >  	execbuf.buffer_count = ARRAY_SIZE(obj);
> > -	if (gen > 3 && gen < 6)
> > +	if (gem_store_dword_needs_secure(fd))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  
> >  	/* Normal mode */
> > diff --git a/tests/intel/gem_exec_reloc.c b/tests/intel/gem_exec_reloc.c
> > index 44c09c3e2941..d9afbe23a337 100644
> > --- a/tests/intel/gem_exec_reloc.c
> > +++ b/tests/intel/gem_exec_reloc.c
> > @@ -903,7 +903,7 @@ static void active(int fd, const intel_ctx_t *ctx, unsigned engine)
> >  	memset(&execbuf, 0, sizeof(execbuf));
> >  	execbuf.buffers_ptr = to_user_pointer(obj);
> >  	execbuf.buffer_count = 2;
> > -	if (gen < 6)
> > +	if (gem_store_dword_needs_secure(fd))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  	execbuf.rsvd1 = ctx->id;
> >  
> > @@ -1310,14 +1310,13 @@ static void concurrent_child(int i915, const intel_ctx_t *ctx,
> >  			     uint32_t *common, int num_common,
> >  			     int in, int out)
> >  {
> > -	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
> >  	int idx = flags_to_index(e);
> >  	uint64_t relocs = concurrent_relocs(i915, idx, CONCURRENT);
> >  	struct drm_i915_gem_exec_object2 obj[num_common + 2];
> >  	struct drm_i915_gem_execbuffer2 execbuf = {
> >  		.buffers_ptr = to_user_pointer(obj),
> >  		.buffer_count = ARRAY_SIZE(obj),
> > -		.flags = e->flags | I915_EXEC_HANDLE_LUT | (gen < 6 ? I915_EXEC_SECURE : 0),
> > +		.flags = e->flags | I915_EXEC_HANDLE_LUT,
> >  		.rsvd1 = ctx->id,
> >  	};
> >  	uint32_t *batch = &obj[num_common + 1].handle;
> > @@ -1325,6 +1324,9 @@ static void concurrent_child(int i915, const intel_ctx_t *ctx,
> >  	uint32_t *x;
> >  	int err = 0;
> >  
> > +	if (gem_store_dword_needs_secure(i915))
> > +		execbuf.flags |= I915_EXEC_SECURE;
> > +
> >  	memset(obj, 0, sizeof(obj));
> >  	obj[0].handle = gem_create(i915, 64 * CONCURRENT * 4);
> >  
> > diff --git a/tests/intel/gem_exec_schedule.c b/tests/intel/gem_exec_schedule.c
> > index fdb7ebd702cd..84219b4cf5a9 100644
> > --- a/tests/intel/gem_exec_schedule.c
> > +++ b/tests/intel/gem_exec_schedule.c
> > @@ -187,7 +187,7 @@ static uint32_t __store_dword(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
> >  	execbuf.buffers_ptr = to_user_pointer(obj + !cork);
> >  	execbuf.buffer_count = 2 + !!cork;
> >  	execbuf.flags = ring;
> > -	if (gen < 6)
> > +	if (gem_store_dword_needs_secure(fd))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  	execbuf.rsvd1 = ctx->id;
> >  
> > @@ -2342,7 +2342,7 @@ static void reorder_wide(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
> >  	execbuf.buffers_ptr = to_user_pointer(obj);
> >  	execbuf.buffer_count = ARRAY_SIZE(obj);
> >  	execbuf.flags = ring;
> > -	if (gen < 6)
> > +	if (gem_store_dword_needs_secure(fd))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  
> >  	execbuf.flags |= I915_EXEC_FENCE_IN;
> > diff --git a/tests/intel/gem_exec_store.c b/tests/intel/gem_exec_store.c
> > index 3b1319519107..d64cdeb6d435 100644
> > --- a/tests/intel/gem_exec_store.c
> > +++ b/tests/intel/gem_exec_store.c
> > @@ -84,7 +84,7 @@ static void store_dword(int fd, const intel_ctx_t *ctx,
> >  	execbuf.buffers_ptr = to_user_pointer(obj);
> >  	execbuf.buffer_count = 2;
> >  	execbuf.flags = e->flags;
> > -	if (gen > 3 && gen < 6)
> > +	if (gem_store_dword_needs_secure(fd))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  	execbuf.rsvd1 = ctx->id;
> >  
> > @@ -169,7 +169,7 @@ static void store_cachelines(int fd, const intel_ctx_t *ctx,
> >  	memset(&execbuf, 0, sizeof(execbuf));
> >  	execbuf.buffer_count = flags & PAGES ? NCACHELINES + 1 : 2;
> >  	execbuf.flags = e->flags;
> > -	if (gen > 3 && gen < 6)
> > +	if (gem_store_dword_needs_secure(fd))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  	execbuf.rsvd1 = ctx->id;
> >  
> > @@ -281,7 +281,7 @@ static void store_all(int fd, const intel_ctx_t *ctx)
> >  	memset(&execbuf, 0, sizeof(execbuf));
> >  	execbuf.buffers_ptr = to_user_pointer(obj);
> >  	execbuf.buffer_count = 2;
> > -	if (gen < 6)
> > +	if (gem_store_dword_needs_secure(fd))
> >  		execbuf.flags |= I915_EXEC_SECURE;
> >  	execbuf.rsvd1 = ctx->id;
> >  
> > @@ -414,7 +414,7 @@ static void store_all(int fd, const intel_ctx_t *ctx)
> >  	free(reloc);
> >  }
> >  
> > -static int print_welcome(int fd)
> > +static void print_welcome(int fd)
> >  {
> >  	uint16_t devid = intel_get_drm_devid(fd);
> >  	const struct intel_device_info *info = intel_get_device_info(devid);
> > @@ -430,8 +430,6 @@ static int print_welcome(int fd)
> >  		err = -errno;
> >  	igt_info("GPU operation? %s [errno=%d]\n",
> >  		 err == 0 ? "yes" : "no", err);
> > -
> > -	return info->graphics_ver;
> >  }
> 
> Why do you changed this? Seems unrelated.
> 
> >  
> >  #define test_each_engine(T, i915, ctx, e)  \
> > @@ -446,12 +444,10 @@ igt_main
> >  	int fd;
> >  
> >  	igt_fixture {
> > -		int gen;
> > -
> >  		fd = drm_open_driver(DRIVER_INTEL);
> >  
> > -		gen = print_welcome(fd);
> 
> Even if you do not need it here it will look cleaner
> in a follow up patch.

The compiler isn't happy about the unused variable. If we
want to split this part it'd have to be a prep patch.

-- 
Ville Syrjälä
Intel
