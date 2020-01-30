Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E8E6F9F0
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2020 15:57:22 +0000 (UTC)
Date: Thu, 30 Jan 2020 17:57:18 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200130155718.GF13686@intel.com>
References: <20200130151229.984-1-ville.syrjala@linux.intel.com>
 <20200130151229.984-3-ville.syrjala@linux.intel.com>
 <158039885873.18112.16131853497278614661@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158039885873.18112.16131853497278614661@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] tests/kms_plane_scaling: Don't test
 every pixel format
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jan 30, 2020 at 03:40:58PM +0000, Chris Wilson wrote:
> Quoting Ville Syrjala (2020-01-30 15:12:29)
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > We probably don't need to test every pixel format, so let's just
> > test one format for each format "class" (as defined by
> > igt_reduce_format()).
> > =

> > Speeds up the test considerably (on KBL):
> > $ time ./build/tests/kms_plane_scaling --r pipe-A-scaler-with-clipping-=
clamping
> > - real  0m25,186s
> > + real  0m3,440s
> > =

> > As with kms_plane we'll add a new command line argument (--extended)
> > which can be used to test all formats.
> > =

> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >  tests/kms_plane_scaling.c | 80 ++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 74 insertions(+), 6 deletions(-)
> > =

> > diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> > index 35aac8dad078..19087286a0f9 100644
> > --- a/tests/kms_plane_scaling.c
> > +++ b/tests/kms_plane_scaling.c
> > @@ -23,6 +23,7 @@
> >   */
> >  =

> >  #include "igt.h"
> > +#include "igt_vec.h"
> >  #include <math.h>
> >  =

> >  =

> > @@ -43,6 +44,7 @@ typedef struct {
> >         igt_plane_t *plane2;
> >         igt_plane_t *plane3;
> >         igt_plane_t *plane4;
> > +       bool extended;
> >  } data_t;
> >  =

> >  static int get_num_scalers(data_t* d, enum pipe pipe)
> > @@ -221,6 +223,28 @@ static bool can_scale(data_t *d, unsigned format)
> >         }
> >  }
> >  =

> > +static bool test_format(data_t *data,
> > +                       struct igt_vec *tested_formats,
> > +                       uint32_t format)
> > +{
> > +       if (!igt_fb_supported_format(format))
> > +               return false;
> > +
> > +       if (!is_i915_device(data->drm_fd) ||
> > +           data->extended)
> > +               return true;
> > +
> > +       format =3D igt_reduce_format(format);
> > +
> > +       /* only test each format "class" once */
> > +       if (igt_vec_index(tested_formats, &format) >=3D 0)
> > +               return false;
> > +
> > +       igt_vec_push(tested_formats, &format);
> =

> Ok, that does exactly what you describe.
> =

> However, that lookup is giving me the shivers, but it does the job so
> long as we don't have too many formats.

Yeah, this being the reduced format we should only have a handful of
these. But I'd be totally fine using a better data structure if
someone wants to write me one ;)

> =

> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

Thanks.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
