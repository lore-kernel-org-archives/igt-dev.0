Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB5510E143
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Nov 2023 14:51:25 +0000 (UTC)
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Fri, 17 Nov 2023 14:51:20 +0000
Message-ID: <CH0PR11MB5444617FA0919E349B22068AE5B7A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20231117001704.2816232-1-matthew.d.roper@intel.com>
In-Reply-To: <20231117001704.2816232-1-matthew.d.roper@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_kmod: Fix uninitialized
 variable during module unload
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

-----Original Message-----
From: Roper, Matthew D <matthew.d.roper@intel.com>=20
Sent: Thursday, November 16, 2023 4:17 PM
To: igt-dev@lists.freedesktop.org
Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Cavitt, Jonathan <jonatha=
n.cavitt@intel.com>
Subject: [PATCH i-g-t] lib/igt_kmod: Fix uninitialized variable during modu=
le unload
>=20
> When unloading a module with no holders, the 'err' variable is checked
> without ever being initialized.
>=20
> Noticed due to sporadic failures in
> igt@xe_module_load@reload-no-display, although other tests may also have
> been impacted.
>=20
> Fixes: 5d4730e7f ("lib/igt_kmod: Allow some leeway in igt_kmod_unload_r")
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Acked-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
- Jonathan Cavitt

> ---
>  lib/igt_kmod.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index e967c9bcd..250ab2107 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -263,7 +263,7 @@ static int igt_kmod_unload_r(struct kmod_module *kmod=
, unsigned int flags)
>  #define MAX_TRIES	20
>  #define SLEEP_DURATION	500000
>  	struct kmod_list *holders, *pos;
> -	int err, tries;
> +	int err =3D 0, tries;
>  	const char *mod_name =3D kmod_module_get_name(kmod);
> =20
>  	if (kmod_module_get_initstate(kmod) =3D=3D KMOD_MODULE_BUILTIN)
> --=20
> 2.41.0
>=20
>=20
