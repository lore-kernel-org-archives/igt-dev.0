Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DED06E043
 for <igt-dev@lists.freedesktop.org>; Wed,  5 May 2021 10:27:43 +0000 (UTC)
Date: Wed, 5 May 2021 13:27:37 +0300
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20210505102737.GA126925@ideak-desk.fi.intel.com>
References: <20210429192628.4056795-1-imre.deak@intel.com>
 <20210429192628.4056795-2-imre.deak@intel.com>
 <20210505002305.7bagmdtisnu6hsiw@outlook.office365.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210505002305.7bagmdtisnu6hsiw@outlook.office365.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] tests/kms_ccs: Skip CCS color clear
 value check for randomizing subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On Tue, May 04, 2021 at 08:23:05PM -0400, Rodrigo Siqueira wrote:
> Hi,
> =

> I looked at kms_ccs and tried to find a reference for "color control
> surfaces" in DRM, and I found multiple references for this format in
> i915.

CCS means here Compression Control Surface. Yes, the render and media
GPU engines use their own compression format, hence multiple CCS
modifiers are needed. There are also format differences between
platforms, which further increases the number of modifiers.

> Is it an Intel-specific format? Is kms_ccs a test that can be
> executed in different ASICs?

Yes, the CCS FB modifiers are Intel specific and kms_ccs will not run on
other platforms.

--Imre

> Thanks
> Siqueira
> =

> On 04/29, Imre Deak wrote:
> > When filling the color planes with randomized content, the color clear
> > values won't match what the HW actually wrote there, so skip the clear
> > value check in this case.
> > =

> > Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > Cc: Mika Kahola <mika.kahola@intel.com>
> > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  tests/kms_ccs.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > =

> > diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
> > index 30e0fdb54..61c9b2277 100644
> > --- a/tests/kms_ccs.c
> > +++ b/tests/kms_ccs.c
> > @@ -195,7 +195,7 @@ static void check_ccs_cc_plane(int drm_fd, igt_fb_t=
 *fb, int plane, const float
> >  	munmap(map, fb->size);
> >  };
> >  =

> > -static void check_all_ccs_planes(int drm_fd, igt_fb_t *fb, const float=
 *cc_color)
> > +static void check_all_ccs_planes(int drm_fd, igt_fb_t *fb, const float=
 *cc_color, bool check_cc_plane)
> >  {
> >  	int i;
> >  =

> > @@ -203,7 +203,7 @@ static void check_all_ccs_planes(int drm_fd, igt_fb=
_t *fb, const float *cc_color
> >  		if (igt_fb_is_ccs_plane(fb, i) &&
> >  		    !igt_fb_is_gen12_ccs_cc_plane(fb, i))
> >  			check_ccs_plane(drm_fd, fb, i);
> > -		else if (igt_fb_is_gen12_ccs_cc_plane(fb, i))
> > +		else if (igt_fb_is_gen12_ccs_cc_plane(fb, i) && check_cc_plane)
> >  			check_ccs_cc_plane(drm_fd, fb, i, cc_color);
> >  	}
> >  }
> > @@ -348,7 +348,7 @@ static void generate_fb(data_t *data, struct igt_fb=
 *fb,
> >  		igt_assert_eq(ret, 0);
> >  =

> >  	if (check_ccs_planes)
> > -		check_all_ccs_planes(data->drm_fd, fb, cc_color);
> > +		check_all_ccs_planes(data->drm_fd, fb, cc_color, !(data->flags & TES=
T_RANDOM));
> >  =

> >  	fb->fb_id =3D f.fb_id;
> >  }
> > -- =

> > 2.27.0
> > =

> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flis=
ts.freedesktop.org%2Fmailman%2Flistinfo%2Figt-dev&amp;data=3D04%7C01%7CRodr=
igo.Siqueira%40amd.com%7C015d075eda3348bce83208d90b44b52e%7C3dd8961fe4884e6=
08e11a82d994e183d%7C0%7C0%7C637553211995281967%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DIqMSw%2BtvmobHEOTGjdcrUL%2BE3gW6QlRfavthnqM1%2FVc%3D&amp;reserved=3D0
> =

> -- =

> Rodrigo Siqueira
> https://siqueira.tech


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
