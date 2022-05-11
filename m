Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D214010E051
 for <igt-dev@lists.freedesktop.org>; Wed, 11 May 2022 09:35:35 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Wed, 11 May 2022 09:35:33 +0000
Message-ID: <2727b8aba7fb45cbaebd827090fcd70f@intel.com>
References: <20220504133324.2576100-1-riana.tauro@intel.com>
 <20220504133324.2576100-4-riana.tauro@intel.com>
In-Reply-To: <20220504133324.2576100-4-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v4 3/3] lib/igt_aux: add library
 function to read current selected state of mem_sleep
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
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: Wednesday, May 4, 2022 7:03 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>
> Subject: [PATCH i-g-t v4 3/3] lib/igt_aux: add library function to read c=
urrent
Reorder this patch in this series , patch using this api should follow this=
 pacth.
> selected state of mem_sleep
>=20
> From: "Tauro, Riana" <riana.tauro@intel.com>
>=20
> Add a library function to read the current state of mem_sleep.
> This is used by suspend tests without i915 to skip s3 tests if platform s=
upports
> only s2idle state
"If platform has default state as s2idle"
It is worth to mention in commit log that I will save CI time.
>=20
> Signed-off-by: Tauro, Riana <riana.tauro@intel.com>
> ---
>  lib/igt_aux.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_aux.h | 19 +++++++++++++++++++
>  2 files changed, 69 insertions(+)
>=20
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c index 03cc38c9..baa88290 10064=
4
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -710,6 +710,12 @@ static const char *suspend_test_name[] =3D {
>  	[SUSPEND_TEST_CORE] =3D "core",
>  };
>=20
> +static const char *mem_sleep_label[] =3D {
How about mem_sleep_name[] ?
> +	[MEM_SLEEP_FREEZE] =3D "s2idle",
> +	[MEM_SLEEP_STANDBY] =3D "shallow",
> +	[MEM_SLEEP_MEM] =3D "deep"
> +};
> +
>  static enum igt_suspend_test get_suspend_test(int power_dir)  {
>  	char *test_line;
> @@ -951,6 +957,50 @@ int igt_get_autoresume_delay(enum
> igt_suspend_state state)
>  	return delay;
>  }
>=20
> +/**
> + * igt_get_memsleep_state
> + *
> + * Reads the value of /sys/power/mem_sleep and
> + * returns the current suspend state associated with 'mem'.
> + *
> + * Returns : an#igt_mem_sleep state, current suspend state associated wi=
th
> 'mem'.
space after 'an'
> + */
> +int igt_get_memsleep_state(void)
> +{
> +	char *mem_sleep_line;
	How about mem_sleep_states ?
> +	char *mem_sleep_state;
> +	enum igt_mem_sleep mem_sleep;
> +	int power_dir;
> +
> +	igt_require((power_dir =3D open("/sys/power", O_RDONLY)) >=3D 0);
> +
> +	if (faccessat(power_dir, "mem_sleep", R_OK, 0))
> +		return MEM_SLEEP_NONE;
> +
> +	igt_assert((mem_sleep_line =3D igt_sysfs_get(power_dir, "mem_sleep")));
> +	for (mem_sleep_state =3D strtok(mem_sleep_line, " "); mem_sleep_state;
> +	     mem_sleep_state =3D strtok(NULL, " "))
> +		if (mem_sleep_state[0] =3D=3D '[') {
> +			mem_sleep_state[strlen(mem_sleep_state) - 1] =3D '\0';
> +			mem_sleep_state++;
> +			break;
> +		}
> +         Use braces here.=20
> +	if (!mem_sleep_state) {
> +		free(mem_sleep_line);
> +		return MEM_SLEEP_NONE;
> +	}
> +
> +	for (mem_sleep =3D MEM_SLEEP_FREEZE; mem_sleep <
> MEM_SLEEP_NUM; mem_sleep++)
> +		if (strcmp(mem_sleep_label[mem_sleep], mem_sleep_state) =3D=3D
> 0)
> +			break;
	Here as well, it is more readable with braces.=20
> +
> +	igt_assert(mem_sleep < MEM_SLEEP_NUM);
	Use igt_assert_f with a meaningful message.

               Br ,
	Anshuman.
> +
> +	free(mem_sleep_line);
> +	close(power_dir);
> +	return mem_sleep;
> +}
>  /**
>   * igt_drop_root:
>   *
> diff --git a/lib/igt_aux.h b/lib/igt_aux.h index 9f2588ae..2f7efd9c 10064=
4
> --- a/lib/igt_aux.h
> +++ b/lib/igt_aux.h
> @@ -186,11 +186,30 @@ enum igt_suspend_test {
>  	SUSPEND_TEST_NUM,
>  };
>=20
> +/**
> + * igt_mem_sleep:
> + * @MEM_SLEEP_NONE: no support
> + * @MEM_SLEEP_FREEZE: suspend-to-idle target state, aka S0ix or freeze,
> + * @MEM_SLEEP_STANDBY: standby target state, aka S1
> + * @MEM_SLEEP_MEM: suspend-to-mem target state aka S3  */ enum
> +igt_mem_sleep {
> +	MEM_SLEEP_NONE,
> +	MEM_SLEEP_FREEZE,
> +	MEM_SLEEP_STANDBY,
> +	MEM_SLEEP_MEM,
> +
> +	/*<private>*/
> +	MEM_SLEEP_NUM,
> +};
> +
>  void igt_system_suspend_autoresume(enum igt_suspend_state state,
>  				   enum igt_suspend_test test);
>  void igt_set_autoresume_delay(int delay_secs);  int
> igt_get_autoresume_delay(enum igt_suspend_state state);
>=20
> +int igt_get_memsleep_state(void);
> +
>  /* dropping priviledges */
>  void igt_drop_root(void);
>=20
> --
> 2.25.1
