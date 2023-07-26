Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47EDB10E413
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jul 2023 05:27:01 +0000 (UTC)
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Wed, 26 Jul 2023 05:26:48 +0000
Message-ID: <IA1PR11MB64673A3EB598BBA5B962D906E300A@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20230724073737.666171-1-nemesa.garg@intel.com>
 <DM4PR11MB6312856125031942BDDCC3D89003A@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB6312856125031942BDDCC3D89003A@DM4PR11MB6312.namprd11.prod.outlook.com>
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
Cc: "Garg@freedesktop.org" <Garg@freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: B, Jeevan <jeevan.b@intel.com>
> Sent: Tuesday, July 25, 2023 3:26 PM
> To: Garg, Nemesa <nemesa.garg@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Garg@freedesktop.org; Garg, Nemesa <nemesa.garg@intel.com>
> Subject: RE: [igt-dev] [PATCH i-g-t] tests/kms_hdmi_inject: Fix audio tes=
t by
> loading snd driver
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Garg, Nemesa
> > Sent: Monday, July 24, 2023 1:08 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Garg@freedesktop.org; Garg, Nemesa <nemesa.garg@intel.com>
> > Subject: [igt-dev] [PATCH i-g-t] tests/kms_hdmi_inject: Fix audio test
> > by loading snd driver
> >
> > As audio driver is blacklisted so load the snd_hda_intel module before
> > the inject_audio test run
> Any idea why snd_hda_intel si blocklisted ? It should be done right.
During boot time the driver is blacklisted as seen in boot logs and after b=
oot the driver
does not get loaded so added this function.
> >
> > Signed-off-by: Garg, Nemesa <nemesa.garg@intel.com>
> > ---
> >  tests/kms_hdmi_inject.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c index
> > 9aa5c59fc..1964d7541 100644
> > --- a/tests/kms_hdmi_inject.c
> > +++ b/tests/kms_hdmi_inject.c
> > @@ -30,6 +30,7 @@
> >  #include "igt_edid.h"
> >  #include "igt_eld.h"
> >  #include "xe/xe_query.h"
> > +#include "igt_kmod.h"
> >
> >  #define HDISPLAY_4K	3840
> >  #define VDISPLAY_4K	2160
> > @@ -206,6 +207,9 @@ igt_main
> >  		igt_require(connector);
> >
> >  		kmstest_unset_all_crtcs(drm_fd, res);
> > +
> > +		if (!igt_kmod_is_loaded("snd_hda_intel"))
> > +			igt_kmod_load("snd_hda_intel", NULL);
> >  	}
> >
> >  	igt_describe("Make sure that 4K modes exposed by DRM match the "
> > --
> > 2.25.1
