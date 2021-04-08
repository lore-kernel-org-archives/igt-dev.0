Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287ED6E1B1
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Apr 2021 20:13:20 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id f12so3462628wro.0
 for <igt-dev@lists.freedesktop.org>; Thu, 08 Apr 2021 13:13:20 -0700 (PDT)
Date: Thu, 8 Apr 2021 22:13:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <YG9j3HqjZCk71Dmi@phenom.ffwll.local>
References: <20210401114316.2597715-1-tvrtko.ursulin@linux.intel.com>
 <YGW2pTimwjHEDf3M@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YGW2pTimwjHEDf3M@platvala-desk.ger.corp.intel.com>
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Apr 01, 2021 at 03:03:49PM +0300, Petri Latvala wrote:
> On Thu, Apr 01, 2021 at 12:43:16PM +0100, Tvrtko Ursulin wrote:
> > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > 
> > Correcting a brain malfunction while typing in Makefile.sources.
> > 
> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>

Isn't autotools now going away with Arek's series?
-Daniel

> 
> 
> > ---
> >  tests/Makefile.sources | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tests/Makefile.sources b/tests/Makefile.sources
> > index e992285fedc5..194df8e27dd0 100644
> > --- a/tests/Makefile.sources
> > +++ b/tests/Makefile.sources
> > @@ -464,7 +464,7 @@ TESTS_progs += gem_wait
> >  gem_wait_SOURCES = i915/gem_wait.c
> >  
> >  TESTS_progs += gem_watchdog
> > -gem_exec_watchdog_SOURCES = i915/gem_watchdog.c
> > +gem_watchdog_SOURCES = i915/gem_watchdog.c
> >  
> >  TESTS_progs += gem_workarounds
> >  gem_workarounds_SOURCES = i915/gem_workarounds.c
> > -- 
> > 2.27.0
> > 
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
