Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE456E41A
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Jan 2021 10:05:55 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20210107095517.GM7444@platvala-desk.ger.corp.intel.com>
References: <20210106140035.3802594-1-chris@chris-wilson.co.uk>
 <20210107095517.GM7444@platvala-desk.ger.corp.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 07 Jan 2021 10:05:49 +0000
Message-ID: <161001394911.839.5398373114595453242@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Abort the run after a kernel
 taint is discovered
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Petri Latvala (2021-01-07 09:55:17)
> On Wed, Jan 06, 2021 at 02:00:35PM +0000, Chris Wilson wrote:
> > Since we no longer immediately abort a test upon a taint, that taint may
> > persist into the next test causing unrelated incompletes. Avoid the
> > tainted inheritance by aborting between tests if the kernel is tainted.
> > 
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > Cc: Petri Latvala <petri.latvala@intel.com>
> > ---
> >  runner/executor.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/runner/executor.c b/runner/executor.c
> > index faf272d85..8cddcf1ce 100644
> > --- a/runner/executor.c
> > +++ b/runner/executor.c
> > @@ -1801,6 +1801,7 @@ bool execute(struct execute_state *state,
> >  
> >       for (; state->next < job_list->size;
> >            state->next++) {
> > +             unsigned long taints;
> >               char *reason = NULL;
> >               int result;
> >  
> > @@ -1836,6 +1837,13 @@ bool execute(struct execute_state *state,
> >                       break;
> >               }
> >  
> > +             if (settings->abort_mask & ABORT_TAINT && tainted(&taints)) {
> > +                     outf("Stopping the rung because the kernel is tainted: %#x.\n",
> > +                          taintss);
> > +                     status = false;
> > +                     break;
> > +             }
> > +
> 
> We already call need_to_abort() a couple of lines above this:
> 
> if (reason != NULL || (reason = need_to_abort(settings)) != NULL) {

Oh, it's the dynamic subtests that are producing the confused results.

More reason to have the tainted selfchecks in libigt.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
