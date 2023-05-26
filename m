Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A7510E7A4
 for <igt-dev@lists.freedesktop.org>; Fri, 26 May 2023 06:37:32 +0000 (UTC)
Date: Fri, 26 May 2023 08:37:27 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230526083727.244dd893@maurocar-mobl2>
In-Reply-To: <20230525192245.dfhsw4y4rukeeerf@kamilkon-desk1>
References: <20230525090535.2791739-1-mauro.chehab@linux.intel.com>
 <20230525090535.2791739-5-mauro.chehab@linux.intel.com>
 <20230525192245.dfhsw4y4rukeeerf@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v4 04/11] i915/gem_exec_*: better
 document gem exec tests used for i915 validation
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

On Thu, 25 May 2023 21:22:45 +0200
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Hi Mauro,
> 
> On 2023-05-25 at 11:05:28 +0200, Mauro Carvalho Chehab wrote:
> > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> > 
> > Merge data from some ancillary internal documentation to improve
> > core test descriptions.
> > 
> > This patch was auto-generated via script.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> > diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
> > index 76a86e8f4197..1d09cfe07135 100644
> > --- a/tests/i915/gem_exec_fence.c
> > +++ b/tests/i915/gem_exec_fence.c

> >   * SUBTEST: basic-wait-all
> > - * Description: Basic check for composite fence with additional wait on all busy engines.
> > + * Description:
> > + *   Basic check for composite fence with additional wait on all busy engines.
> > + *   Execute the same batch on each engine and check that the composite fence across all engines completes only after the batch is completed on every engine.  
> ------- ^
> Looks strange.

Comment makes sense to me. I'll keep this one. It can be changed later on,
if it doesn't reflect the test behavior.


> >   * SUBTEST: nb-await
> > - * Description: Check for explicit fence with non-blocking wait on each engine.
> > + * Description:
> > + *   Check for explicit fence with non-blocking wait on each engine.
> > + *   Check for explicit fence with non-blocking wait on each  
> ------- ^
> This one is out of place, repeated with last word cut off.
> 
> >   * Feature: cmd_submission, multitile, synchronization
> > + * Functionality: semaphore
> >   * Run type: BAT
> > + * Test category: MultiTile
> >   *
> >   * SUBTEST: nb-await-hang
> >   * Description: Check for explicit fence with non-blocking async wait on each engine with a pending gpu hang.
> > @@ -122,9 +153,12 @@
> >   * Run type: FULL
> >   *
> >   * SUBTEST: parallel
> > - * Description: Check for EXEC_FENCE_SUBMIT in parallel execution scenarios on each engine.
> > + * Description:
> > + *   Check for EXEC_FENCE_SUBMIT in parallel execution scenarios on each engine.
> > + *   Check for EXEC_FENCE_SUBMIT in parallel execution scenarios  
> ------- ^
> Same here.
> 
> Rest looks ok, if you think that descriptions may be corrected
> later add my r-b.

I'll fix those two comments about the duplicated (incomplete)
descriptions, and add your R-B.

Thanks!
Mauro
