Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DAFB6E9E4
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Aug 2021 06:20:03 +0000 (UTC)
Date: Wed, 4 Aug 2021 08:19:58 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210804061958.GB4891@zkempczy-mobl2>
References: <20210726200026.4815-1-zbigniew.kempczynski@intel.com>
 <20210726200026.4815-2-zbigniew.kempczynski@intel.com>
 <87im0mku04.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87im0mku04.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 01/52] lib/igt_dummyload: Add support
 of using allocator in igt spinner
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
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Aug 03, 2021 at 04:07:07PM -0700, Dixit, Ashutosh wrote:
> On Mon, 26 Jul 2021 12:59:35 -0700, Zbigniew Kempczyński wrote:
> >
> > @@ -164,16 +171,34 @@ emit_recursive_batch(igt_spin_t *spin,
> >	execbuf->buffer_count++;
> >	cs = spin->batch;
> >
> > -	obj[BATCH].offset = addr;
> > +	if (ahnd)
> > +		addr = intel_allocator_alloc_with_strategy(ahnd, obj[BATCH].handle,
> > +							   BATCH_SIZE, 0,
> > +							   ALLOC_STRATEGY_LOW_TO_HIGH);
> 
> Is the strategy argument just for debug, so that spin offsets look
> different from offsets for other objects? Since everyone should be
> allocating from the same allocator which is managing offsets this should
> probably not be needed?

I wanted to be consisted with reloc version. Currently it randomize offsets
within first 32bit gtt space (see comment in emit_recursive_batch()).

Simple allocator starts from high->low from default so to be consisted 
I've added LOW_TO_HIGH flag to alloc offsets on low vm address space.

--
Zbigniew

> 
> In any case, the patch is great, so this is:
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
