Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0BB710E131
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Oct 2023 16:48:50 +0000 (UTC)
Date: Mon, 9 Oct 2023 18:48:45 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231009164845.bl6e2lowtfuvrj5n@kamilkon-desk.igk.intel.com>
References: <20231002104846.21443-1-nirmoy.das@intel.com>
 <6b302953-93de-b544-2549-c2bb198f974b@linux.intel.com>
 <20231005105432.v5vs6xe5w5aga3go@kamilkon-desk.igk.intel.com>
 <2701b664-9f24-565e-c1f0-1c64622a19f4@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2701b664-9f24-565e-c1f0-1c64622a19f4@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel/gem_eio: Skip stress test
 on BCS0 for MTL
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Nirmoy,
On 2023-10-06 at 10:56:41 +0200, Nirmoy Das wrote:
> Hi Kamil,
> 
> On 10/5/2023 12:54 PM, Kamil Konieczny wrote:
> > Hi Nirmoy,
> > On 2023-10-05 at 12:39:07 +0200, Nirmoy Das wrote:
> > > ping
> > > 
> > > On 10/2/2023 12:48 PM, Nirmoy Das wrote:
> > > > We do GGTT update on MTL using bcs engine, blocking that would
> > > > fail the test so skip such subtests on bcs engine for MTL.
> > > > 
> > > > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > Please ask Sai from bug filing team for respin
> > (look at BAT fail).
> 
> repin didn't help :/  unrelated failures. Let me check with Sai.
> 
> 
> > 
> > > > ---
> > > >    tests/intel/gem_eio.c | 10 +++++++++-
> > > >    1 file changed, 9 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
> > > > index 6d4b8f7df..99891ad15 100644
> > > > --- a/tests/intel/gem_eio.c
> > > > +++ b/tests/intel/gem_eio.c
> > > > @@ -1111,8 +1111,16 @@ static void test_reset_stress(int fd, unsigned int flags)
> > > >    	const intel_ctx_t *ctx0 = context_create_safe(fd);
> > > >    	uint64_t ahnd = get_reloc_ahnd(fd, ctx0->id);
> > > > -	for_each_ring(e, fd)
> > > > +	for_each_ring(e, fd) {
> > > > +		struct intel_execution_engine2 engine;
> > > > +
> > > > +		engine = gem_eb_flags_to_engine(eb_ring(e));
> > > > +
> > > > +		if (gem_engine_can_block_ggtt_binder(fd, &engine))
> > > > +			continue;
> > Is it possible that this loop will have only bcs egines?
> > Or due to (future?) bug in gem_engine_can_block_ggtt_binder this
> > loop will never execute any test? In that case:
> 
> for_each_ring() iterate over the device so it is not possible to just have copy engine.
> Don't think we need to check that.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> Regards,
> Nirmoy
> 
> > 
> >              ++counter;
> > 
> > > > +
> > > >    		reset_stress(fd, ahnd, ctx0, e->name, eb_ring(e), flags);
> > > > +	}
> > igt_require(counter);

Hmm, this should be after ctx_destroy and put_ahnd but as
it is not needed you may drop my suggestion.

Regards,
Kamil

> > 
> > Regards,
> > Kamil
> > 
> > > >    	intel_ctx_destroy(fd, ctx0);
> > > >    	put_ahnd(ahnd);
