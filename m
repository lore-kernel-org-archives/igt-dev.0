Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 384F410E471
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jan 2023 19:33:44 +0000 (UTC)
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Date: Mon, 9 Jan 2023 19:33:37 +0000
Message-ID: <CH0PR11MB544498FA5DA0A8F0427C2935E5FE9@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20230109192536.3395428-1-jonathan.cavitt@intel.com>
In-Reply-To: <20230109192536.3395428-1-jonathan.cavitt@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_kmod: Allow some leeway in
 igt_kmod_unload_r
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

-----Original Message-----
From: Cavitt, Jonathan <jonathan.cavitt@intel.com>=20
Sent: Monday, January 9, 2023 11:26 AM
To: igt-dev@lists.freedesktop.org
Cc: Dutt, Sudeep <sudeep.dutt@intel.com>; Cavitt, Jonathan <jonathan.cavitt=
@intel.com>
Subject: [PATCH i-g-t] lib/igt_kmod: Allow some leeway in igt_kmod_unload_r
>=20
> kmod_module_remove_module occasionally returns EAGAIN for mei_gsc
> in the setup of some gem_lmem_swapping subtests.  Just because
> EAGAIN is returned doesn't mean the module is lost and unable to
> be unloaded.  Try again some number of times (currently 10) before

Just noticed it's actually 20 times in the code.  I'll fix this before conf=
irming the final
push if this change is accepted.
-Jonathan Cavitt

> giving up.
>=20
> Retries will occur for -EBUSY and -EAGAIN, as these imply the
> system is waiting for the target module can simply be waited for.
> All other errors exit immediately, but as the context for each
> error informs their relative severity, no warnings will be issued.
>=20
> References: VLK-30287, VLK-39629
>=20
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: Stuart Summers <stuart.summers@intel.com>
> CC: Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
> CC: Chris Wilson <chris.p.wilson@linux.intel.com>
> Reviewed-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> ---
>  lib/igt_kmod.c | 41 ++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 38 insertions(+), 3 deletions(-)
>=20
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 17090110c..c840f9a17 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -253,8 +253,11 @@ out:
> =20
>  static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flag=
s)
>  {
> +#define MAX_TRIES	20
> +#define SLEEP_DURATION	500000
>  	struct kmod_list *holders, *pos;
> -	int err =3D 0;
> +	int err, tries;
> +	const char *mod_name =3D kmod_module_get_name(kmod);
> =20
>  	holders =3D kmod_module_get_holders(kmod);
>  	kmod_list_foreach(pos, holders) {
> @@ -269,7 +272,6 @@ static int igt_kmod_unload_r(struct kmod_module *kmod=
, unsigned int flags)
>  		return err;
> =20
>  	if (igt_kmod_is_loading(kmod)) {
> -		const char *mod_name =3D kmod_module_get_name(kmod);
>  		igt_debug("%s still initializing\n", mod_name);
>  		err =3D igt_wait(!igt_kmod_is_loading(kmod), 10000, 100);
>  		if (err < 0) {
> @@ -279,7 +281,40 @@ static int igt_kmod_unload_r(struct kmod_module *kmo=
d, unsigned int flags)
>  		}
>  	}
> =20
> -	return kmod_module_remove_module(kmod, flags);
> +	for (tries =3D 0; tries < MAX_TRIES; tries++) {
> +		bool loop =3D false;
> +
> +		err =3D kmod_module_remove_module(kmod, flags);
> +
> +		/* Only loop in the following cases */
> +		switch (err) {
> +		case -EBUSY:
> +		case -EAGAIN:
> +			/* Waiting for module to be available */
> +			loop =3D true;
> +			break;
> +		default:
> +			break;
> +                }
> +		if (!loop)
> +			break;
> +
> +		igt_debug("Module %s failed to unload with err: %d on attempt: %i\n",
> +			  mod_name, err, tries + 1);
> +
> +		usleep(SLEEP_DURATION);
> +	}
> +
> +	if (err =3D=3D -ENOENT)
> +		igt_debug("Module %s could not be found.  Skipping.\n", mod_name);
> +	else if (err)
> +		igt_info("Module %s failed to unload with err: %d after ~%.1fms\n",
> +			 mod_name, err, SLEEP_DURATION*tries/1000.);
> +	else if (tries)
> +		igt_info("Module %s unload took ~%.1fms over %i attempts\n",
> +			 mod_name, SLEEP_DURATION*tries/1000., tries + 1);
> +
> +	return err;
>  }
> =20
>  /**
> --=20
> 2.25.1
>=20
>=20
