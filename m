Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0576E056
 for <igt-dev@lists.freedesktop.org>; Sun,  2 Feb 2020 10:31:32 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <87blqj565y.wl-ashutosh.dixit@intel.com>
References: <20200131171150.8333-1-antonio.argenziano@intel.com>
 <87blqj565y.wl-ashutosh.dixit@intel.com>
Message-ID: <158063948798.17828.2067896502546028406@skylake-alporthouse-com>
Date: Sun, 02 Feb 2020 10:31:28 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/i915/gem_ctx_sseu: Skip gtt
 tests if mappable aperture unavailable
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Antonio Argenziano <antonio.argenziano@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Dixit, Ashutosh (2020-02-01 03:37:45)
> On Fri, 31 Jan 2020 09:11:50 -0800, Antonio Argenziano wrote:
> > The gtt tests try to verify that a gtt mapped area can be used as an
> > sseu pointer so it wouldn't make sense to run those when gtt mapping is
> > not available.
> >
> > v2:
> >       - Move require in subtest definition. (Ashutosh)
> >
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
> > Signed-off-by: Antonio Argenziano <antonio.argenziano@intel.com>
> > Cc: Dixit Ashutosh <ashutosh.dixit@intel.com>
> > ---
> >  tests/i915/gem_ctx_sseu.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/i915/gem_ctx_sseu.c b/tests/i915/gem_ctx_sseu.c
> > index 38dc584b..b5e9658e 100644
> > --- a/tests/i915/gem_ctx_sseu.c
> > +++ b/tests/i915/gem_ctx_sseu.c
> > @@ -528,8 +528,11 @@ igt_main
> >               igt_subtest("invalid-sseu")
> >                       test_invalid_sseu(fd);
> >
> > -             igt_subtest("ggtt-args")
> > +             igt_subtest("ggtt-args") {
> > +                     gem_require_mappable_ggtt(fd);
> > +
> >                       test_ggtt_args(fd);

It pains me to say because of all the duplication, but we do need to
cover the cases where args are inside strange mmaped objects.

Long ago we wanted a 'toolbox', as nearly all of these tests are the
same except for the ioctl layout. Ideal candidates for annotated
fuzzing (how many different types of mmap/faulthandlers can we think
of?)

We need a better solution here.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
