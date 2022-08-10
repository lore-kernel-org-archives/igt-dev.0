Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8CE91EED
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Aug 2022 11:51:11 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Wed, 10 Aug 2022 11:51:07 +0000
Message-ID: <CY5PR11MB62111399D88E1DED67C4D3A395659@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20220810094027.541357-1-riana.tauro@intel.com>
 <20220810094027.541357-2-riana.tauro@intel.com>
In-Reply-To: <20220810094027.541357-2-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] lib/igt_aux : Skip SUSPEND_STATE_S3
 if mem_sleep deep state is not supported
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: Wednesday, August 10, 2022 3:10 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: [PATCH i-g-t 1/1] lib/igt_aux : Skip SUSPEND_STATE_S3 if mem_sle=
ep
> deep state is not supported
>=20
> Forcing s3 by setting mem_sleep to deep fails if s3 is not supported by p=
latform
>=20
> Skip the test by checking if s3 is not one of the supported mem_sleep sta=
tes
>=20
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6531
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  lib/igt_aux.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c index d80a1935..edb53425 10064=
4
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -882,6 +882,23 @@ static void set_mem_sleep(int power_dir, enum
> igt_mem_sleep sleep)
>  				 mem_sleep_name[sleep]));
>  }
>=20
> +static bool is_mem_sleep_state_supported(int power_dir, enum
> +igt_mem_sleep state) {
> +	const char *str;
> +	char *mem_sleep_states;
> +
> +	igt_assert((mem_sleep_states =3D igt_sysfs_get(power_dir,
> +"mem_sleep")));
> +
> +	str =3D strstr(mem_sleep_states, mem_sleep_name[state]);
> +
> +	if (!str)
> +		igt_info("mem_sleep state %s not supported.\nSupported
> mem_sleep states: %s\n",
> +			 mem_sleep_name[state], mem_sleep_states);
Nitpicking=20
With this It may print with []:=20
mem_sleep state deep not supported
Supported mem_sleep states: [s2idle] shallow
But as this could be an extra piece of information of current mem_sleep sta=
te as well.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>

> +
> +	free(mem_sleep_states);
> +	return str;
> +}
> +
>  /**
>   * igt_system_suspend_autoresume:
>   * @state: an #igt_suspend_state, the target suspend state @@ -923,6 +94=
0,8
> @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
>=20
>  	if (state =3D=3D SUSPEND_STATE_S3) {
>  		orig_mem_sleep =3D get_mem_sleep();
> +		igt_skip_on_f(!is_mem_sleep_state_supported(power_dir,
> MEM_SLEEP_DEEP),
> +			      "S3 not supported in this system.\n");
>  		set_mem_sleep(power_dir, MEM_SLEEP_DEEP);
>  		igt_skip_on_f(get_mem_sleep() !=3D MEM_SLEEP_DEEP,
>  			      "S3 not possible in this system.\n");
> --
> 2.25.1
