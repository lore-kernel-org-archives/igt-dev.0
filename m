Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9BE6E51A
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Aug 2021 10:19:55 +0000 (UTC)
Date: Thu, 5 Aug 2021 12:19:50 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210805101950.GA16047@zkempczy-mobl2>
References: <20210726200026.4815-1-zbigniew.kempczynski@intel.com>
 <20210726200026.4815-17-zbigniew.kempczynski@intel.com>
 <87y29gs6kl.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y29gs6kl.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 16/52] tests/gem_ctx_param: Adopt to
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Aug 05, 2021 at 12:18:18AM -0700, Dixit, Ashutosh wrote:
> On Mon, 26 Jul 2021 12:59:50 -0700, Zbigniew Kempczyński wrote:
> >
> > diff --git a/tests/i915/gem_ctx_param.c b/tests/i915/gem_ctx_param.c
> > index c795f1b45..11bc08e36 100644
> > --- a/tests/i915/gem_ctx_param.c
> > +++ b/tests/i915/gem_ctx_param.c
> > @@ -165,6 +165,7 @@ static void test_vm(int i915)
> >	int err;
> >	uint32_t parent, child;
> >	igt_spin_t *spin;
> > +	uint64_t ahnd;
> >
> >	/*
> >	 * Proving 2 contexts share the same GTT is quite tricky as we have no
> > @@ -190,7 +191,8 @@ static void test_vm(int i915)
> >
> >	/* Test that we can't set the VM after we've done an execbuf */
> >	arg.ctx_id = gem_context_create(i915);
> > -	spin = igt_spin_new(i915, .ctx_id = arg.ctx_id);
> > +	ahnd = get_reloc_ahnd(i915, arg.ctx_id);
> > +	spin = igt_spin_new(i915, .ahnd = ahnd, .ctx_id = arg.ctx_id);
> >	igt_spin_free(i915, spin);
> >	arg.value = gem_vm_create(i915);
> >	err = __gem_context_set_param(i915, &arg);
> > @@ -202,7 +204,7 @@ static void test_vm(int i915)
> >	child = gem_context_create(i915);
> >
> >	/* Create a background spinner to keep the engines busy */
> > -	spin = igt_spin_new(i915);
> > +	spin = igt_spin_new(i915, .ahnd = ahnd);
> >	for (int i = 0; i < 16; i++) {
> >		spin->execbuf.rsvd1 = gem_context_create(i915);
> >		__gem_context_set_priority(i915, spin->execbuf.rsvd1, 1023);
> > @@ -259,6 +261,7 @@ static void test_vm(int i915)
> >	igt_spin_free(i915, spin);
> >	gem_sync(i915, batch.handle);
> >	gem_close(i915, batch.handle);
> > +	put_ahnd(ahnd);
> 
> I think this should work even thought the context against which ahnd has
> been created has been destroyed after the first spin_free, but please
> check:
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Yes, ahnd is only offset provider here for spinners. But to avoid 
confusion I'm going to delete first ahnd (for arg.ctx_id and recreate
ahnd for default context before start second spinner.

As this is cosmetic change I dare to keep your r-b.

--
Zbigniew
