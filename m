Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 9 Apr 2021 10:55:04 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YHAIWNZrEeEqFhaW@platvala-desk.ger.corp.intel.com>
References: <20210401114316.2597715-1-tvrtko.ursulin@linux.intel.com>
 <YGW2pTimwjHEDf3M@platvala-desk.ger.corp.intel.com>
 <YG9j3HqjZCk71Dmi@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YG9j3HqjZCk71Dmi@phenom.ffwll.local>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] gem_watchdog: Fix autotools
 build
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
To: Daniel Vetter <daniel@ffwll.ch>
Cc: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Apr 08, 2021 at 10:13:16PM +0200, Daniel Vetter wrote:
> On Thu, Apr 01, 2021 at 03:03:49PM +0300, Petri Latvala wrote:
> > On Thu, Apr 01, 2021 at 12:43:16PM +0100, Tvrtko Ursulin wrote:
> > > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > 
> > > Correcting a brain malfunction while typing in Makefile.sources.
> > > 
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > 
> > Reviewed-by: Petri Latvala <petri.latvala@intel.com>
> 
> Isn't autotools now going away with Arek's series?

Yes. But this breakage happened before autotools removal landed.


-- 
Petri Latvala


> -Daniel
> 
> > 
> > 
> > > ---
> > >  tests/Makefile.sources | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/tests/Makefile.sources b/tests/Makefile.sources
> > > index e992285fedc5..194df8e27dd0 100644
> > > --- a/tests/Makefile.sources
> > > +++ b/tests/Makefile.sources
> > > @@ -464,7 +464,7 @@ TESTS_progs += gem_wait
> > >  gem_wait_SOURCES = i915/gem_wait.c
> > >  
> > >  TESTS_progs += gem_watchdog
> > > -gem_exec_watchdog_SOURCES = i915/gem_watchdog.c
> > > +gem_watchdog_SOURCES = i915/gem_watchdog.c
> > >  
> > >  TESTS_progs += gem_workarounds
> > >  gem_workarounds_SOURCES = i915/gem_workarounds.c
> > > -- 
> > > 2.27.0
> > > 
> > > _______________________________________________
> > > Intel-gfx mailing list
> > > Intel-gfx@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
