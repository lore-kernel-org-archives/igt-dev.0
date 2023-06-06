Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3D310E2F0
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jun 2023 08:28:28 +0000 (UTC)
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>, "Kumar, Janga Rahul"
 <janga.rahul.kumar@intel.com>
Date: Tue, 6 Jun 2023 08:28:24 +0000
Message-ID: <DM6PR11MB44922AA762FF87C671545A698D52A@DM6PR11MB4492.namprd11.prod.outlook.com>
References: <20230529101654.488126-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20230529101654.488126-1-janga.rahul.kumar@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/core_hotunplug: Add XE driver
 test support
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
> janga.rahul.kumar@intel.com
> Sent: 29 May 2023 03:47 PM
> To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> <ramadevi.gandi@intel.com>; Kumar, Janga Rahul
> <janga.rahul.kumar@intel.com>
> Subject: [igt-dev] [PATCH i-g-t] tests/core_hotunplug: Add XE driver test
> support
>=20
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>=20
> Enable test for DRIVER_XE
>=20
> Signed-off-by: Janga Rahul Kumar<janga.rahul.kumar@intel.com>
> ---
>  tests/core_hotunplug.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c index
> 4d6a721f..2b97e86e 100644
> --- a/tests/core_hotunplug.c
> +++ b/tests/core_hotunplug.c
> @@ -445,7 +445,7 @@ static void node_healthcheck(struct hotunplug *priv,
> unsigned flags)
>  	if (closed)	/* store fd for cleanup if not dirty */
>  		priv->fd.drm_hc =3D fd_drm;
>=20
> -	if (priv->chipset =3D=3D DRIVER_INTEL) {
> +	if (priv->chipset =3D=3D DRIVER_INTEL || priv->chipset =3D=3D DRIVER_XE=
) {
You need to add more support to make it work for XE similar to local_i915_h=
ealthcheck as it is just assigning NULL value which is not expected.
Thanks,
Priyanka
>  		/* don't report library failed asserts as healthcheck failure */
>  		priv->failure =3D "Unrecoverable test failure";
>  		if (local_i915_healthcheck(fd_drm, "") && @@ -694,6
> +694,10 @@ igt_main
>  			igt_require_gem(fd_drm);
>=20
>  			priv.has_intel_perf =3D
> local_i915_perf_healthcheck(fd_drm);
> +		} else if (is_xe_device(fd_drm)) {
> +			priv.chipset =3D DRIVER_XE;
> +
> +			gem_quiescent_gpu(fd_drm);
>  		}
>=20
>  		/* Make sure subtests always reopen the same device */
> --
> 2.25.1
