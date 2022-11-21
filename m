Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9415610E1A7
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Nov 2022 10:03:34 +0000 (UTC)
Date: Mon, 21 Nov 2022 12:03:48 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <Y3tNBFhd5QjoaYyc@platvala-desk.ger.corp.intel.com>
References: <20221115190513.30821-1-niranjana.vishwanathapura@intel.com>
 <42fed476-5f00-90e2-83ba-df17a9acc73a@intel.com>
 <Y3fZj+5QD9fBtOKo@nvishwa1-DESK>
 <95c5d0bb-0fbe-40fa-86b7-87d529d48f6b@intel.com>
 <Y3tGYGjsLHUkKfvN@platvala-desk.ger.corp.intel.com>
 <0e90bbf2-e3c6-dd45-99a2-8b204e1b54e4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e90bbf2-e3c6-dd45-99a2-8b204e1b54e4@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_shrink: Fix memory
 requirement assertion
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, chris.p.wilson@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Nov 21, 2022 at 09:44:37AM +0000, Matthew Auld wrote:
> On 21/11/2022 09:35, Petri Latvala wrote:
> > On Mon, Nov 21, 2022 at 09:12:57AM +0000, Matthew Auld wrote:
> > > On 18/11/2022 19:14, Niranjana Vishwanathapura wrote:
> > > > On Fri, Nov 18, 2022 at 02:54:40PM +0000, Matthew Auld wrote:
> > > > > On 15/11/2022 19:05, Niranjana Vishwanathapura wrote:
> > > > > > The reclaim subtest do not require the alloc_size memory
> > > > > > allocations. Ensure the memory requirement assert is only
> > > > > > applied for other subtests.
> > > > > > 
> > > > > > Signed-off-by: Niranjana Vishwanathapura
> > > > > > <niranjana.vishwanathapura@intel.com>
> > > > > > ---
> > > > > >   tests/i915/gem_shrink.c | 8 ++++----
> > > > > >   1 file changed, 4 insertions(+), 4 deletions(-)
> > > > > > 
> > > > > > diff --git a/tests/i915/gem_shrink.c b/tests/i915/gem_shrink.c
> > > > > > index e3e20dfc9..380d2c846 100644
> > > > > > --- a/tests/i915/gem_shrink.c
> > > > > > +++ b/tests/i915/gem_shrink.c
> > > > > > @@ -456,9 +456,6 @@ igt_main
> > > > > >                num_processes, alloc_size);
> > > > > >           alloc_size <<= 20;
> > > > > > -        igt_require_memory(num_processes, alloc_size,
> > > > > > -                   CHECK_SWAP | CHECK_RAM);
> > > > > > -
> > > > > 
> > > > > If that's the case then all the other stuff in the fixture is not
> > > > > really used either (like alloc_size, num_processes etc). Maybe just
> > > > > move the fixture instead?
> > > > > 
> > > > > igt_subtest_group {
> > > > >      igt_fixture {
> > > > > 
> > > > >      }
> > > > > 
> > > > >      for(const struct test *t = tests; t->name; t++) {
> > > > >      ....
> > > > > }
> > > > > 
> > > > > igt_subtest("reclaim")
> > > > > ...
> > > > > 
> > > > 
> > > > Ok, but the igt_fixture() inside the igt_subtest_group still gets executed
> > > > when we run reclaim subtest (with '--r reclaim').
> > > 
> > > Petri, do you know if that's expected?
> > 
> > Yes, all fixtures get executed.
> 
> Ok, so it's not really possible to have a sub-fixture, which is only run for
> a particular set of subtests? In such a case is a completely new test the
> correct approach?

Yeah that's not possible with the current architecture. We have no way
of neatly tying a fixture to a set of subtests.


> 
> I recently needed something similar here:
> https://patchwork.freedesktop.org/patch/511628/?series=110908&rev=2
> 
> But I guess that should rather be a new test? Or is there a better approach?

What you have in that fixture can just be inside the subtest. A
fixture is really for _common_ (shared) setup code.

(A fixture after a test on the other hand is useful for teardown,
since failing an igt_assert/igt_require jumps out of the subtest
immediately)


-- 
Petri Latvala
