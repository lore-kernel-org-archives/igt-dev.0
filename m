Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7973410E086
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jun 2023 18:01:06 +0000 (UTC)
Date: Mon, 5 Jun 2023 20:00:56 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
Message-ID: <20230605180056.m43sxmp4eiak7dn2@zkempczy-mobl2>
References: <20230604195811.9487-1-sai.gowtham.ch@intel.com>
 <20230604195811.9487-3-sai.gowtham.ch@intel.com>
 <20230605104437.2y6c2wj24ldczncu@zkempczy-mobl2>
 <BYAPR11MB3413EB0D4A4E9B6921F0F446D04DA@BYAPR11MB3413.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BYAPR11MB3413EB0D4A4E9B6921F0F446D04DA@BYAPR11MB3413.namprd11.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/xe/xe_spin_batch: Add new
 test to exercise igt_spin_new for xe
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

On Mon, Jun 05, 2023 at 03:24:19PM +0200, Ch, Sai Gowtham wrote:
> 
> 
> > -----Original Message-----
> > From: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>
> > Sent: Monday, June 5, 2023 4:15 PM
> > To: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>
> > Cc: igt-dev@lists.freedesktop.org; Kumar, Janga Rahul
> > <janga.rahul.kumar@intel.com>; kamil.konieczny@linux.intel.com
> > Subject: Re: [PATCH i-g-t 2/2] tests/xe/xe_spin_batch: Add new test to exercise
> > igt_spin_new for xe
> > 
> > On Mon, Jun 05, 2023 at 01:28:11AM +0530, sai.gowtham.ch@intel.com wrote:
> > > From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> > >
> > > xe_spin_batch test exercises igt_spin_new submissions with different
> > > combination.
> > 
> > On DG2:
> > 
> > Starting subtest: spin-all
> > (xe_spin_batch:6866) CRITICAL: Test assertion failure function spin_all, file
> > ../tests/xe/xe_spin_batch.c:123:
> > (xe_spin_batch:6866) CRITICAL: Failed assertion: igt_ioctl(fd, (((2U|1U) <<
> > (((0+8)+8)+14)) | ((('d')) << (0+8)) | (((0x40 + 0x06)) << 0) | ((((sizeof(struct
> > drm_xe_engine_create)))) << ((0+8)+8))), &create) == 0
> > (xe_spin_batch:6866) CRITICAL: Last errno: 22, Invalid argument
> > (xe_spin_batch:6866) CRITICAL: error: -1 != 0 Stack trace:
> >   #0 ../lib/igt_core.c:1963 __igt_fail_assert()
> >   #1 ../tests/xe/xe_spin_batch.c:168 __igt_unique____real_main136()
> >   #2 ../tests/xe/xe_spin_batch.c:136 main()
> >   #3 ../csu/libc-start.c:332 __libc_start_main()
> >   #4 [_start+0x2e]
> > Subtest spin-all failed.
> > **** DEBUG ****
> > (xe_spin_batch:6866) intel_allocator_reloc-DEBUG: Using reloc allocator
> > (xe_spin_batch:6866) CRITICAL: Test assertion failure function spin_all, file
> > ../tests/xe/xe_spin_batch.c:123:
> > (xe_spin_batch:6866) CRITICAL: Failed assertion: igt_ioctl(fd, (((2U|1U) <<
> > (((0+8)+8)+14)) | ((('d')) << (0+8)) | (((0x40 + 0x06)) << 0) | ((((sizeof(struct
> > drm_xe_engine_create)))) << ((0+8)+8))), &create) == 0
> > (xe_spin_batch:6866) CRITICAL: Last errno: 22, Invalid argument
> > (xe_spin_batch:6866) CRITICAL: error: -1 != 0
> > (xe_spin_batch:6866) igt_core-INFO: Stack trace:
> > (xe_spin_batch:6866) igt_core-INFO:   #0 ../lib/igt_core.c:1963
> > __igt_fail_assert()
> > (xe_spin_batch:6866) igt_core-INFO:   #1 ../tests/xe/xe_spin_batch.c:168
> > __igt_unique____real_main136()
> > (xe_spin_batch:6866) igt_core-INFO:   #2 ../tests/xe/xe_spin_batch.c:136 main()
> > (xe_spin_batch:6866) igt_core-INFO:   #3 ../csu/libc-start.c:332
> > __libc_start_main()
> > (xe_spin_batch:6866) igt_core-INFO:   #4 [_start+0x2e]
> > ****  END  ****
> > Subtest spin-all: FAIL (0.014s)
> > 
> > Please check.
> > 
> 
> Strange, Working fine for me.
> 
> gta@DUT051DG2FRD:~/Gowtham/0106/igt-gpu-tools$ sudo ./build/tests/xe_spin_batch
> IGT-Version: 1.27.1-g41db4db7 (x86_64) (Linux: 6.3.0-xe-15052023+ x86_64)
> Opened device: /dev/dri/card0
> Starting subtest: spin-basic
> Subtest spin-basic: SUCCESS (0.008s)
> Starting subtest: spin-batch
> Subtest spin-batch: SUCCESS (0.061s)
> Starting subtest: spin-basic-all
> Subtest spin-basic-all: SUCCESS (0.075s)
> Starting subtest: spin-all
> Subtest spin-all: SUCCESS (0.028s) 
> 

May you run tools/lsgpu?

--
Zbigniew

> ---
> Gowtham
> 
> > --
> > Zbigniew
> > 
> > 
> > >
> > > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> > > ---
> > >  tests/meson.build        |   1 +
> > >  tests/xe/xe_spin_batch.c | 168
> > > +++++++++++++++++++++++++++++++++++++++
> > >  2 files changed, 169 insertions(+)
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
> > > file mode 100644 index 00000000..ac531110
> > > --- /dev/null
> > > +++ b/tests/xe/xe_spin_batch.c
> > > @@ -0,0 +1,168 @@
> > > +#include "igt.h"
> > > +#include "lib/intel_reg.h"
> > > +#include "xe_drm.h"
> > > +#include "xe/xe_ioctl.h"
> > > +#include "xe/xe_query.h"
> > > +
> > > +#define MAX_INSTANCE 9
> > > +
> > > +/**
> > > + * TEST: Basic test for spin batch submissons.
> > > + *
> > > + * SUBTEST: spin-basic
> > > + * Description: Basic test to submit spin batch submissons on copy engine.
> > > + * Run type: FULL
> > > + * TODO: change ``'Run type' == FULL`` to a better category
> > > + *
> > > + */
> > > +
> > > +static void spin_basic(int fd)
> > > +{
> > > +	uint64_t ahnd;
> > > +	igt_spin_t *spin;
> > > +
> > > +	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> > > +	spin = __igt_spin_new(fd, .ahnd = ahnd);
> > > +	igt_assert(spin);
> > > +
> > > +	igt_spin_free(fd, spin);
> > > +	put_ahnd(ahnd);
> > > +}
> > > +
> > > +/**
> > > + * TEST:Test for spin batch submissons.
> > > + *
> > > + * SUBTEST: spin-batch
> > > + * Description: Create vm and engine of hwe class and run the spinner on it.
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
> > > +	spin = igt_spin_new(fd, .ahnd = ahnd, .engine = engine, .vm = vm);
> > > +	igt_assert(spin);
> > > +
> > > +	igt_spin_free(fd, spin);
> > > +	xe_engine_destroy(fd, engine);
> > > +	xe_vm_destroy(fd, vm);
> > > +
> > > +	put_ahnd(ahnd);
> > > +}
> > > +
> > > +/**
> > > + * TEST: Basic test for spin batch submission on all hwe.
> > > + *
> > > + * SUBTEST: spin-basic-all
> > > + * Description: Basic test which validates the functionality of spinner on all
> > hwe.
> > > + * Run type: FULL
> > > + * TODO: change ``'Run type' == FULL`` to a better category
> > > + *
> > > + */
> > > +static void spin_basic_all(int fd, struct
> > > +drm_xe_engine_class_instance *hwe) {
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
> > > +	igt_subtest("spin-basic")
> > > +		spin_basic(fd);
> > > +
> > > +	igt_subtest("spin-batch")
> > > +		xe_for_each_hw_engine(fd, hwe)
> > > +			spin(fd, hwe);
> > > +
> > > +	igt_subtest("spin-basic-all")
> > > +		xe_for_each_hw_engine(fd, hwe)
> > > +			spin_basic_all(fd, hwe);
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
