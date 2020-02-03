Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C154F6E312
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2020 11:50:09 +0000 (UTC)
Date: Mon, 3 Feb 2020 13:50:07 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200203115007.GC25209@platvala-desk.ger.corp.intel.com>
References: <20200202185649.4105689-1-chris@chris-wilson.co.uk>
 <20200203111344.GB25209@platvala-desk.ger.corp.intel.com>
 <158072891643.20090.13007450821769380286@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158072891643.20090.13007450821769380286@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Kill residual children at the end
 of a subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Feb 03, 2020 at 11:21:56AM +0000, Chris Wilson wrote:
> Quoting Petri Latvala (2020-02-03 11:13:44)
> > On Sun, Feb 02, 2020 at 06:56:49PM +0000, Chris Wilson wrote:
> > > Ensure that we tidy up all the excess children left behind by a failing
> > > subtest, we do not want them loitering into the next!
> > > 
> > > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > > ---
> > >  lib/igt_core.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/lib/igt_core.c b/lib/igt_core.c
> > > index a0bf29408..65c80fbba 100644
> > > --- a/lib/igt_core.c
> > > +++ b/lib/igt_core.c
> > > @@ -1362,6 +1362,10 @@ static void exit_subtest(const char *result)
> > >  
> > >       igt_terminate_spins();
> > >  
> > > +     for (int c = 0; c < num_test_children; c++)
> > > +             kill(test_children[c], SIGKILL);
> > > +     num_test_children = 0;
> > 
> > Are the children wait()ed for somewhere?
> 
> Would be very hard to do from inside the dead subtest. We can leave them
> as zombies, otherwise how long do you want to wait? As far as the CPU
> side of things go, they will not make any further progress.

igt_exit() does an assert that waitpid(-1, ...) errors with
ECHILD. The exit handler that does call wait() only does it if
num_test_children is nonzero.

All tests that fork stuff are already supposed to call
igt_waitchildren(), right? Should we call igt_waitchildren_timeout()
here instead, with a 1s timeout? Or __igt_waitchildren() after firing
off some SIGKILLs.

Care to beef up lib/tests/igt_fork.c to make sure this is all done
gracefully at subtest level, currently it only checks that the state
is sane at exit() time?


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
