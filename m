Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E2810E568
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jul 2023 10:44:23 +0000 (UTC)
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Garg, Nemesa" <nemesa.garg@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Sharma, Swati2" <swati2.sharma@intel.com>
Date: Thu, 27 Jul 2023 10:44:19 +0000
Message-ID: <DM4PR11MB6360EE5FFC075319BD038732F401A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230726134008.750267-1-nemesa.garg@intel.com>
In-Reply-To: <20230726134008.750267-1-nemesa.garg@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t,
 v2] tests/kms_hdmi_inject: Fix audio test by loading snd driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Garg, Nemesa" <nemesa.garg@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Nemesa=
 Garg
> Sent: Wednesday, July 26, 2023 7:10 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Garg, Nemesa <nemesa.garg@intel.com>
> Subject: [igt-dev] [PATCH i-g-t, v2] tests/kms_hdmi_inject: Fix audio tes=
t by loading
> snd driver
>=20
> As audio driver is blacklisted so load the snd_hda_intel module before th=
e
> inject_audio test run.
>=20
> v2: Address comments(Kamil)
>=20
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>  tests/kms_hdmi_inject.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c index
> 9aa5c59fc..93a1e53d3 100644
> --- a/tests/kms_hdmi_inject.c
> +++ b/tests/kms_hdmi_inject.c
> @@ -29,6 +29,7 @@
>  #include "igt.h"
>  #include "igt_edid.h"
>  #include "igt_eld.h"
> +#include "igt_kmod.h"
>  #include "xe/xe_query.h"
>=20
>  #define HDISPLAY_4K	3840
> @@ -206,6 +207,9 @@ igt_main
>  		igt_require(connector);
>=20
>  		kmstest_unset_all_crtcs(drm_fd, res);
> +
> +		if (!igt_kmod_is_loaded("snd_hda_intel"))
> +			igt_kmod_load("snd_hda_intel", NULL);

I think the snd driver can be loaded as part of CI test prep along with i91=
5
and any other dependent module, before the execution begins. This way
individual tests will not need to load at per test level.

@Sharma, Swati2 Can you also check once from validation and CI perspective.

Regards,
Uma Shankar
>  	}
>=20
>  	igt_describe("Make sure that 4K modes exposed by DRM match the "
> --
> 2.25.1
