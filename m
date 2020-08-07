Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <25f28f97-1e1f-e11f-ee6a-c524e4f854b2@intel.com>
References: <20200807084506.473089-1-chris@chris-wilson.co.uk>
 <25f28f97-1e1f-e11f-ee6a-c524e4f854b2@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 07 Aug 2020 10:11:15 +0100
Message-ID: <159679147552.16647.11735803367843972389@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_exec_fence: Use
 default-context for syncobj-timeline-wait
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Lionel Landwerlin (2020-08-07 10:00:14)
> On 07/08/2020 11:45, Chris Wilson wrote:
> > syncobj-timeline-wait is only exercising waits on the syncobj along a
> > single timeline, for which it can use the universally available default
> > context, and so not try and fail to create a HW context on very old
> > platforms.
> >
> > Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2308
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> 
> 
> Hm... I thought maybe we didn't get all the engines on the default context.

A fresh context, either the default for a new fd or from
gem_context_create(), only gets the default set of engines. The context
created here has a clone of the engines from the default context, which
we hope has been reconfigured already to have the set of all available
engines.

__for_each_physical_engine() works by querying the kernel and
reconfiguring the default context to suite. Fortunately that is run in a
fixture early on in gem_exec_fence, so by the time we get to the syncobj
group, we have all engines available.

Looks like we're good to iterate over them all :)
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
