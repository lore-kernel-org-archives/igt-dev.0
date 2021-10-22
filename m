Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0637C6E58B
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Oct 2021 04:40:36 +0000 (UTC)
Date: Fri, 22 Oct 2021 06:40:32 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211022044032.GA8290@zkempczy-mobl2>
References: <20211021043508.1158148-1-priyanka.dandamudi@intel.com>
 <20211021043508.1158148-4-priyanka.dandamudi@intel.com>
 <20211021073321.GC3640@zkempczy-mobl2>
 <87y26l9atx.wl-ashutosh.dixit@intel.com>
 <87wnm59a0x.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87wnm59a0x.wl-ashutosh.dixit@intel.com>
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, John Harrison <john.c.harrison@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Oct 21, 2021 at 05:29:50PM -0700, Dixit, Ashutosh wrote:
> On Thu, 21 Oct 2021 17:12:26 -0700, Dixit, Ashutosh wrote:
> >
> > On Thu, 21 Oct 2021 00:33:21 -0700, Zbigniew Kempczyński wrote:
> > >
> > > On Thu, Oct 21, 2021 at 10:05:07AM +0530, priyanka.dandamudi@intel.com wrote:
> > > > From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > >
> > > > Add compute (CCS) engine. Add this to the IGT
> > > > structure to allow gem tests to execute.
> > > >
> > > > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > > > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > > Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > > > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > > Cc: Arjun Melkaveri <arjun.melkaveri@intel.com>
> > > > ---
> > > >  lib/igt_gt.c | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > >
> > > > diff --git a/lib/igt_gt.c b/lib/igt_gt.c
> > > > index a0ba04cc..80fb65ca 100644
> > > > --- a/lib/igt_gt.c
> > > > +++ b/lib/igt_gt.c
> > > > @@ -604,6 +604,10 @@ const struct intel_execution_engine2 intel_execution_engines2[] = {
> > > >	{ "vcs1", I915_ENGINE_CLASS_VIDEO, 1, I915_EXEC_BSD | I915_EXEC_BSD_RING2 },
> > > >	{ "vcs2", I915_ENGINE_CLASS_VIDEO, 2, -1 },
> > > >	{ "vecs0", I915_ENGINE_CLASS_VIDEO_ENHANCE, 0, I915_EXEC_VEBOX },
> > > > +	{ "ccs0", I915_ENGINE_CLASS_COMPUTE, 0 , -1},
> > > > +	{ "ccs1", I915_ENGINE_CLASS_COMPUTE, 1 , -1},
> > > > +	{ "ccs2", I915_ENGINE_CLASS_COMPUTE, 2 , -1},
> > > > +	{ "ccs3", I915_ENGINE_CLASS_COMPUTE, 3 , -1},
> >
> > Is this correct? Isn't intel_execution_engines2 a list of just the legacy
> > engines? I don't think compute engines (which may vary in number) can be
> > added to the list of legacy engines. Isn't it true that compute engines can
> > only be accessed by querying the present engines dynamically (using
> > something like intel_ctx_create_all_physical())?
> 
> I've copied Tvrtko (the boss :), but I am pretty sure what I said is
> correct. Legacy engines are what context 0 is created with (without adding
> any more engines onto context 0). So unless we can confirm that these
> engines are present for context 0 in the kernel we can't add them in IGT.

I'm sorry, you're right. I wasn't aware legacy engines are "frozen", so
context 0 won't get an access to ccs. My r-b is incorrect then and patch
shouldn't land.  Another problem you've just realized me is with above
patch I would still need to detect ccs somehow on context 0 depending
on gen to allow iterator to go over existing engines.

--
Zbigniew
