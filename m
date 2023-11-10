Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231FB10E656
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Nov 2023 05:40:18 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Fri, 10 Nov 2023 05:40:13 +0000
Message-ID: <MW3PR11MB47481C86FBF848C0D81FCE52AEAEA@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20231110052746.2131907-1-priyanka.dandamudi@intel.com>
 <20231110052746.2131907-3-priyanka.dandamudi@intel.com>
In-Reply-To: <20231110052746.2131907-3-priyanka.dandamudi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/intel/xe_exec_queue_property:
 Add scheduler exec queue set property
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



> -----Original Message-----
> From: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Sent: Friday, November 10, 2023 10:58 AM
> To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; Kumar, Janga
> Rahul <janga.rahul.kumar@intel.com>; igt-dev@lists.freedesktop.org
> Subject: [PATCH i-g-t 2/2] tests/intel/xe_exec_queue_property: Add
> scheduler exec queue set property
>=20
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
> Added tests to check scheduler exec queue set properties.
> Schedulers inclcude job timeout, preempt timeout and timeslice.
>=20
> v2: Moved sysfs related fixture code to subtest group.(Rahul)
>=20
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

LGTM,
Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  tests/intel/xe_exec_queue_property.c | 90 +++++++++++++++++++++++++++-
>  1 file changed, 89 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_exec_queue_property.c
> b/tests/intel/xe_exec_queue_property.c
> index f61ab1a19..4e32aefa5 100644
> --- a/tests/intel/xe_exec_queue_property.c
> +++ b/tests/intel/xe_exec_queue_property.c
> @@ -13,6 +13,14 @@
>   * Description: tests basic priority property by setting invalid values =
and
> positive values.
>   * SUBTEST: persistence-set-property
>   * Description: tests basic persistence property by setting positive val=
ues
> + * SUBTEST: %s-property-min-max
> + * Description: Test to check if %s arg[1] schedule parameter checks for=
 min
> max values.
> + *
> + * arg[1]:
> + *
> + * @preempt_timeout_us:		preempt timeout us
> + * @timeslice_duration_us:	timeslice duration us
> + * @job_timeout_ms:		job timeout ms
>   */
>=20
>  #include <dirent.h>
> @@ -22,15 +30,28 @@
>  #include <sys/types.h>
>=20
>  #include "igt.h"
> -#include "xe_drm.h"
> +#include "igt_sysfs.h"
>  #include "lib/igt_syncobj.h"
>  #include "lib/intel_reg.h"
> +#include "xe_drm.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>=20
>  #define DRM_SCHED_PRIORITY_HIGH  2
>  #define DRM_SCHED_PRIORITY_NORMAL 1
>=20
> +static int get_property_name(const char *property) {
> +	if (strstr(property, "preempt"))
> +		return
> XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT;
> +	else if (strstr(property, "job_timeout"))
> +		return XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT;
> +	else if (strstr(property, "timeslice"))
> +		return XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE;
> +	else
> +		return -1;
> +}
> +
>  static void test_set_property(int xe, int property_name,
>  			      int property_value, int err_val)  { @@ -60,9
> +81,48 @@ static void test_set_property(int xe, int property_name,
>  	igt_assert_eq(ret, err_val);
>  }
>=20
> +static void test_property_min_max(int xe, int engine, const char
> +**property) {
> +	unsigned int max;
> +	unsigned int min;
> +	unsigned int set;
> +	int property_name;
> +	int defaults;
> +
> +	defaults =3D openat(engine, ".defaults", O_DIRECTORY);
> +	igt_require(defaults !=3D -1);
> +
> +	igt_sysfs_scanf(defaults, property[2], "%u", &max);
> +	igt_sysfs_scanf(defaults, property[1], "%u", &min);
> +	igt_sysfs_scanf(engine, property[0], "%u", &set);
> +
> +	property_name =3D get_property_name(property[0]);
> +	igt_assert_neq(property_name, -1);
> +
> +	/* Tests scheduler properties by setting positive values */
> +	test_set_property(xe, property_name, max, 0);
> +	test_set_property(xe, property_name, min, 0);
> +
> +	/* Tests scheduler properties by setting invalid values */
> +	test_set_property(xe, property_name, max + 1, -EINVAL);
> +	test_set_property(xe, property_name, min - 1, -EINVAL); }
> +
>  igt_main
>  {
> +	static const struct {
> +		const char *name;
> +		void (*fn)(int, int, const char **);
> +	} tests[] =3D {{"property-min-max", test_property_min_max}, {} };
> +
> +	const char *property[][3] =3D { {"preempt_timeout_us",
> "preempt_timeout_min", "preempt_timeout_max"},
> +				      {"timeslice_duration_us",
> "timeslice_duration_min", "timeslice_duration_max"},
> +				      {"job_timeout_ms", "job_timeout_min",
> "job_timeout_max"},
> +	};
> +	int count =3D sizeof(property) / sizeof(property[0]);
> +	int sys_fd;
>  	int xe;
> +	int gt;
>=20
>  	igt_fixture {
>  		xe =3D drm_open_driver(DRIVER_XE);
> @@ -94,6 +154,34 @@ igt_main
>=20
>  	}
>=20
> +	igt_subtest_group {
> +		igt_fixture {
> +			sys_fd =3D igt_sysfs_open(xe);
> +			igt_require(sys_fd !=3D -1);
> +			close(sys_fd);
> +		}
> +
> +		for (int i =3D 0; i < count; i++) {
> +			for (typeof(*tests) *t =3D tests; t->name; t++) {
> +				igt_subtest_with_dynamic_f("%s-%s",
> property[i][0], t->name) {
> +					xe_for_each_gt(xe, gt) {
> +						int engines_fd =3D -1;
> +						int gt_fd =3D -1;
> +
> +						gt_fd =3D xe_sysfs_gt_open(xe,
> gt);
> +						igt_require(gt_fd !=3D -1);
> +						engines_fd =3D openat(gt_fd,
> "engines", O_RDONLY);
> +						igt_require(engines_fd !=3D -1);
> +
> +						igt_sysfs_engines(xe,
> engines_fd, property[i], t->fn);
> +						close(engines_fd);
> +						close(gt_fd);
> +					}
> +				}
> +			}
> +		}
> +	}
> +
>  	igt_fixture {
>  		xe_device_put(xe);
>  		drm_close_driver(xe);
> --
> 2.25.1
