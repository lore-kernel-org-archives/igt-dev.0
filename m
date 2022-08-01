Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7B68F9F1
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Aug 2022 11:54:53 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Karolina Drobnik <karolina.drobnik@intel.com>
Date: Mon, 01 Aug 2022 13:54:47 +0200
Message-ID: <4393065.8F6SAcFxjW@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <fb564118-4afb-6f4a-03cc-34e255b871ef@intel.com>
References: <cover.1658826356.git.karolina.drobnik@intel.com>
 <6459819.4vTCxPXJkl@jkrzyszt-mobl1.ger.corp.intel.com>
 <fb564118-4afb-6f4a-03cc-34e255b871ef@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/2] tests/gem_exec_fence: Check
 stored values only for valid workloads
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Monday, 1 August 2022 11:51:27 CEST Karolina Drobnik wrote:
> Hi,
> 
> On 01.08.2022 10:11, Janusz Krzysztofik wrote:
> > On Monday, 1 August 2022 07:53:54 CEST Karolina Drobnik wrote:
> >> Hi,
> >>
> >> On 29.07.2022 17:23, Janusz Krzysztofik wrote:
> >>> On Friday, 29 July 2022 13:32:37 CEST Karolina Drobnik wrote:
> >>>> Hi Janusz,
> >>>>
> >>>> On 29.07.2022 10:24, Janusz Krzysztofik wrote:
> >>>>> Hi Karolina,
> >>>>>
> >>>>> On Friday, 29 July 2022 09:38:43 CEST Karolina Drobnik wrote:
> >>>>>> Hi Janusz,
> >>>>>>
> >>>>>> Thanks a lot for taking a look at the patch.
> >>>>>>
> >>>>>> On 28.07.2022 18:56, Janusz Krzysztofik wrote:
> >>>>>>> On Tuesday, 26 July 2022 12:13:11 CEST Karolina Drobnik wrote:
> >>>>>>>> From: Chris Wilson <chris@chris-wilson.co.uk>
> >>>>>>>>
> >>>>>>>> test_fence_await verifies if a fence used to pipeline work signals
> >>>>>>>> correctly. await-hang and nb-await-hang test cases inject GPU hang,
> >>>>>>>> which causes an erroneous state, meaning the fence will be signaled
> >>>>>>>> without execution. The error causes an instant reset of the command
> >>>>>>>> streamer for the hanging workload. This revealed a problem with how
> >>>>>>>> we verify the fence state and results. The test assumes that the
> >>>>>>>> error notification happens after a hang is declared, which takes
> >>>>>>>> longer than submitting the next set of fences, making the test pass
> >>>>>>>> every time. With the immediate reset, this might not happen, so the
> >>>>>>>> assertion fails, as there are no active fences in the GPU hang case.
> >>>>>>>>
> >>>>>>>> Move the check for active fence to the path for non-hanging workload,
> >>>>>>>> and verify results only in this scenario.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> >>>>>>>> Signed-off-by: Karolina Drobnik <karolina.drobnik@intel.com>
> >>>>>>>> ---
> >>>>>>>>      tests/i915/gem_exec_fence.c | 14 ++++++++------
> >>>>>>>>      1 file changed, 8 insertions(+), 6 deletions(-)
> >>>>>>>>
> >>>>>>>> diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/
> > gem_exec_fence.c
> >>>>>>>> index d46914c2..260aa82c 100644
> >>>>>>>> --- a/tests/i915/gem_exec_fence.c
> >>>>>>>> +++ b/tests/i915/gem_exec_fence.c
> >>>>>>>> @@ -350,18 +350,20 @@ static void test_fence_await(int fd, const
> >>>>> intel_ctx_t
> >>>>>>> *ctx,
> >> (...)
> >>>>>>>>      
> >>>>>>>> -	if ((flags & HANG) == 0)
> >>>>>>>>      		igt_spin_end(spin);
> >>>>>>>> +	}
> >>>>>>>>      
> >>>>>>>>      	igt_waitchildren();
> >>>>>>>>      
> >>>>>>>>      	gem_set_domain(fd, scratch, I915_GEM_DOMAIN_GTT, 0);
> >>>>>>>> -	while (i--)
> >>>>>>>> +	igt_assert(!fence_busy(spin->out_fence));
> >>>>>>>
> >>>>>>> We only check that the out fence of the presumably hanged spin batch
> > no
> >>>>> longer
> >>>>>>> blocks execution of store batches.
> >>>>>>
> >>>>>> This check applies to all workloads, all of them should be done with
> >>>>>> work at this point
> >>>>>
> >>>>> OK, but since that's the only explicit assert in the *-hang processing
> > path,
> >>>>> does it tell us anything about fencing working or not?
> >>>>
> >>>> It says that we were given an active fence, we wait at it and hope it
> >>>> signals when an error is reported. Like I said, we can't check the
> >>>> results itself, as they are meaningless with the reset. If we have an
> >>>> active fence at this point, that's bad, and the test should fail.
> >>>>
> >>>>> I think it doesn't,
> >>>>> and as long as I'm not wrong, I think such scenarios hardly belong to
> >>>>> gem_exec_fence.
> >>>>
> >>>> Hm, I'm not sure if I follow, but this exact transition (from active ->
> >>>> (record error) -> signal) is one of the possible scenarios we wish to
> >>>> test.
> >>>
> >>> OK, so we check if an active fence is signalled on error.  But then, what
> > does
> >>> 'active' mean here?
> >>
> >> Active means that the fence was sent and we wait to hear back from the
> >> GPU. If you'd like to see what are the state transitions in fences, you
> >> can check out Mainline Explicit Fencing series of blog posts/presentation.
> >>
> >>> Do we consider a fence active as soon as it has been
> >>> exported to userspace?  Or only after it has been imported back from
> > userspace
> >>> by at least one consumer?
> >>
> >> We assume them to be active as soon as the fence's fd is returned from
> >> the driver to userspace (we deal with out-fences here).
> >>
> >>> Assuming the former (as I guess), what do we need
> >>> the store batches for in these now modified *await-hang scenarios?  What
> > extra
> >>> value do those scenarios provide compared to (nb-)?wait-hang ?
> >>
> >> Hm, I don't quite understand the question here -- are you asking why do
> >> we check the store results? test_fence_await is reused by other
> >> subtests, not only the hanging cases, and we expect to see the stores.
> > 
> > The patch introduces two processing paths to test_fence_await(), one of them
> > for *-hang variants.  In that *-hang processing path, why do we still submit
> > batches that depend on the fence if we don't examine their execution and
> > results, only their completion? 
> 
> Ah, OK, now I get it. Do you suggest that we should also add a check for 
> HANG flag for igt_store_word block? But we still need to send something 
> to test this case.

Why do we need to send something?  What that something should look like?  IOW, 
what are we trying to exercise with this case?  How is it supposed to be 
different from wait-hang scenario?

> 
> > They get completed regardless of fencing working or not, I believe, > then that part of the *-hang processing path
> > related to store batches seems useless for me in a test focused on fencing.
> 
> Do they get completed? We'll get a CS reset and this batch won't 
> complete. 

OK, by completed I meant no longer queued nor running.

> Yes, in the case of hangs we just check the fence, 

Again, how this is supposed to be different from wait-hang scenario?

Thanks,
Janusz

> but in 
> general we do care about these stores. This patch aims to fix the 
> problem uncovered during manual testing (*-hang variants are not run in 
> CI), it does not try to rewrite the test (because that's what would be 
> required to completely separate these two test cases).
> 
> Many thanks,
> Karolina
> 
> > Thanks,
> > Janusz
> > 
> >>
> >> Many thanks,
> >> Karolina
> >>
> >>> Thanks,
> >>> Janusz
> >>
> > 
> > 
> > 
> > 
> 



