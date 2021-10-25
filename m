Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EEB89D5F
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Oct 2021 03:50:49 +0000 (UTC)
Date: Mon, 25 Oct 2021 05:50:44 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211025035044.GB4049@zkempczy-mobl2>
References: <20211021043508.1158148-1-priyanka.dandamudi@intel.com>
 <20211021043508.1158148-4-priyanka.dandamudi@intel.com>
 <20211021073321.GC3640@zkempczy-mobl2>
 <87y26l9atx.wl-ashutosh.dixit@intel.com>
 <87wnm59a0x.wl-ashutosh.dixit@intel.com>
 <20211022044032.GA8290@zkempczy-mobl2>
 <eb1fbef5-32b9-f76d-73f6-de5071fc954e@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb1fbef5-32b9-f76d-73f6-de5071fc954e@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] lib/igt_gt: Add compute engine
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, John Harrison <john.c.harrison@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Oct 22, 2021 at 01:07:41PM +0100, Tvrtko Ursulin wrote:
<cut>

> > > > > > --- a/lib/igt_gt.c
> > > > > > +++ b/lib/igt_gt.c
> > > > > > @@ -604,6 +604,10 @@ const struct intel_execution_engine2 intel_execution_engines2[] = {
> > > > > > 	{ "vcs1", I915_ENGINE_CLASS_VIDEO, 1, I915_EXEC_BSD | I915_EXEC_BSD_RING2 },
> > > > > > 	{ "vcs2", I915_ENGINE_CLASS_VIDEO, 2, -1 },
> > > > > > 	{ "vecs0", I915_ENGINE_CLASS_VIDEO_ENHANCE, 0, I915_EXEC_VEBOX },
> > > > > > +	{ "ccs0", I915_ENGINE_CLASS_COMPUTE, 0 , -1},
> > > > > > +	{ "ccs1", I915_ENGINE_CLASS_COMPUTE, 1 , -1},
> > > > > > +	{ "ccs2", I915_ENGINE_CLASS_COMPUTE, 2 , -1},
> > > > > > +	{ "ccs3", I915_ENGINE_CLASS_COMPUTE, 3 , -1},
> > > > 
> > > > Is this correct? Isn't intel_execution_engines2 a list of just the legacy
> > > > engines? I don't think compute engines (which may vary in number) can be
> > > > added to the list of legacy engines. Isn't it true that compute engines can
> > > > only be accessed by querying the present engines dynamically (using
> > > > something like intel_ctx_create_all_physical())?
> > > 
> > > I've copied Tvrtko (the boss :), but I am pretty sure what I said is
> > > correct. Legacy engines are what context 0 is created with (without adding
> > > any more engines onto context 0). So unless we can confirm that these
> > > engines are present for context 0 in the kernel we can't add them in IGT.
> > 
> > I'm sorry, you're right. I wasn't aware legacy engines are "frozen", so
> > context 0 won't get an access to ccs. My r-b is incorrect then and patch
> > shouldn't land.  Another problem you've just realized me is with above
> > patch I would still need to detect ccs somehow on context 0 depending
> > on gen to allow iterator to go over existing engines.
> 
> Don't know any longer guys - in the past "static engines" iterator was
> supposed to be used to enumerate all possible engines _without_ querying the
> device (like when enumerating subtests it isn't allowed to open the device).
> 
> As such CCS would go to intel_execution_engines2 with "-1" for flags, as
> above patch had it. In other words in the past it was supposed to contain
> all engines i915 engine query could possibly return. The array would then
> also be used from elsewhere in the code to map class and instance to name
> and similar.

Ok, now everything is clear to me. Adding CCS to intel_execution_engines2[]
doesn't make sense because we won't have legacy ID which we could use 
in context 0 (in __for_each_static_engine()). Context 0 itself is legacy,
frozen and already converted from proto->full context during opening i915,
so no changes will occur in the engine set.

> 
> Whether or not all this changed in the intel_ctx_t rewrite I have no idea. I
> see the "legacy" comment was added in:
> 
> commit 9b32262bfadffffcde33c18ffb7c5292fbf4901e
> Author: Jason Ekstrand <jason@jlekstrand.net>
> Date:   Thu Apr 15 12:42:53 2021 -0500
> 
>     docs: Add gem_engine_topology.h to the docs
> 
> So perhaps ask Jason what was the plan there.

I don't think we should bother him - only allowed interface we got now 
in setting with using engines from I915_QUERY(engines) and all legacy 
engines walkthrough just gone for contexts > 0. So adding this to 
above array is useless.

Thanks for explanation.

--
Zbigniew

> 
> Regards,
> 
> Tvrtko
