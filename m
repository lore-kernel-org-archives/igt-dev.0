Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716B66E3D0
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Oct 2021 10:22:10 +0000 (UTC)
Date: Tue, 5 Oct 2021 13:22:02 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YVwnSl1BumIYE0bX@intel.com>
References: <20211004085629.2796-1-karthik.b.s@intel.com>
 <YVrHBWTxHBHQEMZ0@intel.com> <YVshFrxOVFlyFmNy@intel.com>
 <eca505ba-6efd-5b4f-ce86-b16d2e035a2e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <eca505ba-6efd-5b4f-ce86-b16d2e035a2e@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_big_fb: Add retry mechanism
 for async flip subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Oct 05, 2021 at 03:30:01PM +0530, Karthik B S wrote:
> On 10/4/2021 9:13 PM, Ville Syrj=E4l=E4 wrote:
> > On Mon, Oct 04, 2021 at 12:19:01PM +0300, Ville Syrj=E4l=E4 wrote:
> >> On Mon, Oct 04, 2021 at 02:26:29PM +0530, Karthik B S wrote:
> >>> Async flip subtests fail sporadically with CRC failure on CI.
> >>> This is expected as these tests are not run on highest priority by the
> >>> scheduler, but this creates noise on CI. Add retry mechanism to rerun
> >>> the test once if failure is seen.
> >>>
> >>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> >>> ---
> >>>   tests/i915/kms_big_fb.c | 9 +++++++++
> >>>   1 file changed, 9 insertions(+)
> >>>
> >>> diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
> >>> index 308227c9..8c09f59e 100644
> >>> --- a/tests/i915/kms_big_fb.c
> >>> +++ b/tests/i915/kms_big_fb.c
> >>> @@ -481,6 +481,7 @@ max_hw_stride_async_flip_test(data_t *data)
> >>>   		       h =3D data->output->config.default_mode.vdisplay;
> >>>   	igt_plane_t *primary;
> >>>   	igt_crc_t compare_crc, async_crc;
> >>> +	bool retried =3D false;
> >>>  =20
> >>>   	igt_require(data->display.is_atomic);
> >>>   	igt_output_set_pipe(data->output, data->pipe);
> >>> @@ -513,6 +514,7 @@ max_hw_stride_async_flip_test(data_t *data)
> >>>   					  INTEL_PIPE_CRC_SOURCE_AUTO);
> >>>   	igt_pipe_crc_start(data->pipe_crc);
> >>>  =20
> >>> +retry:
> >>>   	igt_set_timeout(5, "Async pageflipping loop got stuck!\n");
> >>>   	for (int i =3D 0; i < 2; i++) {
> >>>   		igt_plane_set_fb(primary, &data->big_fb);
> >>> @@ -548,6 +550,13 @@ max_hw_stride_async_flip_test(data_t *data)
> >>>   		igt_assert_f(kmstest_get_vblank(data->drm_fd, data->pipe, 0) -
> >>>   			     startframe =3D=3D 1, "lost frames\n");
> >>>  =20
> >>> +		/* Test is not running at real time priority, so allow one failure=
*/
> >>> +		if (!(igt_check_crc_equal(&compare_crc, &async_crc)^(i^1)) && !ret=
ried) {
> >>> +			retried =3D true;
> >>> +			igt_reset_timeout();
> >>> +			goto retry;
> >>> +		}
> >>> +
> >> This test seems to entirely fit kms_big_fb in general. I don't
> >                       ^
> > 		     not
> >
> > is what I meant to write. Somewhat important small word.
> >
> >> think kms_big_fb should be testing any timing sensitive stuff.
> >>
> >> So I think we should change this to a form that follows the rest
> >> of kms_big_fb to validate that each page flip just presents the
> >> correct data on screen. The timing sensitive stuff is best left
> >> for kms_async_flip.
> >>
> >> So this should maybe be something like: flip to a correctly sized
> >> temp fb with the wrong contents and change the plane src coordinates,
> >> and then async flip back to the correct fb and validate the
> >> correct data is now on screen.
>=20
> Thank you for the feedback.
>=20
> Is this because we can handle any timing related failures in the same=20
> test (may be using some common mechanism)? So add a subtest for=20
> max-hw-stride in kms_async_flips and rewrite this subtest as mentioned=20
> above?

I don't think there's anything specifically about max stride
that needs timing sensitive tests. In theory kms_async_flip/crc
already tests what we need, which is that there are no visual
artifacts when flipping between two identical framebuffers.
The only exception would be if there's some very specific
hardware issue with big stride + async flip.

We could perhaps split kms_async_flip/crc into two tests
actually: one is the current test that scribbles into the
backbuffer between the flips, the other one would be otherwise
identical but it would just skip the scribbling. The difference
is that the scribbling takes a bit of time (esp. as the igt
rendering routines aren't particularly fast) so it may not get
as many flips in as we would otherwise. So the second test
would only confirm that the async flip itself is working without
any visual artifacts/underruns/etc. This split could also help
in determining whether some failure is due to perhaps the flip
event being delivered too early (should fail the current test)
vs. the hardware just causing visual artifacts on its own
(should fail both tests). An example of the latter case is
the HSW+ VT-d+async flip bug.

And then we'd just leave it to kms_big_fb to validate that the
async flip does in fact flip to the correct framebuffer (and
position inside said framebuffer). No timing sensitive bits
needed in that test.

--=20
Ville Syrj=E4l=E4
Intel
