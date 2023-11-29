Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D577610E1B2
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Nov 2023 11:54:37 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>
Date: Wed, 29 Nov 2023 11:54:34 +0000
Message-ID: <MW3PR11MB4748A289C0B4DF02804F1925AE83A@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20231129102628.30848-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20231129102628.30848-1-sai.gowtham.ch@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] intel/xe_exec_store.c: Fix the check
 for num of placements in store_all.
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> sai.gowtham.ch@intel.com
> Sent: Wednesday, November 29, 2023 3:56 PM
> To: igt-dev@lists.freedesktop.org; Ch, Sai Gowtham
> <sai.gowtham.ch@intel.com>
> Subject: [igt-dev] [PATCH i-g-t] intel/xe_exec_store.c: Fix the check for=
 num of
> placements in store_all.
>=20
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>=20
> Adjust the store_all execution with dynamic subtest, so that test will sk=
ip the
> engines with no instances and executes on the engines with instances.
>=20
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_exec_store.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c in=
dex
> 9c14bfd14..95c678bf7 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -245,7 +245,8 @@ static void store_all(int fd, int gt, int class)
>  		eci[num_placements++] =3D *hwe;
>  	}
>=20
> -	igt_require(num_placements);
> +	igt_skip_on_f(!num_placements, "Engine class:%d gt:%d not enabled on
> this platform\n",
> +			class, gt);
>=20
>  	for (i =3D 0; i < num_placements; i++) {
>  		struct drm_xe_exec_queue_create create =3D { @@ -304,10
> +305,13 @@ igt_main
>  	igt_subtest("basic-store")
>  		store(fd);
>=20
> -	igt_subtest("basic-all") {
> +	igt_subtest_with_dynamic("basic-all") {
>  		xe_for_each_gt (fd, gt)
> -			xe_for_each_hw_engine_class(class)
> -				store_all(fd, gt, class);
> +			xe_for_each_hw_engine_class (class) {
The problem here is, test is failing as we are trying to check all the engi=
ne classes on all gt's. Test is skipping in cases where the engine class is=
 not present on a particular engine or an hardware.

Here the correct solution will be using " xe_for_each_hw_engine " instead o=
f using xe_for_each_gt and xe_for_each_hw_engine_class.

xe_for_each_hw_engine internally uses query ioctl to get the existing engin=
es info on a hardware. Each engine id, class, instance , gt id is returned =
which can be used to pass gt and class data to store_all.

JFYI
xe_for_each_gt - iterates over all gt's
xe_for_each_hw_engine_class - loop iterates over all the known engines clas=
ses including the ones which are not present on the GT or on the platform.

By passing only existing engine class info, above check " igt_require(num_p=
lacements)" won't be required.

Thanks,
Rahul
> +				igt_dynamic_f("class-%d", class) {
> +					store_all(fd, gt, class);
> +				}
> +			}
>  	}
>=20
>  	igt_subtest("cachelines")
> --
> 2.39.1
