Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 11 Feb 2020 11:37:32 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200211093732.GM25209@platvala-desk.ger.corp.intel.com>
References: <cover.1581381780.git.dale.b.stimson@intel.com>
 <2f2d74a2aa0bb1ab0050bdeb5a272ae9d7f61c69.1581381780.git.dale.b.stimson@intel.com>
 <20200211092200.GL25209@platvala-desk.ger.corp.intel.com>
 <877e0t1nfo.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <877e0t1nfo.fsf@intel.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 1/3] i915/gem_mmio_base.c -
 get mmio_base from debugfs (if possible)
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
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Feb 11, 2020 at 11:30:03AM +0200, Jani Nikula wrote:
> On Tue, 11 Feb 2020, Petri Latvala <petri.latvala@intel.com> wrote:
> >> diff --git a/lib/i915/gem_mmio_base.c b/lib/i915/gem_mmio_base.c
> >> new file mode 100644
> >> index 000000000..8718c092f
> >> --- /dev/null
> >> +++ b/lib/i915/gem_mmio_base.c
> >> @@ -0,0 +1,346 @@
> >> +//  Copyright (C) 2020 Intel Corporation
> >> +//
> >> +//  SPDX-License-Identifier: MIT
> >
> > We don't use SPDX headers in IGT, please use the MIT license comment
> > block instead.
> 
> Why not? Should we start?

I'm all for it, but preferably not trickled in but as separate conversion!


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
