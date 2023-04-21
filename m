Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64AE110E321
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Apr 2023 18:57:03 +0000 (UTC)
Date: Fri, 21 Apr 2023 20:56:44 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Message-ID: <20230421185644.s4lxsidhugj2wes2@zkempczy-mobl2>
References: <20230421055457.13035-1-zbigniew.kempczynski@intel.com>
 <20230421055457.13035-8-zbigniew.kempczynski@intel.com>
 <df8c784b-7479-02c7-55ab-b2051c79d37b@intel.com>
 <20230421182656.gq46aeoosssqe47t@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230421182656.gq46aeoosssqe47t@zkempczy-mobl2>
Subject: Re: [igt-dev] [PATCH i-g-t v4 07/10] tests/xe_intel_bb: Check if
 intel-bb Xe support correctness
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 08:26:56PM +0200, Zbigniew Kempczyński wrote:

<cut>

> > > +	/* We'll fail on src <-> final compare so just warn */
> > > +	if (tiling == I915_TILING_NONE) {
> > > +		if (compare_bufs(&src, &dst, false) > 0)
> > > +			igt_warn("none->none blit failed!");
> > > +	} else {
> > > +		if (compare_bufs(&src, &dst, false) == 0)
> > > +			igt_warn("none->tiled blit failed!");
> > > +	}
> > 
> > Maybe:
> > 
> > 	if (tiling == I915_TILING_NONE && compare_bufs(&src, &dst, false) > 0)
> > 		igt_warn("none->none blit failed!");
> > 	else if (compare_bufs(&src, &dst, false) == 0)
> > 		igt_warn("none->tiled blit failed!");
> 
> This is not the same. In your case if tiling == NONE and compare() == 0
> we enter second condition and perform compare() one more time as first
> condition failed. I'm not compiler expert so I'm not able to answer
> the question will it handle this situation and evaluate function
> only once.
> 

I've google'd a bit and it seems __attribute__((pure)) might help but
I would try this and verify.

--
Zbigniew
