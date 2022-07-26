Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0A6112478
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Jul 2022 06:32:13 +0000 (UTC)
Date: Tue, 26 Jul 2022 08:32:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yt+KaDeZHpLtmcqa@kamilkon-desk1>
References: <cover.1658322887.git.karolina.drobnik@intel.com>
 <d9a1b5eb559af9658a2201397c1fb725102213a7.1658322887.git.karolina.drobnik@intel.com>
 <YtqpHhr0hMPiVqni@kamilkon-desk1>
 <fce95533-bb93-c6b4-a99a-c334f5a316c0@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fce95533-bb93-c6b4-a99a-c334f5a316c0@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/gem_exec_fence: Coordinate
 sleep with the start of the request
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Karolina,

On 2022-07-25 at 09:24:39 +0200, Karolina Drobnik wrote:
> Hi Kamil,
> 
> On 22.07.2022 15:41, Kamil Konieczny wrote:
> > Hi,
> > 
> > On 2022-07-20 at 16:01:04 +0200, Karolina Drobnik wrote:
> > > From: Chris Wilson <chris@chris-wilson.co.uk>
> > > 
> > > Wait until we know the request is running on the GPU before sleeping
> > > and giving a chance for other fences to run ahead.
> > > 
> > > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > > Signed-off-by: Karolina Drobnik <karolina.drobnik@intel.com>
> > > ---
> > >   tests/i915/gem_exec_fence.c | 6 +++++-
> > >   1 file changed, 5 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
> > > index c1bd2a38..5f15fbdd 100644
> > > --- a/tests/i915/gem_exec_fence.c
> > > +++ b/tests/i915/gem_exec_fence.c
> > > @@ -324,7 +324,10 @@ static void test_fence_await(int fd, const intel_ctx_t *ctx,
> > >   			    .ahnd = ahnd,
> > >   			    .ctx = ctx,
> > >   			    .engine = e->flags,
> > > -			    .flags = IGT_SPIN_FENCE_OUT | spin_hang(flags));
> > > +			    .flags =
> > > +			    IGT_SPIN_FENCE_OUT |
> > > +			    IGT_SPIN_POLL_RUN |
> > > +			    spin_hang(flags));
> > 
> > Please move these after '=', so it will be
> > 			    .flags = IGT_SPIN_FENCE_OUT | IGT_SPIN_POLL_RUN |
> > 			             spin_hang(flags));
> 
> I think it's more of a style preference - the author decided to go for it,
> and it looks good to me. But if you have a specific style guidance that
> points out that such formatting is undesirable, please share and I'll
> correct the patch.
> 
> Many thanks,
> Karolina

For me it looks bad now. Here the assigment is extended with one new
flag, so please add that with little change. If you insist you can
make it one long line here (sometimes we can break 80 chars per line),
so even this is better:
 			    .flags = IGT_SPIN_FENCE_OUT | IGT_SPIN_POLL_RUN | spin_hang(flags));
or this:
 			    .flags = IGT_SPIN_FENCE_OUT |
				     IGT_SPIN_POLL_RUN |
				     spin_hang(flags));

Regards,
Kamil

> 
> > With that fixed,
> > Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > 
> > --
> > Kamil
> > 
> > >   	igt_assert(spin->out_fence != -1);
> > >   	i = 0;
> > > @@ -347,6 +350,7 @@ static void test_fence_await(int fd, const intel_ctx_t *ctx,
> > >   		i++;
> > >   	}
> > > +	igt_spin_busywait_until_started(spin);
> > >   	/* Long, but not too long to anger preemption disable checks */
> > >   	usleep(50 * 1000); /* 50 ms, typical preempt reset is 150+ms */
> > > -- 
> > > 2.25.1
> > > 
