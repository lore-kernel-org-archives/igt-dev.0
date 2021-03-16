Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B59389AAD
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Mar 2021 13:18:41 +0000 (UTC)
Date: Tue, 16 Mar 2021 14:18:36 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210316131836.GC14270@zkempczy-mobl2>
References: <20210315165842.64488-1-zbigniew.kempczynski@intel.com>
 <20210315165842.64488-38-zbigniew.kempczynski@intel.com>
 <161589380568.9605.17854219310890388301@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <161589380568.9605.17854219310890388301@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t v23 37/37] tests/gem_linear_blits: Use
 intel allocator
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Mar 16, 2021 at 11:23:25AM +0000, Chris Wilson wrote:

<cut>

> > +               do_relocs = !gem_uses_ppgtt(fd);
> >  
> >                 count = gem_aperture_size(fd);
> >                 if (count >> 32)
> >                         count = MAX_32b;
> > +               else
> > +                       do_relocs = true;
> 
> So this catches Braswell (has a 32b full-ppgtt) and only Braswell.
> Any reason why the simple allocator cannot handle less than 32b of
> address space?
> 

No, but do we really need this in that series? I'm not good in all
i915 history and I don't have knowledge about all previous gen 
limitations so I left above check intact. 

--
Zbigniew
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
