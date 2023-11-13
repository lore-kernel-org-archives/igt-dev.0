Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E8910E3BC
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Nov 2023 15:34:36 +0000 (UTC)
Date: Mon, 13 Nov 2023 16:34:11 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231113153411.kinbci7uyvfw26s2@kamilkon-desk.igk.intel.com>
References: <20231113104332.1266113-1-bhanuprakash.modem@intel.com>
 <b94e4f26-6655-4ead-8769-30d98570d27b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b94e4f26-6655-4ead-8769-30d98570d27b@intel.com>
Subject: Re: [igt-dev] [i-g-t] syncobj_timeline: don't expect EINVAL for
 WAIT_UNSUBMITTED | WAIT_AVAILABLE
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Bhanu,

thank you for fixing this.

On 2023-11-13 at 15:48:37 +0100, Karolina Stolarek wrote:
> On 13.11.2023 11:43, Bhanuprakash Modem wrote:
> > From: Erik Kurzinger <ekurzinger@nvidia.com>
> > 
> > The syncobj_timeline test expects waiting for an unsubmitted fence with
> > the WAIT_AVAILABLE flag set to fail with EINVAL. While this matches the
> > behavior of current kernels, that behavior is incorrect and will be
> > fixed by
> > https://lists.freedesktop.org/archives/dri-devel/2023-August/418710.html
> > 
> > With that fix, the WAIT_AVAILABLE flag will have the intended semantics
> > of waiting for an unsubmitted fence to be submitted instead of failing.
> > 
> > Note that this will cause the test to fail with kernels that lack the
> > fix, but such failures will reflect a genuine defect.
> > 
> > V2: Fix testplan documentation
---------------------------------- ^
add (Bhanuprakash)

V2: Fix testplan documentation (Bhanuprakash)

> > 

Here checkpatch.pl is printing error:

ERROR: Missing Signed-off-by: line by nominal patch author 'Erik Kurzinger <ekurzinger@nvidia.com>'

As Karolina pointed out, here should go:

Signed-off-by: Erik Kurzinger <ekurzinger@nvidia.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Acked-by: Simon Ser <contact@emersion.fr>

And after that your s-o-b:

> > Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> 
> I think it would be better to submit a separate patch for tesplan changes,
> but I won't block merging the patch as it is.

In this test a testname was decided by value of err, so it really should go
in one patch.

After that changes you may add my Acked-by (after one from Karolina).

Regards,
Kamil

> 
> Please add SoB for Erik, Ack from Simon and RB from Zbigniew as it was in
> the original patch.
> 
> I tested it locally and all the test cases pass now. Feel free to either add
> Tested-by or Ack from me.
> 
> All the best,
> Karolina
> 
> > ---
> >   tests/syncobj_timeline.c | 24 ++++++++++++------------
> >   1 file changed, 12 insertions(+), 12 deletions(-)
> > 
> > diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
> > index b4e1d093a..ea8341a30 100644
> > --- a/tests/syncobj_timeline.c
> > +++ b/tests/syncobj_timeline.c
> > @@ -135,16 +135,16 @@
> >    *   Verifies that as we signal points from the host, the syncobj timeline value increments and
> >    *   that waits for submits/signals works properly.
> >    *
> > - * SUBTEST: invalid-multi-wait-all-available-unsubmitted
> > + * SUBTEST: etime-multi-wait-all-available-unsubmitted
> >    * Description: Verifies waiting on a list of timeline syncobjs
> >    *
> > - * SUBTEST: invalid-multi-wait-all-available-unsubmitted-signaled
> > + * SUBTEST: etime-multi-wait-all-available-unsubmitted-signaled
> >    * Description: Verifies waiting on a list of timeline syncobjs
> >    *
> > - * SUBTEST: invalid-multi-wait-all-available-unsubmitted-submitted
> > + * SUBTEST: etime-multi-wait-all-available-unsubmitted-submitted
> >    * Description: Verifies waiting on a list of timeline syncobjs
> >    *
> > - * SUBTEST: invalid-multi-wait-all-available-unsubmitted-submitted-signaled
> > + * SUBTEST: etime-multi-wait-all-available-unsubmitted-submitted-signaled
> >    * Description: Verifies waiting on a list of timeline syncobjs
> >    *
> >    * SUBTEST: invalid-multi-wait-all-unsubmitted
> > @@ -159,16 +159,16 @@
> >    * SUBTEST: invalid-multi-wait-all-unsubmitted-submitted-signaled
> >    * Description: Verifies waiting on a list of timeline syncobjs
> >    *
> > - * SUBTEST: invalid-multi-wait-available-unsubmitted
> > + * SUBTEST: etime-multi-wait-available-unsubmitted
> >    * Description: Verifies waiting on a list of timeline syncobjs
> >    *
> > - * SUBTEST: invalid-multi-wait-available-unsubmitted-signaled
> > + * SUBTEST: multi-wait-available-unsubmitted-signaled
> >    * Description: Verifies waiting on a list of timeline syncobjs
> >    *
> > - * SUBTEST: invalid-multi-wait-available-unsubmitted-submitted
> > + * SUBTEST: multi-wait-available-unsubmitted-submitted
> >    * Description: Verifies waiting on a list of timeline syncobjs
> >    *
> > - * SUBTEST: invalid-multi-wait-available-unsubmitted-submitted-signaled
> > + * SUBTEST: multi-wait-available-unsubmitted-submitted-signaled
> >    * Description: Verifies waiting on a list of timeline syncobjs
> >    *
> >    * SUBTEST: invalid-multi-wait-unsubmitted
> > @@ -213,13 +213,13 @@
> >    * SUBTEST: invalid-signal-zero-handles
> >    * Description: Verify that signaling an empty list of syncobj handles is rejected
> >    *
> > - * SUBTEST: invalid-single-wait-all-available-unsubmitted
> > + * SUBTEST: etime-single-wait-all-available-unsubmitted
> >    * Description: Verifies wait behavior on a single timeline syncobj
> >    *
> >    * SUBTEST: invalid-single-wait-all-unsubmitted
> >    * Description: Verifies wait behavior on a single timeline syncobj
> >    *
> > - * SUBTEST: invalid-single-wait-available-unsubmitted
> > + * SUBTEST: etime-single-wait-available-unsubmitted
> >    * Description: Verifies wait behavior on a single timeline syncobj
> >    *
> >    * SUBTEST: invalid-single-wait-unsubmitted
> > @@ -1782,7 +1782,7 @@ igt_main
> >   						WAIT_SIGNALED)) != 1)
> >   			continue;
> > -		if ((flags & WAIT_UNSUBMITTED) && !(flags & WAIT_FOR_SUBMIT))
> > +		if ((flags & WAIT_UNSUBMITTED) && !((flags & WAIT_FOR_SUBMIT) || (flags & WAIT_AVAILABLE)))
> >   			err = -EINVAL;
> >   		else if (!(flags & WAIT_SIGNALED) && !((flags & WAIT_SUBMITTED) && (flags & WAIT_AVAILABLE)))
> >   			err = -ETIME;
> > @@ -1851,7 +1851,7 @@ igt_main
> >   			continue;
> >   		err = 0;
> > -		if ((flags & WAIT_UNSUBMITTED) && !(flags & WAIT_FOR_SUBMIT)) {
> > +		if ((flags & WAIT_UNSUBMITTED) && !((flags & WAIT_FOR_SUBMIT) || (flags & WAIT_AVAILABLE))) {
> >   			err = -EINVAL;
> >   		} else if (flags & WAIT_ALL) {
> >   			if (flags & (WAIT_UNSUBMITTED | WAIT_SUBMITTED))
