Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA2E89B9F
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Aug 2021 06:49:37 +0000 (UTC)
Date: Mon, 23 Aug 2021 08:49:33 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210823064933.GD5611@zkempczy-mobl2>
References: <20210822121626.12150-1-arjun.melkaveri@intel.com>
 <20210823032608.GB5611@zkempczy-mobl2>
 <20210823060921.GA17300@arjun-NUC8i7BEH>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210823060921.GA17300@arjun-NUC8i7BEH>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_sync: igt_require to
 check availability of engine in list_engines
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Melkaveri, Arjun" <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Aug 23, 2021 at 11:39:21AM +0530, Melkaveri, Arjun wrote:
> On Mon, Aug 23, 2021 at 05:26:08AM +0200, Zbigniew Kempczyński wrote:
> > On Sun, Aug 22, 2021 at 05:46:26PM +0530, Arjun Melkaveri wrote:
> > > Replaced igt_assert with igt_require in list_engines , to
> > > avoid false failure of test case if engine is not supported
> > > or found .
> > > Test will return Test requirement not met.
> > > 
> > > Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
> > > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > ---
> > >  tests/i915/gem_sync.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
> > > index 6cb00c40..4ad264a2 100644
> > > --- a/tests/i915/gem_sync.c
> > > +++ b/tests/i915/gem_sync.c
> > > @@ -106,9 +106,9 @@ list_engines(int fd, const intel_ctx_t *ctx, unsigned ring)
> > >  		ied = intel_engine_list_for_ctx_cfg(fd, &ctx->cfg);
> > >  	} else {
> > >  		if (ctx->cfg.num_engines)
> > > -			igt_assert(ring < ctx->cfg.num_engines);
> > > +			igt_require(ring < ctx->cfg.num_engines);
> > >  		else
> > > -			igt_assert(gem_has_ring(fd, ring));
> > > +			igt_require(gem_has_ring(fd, ring));
> > 
> > To be honest I don't like this change. If we have invalid ring
> > here it smells like bug in the code. If caller is passed 
> > ctx it should be created over cfg, so it contains valid (imo)
> > engine set. Thus if someone passed invalid ring I would assume
> > this is bug in the code and assert is correct bahavior here.
> > 
> > What are scenarios you're trying to handle?
> > 
> > --
> > Zbigniew
> This test is asserting for render engine in platform that doesnt support it.
> It used to skip before test was converted to use intel_ctx_t .
> (https://patchwork.freedesktop.org/patch/442850/)

I think render engine should be excluded in DRM_I915_QUERY_ENGINE_INFO query.
If it is not imo this is a bug. Kernel shouldn't return render engine if it is
not available on some platform.

--
Zbigniew

> 
> -Arjun 
> > 
> > >  
> > >  		ied.engines[ied.nengines].flags = ring;
> > >  		strcpy(ied.engines[ied.nengines].name, " ");
> > > -- 
> > > 2.25.1
> > > 
