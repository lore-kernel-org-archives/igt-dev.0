Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3409710EC1B
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Sep 2022 07:35:36 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Fri, 9 Sep 2022 07:35:27 +0000
Message-ID: <CY5PR11MB621141E114E6C2FEFE55691F95439@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20220909072744.2919983-1-riana.tauro@intel.com>
 <20220909072744.2919983-3-riana.tauro@intel.com>
In-Reply-To: <20220909072744.2919983-3-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] tests/i915/i915_suspend: Disable
 d3cold_allowed for basic-s2idle-without-i915
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
> Sent: Friday, September 9, 2022 12:58 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: [PATCH i-g-t v2 2/2] tests/i915/i915_suspend: Disable d3cold_all=
owed
> for basic-s2idle-without-i915
>=20
> When module is unloaded and s2idle is triggered, PCI core leaves the endp=
oint in
> D0 and the bridge in D3 state causing PCIE spec violation. The config spa=
ce is
> read as 0xFF
>=20
> Keep the bridge in D0 before module unload to prevent this issue
>=20
> v2: Addressed cosmetic review comments (Anshuman)
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tests/i915/i915_suspend.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c index
> 94935595..815f1c8a 100644
> --- a/tests/i915/i915_suspend.c
> +++ b/tests/i915/i915_suspend.c
> @@ -43,6 +43,7 @@
>  #include "igt.h"
>  #include "igt_kmod.h"
>  #include "igt_device.h"
> +#include "igt_device_scan.h"
>=20
>  #define OBJECT_SIZE (16*1024*1024)
>=20
> @@ -206,13 +207,38 @@ test_forcewake(int fd, bool hibernate)  static void
> test_suspend_without_i915(int state)  {
> +	struct igt_device_card card;
> +	char d3cold_allowed[2];
> +	int fd;
> +
> +	fd =3D __drm_open_driver(DRIVER_INTEL);
> +	igt_devices_scan(false);
> +
> +	/*
> +	 * When module is unloaded and s2idle is triggered, PCI core leaves the
> endpoint
> +	 * in D0 and the bridge in D3 state causing PCIE spec violation and con=
fig
> space
> +	 * is read as 0xFF. Keep the bridge in D0 before module unload to
> prevent
> +	 * this issue
> +	 */
> +	if (state =3D=3D SUSPEND_STATE_FREEZE &&
> +	    igt_device_find_first_i915_discrete_card(&card)) {
> +		igt_pm_get_d3cold_allowed(&card, d3cold_allowed);
> +		igt_pm_set_d3cold_allowed(&card, "0\n");
> +	}
> +	close(fd);
> +
>  	igt_kmsg(KMSG_INFO "Unloading i915\n");
>  	igt_assert_eq(igt_i915_driver_unload(),0);
>=20
>  	igt_system_suspend_autoresume(state, SUSPEND_TEST_NONE);
>=20
> +	if (state =3D=3D SUSPEND_STATE_FREEZE && strlen(card.card))
> +		igt_pm_set_d3cold_allowed(&card, d3cold_allowed);
> +
>  	igt_kmsg(KMSG_INFO "Re-loading i915 \n");
>  	igt_assert_eq(igt_i915_driver_load(NULL), 0);
> +
> +	igt_devices_free();
>  }
>=20
>  int fd;
> --
> 2.25.1
