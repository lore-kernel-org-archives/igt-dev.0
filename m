Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0CB10E296
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jan 2023 06:42:42 +0000 (UTC)
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Mon, 16 Jan 2023 06:42:37 +0000
Message-ID: <IA1PR11MB6266EA7F413938CAE8CBE29BE2C19@IA1PR11MB6266.namprd11.prod.outlook.com>
References: <20230112105702.19502-1-dnyaneshwar.bhadane@intel.com>
 <Y7/+4sEWGELI2unz@intel.com>
In-Reply-To: <Y7/+4sEWGELI2unz@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] tests/kms_cursor_crc: skip pipe on invalid
 connector in cursor size test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Heikkila,
 Juha-pekka" <juha-pekka.heikkila@intel.com>, "Kurmi,
 Suresh Kumar" <suresh.kumar.kurmi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Ville,

> -----Original Message-----
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Sent: Thursday, January 12, 2023 6:07 PM
> To: Bhadane, Dnyaneshwar <dnyaneshwar.bhadane@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Kurmi, Suresh Kumar
> <suresh.kumar.kurmi@intel.com>; Heikkila, Juha-pekka <juha-
> pekka.heikkila@intel.com>
> Subject: Re: [igt-dev] [i-g-t] tests/kms_cursor_crc: skip pipe on invalid
> connector in cursor size test
>=20
> On Thu, Jan 12, 2023 at 04:27:02PM +0530, Dnyaneshwar Bhadane wrote:
> > Only the valid pipe connector combination reach to the igt commit.
> > Cursor max-size test will not affect existing flow as only skip for
> > invalid connector.
> > For cursor-dpms and cursor-suspend not require to check
> > require_cursor_size becuase the cursor height and width used from drm
> capablities.
> >
> > Signed-off-by: Dnyaneshwar Bhadane
> <dnyaneshwar.bhadane@intel.com>
> >
> > ---
> >  tests/kms_cursor_crc.c | 21 +++++++++++++++------
> >  1 file changed, 15 insertions(+), 6 deletions(-)
> >
> > diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c index
> > d5a4b30b..4ab4c005 100644
> > --- a/tests/kms_cursor_crc.c
> > +++ b/tests/kms_cursor_crc.c
> > @@ -752,6 +752,13 @@ static void run_size_tests(data_t *data, int w, in=
t
> h)
> >  			for_each_pipe(&data->display, pipe) {
> >  				data->pipe =3D pipe;
> >
> > +				if(!igt_pipe_connector_valid(pipe, data-
> >output)) {
>=20
> Isn't there a for_each_something() that does all of that?

Yes, I found for_each_pipe_with_valid_output()  and this macro loop checks =
for the invalid connectors on=20
each pipe. I will update the code using for_each_pipe_with_valid_output().=
=20
Thanks for the suggestion.

Dnyaneshwar Bhadane,
Intel

>=20
> > +					igt_debug("Invalid connector on
> pipe-%s-%s\n",
> > +						kmstest_pipe_name(pipe),
> > +						data->output->name);
> > +					continue;
> > +				}
> > +
> >  				if (require_cursor_size(data, w, h)) {
> >  					igt_info("Cursor size %dx%d not
> supported by driver\n", w, h);
> >  					continue;
> > @@ -854,9 +861,10 @@ static void run_tests_on_pipe(data_t *data)
> >  			data->pipe =3D pipe;
> >  			data->flags =3D TEST_DPMS;
> >
> > -			if (require_cursor_size(data, data->cursor_max_w,
> data->cursor_max_h)) {
> > -				igt_debug("Cursor size %dx%d not supported
> by driver\n",
> > -					  data->cursor_max_w, data-
> >cursor_max_h);
> > +			if(!igt_pipe_connector_valid(pipe, data->output)) {
> > +				igt_debug("Invalid connector on pipe-%s-
> %s\n",
> > +					kmstest_pipe_name(pipe),
> > +					data->output->name);
> >  				continue;
> >  			}
> >
> > @@ -875,9 +883,10 @@ static void run_tests_on_pipe(data_t *data)
> >  			data->pipe =3D pipe;
> >  			data->flags =3D TEST_SUSPEND;
> >
> > -			if (require_cursor_size(data, data->cursor_max_w,
> data->cursor_max_h)) {
> > -				igt_debug("Cursor size %dx%d not supported
> by driver\n",
> > -					  data->cursor_max_w, data-
> >cursor_max_h);
> > +			if(!igt_pipe_connector_valid(pipe, data->output)) {
> > +				igt_debug("Invalid connector on pipe-%s-
> %s\n",
> > +					kmstest_pipe_name(pipe),
> > +					data->output->name);
> >  				continue;
> >  			}
> >
> > --
> > 2.35.1
>=20
> --
> Ville Syrj=E4l=E4
> Intel
