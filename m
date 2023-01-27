Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF1210E193
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jan 2023 17:44:01 +0000 (UTC)
Date: Fri, 27 Jan 2023 18:44:00 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230127174400.c53vmhgsv2hqldqz@kamilkon-desk1>
References: <20230127160813.139460-1-ashutosh.dixit@intel.com>
 <20230127160813.139460-2-ashutosh.dixit@intel.com>
 <20230127164603.ckc3cn2p2ecmgcua@kamilkon-desk1>
 <87lelngbmz.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87lelngbmz.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] i915/i915_power: Sanity check power
 measurement
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

Hi Ashutosh,

On 2023-01-27 at 08:55:48 -0800, Dixit, Ashutosh wrote:
> On Fri, 27 Jan 2023 08:46:03 -0800, Kamil Konieczny wrote:
> >
> > Hi Ashutosh,
> >
> > looks much better, few small nits left, see below.
> >
> > On 2023-01-27 at 08:08:12 -0800, Ashutosh Dixit wrote:
> > > Add a test to sanity check power measurement on integrated/discrete by
> > > requiring power under load to be > 0 and >= idle power.
> > >
> > > v2: Code reorganization (Kamil K)
> > > v3: More code reorganization (Kamil K)
> > >
> > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> > > ---
> > >  tests/i915/i915_power.c | 70 +++++++++++++++++++++++++++++++++++++++++
> > >  tests/meson.build       |  1 +
> > >  2 files changed, 71 insertions(+)
> > >  create mode 100644 tests/i915/i915_power.c
> > >
> > > diff --git a/tests/i915/i915_power.c b/tests/i915/i915_power.c
> > > new file mode 100644
> > > index 00000000000..533cf769b54
> > > --- /dev/null
> > > +++ b/tests/i915/i915_power.c
> > > @@ -0,0 +1,70 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright © 2023 Intel Corporation
> > > + */
> > > +
> > > +#include "igt.h"
> > > +#include "i915/gem.h"
> > > +#include "igt_power.h"
> > > +
> > > +IGT_TEST_DESCRIPTION("i915 power measurement tests");
> > > +
> > > +static double measure_power(struct igt_power *pwr, int sleep_duration_sec)
> > ----------------------------------------------------- ^
> > unsigned int
> 
> No this is double, see igt_power_get_mW.

I mean type of sleep_duration_sec should be unsigned int.

Regards,
Kamil

> 
> >
> > > +{
> > > +	struct power_sample sample[2];
> > > +
> > > +	igt_power_get_energy(pwr, &sample[0]);
> > > +	usleep(sleep_duration_sec * USEC_PER_SEC);
> > > +	igt_power_get_energy(pwr, &sample[1]);
> > > +
> > > +	return igt_power_get_mW(pwr, &sample[0], &sample[1]);
> > > +}
> > > +
> > > +static void sanity(int i915)
> > > +{
> > > +	const intel_ctx_t *ctx;
> > > +	struct igt_power pwr;
> > > +	double idle, busy;
> > > +	igt_spin_t *spin;
> > > +	uint64_t ahnd;
> > > +
> > > +	/* Idle power */
> > > +	igt_require(!igt_power_open(i915, &pwr, "gpu"));
> > > +	gem_quiescent_gpu(i915);
> > > +	idle = measure_power(&pwr, 2);
> > ---------------------------------- ^
> >
> > > +
> > > +	/* Busy power */
> > > +	ctx = intel_ctx_create_all_physical(i915);
> > > +	ahnd = get_reloc_ahnd(i915, ctx->id);
> > > +	spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
> > > +			    .engine = ALL_ENGINES,
> > > +			    .flags = IGT_SPIN_POLL_RUN);
> > > +	/* Wait till at least one spinner starts */
> > > +	igt_spin_busywait_until_started(spin);
> > > +	busy = measure_power(&pwr, 2);
> > ---------------------------------- ^
> > Make it define or const as you are using it twice and this
> > should be the same.
> 
> Will fix this up.
> 
> >
> > With that fixed:
> > Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Thanks!
> 
> >
> > --
> > Kamil
> >
> > > +	igt_free_spins(i915);
> > > +	put_ahnd(ahnd);
> > > +	intel_ctx_destroy(i915, ctx);
> > > +	igt_power_close(&pwr);
> > > +
> > > +	igt_info("Measured power: idle: %g mW, busy: %g mW\n", idle, busy);
> > > +	igt_assert(idle >= 0 && busy > 0 && busy > idle);
> > > +}
> > > +
> > > +igt_main
> > > +{
> > > +	int i915;
> > > +
> > > +	igt_fixture {
> > > +		i915 = drm_open_driver_master(DRIVER_INTEL);
> > > +	}
> > > +
> > > +	igt_describe("Sanity check gpu power measurement");
> > > +	igt_subtest("sanity") {
> > > +		sanity(i915);
> > > +	}
> > > +
> > > +	igt_fixture {
> > > +		close(i915);
> > > +	}
> > > +}
> > > diff --git a/tests/meson.build b/tests/meson.build
> > > index cce9d89e1c8..d93a07c9ed6 100644
> > > --- a/tests/meson.build
> > > +++ b/tests/meson.build
> > > @@ -213,6 +213,7 @@ i915_progs = [
> > >	'i915_pm_dc',
> > >	'i915_pm_rps',
> > >	'i915_pm_sseu',
> > > +	'i915_power',
> > >	'i915_query',
> > >	'i915_selftest',
> > >	'i915_suspend',
> > > --
> > > 2.38.0
> > >
