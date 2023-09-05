Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDC510E420
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Sep 2023 05:24:37 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>
Date: Tue, 5 Sep 2023 05:24:33 +0000
Message-ID: <DM4PR11MB63128768E4EF4978D5E1F94490E8A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20230904170749.14616-1-jeevan.b@intel.com>
 <ZPYi0chDmm3G4r8L@ideak-desk.fi.intel.com>
In-Reply-To: <ZPYi0chDmm3G4r8L@ideak-desk.fi.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_setmode: skip subtest when
 valid combination not found
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

> -----Original Message-----
> From: Deak, Imre <imre.deak@intel.com>
> Sent: Tuesday, September 5, 2023 12:03 AM
> To: B, Jeevan <jeevan.b@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [PATCH i-g-t] tests/kms_setmode: skip subtest when valid
> combination not found
>=20
> On Mon, Sep 04, 2023 at 10:37:49PM +0530, Jeevan B wrote:
> > Skip subtest with a valid message instead of "No dynamic tests executed=
"
> > when valid crtc-connector combination is not available.
>=20
> Please describe how the change actually fixes things. If no dynamic test =
is
> defined for a subtest the subtest will skip. Is that an issue and if so w=
hy?
Hi Imre,=20

It does not resolve/fixes things, but rather provides clarity when the bugs=
 are generated.
Instead of skipping with "No Dynamic Subtest Executed"

Thanks=20
Jeevan B=20
>=20
> >
> > Signed-off-by: Jeevan B <jeevan.b@intel.com>
> > ---
> >  tests/kms_setmode.c | 64
> > ++++++++++++++++++++++-----------------------
> >  1 file changed, 32 insertions(+), 32 deletions(-)
> >
> > diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c index
> > a611d938..74292abf 100644
> > --- a/tests/kms_setmode.c
> > +++ b/tests/kms_setmode.c
> > @@ -645,47 +645,47 @@ static void test_one_combination(const struct
> test_config *tconf,
> >  				 int connector_count)
> >  {
> >  	struct crtc_config crtcs[MAX_CRTCS];
> > -	int crtc_count;
> > +	int crtc_count, i, pos =3D 0;
> > +	char test_name[256];
> >  	bool config_valid;
> >
> >  	setup_crtcs(tconf, cconfs, connector_count, crtcs,
> >  		    &crtc_count, &config_valid);
> >
> > -	if (config_valid =3D=3D !(tconf->flags & TEST_INVALID)) {
> > -		int i, pos =3D 0;
> > -		char test_name[256];
> > -
> > -		for (i =3D 0; i < crtc_count; i++) {
> > -			if (i > 0)
> > -				pos +=3D snprintf(&test_name[pos],
> ARRAY_SIZE(test_name) - pos, "-");
> > -			pos +=3D get_test_name_str(&crtcs[i],
> &test_name[pos], ARRAY_SIZE(test_name) - pos);
> > -		}
> > +	for (i =3D 0; i < crtc_count; i++) {
> > +		if (i > 0)
> > +			pos +=3D snprintf(&test_name[pos],
> ARRAY_SIZE(test_name) - pos, "-");
> > +		pos +=3D get_test_name_str(&crtcs[i], &test_name[pos],
> ARRAY_SIZE(test_name) - pos);
> > +	}
> >
> > -		for (i =3D 0; i < crtc_count; i++) {
> > -			struct crtc_config *crtc =3D &crtcs[i];
> > -
> > -			/*
> > -			 * if mode.hdisplay > 5120, then ignore
> > -			 *   - last crtc in single/multi-connector config
> > -			 *   - consecutive crtcs in multi-connector config
> > -			 *
> > -			 * in multi-connector config ignore if
> > -			 *   - previous crtc mode.hdisplay > 5120 and
> > -			 *   - current & previous crtcs are consecutive
> > -			 */
> > -			if (((crtc->mode.hdisplay >
> MAX_HDISPLAY_PER_CRTC) &&
> > -			     ((crtc->crtc_idx >=3D (tconf->resources->count_crtcs
> - 1)) ||
> > -			      ((i < (crtc_count - 1)) && (abs(crtcs[i + 1].crtc_idx -
> crtc->crtc_idx) <=3D 1)))) ||
> > -			    ((i > 0) && (crtc[i - 1].mode.hdisplay >
> MAX_HDISPLAY_PER_CRTC) &&
> > -			     (abs(crtc->crtc_idx - crtcs[i - 1].crtc_idx) <=3D 1))) {
> > -				igt_info("Combo: %s is not possible with
> selected mode(s).\n", test_name);
> > -				goto out;
> > +	igt_dynamic_f("%s", test_name)
> > +		if (config_valid =3D=3D !(tconf->flags & TEST_INVALID)) {
> > +
> > +			for (i =3D 0; i < crtc_count; i++) {
> > +				struct crtc_config *crtc =3D &crtcs[i];
> > +
> > +				/*
> > +				 * if mode.hdisplay > 5120, then ignore
> > +				 *   - last crtc in single/multi-connector config
> > +				 *   - consecutive crtcs in multi-connector
> config
> > +				 *
> > +				 * in multi-connector config ignore if
> > +				 *   - previous crtc mode.hdisplay > 5120 and
> > +				 *   - current & previous crtcs are consecutive
> > +				 */
> > +				if (((crtc->mode.hdisplay >
> MAX_HDISPLAY_PER_CRTC) &&
> > +				     ((crtc->crtc_idx >=3D (tconf->resources-
> >count_crtcs - 1)) ||
> > +				      ((i < (crtc_count - 1)) && (abs(crtcs[i +
> 1].crtc_idx - crtc->crtc_idx) <=3D 1)))) ||
> > +				    ((i > 0) && (crtc[i - 1].mode.hdisplay >
> MAX_HDISPLAY_PER_CRTC) &&
> > +				     (abs(crtc->crtc_idx - crtcs[i - 1].crtc_idx) <=3D
> 1))) {
> > +					igt_info("Combo: %s is not possible
> with selected mode(s).\n", test_name);
> > +					goto out;
> > +				}
> >  			}
> > -		}
> >
> > -		igt_dynamic_f("%s", test_name)
> >  			test_crtc_config(tconf, crtcs, crtc_count);
> > -	}
> > +		} else
> > +			igt_skip("Valid connector-crtc combination not
> found\n");
> >
> >  out:
> >  	cleanup_crtcs(crtcs, crtc_count);
> > --
> > 2.34.1
> >
