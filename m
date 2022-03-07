Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D705410E1D1
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Mar 2022 08:02:06 +0000 (UTC)
Date: Mon, 7 Mar 2022 09:02:00 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <YiW7+NCw/7MR5bV7@zkempczy-mobl2>
References: <20220303140636.26652-1-anshuman.gupta@intel.com>
 <20220303140636.26652-2-anshuman.gupta@intel.com>
 <87o82kzzal.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o82kzzal.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] i915/gem_eio: Exercise object
 creation while wedged
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 chris.p.wilson@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Mar 04, 2022 at 10:30:42PM -0800, Dixit, Ashutosh wrote:
> On Thu, 03 Mar 2022 06:06:35 -0800, Anshuman Gupta wrote:
> >
> > diff --git a/lib/i915/gem_memory_topology.h b/lib/i915/gem_memory_topology.h
> > new file mode 100644
> > index 000000000..8daec8b5b
> > --- /dev/null
> > +++ b/lib/i915/gem_memory_topology.h
> > @@ -0,0 +1,45 @@
> > +/*
> > + * Copyright © 2021 Intel Corporation
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaining a
> > + * copy of this software and associated documentation files (the "Software"),
> > + * to deal in the Software without restriction, including without limitation
> > + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> > + * and/or sell copies of the Software, and to permit persons to whom the
> > + * Software is furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice (including the next
> > + * paragraph) shall be included in all copies or substantial portions of the
> > + * Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> > + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> > + * IN THE SOFTWARE.
> > + */
> 
> Can we please replace these headers with SPDX headers (note SPDX headers
> for .c and .h files are different but we have plenty in the code).
> 
> > +
> > +#ifndef GEM_MEMORY_TOPOLOGY_H
> > +#define GEM_MEMORY_TOPOLOGY_H
> > +
> > +#include <stdint.h>
> > +
> > +#include "i915_drm.h"
> > +
> > +struct gem_memory_region {
> > +	struct gem_memory_region *next;
> > +	char *name;
> > +
> > +	struct drm_i915_gem_memory_class_instance ci;
> > +	uint64_t size;
> > +};
> > +
> > +struct gem_memory_region *__gem_get_memory_regions(int i915);
> > +struct gem_memory_region *
> > +__gem_next_memory_region(struct gem_memory_region *r);
> > +
> > +#define for_each_memory_region(r__, fd__) for (struct gem_memory_region *r__ = __gem_get_memory_regions(fd__); r__; r__ = __gem_next_memory_region(r__))
> 
> Let me ask about this too on the mailing list. We already have equivalent
> functionality using get_memory_region_set()/for_each_combination(), the
> macros introduced here are actually simpler. But any objection to
> introducing these since we already have equivalent functionality?

I got no objection. It covers single case (iterating over regions) but
this is most common case. BTW self-freeing iterator is smartly coded. One
question is - why this is not a part of intel_memory_region.[ch]. Do we
need to introduce another file if this is related to memory regioning?

--
Zbigniew
