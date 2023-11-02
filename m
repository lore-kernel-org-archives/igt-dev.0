Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4374910E155
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Nov 2023 09:53:21 +0000 (UTC)
Date: Thu, 2 Nov 2023 10:53:16 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <20231102095316.3tg2qvmwixfk6fzo@zkempczy-mobl2>
References: <20231020093801.631809-1-matthew.auld@intel.com>
 <20231020093801.631809-12-matthew.auld@intel.com>
 <20231024163949.v6gt7n6gprodvh7v@zkempczy-mobl2>
 <8de4e1c7-d353-620d-6920-05c4e1328808@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8de4e1c7-d353-620d-6920-05c4e1328808@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v5 11/15] lib/intel_allocator: treat
 default_alignment as the minimum
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

On Tue, Oct 24, 2023 at 06:16:26PM +0100, Matthew Auld wrote:
> On 24/10/2023 17:39, Zbigniew Kempczyński wrote:
> > On Fri, Oct 20, 2023 at 10:37:57AM +0100, Matthew Auld wrote:
> > > If something overrides the default alignment, we should only apply the
> > > alignment if it is larger than the default_alignment.
> > > 
> > > v2 (Niranjana):
> > >    - Simplify slightly
> > > 
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > Cc: José Roberto de Souza <jose.souza@intel.com>
> > > Cc: Pallavi Mishra <pallavi.mishra@intel.com>
> > > Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > > ---
> > >   lib/intel_allocator.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
> > > index e5b9457b8..96ffe40d5 100644
> > > --- a/lib/intel_allocator.c
> > > +++ b/lib/intel_allocator.c
> > > @@ -584,8 +584,8 @@ static int handle_request(struct alloc_req *req, struct alloc_resp *resp)
> > >   			break;
> > >   		case REQ_ALLOC:
> > > -			if (!req->alloc.alignment)
> > > -				req->alloc.alignment = ial->default_alignment;
> > > +			req->alloc.alignment = max(ial->default_alignment,
> > > +						   req->alloc.alignment);
> > 
> > It will work but change current allocator behavior regarding
> > requested smaller alignment than default. I mean if allocator was
> > created with (let's say) 64K alignment and we want to suballocate
> > with 4K we can't do that with above code. All object regardless
> > our alignment requirement will be aligned to 64K.
> > 
> > Of course my need to have objects aligned to 4K is still reachable
> > if I create allocator with 4K as enforced alignment and pass 64K
> > as alignment argument on alloc().
> 
> Yeah, that seems fine to me. If I don't ask for any specific alignment when
> creating the allocator it should just give me the "safe" default imo, and
> all further allocations should be at least that, no matter what.

Ok. That's "safe" strategy which should match most tests needs.

> 
> If something more exotic (which doesn't seem to be the common case) is
> needed with being able to use say 4K, then manually setting that when
> creating the allocator isn't too unreasonable, with then having finer
> control with each individual allocation?

Yes, we might go this way - finer control on alloc() with enforced 4K
on alloc open().

> 
> > 
> > What case are you solving with above code?
> 
> For my case I basically just want to force the allocator to always use 2M+
> alignment, and I don't want random lib stuff passing in 4K/64K when
> allocating an address and somehow overriding that. But perhaps I'm
> misunderstanding how this all works?

You understand all of this perfectly. If you've opened allocator with 2M
everything will work as you expect with your fix above.

So from me either:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> > 
> > --
> > Zbigniew
> > 
> > >   			resp->response_type = RESP_ALLOC;
> > >   			resp->alloc.offset = ial->alloc(ial,
> > > -- 
> > > 2.41.0
> > > 
