Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1BC10FC4D
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Aug 2022 09:59:06 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Wed, 3 Aug 2022 09:59:01 +0000
Message-ID: <CY5PR11MB6211DE00EB74B1E0466255A9959C9@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20220801180145.243227-3-rodrigo.vivi@intel.com>
 <20220801181053.249195-1-rodrigo.vivi@intel.com>
In-Reply-To: <20220801181053.249195-1-rodrigo.vivi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_aux: Check suspend state
 support directly.
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
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Monday, August 1, 2022 11:41 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>
> Subject: [PATCH i-g-t] lib/igt_aux: Check suspend state support directly.
>=20
> Let's simplify the suspend state check directly by using its name instead=
 of using
> a mask style. This will allow us to introduce a new state cleanly.
>=20
> v2: remove accidental fprintf
>=20
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>[Gupta, Anshuman] .
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  lib/igt_aux.c | 28 ++++++++++------------------
>  1 file changed, 10 insertions(+), 18 deletions(-)
>=20
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c index 6cdda077..805550d1 10064=
4
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -815,29 +815,21 @@ static void suspend_via_sysfs(int power_dir, enum
> igt_suspend_state state)
>  				 suspend_state_name[state]));
>  }
>=20
> -static uint32_t get_supported_suspend_states(int power_dir)
> +static bool is_state_supported(int power_dir, enum igt_suspend_state
> +state)
>  {
> +	const char *str;
>  	char *states;
> -	char *state_name;
> -	uint32_t state_mask;
>=20
>  	igt_assert((states =3D igt_sysfs_get(power_dir, "state")));
> -	state_mask =3D 0;
> -	for (state_name =3D strtok(states, " "); state_name;
> -	     state_name =3D strtok(NULL, " ")) {
> -		enum igt_suspend_state state;
> -
> -		for (state =3D SUSPEND_STATE_FREEZE; state <
> SUSPEND_STATE_NUM;
> -		     state++)
> -			if (strcmp(state_name, suspend_state_name[state]) =3D=3D
> 0)
> -				break;
> -		igt_assert(state < SUSPEND_STATE_NUM);
> -		state_mask |=3D 1 << state;
> -	}
>=20
> -	free(states);
> +	str =3D strstr(states, suspend_state_name[state]);
>=20
> -	return state_mask;
> +	if (!str)
> +		igt_info("State %s not supported.\nSupported States: %s\n",
> +			 suspend_state_name[state], states);
> +
> +	free(states);
> +	return str;
>  }
>=20
>  /**
> @@ -868,7 +860,7 @@ void igt_system_suspend_autoresume(enum
> igt_suspend_state state,
>  	enum igt_suspend_test orig_test;
>=20
>  	igt_require((power_dir =3D open("/sys/power", O_RDONLY)) >=3D 0);
> -	igt_require(get_supported_suspend_states(power_dir) & (1 << state));
> +	igt_require(is_state_supported(power_dir, state));
>  	igt_require(test =3D=3D SUSPEND_TEST_NONE ||
>  		    faccessat(power_dir, "pm_test", R_OK | W_OK, 0) =3D=3D 0);
>=20
> --
> 2.35.3
