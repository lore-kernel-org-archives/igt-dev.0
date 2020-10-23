Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9FD6E508
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2020 11:47:34 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id v5so1131329wmh.1
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2020 04:47:34 -0700 (PDT)
Date: Fri, 23 Oct 2020 08:47:25 -0300
From: Melissa Wen <melissa.srw@gmail.com>
Message-ID: <20201023114725.yq76vg6grquqing7@smtp.gmail.com>
References: <20201021085956.5bgbdcmoh357v3tx@smtp.gmail.com>
 <20201022103702.GJ6112@intel.com>
 <2b624f9f-2bfc-3ffe-655c-1bca869dd9f2@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2b624f9f-2bfc-3ffe-655c-1bca869dd9f2@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_cursor_crc: refactoring
 cursor-alpha subtests
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 10/22, Juha-Pekka Heikkila wrote:
> On 22.10.2020 13.37, Ville Syrj=E4l=E4 wrote:
> > On Wed, Oct 21, 2020 at 05:59:56AM -0300, Melissa Wen wrote:
> > > Considering just a fully opaque or fully transparent cursor is not en=
ough
> > > to check the composition of an ARGB cursor plane. For example, the ca=
iro
> > > ARGB32 format uses pre-multiplied alpha, and this representation may =
only
> > > be evident when testing a translucent cursor.
> > > =

> > > Therefore, this patch refactors the cursor-alpha-opaque and
> > > cursor-alpha-transparent subtests into just one subtest (cursor-alpha)
> > > that checks the alpha blending of a white cursor, with different alpha
> > > values, in the primary plane. This refactoring also generates some se=
tup
> > > stuffs savings.
> > =

> > Black background means you can't actually tell the
> > difference between premultiplied blending and no
> > blending.
> > =

> > Oh, I guess restore_image() does end up painting
> > the test pattern into the primary plane's fb? Are
> > we guaranteed to position the cursor over some non-black
> > parts?
> > =

> > The other obvious concern is whether hardware and software
> > blending will produce the exact same results or not. I do see
> > you use 1/4 steps for the alpha, which I guess can make that
> > more likely.
> =

> I don't think verifying those blending levels will be possible when
> comparing hw vs sw image, to me it seemed different gens behave different
> with cursor alpha. On this test to make it fail reliably even with alpha
> value 1.0 one just need to change from cursor image white sub block into
> grey level 0.5.
> =

Hi, Ville and Juha-Pekka

Thanks for feedback.

To be honest, I'm a little confused by the issues you raised.
Maybe I'm not getting it right.

(1) We currently have two test cases to check the composition of the
cursor plane with the primary: alpha =3D 0 and alpha =3D 1, both with solid
black background and white cursor. For these cases, the premultiplied or
straight alpha blending behave equally, since the cursor is just all 00
or all FF.

but for any other non-extreme alpha value, if the alpha blending is
straight, it will end up "applying alpha twice". For example, if I
remember correctly, cairo draws a white cursor alpha 0.5 =3D 80808080; and
doing a *straight* alpha blending on black background results in
FF404040. And this is why this patch checks the composition for extreme
and non-extreme alpha values.
Another way could be just to check a third alpha value, without all
these alpha levels... I mean, if you think checking non-extreme values
makes sense.

(2) On the other hand, I guess that the "CRC mismatch for alpha =3D 0.5"
for IGTPW_5080 is not really related to the proper composition, but it
is a rounding issue (225 * 0.5 =3D 127.5). Because it didn't fail for any
other non-extreme alpha levels and to get 128 without rounding issue,
alpha should be 0.502.

Therefore, if the problem here is rounding, would be better to take this
problematic case off, right?

> > =

> > Side note: data->primary_fb[RESTOREBUFFER] looks to be dead weight
> =

> Seems it was left when rendercopy was taken out from this test.
> =

> > =

> > > =

> > > v2:
> > > - debug log states the alpha whenever CRC mismatch (Arek)
> > > - checking all alpha values before asserting the result (Arek)
> > > =

> > > Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> > > ---
> > >   tests/kms_cursor_crc.c | 87 ++++++++++++++++++++++-----------------=
---
> > >   1 file changed, 45 insertions(+), 42 deletions(-)
> > > =

> > > diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> > > index 0be8f7f8..83c74a69 100644
> > > --- a/tests/kms_cursor_crc.c
> > > +++ b/tests/kms_cursor_crc.c
> > > @@ -428,65 +428,73 @@ static void prepare_crtc(data_t *data, igt_outp=
ut_t *output,
> > >   	igt_pipe_crc_start(data->pipe_crc);
> > >   }
> > > -static void test_cursor_alpha(data_t *data, double a)
> > > +static void test_cursor_alpha(data_t *data)
> > >   {
> > >   	igt_display_t *display =3D &data->display;
> > >   	igt_pipe_crc_t *pipe_crc =3D data->pipe_crc;
> > > -	igt_crc_t crc, ref_crc;
> > > +	igt_crc_t crc[5], ref_crc;
> > >   	cairo_t *cr;
> > >   	uint32_t fb_id;
> > >   	int curw =3D data->curw;
> > >   	int curh =3D data->curh;
> > > +	int i, index;
> > > +	double alpha;
> > > +	bool mismatch =3D false;
> > > -	/* Alpha cursor fb with white color */
> > > +	/* Alpha cursor fb */
> > >   	fb_id =3D igt_create_fb(data->drm_fd, curw, curh,
> > >   				    DRM_FORMAT_ARGB8888,
> > >   				    LOCAL_DRM_FORMAT_MOD_NONE,
> > >   				    &data->fb);
> > >   	igt_assert(fb_id);
> > > +
> > > +	/*
> > > +	 * Hardware Test
> > > +	 * With the cursor enabled, get the PF CRCs from the composition wi=
th a
> > > +	 * white cursor with different alpha values.
> > > +	 */
> > >   	cr =3D igt_get_cairo_ctx(data->drm_fd, &data->fb);
> > > -	igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, a);
> > > -	igt_put_cairo_ctx(cr);
> > > +	cairo_set_operator (cr, CAIRO_OPERATOR_SOURCE);
> > > -	/* Hardware Test - enable cursor and get PF CRC */
> > >   	cursor_enable(data);
> > > -	igt_display_commit(display);
> > > -	igt_wait_for_vblank(data->drm_fd,
> > > -			display->pipes[data->pipe].crtc_offset);
> > > -	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
> > > +	for (i =3D 0, alpha =3D 1.0; alpha >=3D 0.0; alpha -=3D 0.25, i++) {
> > > +		igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, alpha);
> > > +
> > > +		igt_display_commit(display);
> > > +		igt_wait_for_vblank(data->drm_fd,
> > > +				    display->pipes[data->pipe].crtc_offset);
> > > +		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc[i]);
> > > +	}
> > > +	igt_put_cairo_ctx(cr);
> > >   	cursor_disable(data);
> > >   	igt_remove_fb(data->drm_fd, &data->fb);
> > > -	/* Software Test - render cursor in software, drawn it directly on =
PF */
> > > +	/* Software Test - render cursor in software, drawn it directly on =
PF*/
> > >   	cr =3D igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFF=
ER]);
> > > -	igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, a);
> > > -	igt_put_cairo_ctx(cr);
> > > -
> > > -	igt_display_commit(display);
> > > -	igt_wait_for_vblank(data->drm_fd,
> > > -			display->pipes[data->pipe].crtc_offset);
> > > -	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
> > > -	/* Compare CRC from Hardware/Software tests */
> > > -	igt_assert_crc_equal(&crc, &ref_crc);
> > > +	for (i =3D 0, alpha =3D 1.0; alpha >=3D 0.0; alpha -=3D 0.25, i++) {
> > > +		igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, alpha);
> > > -	/*Clear Screen*/
> > > -	cr =3D igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFE=
R]);
> > > -	igt_paint_color(cr, 0, 0, data->screenw, data->screenh,
> > > -			0.0, 0.0, 0.0);
> > > -	igt_put_cairo_ctx(cr);
> > > -}
> > > +		igt_display_commit(display);
> > > +		igt_wait_for_vblank(data->drm_fd,
> > > +				display->pipes[data->pipe].crtc_offset);
> > > +		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
> > > -static void test_cursor_transparent(data_t *data)
> > > -{
> > > -	test_cursor_alpha(data, 0.0);
> > > +		/* Compare CRC from Hardware/Software tests */
> > > +		if (igt_find_crc_mismatch(&crc[i], &ref_crc, &index)) {
> > > +			mismatch =3D true;
> > > +			igt_debug("CRC mismatch for alpha %.2f: 0x%x !=3D 0x%x\n",
> > > +				  alpha, crc[i].crc[index], ref_crc.crc[index]);
> > > +		}
> > > -}
> > > +		/*Clear Screen*/
> > > +		igt_paint_color(cr, 0, 0, data->screenw, data->screenh,
> > > +				0.0, 0.0, 0.0);
> > > +	}
> > > +	igt_put_cairo_ctx(cr);
> > > -static void test_cursor_opaque(data_t *data)
> > > -{
> > > -	test_cursor_alpha(data, 1.0);
> > > +	igt_assert_f(!mismatch, "At least one CRC mismatch detected\n");
> > >   }
> > >   static void run_test(data_t *data, void (*testfunc)(data_t *), int =
cursor_w, int cursor_h)
> > > @@ -655,15 +663,10 @@ static void run_tests_on_pipe(data_t *data, enu=
m pipe pipe)
> > >   		run_test(data, test_cursor_size,
> > >   			 data->cursor_max_w, data->cursor_max_h);
> > > -	igt_describe("Validates the composition of a fully opaque cursor "
> > > -		     "plane, i.e., alpha channel equal to 1.0.");
> > > -	igt_subtest_f("pipe-%s-cursor-alpha-opaque", kmstest_pipe_name(pipe=
))
> > > -		run_test(data, test_cursor_opaque, data->cursor_max_w, data->curso=
r_max_h);
> > > -
> > > -	igt_describe("Validates the composition of a fully transparent curs=
or "
> > > -		     "plane, i.e., alpha channel equal to 0.0.");
> > > -	igt_subtest_f("pipe-%s-cursor-alpha-transparent", kmstest_pipe_name=
(pipe))
> > > -		run_test(data, test_cursor_transparent, data->cursor_max_w, data->=
cursor_max_h);
> > > +	igt_describe("Validates the composition of alpha cursor plane "
> > > +		     "from fully opaque to fully transparent alpha range");
> > > +	igt_subtest_f("pipe-%s-cursor-alpha", kmstest_pipe_name(pipe))
> > > +		run_test(data, test_cursor_alpha, data->cursor_max_w, data->cursor=
_max_h);
> > >   	igt_fixture
> > >   		create_cursor_fb(data, data->cursor_max_w, data->cursor_max_h);
> > > -- =

> > > 2.28.0
> > > =

> > > _______________________________________________
> > > igt-dev mailing list
> > > igt-dev@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/igt-dev
> > =

> =

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
