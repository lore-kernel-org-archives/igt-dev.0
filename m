Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D89310E57A
 for <igt-dev@lists.freedesktop.org>; Wed, 24 May 2023 07:11:44 +0000 (UTC)
Message-ID: <af77b5fa-5991-2790-9b56-c58e03ef261d@intel.com>
Date: Wed, 24 May 2023 12:41:09 +0530
Content-Language: en-US
To: <sai.gowtham.ch@intel.com>, <igt-dev@lists.freedesktop.org>,
 <zbigniew.kempczynski@intel.com>
References: <20230522123605.17416-1-sai.gowtham.ch@intel.com>
 <20230522123605.17416-3-sai.gowtham.ch@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230522123605.17416-3-sai.gowtham.ch@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/xe/xe_spin_batch: Add new
 test to exercise igt_spin_new for xe.
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


On Mon-22-05-2023 06:06 pm, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> xe_spin_batch test exercises basic igt_spin_new submissions and
> and with all engines.
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>   tests/meson.build        |   1 +
>   tests/xe/xe_spin_batch.c | 113 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 114 insertions(+)
>   create mode 100644 tests/xe/xe_spin_batch.c
> 
> diff --git a/tests/meson.build b/tests/meson.build
> index f71be1db..e794b75a 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -268,6 +268,7 @@ xe_progs = [
>   	'xe_query',
>   	'xe_vm',
>   	'xe_waitfence',
> +	'xe_spin_batch',
>   ]
>   
>   msm_progs = [
> diff --git a/tests/xe/xe_spin_batch.c b/tests/xe/xe_spin_batch.c
> new file mode 100644
> index 00000000..55fbca92
> --- /dev/null
> +++ b/tests/xe/xe_spin_batch.c
> @@ -0,0 +1,113 @@
> +#include "igt.h"
> +#include "lib/intel_reg.h"
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +
> +#define MAX_INSTANCE 9
> +/**
> + * TEST: Basic test for spin batch submission.
> + *
> + * SUBTEST: spin-batch
> + * Description: Simple test!
> + * Run type: FULL
> + * TODO: change ``'Run type' == FULL`` to a better category
> + *
> + */
> +
> +static void spin(int fd, struct drm_xe_engine_class_instance *hwe)
> +{
> +	uint64_t ahnd;
> +	unsigned int engine;
> +	uint32_t vm;
> +	igt_spin_t *spin;
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	engine = xe_engine_create(fd, vm, hwe, 0);
> +	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> +
> +	spin = __igt_spin_new(fd, .ahnd = ahnd, .hwe = hwe, .engine = engine, .vm = vm);
> +	igt_assert(spin);
> +
> +	igt_spin_free(fd, spin);
> +	put_ahnd(ahnd);
> +}
> +
> +/**
> + * TEST: Test for spin batch submissions.
> + * SUBTEST: spin-all
> + * Description: Spinner test to run on all the engines!
> + * Run type: FULL
> + * TODO: change ``'Run type' == FULL`` to a better category
> + *
> + */
> +
> +static void spin_all (int fd, int gt, int class)
> +{
> +	uint64_t ahnd;
> +	uint32_t engines[MAX_INSTANCE];
> +	uint32_t vm[MAX_INSTANCE];
> +	int i, num_placements = 0;
> +	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
> +	igt_spin_t *spin[MAX_INSTANCE];
> +	struct drm_xe_engine_class_instance *hwe;
> +
> +	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> +
> +	xe_for_each_hw_engine(fd, hwe) {
> +		if (hwe->engine_class != class || hwe->gt_id != gt)
> +			continue;
> +		eci[num_placements++] = *hwe;
> +	}
> +	if (num_placements < 2)
> +		return;
> +
> +	for (i = 0; i < num_placements; i++) {
> +		struct drm_xe_engine_create create;
> +		vm[i] = xe_vm_create(fd, 0, 0);
> +
> +		create.vm_id = vm[i];
> +		create.width = 1;
> +		create.num_placements = num_placements;
> +		create.instances = to_user_pointer(eci);
> +
> +		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_ENGINE_CREATE,
> +					&create), 0);
> +		engines[i] = create.engine_id;
> +		spin[i] = __igt_spin_new(fd, .ahnd = ahnd, .hwe = eci, .engine = engines[i], .vm = vm[i]);
> +	}
> +
> +	for (i = 0; i < num_placements; i++) {
> +		igt_assert(spin[i]);
> +		igt_spin_free(fd, spin[i]);
> +	}
> +}
> +
> +igt_main
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	int fd;
> +	int gt, class;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_XE);
> +		xe_device_get(fd);
> +	}
> +
> +	igt_subtest("spin-batch")
> +		xe_for_each_hw_engine(fd, hwe)

I think, this loop should be handled inside the xe spin helper (like 
spin_create()). Since KMS also trying to use the same helper & really 
don't care about hardware engines.

- Bhanu

> +			spin(fd, hwe);
> +
> +	igt_subtest("spin-all") {
> +		xe_for_each_gt(fd, gt)
> +			xe_for_each_hw_engine_class(class)
> +				spin_all(fd, gt, class);
> +	}
> +
> +	igt_fixture {
> +		xe_device_put(fd);
> +		close(fd);
> +	}
> +}
> +
> +
