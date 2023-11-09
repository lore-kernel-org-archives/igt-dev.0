Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86D010E1E6
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 08:22:46 +0000 (UTC)
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Thu, 9 Nov 2023 08:22:42 +0000
Message-ID: <BL0PR11MB3475A2CB0F29C7203815E064D9AFA@BL0PR11MB3475.namprd11.prod.outlook.com>
References: <20231103160148.94811-1-kamil.konieczny@linux.intel.com>
 <20231103160148.94811-4-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231103160148.94811-4-kamil.konieczny@linux.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 3/3] tests/intel/xe_create: add
 multi-GPU basic test
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

Acked-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kamil
> Konieczny
> Sent: Friday, November 3, 2023 5:02 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t v2 3/3] tests/intel/xe_create: add multi-=
GPU
> basic test
>=20
> Add basic multi-GPU test using drm filtered helpers.
>=20
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>=20
> ---
> v2: use new helper
> ---
>  tests/intel/xe_create.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c index
> d99bd51cf..ac5418ef2 100644
> --- a/tests/intel/xe_create.c
> +++ b/tests/intel/xe_create.c
> @@ -191,6 +191,13 @@ static void create_execqueues(int fd, enum
> exec_queue_destroy ed)
>   * Test category: functionality test
>   * Description: Verifies xe bo create returns expected error code on mas=
sive
>   *              buffer sizes.
> + *
> + * SUBTEST: multigpu-create-massive-size
> + * Functionality: ioctl
> + * Test category: functionality test
> + * Feature: multigpu
> + * Description: Verifies xe bo create with massive buffer sizes runs cor=
rectly
> + *		on two or more GPUs.
>   */
>  static void create_massive_size(int fd)  { @@ -228,6 +235,25 @@ igt_main
>  		create_massive_size(xe);
>  	}
>=20
> +	igt_subtest("multigpu-create-massive-size") {
> +		int gpu_count =3D drm_prepare_filtered_multigpu(DRIVER_XE);
> +
> +		igt_require(xe > 0);
> +		igt_require(gpu_count >=3D 2);
> +		igt_multi_fork(child, gpu_count) {
> +			int gpu_fd;
> +
> +			gpu_fd =3D drm_open_filtered_card(child);
> +			igt_assert_f(gpu_fd > 0, "cannot open gpu-%d,
> errno=3D%d\n", child, errno);
> +			igt_assert(is_xe_device(gpu_fd));
> +
> +			create_massive_size(gpu_fd);
> +			drm_close_driver(gpu_fd);
> +		}
> +		igt_waitchildren();
> +	}
> +
> +
>  	igt_fixture
>  		drm_close_driver(xe);
>  }
> --
> 2.42.0
