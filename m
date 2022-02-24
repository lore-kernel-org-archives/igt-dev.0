Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7E910F310
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Feb 2022 07:49:06 +0000 (UTC)
Date: Thu, 24 Feb 2022 08:49:01 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <Yhc4badGXb1UYWlI@zkempczy-mobl2>
References: <20220223103303.24510-1-zbigniew.kempczynski@intel.com>
 <20220223103303.24510-2-zbigniew.kempczynski@intel.com>
 <87zgmgahl8.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zgmgahl8.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/intel_allocator: Add safe
 alignment as a default
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

On Wed, Feb 23, 2022 at 10:45:07PM -0800, Dixit, Ashutosh wrote:
> On Wed, 23 Feb 2022 02:33:02 -0800, Zbigniew Kempczyński wrote:
> >
> > diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> > index e5666cd4f..ddb8d8c1f 100644
> > --- a/lib/intel_batchbuffer.c
> > +++ b/lib/intel_batchbuffer.c
> > @@ -1360,7 +1360,7 @@ __intel_bb_create(int i915, uint32_t ctx, uint32_t size, bool do_relocs,
> >		ibb->allocator_handle = intel_allocator_open_full(i915, ctx,
> >								  start, end,
> >								  allocator_type,
> > -								  strategy);
> > +								  strategy, 0);
> 
> Still reviewing but do we need to change ibb->alignment just below? Also
> alignment in intel_bb_add_object()?

Yes, I wanted to add this as separate change. I'm not able to run
this on CI so I introduce changes partially.

But I got changes in intel-bb scheduled after above will be merged.
--
Zbigniew
