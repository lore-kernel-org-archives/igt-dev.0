Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964D689E11
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 02:53:03 +0000 (UTC)
Date: Tue, 10 Aug 2021 04:52:58 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210810025258.GB3738@zkempczy-mobl2>
References: <20210809130533.27759-1-zbigniew.kempczynski@intel.com>
 <20210809130533.27759-54-zbigniew.kempczynski@intel.com>
 <87tujy1hw3.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87tujy1hw3.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v5 53/65] tests/i915_module_load: Adopt
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Aug 09, 2021 at 01:29:32PM -0700, Dixit, Ashutosh wrote:
> On Mon, 09 Aug 2021 06:05:21 -0700, Zbigniew Kempczyński wrote:
> >
> > @@ -126,6 +144,9 @@ static void store_all(int i915)
> >	gem_read(i915, obj[0].handle, 0, engines, nengine * sizeof(engines[0]));
> >	gem_close(i915, obj[0].handle);
> >	intel_ctx_destroy(i915, ctx);
> > +	put_offset(ahnd, obj[0].handle);
> > +	put_offset(ahnd, obj[1].handle);
> > +	put_ahnd(ahnd);
> 
> Maybe skip put_offset since we are doing put_ahnd anyway? Otherwise,
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reloc allocator is not tracking offset so this is empty call, but switching
to Simple should keep this range until we free it. As allocator instance 
is kept until last reference reaches 0 put_ahnd() not always can destroy
this instance. In this case it is so it doesn't matter we free offset or not.
So I dare to get your r-b leaving code intact.

--
Zbigniew 
