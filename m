Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA20B10E607
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Oct 2022 13:14:17 +0000 (UTC)
Date: Wed, 5 Oct 2022 15:13:43 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <20221005151343.7f125712@maurocar-mobl2>
In-Reply-To: <8735c2sf1d.fsf@intel.com>
References: <20221005074546.55955-1-mauro.chehab@linux.intel.com>
 <20221005074546.55955-5-mauro.chehab@linux.intel.com>
 <8735c2sf1d.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v4 04/77] i915/gem_linear_blits: Close
 device before exit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 05 Oct 2022 14:09:18 +0300
Jani Nikula <jani.nikula@linux.intel.com> wrote:

> On Wed, 05 Oct 2022, Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:
> > From: Chris Wilson <chris.p.wilson@intel.com>
> >
> > Close the device fd before we check for leaks during the atexit
> > handlers.
> >
> > Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> > Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > Reviewed-by: Nirmoy Das<nirmoy.das@intel.com>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > ---
> >  tests/i915/gem_linear_blits.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/i915/gem_linear_blits.c b/tests/i915/gem_linear_blits.c
> > index 1fd5b733c3ce..d02751be9232 100644
> > --- a/tests/i915/gem_linear_blits.c
> > +++ b/tests/i915/gem_linear_blits.c
> > @@ -47,6 +47,7 @@
> >  #include "i915/gem.h"
> >  #include "i915/gem_create.h"
> >  #include "igt.h"
> > +#include "igt_types.h"
> >  
> >  IGT_TEST_DESCRIPTION("Test doing many blits with a working set larger than the"
> >  		     " aperture size.");
> > @@ -236,7 +237,7 @@ igt_main
> >  	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
> >  	uint64_t count = 0;
> >  	bool do_relocs;
> > -	int fd = -1;
> > +	igt_fd_t(fd);  
> 
> I guess igt has long since stopped being written in C, and started being
> written in an "igt dialect" of its own... but the constructs still kind
> of resemble C.
> 
> This doesn't. It looks like a function call but isn't. Looks odd that
> it's among the declarations... but it is a declaration.

True, but this is not different than what we have already at the Linux
Kernel with things like DECLARE_BITMAP():

   struct fsubdev {
        struct work_struct fw_work;
        struct work_struct pm_work;
        struct delayed_work ue_work;
        struct work_struct rescan_work;
        struct fdev *fdev;
        char __iomem *csr_base;
        int irq;
        bool fw_running;
        DECLARE_BITMAP(errors, NUM_SD_ERRORS);
        struct mbdb *mbdb;
...


and other similar variable declaration macros.

Maybe we could name it at patch 01/77 to:


	#define DECLARE_IGT_FD(x__) \
	       volatile int x__ cleanup_with(igt_cleanup_fd) = IGT_OUTER_SCOPE_INIT(-1)

in order to be more like the Kernel.

In a matter of fact, C is just a nicer and more portable way to work
macro-assembler... :-p


Regards,
Mauro
