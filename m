Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910F689F07
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 07:33:34 +0000 (UTC)
Date: Fri, 6 Aug 2021 09:33:29 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210806073329.GF3285@zkempczy-mobl2>
References: <20210726200026.4815-1-zbigniew.kempczynski@intel.com>
 <20210726200026.4815-19-zbigniew.kempczynski@intel.com>
 <874kc3tkir.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874kc3tkir.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 18/52] tests/gem_exec_async: Adopt to
 use allocator
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Aug 05, 2021 at 06:43:56PM -0700, Dixit, Ashutosh wrote:
> On Mon, 26 Jul 2021 12:59:52 -0700, Zbigniew Kempczyński wrote:
> >
> > For newer gens we're not able to rely on relocations. Adopt to use
> > offsets acquired from the allocator.
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
> But a couple of questions/comments below.
> 
> > +static void store_dword(int fd, int id, const intel_ctx_t *ctx,
> > +			 unsigned ring, uint32_t target, uint64_t target_offset,
> > +			 uint32_t offset, uint32_t value)
> >  {
> >	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
> >	struct drm_i915_gem_exec_object2 obj[2];
> > @@ -50,6 +53,15 @@ static void store_dword(int fd, const intel_ctx_t *ctx, unsigned ring,
> >	obj[0].flags = EXEC_OBJECT_ASYNC;
> >	obj[1].handle = gem_create(fd, 4096);
> >
> > +	if (id) {
> > +		obj[0].offset = target_offset;
> > +		obj[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE |
> > +				EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
> > +		obj[1].offset = (id + 1) * SZ_1M;
> 
> So this is where I think we are assigning new offsets to successive batches
> to avoid stalls, correct? Though I don't know why we don't get these
> offsets from the allocator (though I guess this will work since we have a
> 4K scratch buffer and whatever the spin needs)?

In store_dword() we got gem_close(fd, obj[1].handle) so we risk in
igt_fork() we got same offset for different batches. 

> 
> Maybe we can add a one line comment above, something like:

Ok, I'm going to add comment with the description why we need simple
and why we pass 'id' to store_word().

> 
> /* Assign new offsets to successive batches to prevent stalls */
> 
> > @@ -89,6 +101,8 @@ static void one(int fd, const intel_ctx_t *ctx,
> >	uint32_t scratch = gem_create(fd, 4096);
> >	igt_spin_t *spin;
> >	uint32_t *result;
> > +	uint64_t ahnd = get_simple_l2h_ahnd(fd, ctx->id);
> 
> Is there a particular reason for using simple rather than the reloc
> allocator here?

.dependency (scratch). We want to get same offset for same handle so
reloc allocator cannot be used here.

--
Zbigniew
