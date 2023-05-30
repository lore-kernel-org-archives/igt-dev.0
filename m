Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9939B10E0FD
 for <igt-dev@lists.freedesktop.org>; Tue, 30 May 2023 19:12:28 +0000 (UTC)
Date: Tue, 30 May 2023 21:12:23 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
Message-ID: <20230530191223.34mjzlcm7chqb4er@zkempczy-mobl2>
References: <20230525055519.10098-1-sai.gowtham.ch@intel.com>
 <20230525055519.10098-3-sai.gowtham.ch@intel.com>
 <20230529055728.ttmspxtvvmrsfeoy@zkempczy-mobl2>
 <BYAPR11MB3413B19E83E164793BA8F102D04A9@BYAPR11MB3413.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BYAPR11MB3413B19E83E164793BA8F102D04A9@BYAPR11MB3413.namprd11.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/xe/xe_spin_batch: Add new
 test to exercise igt_spin_new for xe.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, May 29, 2023 at 01:02:53PM +0200, Ch, Sai Gowtham wrote:
> 
> 
> > -----Original Message-----
> > From: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>
> > Sent: Monday, May 29, 2023 11:27 AM
> > To: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>
> > Cc: igt-dev@lists.freedesktop.org
> > Subject: Re: [PATCH i-g-t 2/2] tests/xe/xe_spin_batch: Add new test to exercise
> > igt_spin_new for xe.
> > 
> > On Thu, May 25, 2023 at 11:25:19AM +0530, sai.gowtham.ch@intel.com wrote:
> > > From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> > >
> > > xe_spin_batch test exercises basic igt_spin_new submissions and and
> > > with all engines.
> > >
> > > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> > > ---
> > >  tests/meson.build        |   1 +
> > >  tests/xe/xe_spin_batch.c | 138
> > > +++++++++++++++++++++++++++++++++++++++
> > >  2 files changed, 139 insertions(+)
> > >  create mode 100644 tests/xe/xe_spin_batch.c
> > >
> > > diff --git a/tests/meson.build b/tests/meson.build index
> > > f71be1db..e794b75a 100644
> > > --- a/tests/meson.build
> > > +++ b/tests/meson.build
> > > @@ -268,6 +268,7 @@ xe_progs = [
> > >  	'xe_query',
> > >  	'xe_vm',
> > >  	'xe_waitfence',
> > > +	'xe_spin_batch',
> > >  ]
> > >
> > >  msm_progs = [
> > > diff --git a/tests/xe/xe_spin_batch.c b/tests/xe/xe_spin_batch.c new
> > > file mode 100644 index 00000000..1b216199
> > > --- /dev/null
> > > +++ b/tests/xe/xe_spin_batch.c
> > > @@ -0,0 +1,138 @@
> > > +#include "igt.h"
> > > +#include "lib/intel_reg.h"
> > > +#include "xe_drm.h"
> > > +#include "xe/xe_ioctl.h"
> > > +#include "xe/xe_query.h"
> > > +
> > > +#define MAX_INSTANCE 9
> > > +/**
> > > + * TEST:Test for spin batch submissons.
> > > + *
> > > + * SUBTEST: spin-batch
> > > + * Description: Test to submit spin batch with engines and vm.
> > > + * Run type: FULL
> > > + * TODO: change ``'Run type' == FULL`` to a better category
> > > + *
> > > + */
> > > +
> > > +static void spin(int fd, struct drm_xe_engine_class_instance *hwe) {
> > > +	uint64_t ahnd;
> > > +	unsigned int engine;
> > > +	uint32_t vm;
> > > +	igt_spin_t *spin;
> > > +
> > > +	vm = xe_vm_create(fd, 0, 0);
> > > +	engine = xe_engine_create(fd, vm, hwe, 0);
> > > +	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> > > +
> > > +	spin = __igt_spin_new(fd, .ahnd = ahnd, .engine = engine, .vm = vm);
> > > +	igt_assert(spin);
> > > +
> > > +	igt_spin_free(fd, spin);
> > 
> > You shouldn't imo destroy engine/vm inside igt_spin_free(). Caller is the owner
> > and they should stay intact.
> > 
> > If instead .engine you'll pass .hwe you may create engine on top of vm (if
> > passed, if not create new one) and destroy in igt_spin_free().
> > 
> > Resume: track the ownershipping.
> I'm handling this in igt_spin_free itself, if you look at the igt_spin_free code that I've sent for review I'm checking if it's passed from the igt test or 
> Is it created inside the xe_spin_create, I'm not destroying engine and vm when it's passed from igt test.

So in this case you should destroy it in the test, otherwise it will
dangle when test is done.

--
Zbigniew


> > 
> > > +	put_ahnd(ahnd);
> > > +}
> > > +
> > > +/**
> > > + * TEST: Basic test for spin batch submission.
> > > + *
> > > + * SUBTEST: spin-basic
> > > + * Description: Basic test which validates the functionality of spinner.
> > > + * Run type: FULL
> > > + * TODO: change ``'Run type' == FULL`` to a better category
> > > + *
> > > + */
> > > +static void spin_basic(int fd, struct drm_xe_engine_class_instance
> > > +*hwe) {
> > > +	uint64_t ahnd;
> > > +	igt_spin_t *spin;
> > > +
> > > +	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> > > +	spin = __igt_spin_new(fd, .ahnd = ahnd, .hwe = hwe);
> > > +	igt_assert(spin);
> > > +
> > > +	igt_spin_free(fd, spin);
> > > +	put_ahnd(ahnd);
> > > +}
> > > +
> > > +/**
> > > + * TEST: Test for spin batch submissions.
> > > + * SUBTEST: spin-all
> > > + * Description: Spinner test to run on all the engines!
> > > + * Run type: FULL
> > > + * TODO: change ``'Run type' == FULL`` to a better category
> > > + *
> > > + */
> > > +
> > > +static void spin_all (int fd, int gt, int class) {
> > > +	uint64_t ahnd;
> > > +	uint32_t engines[MAX_INSTANCE];
> > > +	uint32_t vm[MAX_INSTANCE];
> > > +	int i, num_placements = 0;
> > > +	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
> > > +	igt_spin_t *spin[MAX_INSTANCE];
> > > +	struct drm_xe_engine_class_instance *hwe;
> > > +
> > > +	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> > > +
> > > +	xe_for_each_hw_engine(fd, hwe) {
> > > +		if (hwe->engine_class != class || hwe->gt_id != gt)
> > > +			continue;
> > > +		eci[num_placements++] = *hwe;
> > > +	}
> > > +	if (num_placements < 2)
> > > +		return;
> > > +
> > > +	for (i = 0; i < num_placements; i++) {
> > > +		struct drm_xe_engine_create create;
> > > +		vm[i] = xe_vm_create(fd, 0, 0);
> > > +
> > > +		create.vm_id = vm[i];
> > > +		create.width = 1;
> > > +		create.num_placements = num_placements;
> > > +		create.instances = to_user_pointer(eci);
> > > +
> > > +		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_ENGINE_CREATE,
> > > +					&create), 0);
> > > +		engines[i] = create.engine_id;
> > > +		spin[i] = __igt_spin_new(fd, .ahnd = ahnd, .engine = engines[i],
> > .vm = vm[i]);
> > > +	}
> > > +
> > > +	for (i = 0; i < num_placements; i++) {
> > > +		igt_assert(spin[i]);
> > > +		igt_spin_free(fd, spin[i]);
> > > +	}
> > > +	put_ahnd(ahnd);
> > > +}
> > > +
> > > +igt_main
> > > +{
> > > +	struct drm_xe_engine_class_instance *hwe;
> > > +	int fd;
> > > +	int gt, class;
> > > +
> > > +	igt_fixture {
> > > +		fd = drm_open_driver(DRIVER_XE);
> > > +		xe_device_get(fd);
> > > +	}
> > > +
> > > +	igt_subtest("spin-batch")
> > > +		xe_for_each_hw_engine(fd, hwe)
> > > +			spin(fd, hwe);
> > 
> > Test both variants: with engine/vm created in the test and passed via .engine +
> > .vm field and with passing .hwe only. Add also support for ALL_ENGINES flag.
> > 
> I think spin-batch already covers that, it passes both engine and vm to igt_spin_new which are created in the test.
> And spin-basic passes only .hwe to igt_spin_new.
> 
> Thanks,
> Gowtham 
> > --
> > Zbigniew
> > 
> > > +
> > > +	igt_subtest("spin-basic")
> > > +		xe_for_each_hw_engine(fd, hwe)
> > > +			spin_basic(fd, hwe);
> > > +
> > > +	igt_subtest("spin-all") {
> > > +		xe_for_each_gt(fd, gt)
> > > +			xe_for_each_hw_engine_class(class)
> > > +				spin_all(fd, gt, class);
> > > +	}
> > > +
> > > +	igt_fixture {
> > > +		xe_device_put(fd);
> > > +		close(fd);
> > > +	}
> > > +}
> > > --
> > > 2.39.1
> > >
