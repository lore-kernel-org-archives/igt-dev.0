Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27E910E1CC
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 10:49:11 +0000 (UTC)
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Mon, 26 Jun 2023 10:49:06 +0000
Message-ID: <SJ1PR11MB62048E414F00172E33C120F58126A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230623114946.3803540-1-himal.prasad.ghimiray@intel.com>
 <20230623114946.3803540-4-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230623114946.3803540-4-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2 3/4] tests/xe/xe_guc_pc: Change the sysfs
 paths
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
> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Sent: Friday, June 23, 2023 5:20 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Iddamsetty,
> Aravind <aravind.iddamsetty@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Kamil Konieczny
> <kamil.konieczny@linux.intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Gupta,
> Anshuman <anshuman.gupta@intel.com>
> Subject: [PATCH v2 3/4] tests/xe/xe_guc_pc: Change the sysfs paths
>=20
> Changes to access sysfs entries under tile directory.
> Access freq sysfs from /sys/class/drm/cardX/device/tileN/gtN
> path.
>=20
> v2:
> - Use snprintf instead of sprintf and check error.
> - Describe what changes are done. (Kamil)
>=20
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Upadhyay <tejas.upadhyay@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  tests/xe/xe_guc_pc.c | 202 ++++++++++++++++++++++---------------------
>  1 file changed, 102 insertions(+), 100 deletions(-)
>=20
> diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c index
> 5c71ae14..825b2c5b 100644
> --- a/tests/xe/xe_guc_pc.c
> +++ b/tests/xe/xe_guc_pc.c
> @@ -133,23 +133,25 @@ static void exec_basic(int fd, struct
> drm_xe_engine_class_instance *eci,
>  	xe_vm_destroy(fd, vm);
>  }
>=20
> -static int set_freq(int sysfs, int gt_id, const char *freq_name, uint32_=
t freq)
> +static int set_freq(int sysfs, int tile_id, int gt_id, const char
> +*freq_name, uint32_t freq)
>  {
>  	int ret =3D -EAGAIN;
>  	char path[32];
>=20
> -	sprintf(path, "device/gt%d/freq_%s", gt_id, freq_name);
> +	igt_assert(snprintf(path, sizeof(path), "device/tile%d/gt%d/freq_%s",
> +			    tile_id, gt_id, freq_name) < sizeof(path));
>  	while (ret =3D=3D -EAGAIN)
>  		ret =3D igt_sysfs_printf(sysfs, path, "%u", freq);
>  	return ret;
>  }
>=20
> -static uint32_t get_freq(int sysfs, int gt_id, const char *freq_name)
> +static uint32_t get_freq(int sysfs, int tile_id, int gt_id, const char
> +*freq_name)
>  {
>  	uint32_t freq;
>  	int err =3D -EAGAIN;
>  	char path[32];
> -	sprintf(path, "device/gt%d/freq_%s", gt_id, freq_name);
> +	igt_assert(snprintf(path, sizeof(path), "device/tile%d/gt%d/freq_%s",
> +			    tile_id, gt_id, freq_name) < sizeof(path));
>  	while (err =3D=3D -EAGAIN)
>  		err =3D igt_sysfs_scanf(sysfs, path, "%u", &freq);
>  	return freq;
> @@ -162,37 +164,37 @@ static uint32_t get_freq(int sysfs, int gt_id, cons=
t
> char *freq_name)
>   * Run type: BAT
>   */
>=20
> -static void test_freq_basic_api(int sysfs, int gt_id)
> +static void test_freq_basic_api(int sysfs, int tile_id, int gt_id)
>  {
> -	uint32_t rpn =3D get_freq(sysfs, gt_id, "rpn");
> -	uint32_t rpe =3D get_freq(sysfs, gt_id, "rpe");
> -	uint32_t rp0 =3D get_freq(sysfs, gt_id, "rp0");
> +	uint32_t rpn =3D get_freq(sysfs, tile_id, gt_id, "rpn");
> +	uint32_t rpe =3D get_freq(sysfs, tile_id, gt_id, "rpe");
> +	uint32_t rp0 =3D get_freq(sysfs, tile_id, gt_id, "rp0");
>=20
>  	/*
>  	 * Negative bound tests
>  	 * RPn is the floor
>  	 * RP0 is the ceiling
>  	 */
> -	igt_assert(set_freq(sysfs, gt_id, "min", rpn - 1) < 0);
> -	igt_assert(set_freq(sysfs, gt_id, "min", rp0 + 1) < 0);
> -	igt_assert(set_freq(sysfs, gt_id, "max", rpn - 1) < 0);
> -	igt_assert(set_freq(sysfs, gt_id, "max", rp0 + 1) < 0);
> +	igt_assert(set_freq(sysfs, tile_id, gt_id, "min", rpn - 1) < 0);
> +	igt_assert(set_freq(sysfs, tile_id, gt_id, "min", rp0 + 1) < 0);
> +	igt_assert(set_freq(sysfs, tile_id, gt_id, "max", rpn - 1) < 0);
> +	igt_assert(set_freq(sysfs, tile_id, gt_id, "max", rp0 + 1) < 0);
>=20
>  	/* Assert min requests are respected from rp0 to rpn */
> -	igt_assert(set_freq(sysfs, gt_id, "min", rp0) > 0);
> -	igt_assert(get_freq(sysfs, gt_id, "min") =3D=3D rp0);
> -	igt_assert(set_freq(sysfs, gt_id, "min", rpe) > 0);
> -	igt_assert(get_freq(sysfs, gt_id, "min") =3D=3D rpe);
> -	igt_assert(set_freq(sysfs, gt_id, "min", rpn) > 0);
> -	igt_assert(get_freq(sysfs, gt_id, "min") =3D=3D rpn);
> +	igt_assert(set_freq(sysfs, tile_id, gt_id, "min", rp0) > 0);
> +	igt_assert(get_freq(sysfs, tile_id, gt_id, "min") =3D=3D rp0);
> +	igt_assert(set_freq(sysfs, tile_id, gt_id, "min", rpe) > 0);
> +	igt_assert(get_freq(sysfs, tile_id, gt_id, "min") =3D=3D rpe);
> +	igt_assert(set_freq(sysfs, tile_id, gt_id, "min", rpn) > 0);
> +	igt_assert(get_freq(sysfs, tile_id, gt_id, "min") =3D=3D rpn);
>=20
>  	/* Assert max requests are respected from rpn to rp0 */
> -	igt_assert(set_freq(sysfs, gt_id, "max", rpn) > 0);
> -	igt_assert(get_freq(sysfs, gt_id, "max") =3D=3D rpn);
> -	igt_assert(set_freq(sysfs, gt_id, "max", rpe) > 0);
> -	igt_assert(get_freq(sysfs, gt_id, "max") =3D=3D rpe);
> -	igt_assert(set_freq(sysfs, gt_id, "max", rp0) > 0);
> -	igt_assert(get_freq(sysfs, gt_id, "max") =3D=3D rp0);
> +	igt_assert(set_freq(sysfs, tile_id, gt_id, "max", rpn) > 0);
> +	igt_assert(get_freq(sysfs, tile_id, gt_id, "max") =3D=3D rpn);
> +	igt_assert(set_freq(sysfs, tile_id, gt_id, "max", rpe) > 0);
> +	igt_assert(get_freq(sysfs, tile_id, gt_id, "max") =3D=3D rpe);
> +	igt_assert(set_freq(sysfs, tile_id, gt_id, "max", rp0) > 0);
> +	igt_assert(get_freq(sysfs, tile_id, gt_id, "max") =3D=3D rp0);
>  }
>=20
>  /**
> @@ -206,11 +208,11 @@ static void test_freq_basic_api(int sysfs, int gt_i=
d)
>   * TODO: change ``'Run type' =3D=3D FULL`` to a better category
>   */
>=20
> -static void test_freq_fixed(int sysfs, int gt_id)
> +static void test_freq_fixed(int sysfs, int tile_id, int gt_id)
>  {
> -	uint32_t rpn =3D get_freq(sysfs, gt_id, "rpn");
> -	uint32_t rpe =3D get_freq(sysfs, gt_id, "rpe");
> -	uint32_t rp0 =3D get_freq(sysfs, gt_id, "rp0");
> +	uint32_t rpn =3D get_freq(sysfs, tile_id, gt_id, "rpn");
> +	uint32_t rpe =3D get_freq(sysfs, tile_id, gt_id, "rpe");
> +	uint32_t rp0 =3D get_freq(sysfs, tile_id, gt_id, "rp0");
>=20
>  	igt_debug("Starting testing fixed request\n");
>=20
> @@ -219,27 +221,27 @@ static void test_freq_fixed(int sysfs, int gt_id)
>  	 * Then we check if hardware is actually operating at the desired freq
>  	 * And let's do this for all the 3 known Render Performance (RP)
> values.
>  	 */
> -	igt_assert(set_freq(sysfs, gt_id, "min", rpn) > 0);
> -	igt_assert(set_freq(sysfs, gt_id, "max", rpn) > 0);
> +	igt_assert(set_freq(sysfs, tile_id, gt_id, "min", rpn) > 0);
> +	igt_assert(set_freq(sysfs, tile_id, gt_id, "max", rpn) > 0);
>  	usleep(ACT_FREQ_LATENCY_US);
> -	igt_assert(get_freq(sysfs, gt_id, "cur") =3D=3D rpn);
> -	igt_assert(get_freq(sysfs, gt_id, "act") =3D=3D rpn);
> +	igt_assert(get_freq(sysfs, tile_id, gt_id, "cur") =3D=3D rpn);
> +	igt_assert(get_freq(sysfs, tile_id, gt_id, "act") =3D=3D rpn);
>=20
> -	igt_assert(set_freq(sysfs, gt_id, "min", rpe) > 0);
> -	igt_assert(set_freq(sysfs, gt_id, "max", rpe) > 0);
> +	igt_assert(set_freq(sysfs, tile_id, gt_id, "min", rpe) > 0);
> +	igt_assert(set_freq(sysfs, tile_id, gt_id, "max", rpe) > 0);
>  	usleep(ACT_FREQ_LATENCY_US);
> -	igt_assert(get_freq(sysfs, gt_id, "cur") =3D=3D rpe);
> -	igt_assert(get_freq(sysfs, gt_id, "act") =3D=3D rpe);
> +	igt_assert(get_freq(sysfs, tile_id, gt_id, "cur") =3D=3D rpe);
> +	igt_assert(get_freq(sysfs, tile_id, gt_id, "act") =3D=3D rpe);
>=20
> -	igt_assert(set_freq(sysfs, gt_id, "min", rp0) > 0);
> -	igt_assert(set_freq(sysfs, gt_id, "max", rp0) > 0);
> +	igt_assert(set_freq(sysfs, tile_id, gt_id, "min", rp0) > 0);
> +	igt_assert(set_freq(sysfs, tile_id, gt_id, "max", rp0) > 0);
>  	usleep(ACT_FREQ_LATENCY_US);
>  	/*
>  	 * It is unlikely that PCODE will *always* respect any request above
> RPe
>  	 * So for this level let's only check if GuC PC is doing its job
>  	 * and respecting our request, by propagating it to the hardware.
>  	 */
> -	igt_assert(get_freq(sysfs, gt_id, "cur") =3D=3D rp0);
> +	igt_assert(get_freq(sysfs, tile_id, gt_id, "cur") =3D=3D rp0);
>=20
>  	igt_debug("Finished testing fixed request\n");  } @@ -255,20 +257,20
> @@ static void test_freq_fixed(int sysfs, int gt_id)
>   * TODO: change ``'Run type' =3D=3D FULL`` to a better category
>   */
>=20
> -static void test_freq_range(int sysfs, int gt_id)
> +static void test_freq_range(int sysfs, int tile_id, int gt_id)
>  {
> -	uint32_t rpn =3D get_freq(sysfs, gt_id, "rpn");
> -	uint32_t rpe =3D get_freq(sysfs, gt_id, "rpe");
> +	uint32_t rpn =3D get_freq(sysfs, tile_id, gt_id, "rpn");
> +	uint32_t rpe =3D get_freq(sysfs, tile_id, gt_id, "rpe");
>  	uint32_t cur, act;
>=20
>  	igt_debug("Starting testing range request\n");
>=20
> -	igt_assert(set_freq(sysfs, gt_id, "min", rpn) > 0);
> -	igt_assert(set_freq(sysfs, gt_id, "max", rpe) > 0);
> +	igt_assert(set_freq(sysfs, tile_id, gt_id, "min", rpn) > 0);
> +	igt_assert(set_freq(sysfs, tile_id, gt_id, "max", rpe) > 0);
>  	usleep(ACT_FREQ_LATENCY_US);
> -	cur =3D get_freq(sysfs, gt_id, "cur");
> +	cur =3D get_freq(sysfs, tile_id, gt_id, "cur");
>  	igt_assert(rpn <=3D cur && cur <=3D rpe);
> -	act =3D get_freq(sysfs, gt_id, "act");
> +	act =3D get_freq(sysfs, tile_id, gt_id, "act");
>  	igt_assert(rpn <=3D act && act <=3D rpe);
>=20
>  	igt_debug("Finished testing range request\n"); @@ -281,20 +283,20
> @@ static void test_freq_range(int sysfs, int gt_id)
>   * TODO: change ``'Run type' =3D=3D FULL`` to a better category
>   */
>=20
> -static void test_freq_low_max(int sysfs, int gt_id)
> +static void test_freq_low_max(int sysfs, int tile_id, int gt_id)
>  {
> -	uint32_t rpn =3D get_freq(sysfs, gt_id, "rpn");
> -	uint32_t rpe =3D get_freq(sysfs, gt_id, "rpe");
> +	uint32_t rpn =3D get_freq(sysfs, tile_id, gt_id, "rpn");
> +	uint32_t rpe =3D get_freq(sysfs, tile_id, gt_id, "rpe");
>=20
>  	/*
>  	 *  When max request < min request, max is ignored and min works
> like
>  	 * a fixed one. Let's assert this assumption
>  	 */
> -	igt_assert(set_freq(sysfs, gt_id, "min", rpe) > 0);
> -	igt_assert(set_freq(sysfs, gt_id, "max", rpn) > 0);
> +	igt_assert(set_freq(sysfs, tile_id, gt_id, "min", rpe) > 0);
> +	igt_assert(set_freq(sysfs, tile_id, gt_id, "max", rpn) > 0);
>  	usleep(ACT_FREQ_LATENCY_US);
> -	igt_assert(get_freq(sysfs, gt_id, "cur") =3D=3D rpe);
> -	igt_assert(get_freq(sysfs, gt_id, "act") =3D=3D rpe);
> +	igt_assert(get_freq(sysfs, tile_id, gt_id, "cur") =3D=3D rpe);
> +	igt_assert(get_freq(sysfs, tile_id, gt_id, "act") =3D=3D rpe);
>  }
>=20
>  /**
> @@ -304,20 +306,20 @@ static void test_freq_low_max(int sysfs, int gt_id)
>   * TODO: change ``'Run type' =3D=3D FULL`` to a better category
>   */
>=20
> -static void test_suspend(int sysfs, int gt_id)
> +static void test_suspend(int sysfs, int tile_id, int gt_id)
>  {
> -	uint32_t rpn =3D get_freq(sysfs, gt_id, "rpn");
> +	uint32_t rpn =3D get_freq(sysfs, tile_id, gt_id, "rpn");
>=20
> -	igt_assert(set_freq(sysfs, gt_id, "min", rpn) > 0);
> -	igt_assert(set_freq(sysfs, gt_id, "max", rpn) > 0);
> +	igt_assert(set_freq(sysfs, tile_id, gt_id, "min", rpn) > 0);
> +	igt_assert(set_freq(sysfs, tile_id, gt_id, "max", rpn) > 0);
>  	usleep(ACT_FREQ_LATENCY_US);
> -	igt_assert(get_freq(sysfs, gt_id, "cur") =3D=3D rpn);
> +	igt_assert(get_freq(sysfs, tile_id, gt_id, "cur") =3D=3D rpn);
>=20
>  	igt_system_suspend_autoresume(SUSPEND_STATE_S3,
>  				      SUSPEND_TEST_NONE);
>=20
> -	igt_assert(get_freq(sysfs, gt_id, "min") =3D=3D rpn);
> -	igt_assert(get_freq(sysfs, gt_id, "max") =3D=3D rpn);
> +	igt_assert(get_freq(sysfs, tile_id, gt_id, "min") =3D=3D rpn);
> +	igt_assert(get_freq(sysfs, tile_id, gt_id, "max") =3D=3D rpn);
>  }
>=20
>  /**
> @@ -332,24 +334,24 @@ static void test_suspend(int sysfs, int gt_id)
>   * TODO: change ``'Run type' =3D=3D FULL`` to a better category
>   */
>=20
> -static void test_reset(int fd, int sysfs, int gt_id, int cycles)
> +static void test_reset(int fd, int sysfs, int tile_id, int gt_id, int
> +cycles)
>  {
> -	uint32_t rpn =3D get_freq(sysfs, gt_id, "rpn");
> +	uint32_t rpn =3D get_freq(sysfs, tile_id, gt_id, "rpn");
>=20
>  	for (int i =3D 0; i < cycles; i++) {
> -		igt_assert_f(set_freq(sysfs, gt_id, "min", rpn) > 0,
> +		igt_assert_f(set_freq(sysfs, tile_id, gt_id, "min", rpn) > 0,
>  			     "Failed after %d good cycles\n", i);
> -		igt_assert_f(set_freq(sysfs, gt_id, "max", rpn) > 0,
> +		igt_assert_f(set_freq(sysfs, tile_id, gt_id, "max", rpn) > 0,
>  			     "Failed after %d good cycles\n", i);
>  		usleep(ACT_FREQ_LATENCY_US);
> -		igt_assert_f(get_freq(sysfs, gt_id, "cur") =3D=3D rpn,
> +		igt_assert_f(get_freq(sysfs, tile_id, gt_id, "cur") =3D=3D rpn,
>  			     "Failed after %d good cycles\n", i);
>=20
>  		xe_force_gt_reset(fd, gt_id);
>=20
> -		igt_assert_f(get_freq(sysfs, gt_id, "min") =3D=3D rpn,
> +		igt_assert_f(get_freq(sysfs, tile_id, gt_id, "min") =3D=3D rpn,
>  			     "Failed after %d good cycles\n", i);
> -		igt_assert_f(get_freq(sysfs, gt_id, "max") =3D=3D rpn,
> +		igt_assert_f(get_freq(sysfs, tile_id, gt_id, "max") =3D=3D rpn,
>  			     "Failed after %d good cycles\n", i);
>  	}
>  }
> @@ -365,11 +367,11 @@ static void test_reset(int fd, int sysfs, int gt_id=
, int
> cycles)
>   * Run type: BAT
>   */
>=20
> -static bool in_rc6(int sysfs, int gt_id)
> +static bool in_rc6(int sysfs, int tile_id, int gt_id)
>  {
> -	char path[32];
> +	char path[40];
>  	char rc[8];
> -	sprintf(path, "device/gt%d/rc_status", gt_id);
> +	sprintf(path, "device/tile%d/gt%d/rc_status", tile_id, gt_id);
>  	if (igt_sysfs_scanf(sysfs, path, "%s", rc) < 0)
>  		return false;
>  	return strcmp(rc, "rc6") =3D=3D 0;
> @@ -379,7 +381,7 @@ igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe;
>  	int fd;
> -	int gt;
> +	int gt, tile, total_tiles;
>  	static int sysfs =3D -1;
>  	int ncpus =3D sysconf(_SC_NPROCESSORS_ONLN);
>  	uint32_t stash_min;
> @@ -392,24 +394,24 @@ igt_main
>  		sysfs =3D igt_sysfs_open(fd);
>  		igt_assert(sysfs !=3D -1);
>=20
> -		/* The defaults are the same. Stashing the gt0 is enough */
> -		stash_min =3D get_freq(sysfs, 0, "min");
> -		stash_max =3D get_freq(sysfs, 0, "max");
> +		/* The defaults are the same. Stashing the gt0 in tile0 is
> enough */
> +		stash_min =3D get_freq(sysfs, 0, 0, "min");
> +		stash_max =3D get_freq(sysfs, 0, 0, "max");
>  	}
>=20
>  	igt_subtest("freq_basic_api") {
> -		xe_for_each_gt(fd, gt)
> -			test_freq_basic_api(sysfs, gt);
> +		xe_for_each_gt_under_each_tile(fd, gt, tile, total_tiles)
> +			test_freq_basic_api(sysfs, tile, gt);
>  	}
>=20
>  	igt_subtest("freq_fixed_idle") {
> -		xe_for_each_gt(fd, gt) {
> -			test_freq_fixed(sysfs, gt);
> +		xe_for_each_gt_under_each_tile(fd, gt, tile, total_tiles) {
> +			test_freq_fixed(sysfs, tile, gt);
>  		}
>  	}
>=20
>  	igt_subtest("freq_fixed_exec") {
> -		xe_for_each_gt(fd, gt) {
> +		xe_for_each_gt_under_each_tile(fd, gt, tile, total_tiles) {
>  			xe_for_each_hw_engine(fd, hwe)
>  				igt_fork(child, ncpus) {
>  					igt_debug("Execution Started\n");
> @@ -417,19 +419,19 @@ igt_main
>  					igt_debug("Execution Finished\n");
>  				}
>  			/* While exec in threads above, let's check the freq */
> -			test_freq_fixed(sysfs, gt);
> +			test_freq_fixed(sysfs, tile, gt);
>  			igt_waitchildren();
>  		}
>  	}
>=20
>  	igt_subtest("freq_range_idle") {
> -		xe_for_each_gt(fd, gt) {
> -			test_freq_range(sysfs, gt);
> +		xe_for_each_gt_under_each_tile(fd, gt, tile, total_tiles) {
> +			test_freq_range(sysfs, tile, gt);
>  		}
>  	}
>=20
>  	igt_subtest("freq_range_exec") {
> -		xe_for_each_gt(fd, gt) {
> +		xe_for_each_gt_under_each_tile(fd, gt, tile, total_tiles) {
>  			xe_for_each_hw_engine(fd, hwe)
>  				igt_fork(child, ncpus) {
>  					igt_debug("Execution Started\n");
> @@ -437,46 +439,46 @@ igt_main
>  					igt_debug("Execution Finished\n");
>  				}
>  			/* While exec in threads above, let's check the freq */
> -			test_freq_range(sysfs, gt);
> +			test_freq_range(sysfs, tile, gt);
>  			igt_waitchildren();
>  		}
>  	}
>=20
>  	igt_subtest("freq_low_max") {
> -		xe_for_each_gt(fd, gt) {
> -			test_freq_low_max(sysfs, gt);
> +		xe_for_each_gt_under_each_tile(fd, gt, tile, total_tiles) {
> +			test_freq_low_max(sysfs, tile, gt);
>  		}
>  	}
>=20
>  	igt_subtest("freq_suspend") {
> -		xe_for_each_gt(fd, gt) {
> -			test_suspend(sysfs, gt);
> +		xe_for_each_gt_under_each_tile(fd, gt, tile, total_tiles) {
> +			test_suspend(sysfs, tile, gt);
>  		}
>  	}
>=20
>  	igt_subtest("freq_reset") {
> -		xe_for_each_gt(fd, gt) {
> -			test_reset(fd, sysfs, gt, 1);
> +		xe_for_each_gt_under_each_tile(fd, gt, tile, total_tiles) {
> +			test_reset(fd, sysfs, tile, gt, 1);
>  		}
>  	}
>=20
>  	igt_subtest("freq_reset_multiple") {
> -		xe_for_each_gt(fd, gt) {
> -			test_reset(fd, sysfs, gt, 50);
> +		xe_for_each_gt_under_each_tile(fd, gt, tile, total_tiles) {
> +			test_reset(fd, sysfs, tile, gt, 50);
>  		}
>  	}
>=20
>  	igt_subtest("rc6_on_idle") {
>  		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
> -		xe_for_each_gt(fd, gt) {
> -			assert(igt_wait(in_rc6(sysfs, gt), 1000, 1));
> +		xe_for_each_gt_under_each_tile(fd, gt, tile, total_tiles) {
> +			assert(igt_wait(in_rc6(sysfs, tile, gt), 1000, 1));
>  		}
>  	}
>=20
>  	igt_subtest("rc0_on_exec") {
>  		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
> -		xe_for_each_gt(fd, gt) {
> -			assert(igt_wait(in_rc6(sysfs, gt), 1000, 1));
> +		xe_for_each_gt_under_each_tile(fd, gt, tile, total_tiles) {
> +			assert(igt_wait(in_rc6(sysfs, tile, gt), 1000, 1));
>  			xe_for_each_hw_engine(fd, hwe)
>  				igt_fork(child, ncpus) {
>  					igt_debug("Execution Started\n");
> @@ -484,15 +486,15 @@ igt_main
>  					igt_debug("Execution Finished\n");
>  				}
>  			/* While exec in threads above, let's check rc_status
> */
> -			assert(igt_wait(!in_rc6(sysfs, gt), 1000, 1));
> +			assert(igt_wait(!in_rc6(sysfs, tile, gt), 1000, 1));
>  			igt_waitchildren();
>  		}
>  	}
>=20
>  	igt_fixture {
> -		xe_for_each_gt(fd, gt) {
> -			set_freq(sysfs, gt, "min", stash_min);
> -			set_freq(sysfs, gt, "max", stash_max);
> +		xe_for_each_gt_under_each_tile(fd, gt, tile, total_tiles) {
> +			set_freq(sysfs, tile, gt, "min", stash_min);
> +			set_freq(sysfs, tile, gt, "max", stash_max);

This is needed to address regressions, when KMD patch merges. Thanks.

Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>  		}
>  		close(sysfs);
>  		xe_device_put(fd);
> --
> 2.25.1
