Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC2510E8AD
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 13:22:41 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Fri, 8 Sep 2023 13:22:37 +0000
Message-ID: <CY5PR11MB6211FABFE7EAB9A5B96F9B2895EDA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230811103217.415744-2-riana.tauro@intel.com>
 <20230905105409.2227832-1-riana.tauro@intel.com>
In-Reply-To: <20230905105409.2227832-1-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/2] tests/xe: Add a test that
 validates idle residency on exec
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Nilawar, Badal" <badal.nilawar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: Tuesday, September 5, 2023 4:24 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>;
> Nilawar, Badal <badal.nilawar@intel.com>; Belgaumkar, Vinay
> <vinay.belgaumkar@intel.com>
> Subject: [PATCH i-g-t v2 1/2] tests/xe: Add a test that validates idle re=
sidency on
> exec
>=20
> Add a test what runs a background load that is active approximately 1% of=
 the
> time. Verify that we do enter
> GT-C6 the rest of the time and validate idle residency is within toleranc=
e.
>=20
> v2: use start and end variables for residency
>     add detailed comment (Badal)
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  tests/intel/xe_pm_residency.c | 140 +++++++++++++++++++++++++++++++++-
>  1 file changed, 137 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.=
c index
> bf8230114..f3b247bf0 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -12,17 +12,20 @@
>   */
>  #include <fcntl.h>
>  #include <limits.h>
> +#include <time.h>
>=20
>  #include "igt.h"
>  #include "igt_device.h"
>  #include "igt_power.h"
>  #include "igt_sysfs.h"
>=20
> +#include "lib/igt_syncobj.h"
> +#include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  #include "xe/xe_util.h"
>=20
>  #define NUM_REPS 16 /* No of Repetitions */ -#define SLEEP_DURATION 3000
> /* in milliseconds */
> +#define SLEEP_DURATION 3 /* in seconds */
>=20
>  const double tolerance =3D 0.1;
>  int fw_handle =3D -1;
> @@ -50,6 +53,11 @@ enum test_type {
>   *		measured over a time interval is within the tolerance
>   * Run type: FULL
>   *
> + * SUBTEST: idle-residency-on-exec
> + * Description: Validate idle residency measured when a background
> + *		load is only active for ~1% of the time
> + * Run type: FULL
> + *
>   * SUBTEST: gt-c6-freeze
>   * Description: Validate idle residency measured over suspend(s2idle)
>   *              is greater than suspend time or within tolerance
> @@ -68,6 +76,94 @@ static void close_fw_handle(int sig)
>  		close(fw_handle);
>  }
>=20
> +static void exec_load(int fd, struct drm_xe_engine_class_instance *hwe,
> +unsigned long *done) {
> +	uint32_t bo =3D 0;
> +	uint32_t exec_queue, syncobj, vm;
> +	uint64_t addr =3D 0x1a0000;
> +	uint64_t batch_addr, batch_offset, data_addr, data_offset;
> +	size_t bo_size;
> +	int b;
> +	struct {
> +		uint32_t batch[16];
> +		uint64_t pad;
> +		uint32_t data;
> +	} *data;
> +
> +	struct drm_xe_sync sync =3D {
> +		.flags =3D DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
> +	};
> +
> +	struct drm_xe_exec exec =3D {
> +		.num_batch_buffer =3D 1,
> +		.num_syncs =3D 1,
> +		.syncs =3D to_user_pointer(&sync),
> +	};
> +
> +	vm =3D xe_vm_create(fd, 0, 0);
> +	exec_queue =3D xe_exec_queue_create(fd, vm, hwe, 0);
> +	bo_size =3D xe_get_default_alignment(fd);
> +
> +	bo =3D xe_bo_create_flags(fd, vm, bo_size,
> +				visible_vram_if_possible(fd, hwe->gt_id));
> +	data =3D xe_bo_map(fd, bo, bo_size);
> +	syncobj =3D syncobj_create(fd, 0);
> +
> +	xe_vm_bind_sync(fd, vm, bo, 0, addr, bo_size);
> +
> +	batch_offset =3D (char *)&data->batch - (char *)data;
> +	batch_addr =3D addr + batch_offset;
> +	data_offset =3D (char *)&data->data - (char *)data;
> +	data_addr =3D addr + data_offset;
> +
> +	/* Aim for ~1% busy */
> +	do {
> +		uint64_t submit, elapsed;
> +		struct timespec tv =3D {};
> +
> +		b =3D 0;
> +		done[1]++;
> +		data->batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
> +		data->batch[b++] =3D data_addr;
> +		data->batch[b++] =3D data_addr >> 32;
> +		data->batch[b++] =3D done[1];
> +		data->batch[b++] =3D MI_BATCH_BUFFER_END;
> +		igt_assert(b <=3D ARRAY_SIZE(data->batch));
> +
> +		exec.exec_queue_id =3D exec_queue;
> +		exec.address =3D batch_addr;
> +		sync.handle =3D syncobj;
> +
> +		igt_nsec_elapsed(&tv);
> +		xe_exec(fd, &exec);
> +		submit =3D igt_nsec_elapsed(&tv);
> +
> +		igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
> +		elapsed =3D igt_nsec_elapsed(&tv);
> +		igt_assert_eq(data->data, done[1]);
> +
> +		igt_debug("Execution took %.3fms (submit %.1fus, wait
> %.1fus)\n",
> +			  1e-6 * elapsed,
> +			  1e-3 * submit,
> +			  1e-3 * (elapsed - submit));
> +
> +		syncobj_reset(fd, &syncobj, 1);
> +
> +		/*
> +		 * Execute the above workload for ~1% of the elapsed time and
> sleep for
> +		 * the rest of the time (~99%)
> +		 */
> +		usleep(elapsed / 10);
> +	} while (!READ_ONCE(*done));
> +
> +	xe_vm_unbind_sync(fd, vm, 0, addr, bo_size);
> +	syncobj_destroy(fd, syncobj);
> +	munmap(data, bo_size);
> +	gem_close(fd, bo);
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>  static unsigned int measured_usleep(unsigned int usec)  {
>  	struct timespec ts =3D { };
> @@ -122,7 +218,7 @@ static void test_idle_residency(int fd, int gt, enum
> test_type flag)
>=20
>  	if (flag =3D=3D TEST_IDLE) {
>  		residency_start =3D read_idle_residency(fd, gt);
> -		elapsed_ms =3D measured_usleep(SLEEP_DURATION * 1000) /
> 1000;
> +		elapsed_ms =3D measured_usleep(SLEEP_DURATION *
> USEC_PER_SEC) / 1000;
>  		residency_end =3D read_idle_residency(fd, gt);
>  	}
>=20
> @@ -132,12 +228,44 @@ static void test_idle_residency(int fd, int gt, enu=
m
> test_type flag)
>  	assert_within_epsilon(residency_end - residency_start, elapsed_ms,
> tolerance);  }
>=20
> +static void idle_residency_on_exec(int fd, struct
> +drm_xe_engine_class_instance *hwe) {
> +	const int tol =3D 20;
> +	unsigned long *done;
> +	unsigned long end, start;
> +	unsigned long elapsed_ms, residency_end, residency_start;
> +
> +	done =3D mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1,
> 0);
> +	igt_assert(done !=3D MAP_FAILED);
> +	memset(done, 0, 4096);
> +
> +	igt_fork(child, 1)
> +		exec_load(fd, hwe, done);
> +
> +	start =3D READ_ONCE(done[1]);
> +	residency_start =3D read_idle_residency(fd, hwe->gt_id);
> +	elapsed_ms =3D measured_usleep(SLEEP_DURATION * USEC_PER_SEC) /
> 1000;
> +	residency_end =3D read_idle_residency(fd, hwe->gt_id);
> +	end =3D READ_ONCE(done[1]);
> +	*done =3D 1;
> +
> +	igt_waitchildren();
> +
> +	/* At least one wakeup/s needed for a reasonable test */
> +	igt_assert(end - start);
> +
> +	/* While very nearly busy, expect full GT C6 */
> +	assert_within_epsilon((residency_end - residency_start), elapsed_ms,
> +tol);
> +
> +	munmap(done, 4096);
> +}
> +
>  static void measure_power(struct igt_power *gpu, double *power)  {
>  	struct power_sample power_sample[2];
>=20
>  	igt_power_get_energy(gpu, &power_sample[0]);
> -	measured_usleep(SLEEP_DURATION * 1000);
> +	measured_usleep(SLEEP_DURATION * USEC_PER_SEC);
>  	igt_power_get_energy(gpu, &power_sample[1]);
>  	*power =3D igt_power_get_mW(gpu, &power_sample[0],
> &power_sample[1]);  } @@ -185,6 +313,7 @@ igt_main
>  	uint32_t d3cold_allowed;
>  	int fd, gt;
>  	char pci_slot_name[NAME_MAX];
> +	struct drm_xe_engine_class_instance *hwe;
>=20
>  	igt_fixture {
>  		fd =3D drm_open_driver(DRIVER_XE);
> @@ -215,6 +344,11 @@ igt_main
>  		xe_for_each_gt(fd, gt)
>  			test_idle_residency(fd, gt, TEST_IDLE);
>=20
> +	igt_describe("Validate idle residency on exec");
> +	igt_subtest("idle-residency-on-exec")
> +		xe_for_each_hw_engine(fd, hwe)
> +			idle_residency_on_exec(fd, hwe);
Are we running this test for each engine ?
It would be better to run for each engine type ?=20
Thanks,
Anshuman.
> +
>  	igt_describe("Toggle GT C states by acquiring/releasing forcewake and
> validate power measured");
>  	igt_subtest("toggle-gt-c6") {
>  		igt_install_exit_handler(close_fw_handle);
> --
> 2.40.0
