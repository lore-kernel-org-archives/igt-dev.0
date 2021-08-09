Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3DC689B7B
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Aug 2021 07:02:02 +0000 (UTC)
Date: Mon, 9 Aug 2021 09:01:28 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210809070128.GB5318@zkempczy-mobl2>
References: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
 <20210806134145.24634-19-zbigniew.kempczynski@intel.com>
 <87o8aautwc.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o8aautwc.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 18/56] tests/gem_exec_balancer: Adopt
 to use allocator
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

On Fri, Aug 06, 2021 at 02:48:19PM -0700, Dixit, Ashutosh wrote:
> On Fri, 06 Aug 2021 06:41:07 -0700, Zbigniew Kempczyński wrote:
> >
> > For newer gens we're not able to rely on relocations. Adopt to use
> > offsets acquired from the allocator.
> 
> One minor fix below, with that:
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
> > @@ -1334,11 +1347,13 @@ static void __bonded_nohang(int i915, const intel_ctx_t *ctx,
> >	};
> >	igt_spin_t *time, *spin;
> >	const intel_ctx_t *load;
> > +	uint64_t ahnd0 = get_reloc_ahnd(i915, 0), ahnd;
> >
> >	load = ctx_create_balanced(i915, siblings, count);
> >	gem_context_set_priority(i915, load->id, 1023);
> > +	ahnd = get_reloc_ahnd(i915, ctx->id);
> 
> ahnd = get_reloc_ahnd(i915, load->id);

Good catch, thanks for finding this. From the offset perspective it 
shouldn't matter but for consistency it is. 

--
Zbigniew

> 
> >
> > -	spin = igt_spin_new(i915, .ctx = load, .engine = 1);
> > +	spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = load, .engine = 1);
