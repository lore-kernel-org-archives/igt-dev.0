Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDC010E9B1
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Mar 2023 17:09:36 +0000 (UTC)
Date: Wed, 22 Mar 2023 18:09:15 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230322170915.fgetw55xiab27msp@kamilkon-desk1>
References: <20230321011800.3025307-1-ashutosh.dixit@intel.com>
 <a9d5c53a-d081-751d-80e0-ff44fd216cf7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a9d5c53a-d081-751d-80e0-ff44fd216cf7@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/i915_power: Also show requested
 and actual freq's
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

Hi,

On 2023-03-21 at 13:27:55 +0530, Riana Tauro wrote:
> 
> 
> On 3/21/2023 6:48 AM, Ashutosh Dixit wrote:
> > When power limits are in effect, in addition to measured power it is also
> > important to see the requested and actual freq's and see how they change
> > with set power limits. Add this to the test output.
> > 
> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > ---
> >   tests/i915/i915_power.c | 11 ++++++++++-
> >   1 file changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/i915/i915_power.c b/tests/i915/i915_power.c
> > index f2fd228698a..f0f10fc4d14 100644
> > --- a/tests/i915/i915_power.c
> > +++ b/tests/i915/i915_power.c
> > @@ -5,6 +5,7 @@
> >   #include "igt.h"
> >   #include "i915/gem.h"
> > +#include "igt_sysfs.h"

Please keep it in alphabetical order.

> >   #include "igt_power.h"
> >   IGT_TEST_DESCRIPTION("i915 power measurement tests");
> > @@ -27,9 +28,13 @@ static void sanity(int i915)
> >   	double idle, busy;
> >   	igt_spin_t *spin;
> >   	uint64_t ahnd;
> > +	int dir, req, act;
> >   #define DURATION_SEC 2
> > +	dir = igt_sysfs_gt_open(i915, 0);
> > +	igt_assert_lt(0, dir);
> > +
> can be replaced with for_each_sysfs_gt_dirfd and making the test a dynamic
> subtest ?
> 
> Thanks
> Riana Tauro
> 

I would prefer to keep it simple and have it as first step,
then make it dynamic subtest with macro.

Regards,
Kamil

> >   	/* Idle power */
> >   	igt_require(!igt_power_open(i915, &pwr, "gpu"));
> >   	gem_quiescent_gpu(i915);
> > @@ -44,12 +49,16 @@ static void sanity(int i915)
> >   	/* Wait till at least one spinner starts */
> >   	igt_spin_busywait_until_started(spin);
> >   	busy = measure_power(&pwr, DURATION_SEC);
> > +	req = igt_sysfs_get_u32(dir, "rps_cur_freq_mhz");
> > +	act = igt_sysfs_get_u32(dir, "rps_act_freq_mhz");
> >   	igt_free_spins(i915);
> >   	put_ahnd(ahnd);
> >   	intel_ctx_destroy(i915, ctx);
> >   	igt_power_close(&pwr);
> > +	close(dir);
> > -	igt_info("Measured power: idle: %g mW, busy: %g mW\n", idle, busy);
> > +	igt_info("Measured power: idle: %g mW, busy: %g mW, req MHz: %d, act MHz: %d\n",
> > +		 idle, busy, req, act);
> >   	igt_assert(idle >= 0 && busy > 0 && busy > idle);
> >   }
