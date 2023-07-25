Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 257F010E07F
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jul 2023 09:55:39 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Garg, Nemesa" <nemesa.garg@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Tue, 25 Jul 2023 09:55:35 +0000
Message-ID: <DM4PR11MB6312856125031942BDDCC3D89003A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20230724073737.666171-1-nemesa.garg@intel.com>
In-Reply-To: <20230724073737.666171-1-nemesa.garg@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_hdmi_inject: Fix audio test
 by loading snd driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Garg, Nemesa" <nemesa.garg@intel.com>,
 "Garg@freedesktop.org" <Garg@freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Garg,
> Nemesa
> Sent: Monday, July 24, 2023 1:08 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Garg@freedesktop.org; Garg, Nemesa <nemesa.garg@intel.com>
> Subject: [igt-dev] [PATCH i-g-t] tests/kms_hdmi_inject: Fix audio test by
> loading snd driver
>=20
> As audio driver is blacklisted so load the snd_hda_intel module before th=
e
> inject_audio test run
Any idea why snd_hda_intel si blocklisted ? It should be done right.=20
>=20
> Signed-off-by: Garg, Nemesa <nemesa.garg@intel.com>
> ---
>  tests/kms_hdmi_inject.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c index
> 9aa5c59fc..1964d7541 100644
> --- a/tests/kms_hdmi_inject.c
> +++ b/tests/kms_hdmi_inject.c
> @@ -30,6 +30,7 @@
>  #include "igt_edid.h"
>  #include "igt_eld.h"
>  #include "xe/xe_query.h"
> +#include "igt_kmod.h"
>=20
>  #define HDISPLAY_4K	3840
>  #define VDISPLAY_4K	2160
> @@ -206,6 +207,9 @@ igt_main
>  		igt_require(connector);
>=20
>  		kmstest_unset_all_crtcs(drm_fd, res);
> +
> +		if (!igt_kmod_is_loaded("snd_hda_intel"))
> +			igt_kmod_load("snd_hda_intel", NULL);
>  	}
>=20
>  	igt_describe("Make sure that 4K modes exposed by DRM match the
> "
> --
> 2.25.1
