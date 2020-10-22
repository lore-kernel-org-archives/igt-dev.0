Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3A86F560
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2020 10:00:44 +0000 (UTC)
Date: Thu, 22 Oct 2020 13:00:39 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201022100039.GO7444@platvala-desk.ger.corp.intel.com>
References: <20201021085956.5bgbdcmoh357v3tx@smtp.gmail.com>
 <CAJeY4oF9po+oG_U2e2ez2POojGdv+5B_b4wRmZpL3f0iPb2gvw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJeY4oF9po+oG_U2e2ez2POojGdv+5B_b4wRmZpL3f0iPb2gvw@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_cursor_crc: refactoring
 cursor-alpha subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Melissa Wen <melissa.srw@gmail.com>, Swati Sharma <swati2.sharma@intel.com>, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org, kernel-usp@googlegroups.com
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Oct 21, 2020 at 01:57:27PM -0300, Melissa Wen wrote:
> Hey,
> 
> I saw that the CI reported a failure again for alpha = 0.5.
> Could it be a rounding issue?


Swati and/or J-P, please check this failure.


-- 
Petri Latvala



> 
> Melissa Wen
> 
> On Wed, Oct 21, 2020 at 6:00 AM Melissa Wen <melissa.srw@gmail.com> wrote:
> >
> > Considering just a fully opaque or fully transparent cursor is not enough
> > to check the composition of an ARGB cursor plane. For example, the cairo
> > ARGB32 format uses pre-multiplied alpha, and this representation may only
> > be evident when testing a translucent cursor.
> >
> > Therefore, this patch refactors the cursor-alpha-opaque and
> > cursor-alpha-transparent subtests into just one subtest (cursor-alpha)
> > that checks the alpha blending of a white cursor, with different alpha
> > values, in the primary plane. This refactoring also generates some setup
> > stuffs savings.
> >
> > v2:
> > - debug log states the alpha whenever CRC mismatch (Arek)
> > - checking all alpha values before asserting the result (Arek)
> >
> > Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> > ---
> >  tests/kms_cursor_crc.c | 87 ++++++++++++++++++++++--------------------
> >  1 file changed, 45 insertions(+), 42 deletions(-)
> >
> > diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> > index 0be8f7f8..83c74a69 100644
> > --- a/tests/kms_cursor_crc.c
> > +++ b/tests/kms_cursor_crc.c
> > @@ -428,65 +428,73 @@ static void prepare_crtc(data_t *data, igt_output_t *output,
> >         igt_pipe_crc_start(data->pipe_crc);
> >  }
> >
> > -static void test_cursor_alpha(data_t *data, double a)
> > +static void test_cursor_alpha(data_t *data)
> >  {
> >         igt_display_t *display = &data->display;
> >         igt_pipe_crc_t *pipe_crc = data->pipe_crc;
> > -       igt_crc_t crc, ref_crc;
> > +       igt_crc_t crc[5], ref_crc;
> >         cairo_t *cr;
> >         uint32_t fb_id;
> >         int curw = data->curw;
> >         int curh = data->curh;
> > +       int i, index;
> > +       double alpha;
> > +       bool mismatch = false;
> >
> > -       /* Alpha cursor fb with white color */
> > +       /* Alpha cursor fb */
> >         fb_id = igt_create_fb(data->drm_fd, curw, curh,
> >                                     DRM_FORMAT_ARGB8888,
> >                                     LOCAL_DRM_FORMAT_MOD_NONE,
> >                                     &data->fb);
> >         igt_assert(fb_id);
> > +
> > +       /*
> > +        * Hardware Test
> > +        * With the cursor enabled, get the PF CRCs from the composition with a
> > +        * white cursor with different alpha values.
> > +        */
> >         cr = igt_get_cairo_ctx(data->drm_fd, &data->fb);
> > -       igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, a);
> > -       igt_put_cairo_ctx(cr);
> > +       cairo_set_operator (cr, CAIRO_OPERATOR_SOURCE);
> >
> > -       /* Hardware Test - enable cursor and get PF CRC */
> >         cursor_enable(data);
> > -       igt_display_commit(display);
> > -       igt_wait_for_vblank(data->drm_fd,
> > -                       display->pipes[data->pipe].crtc_offset);
> > -       igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
> > +       for (i = 0, alpha = 1.0; alpha >= 0.0; alpha -= 0.25, i++) {
> > +               igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, alpha);
> > +
> > +               igt_display_commit(display);
> > +               igt_wait_for_vblank(data->drm_fd,
> > +                                   display->pipes[data->pipe].crtc_offset);
> > +               igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc[i]);
> > +       }
> > +       igt_put_cairo_ctx(cr);
> >
> >         cursor_disable(data);
> >         igt_remove_fb(data->drm_fd, &data->fb);
> >
> > -       /* Software Test - render cursor in software, drawn it directly on PF */
> > +       /* Software Test - render cursor in software, drawn it directly on PF*/
> >         cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
> > -       igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, a);
> > -       igt_put_cairo_ctx(cr);
> > -
> > -       igt_display_commit(display);
> > -       igt_wait_for_vblank(data->drm_fd,
> > -                       display->pipes[data->pipe].crtc_offset);
> > -       igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
> >
> > -       /* Compare CRC from Hardware/Software tests */
> > -       igt_assert_crc_equal(&crc, &ref_crc);
> > +       for (i = 0, alpha = 1.0; alpha >= 0.0; alpha -= 0.25, i++) {
> > +               igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, alpha);
> >
> > -       /*Clear Screen*/
> > -       cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
> > -       igt_paint_color(cr, 0, 0, data->screenw, data->screenh,
> > -                       0.0, 0.0, 0.0);
> > -       igt_put_cairo_ctx(cr);
> > -}
> > +               igt_display_commit(display);
> > +               igt_wait_for_vblank(data->drm_fd,
> > +                               display->pipes[data->pipe].crtc_offset);
> > +               igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
> >
> > -static void test_cursor_transparent(data_t *data)
> > -{
> > -       test_cursor_alpha(data, 0.0);
> > +               /* Compare CRC from Hardware/Software tests */
> > +               if (igt_find_crc_mismatch(&crc[i], &ref_crc, &index)) {
> > +                       mismatch = true;
> > +                       igt_debug("CRC mismatch for alpha %.2f: 0x%x != 0x%x\n",
> > +                                 alpha, crc[i].crc[index], ref_crc.crc[index]);
> > +               }
> >
> > -}
> > +               /*Clear Screen*/
> > +               igt_paint_color(cr, 0, 0, data->screenw, data->screenh,
> > +                               0.0, 0.0, 0.0);
> > +       }
> > +       igt_put_cairo_ctx(cr);
> >
> > -static void test_cursor_opaque(data_t *data)
> > -{
> > -       test_cursor_alpha(data, 1.0);
> > +       igt_assert_f(!mismatch, "At least one CRC mismatch detected\n");
> >  }
> >
> >  static void run_test(data_t *data, void (*testfunc)(data_t *), int cursor_w, int cursor_h)
> > @@ -655,15 +663,10 @@ static void run_tests_on_pipe(data_t *data, enum pipe pipe)
> >                 run_test(data, test_cursor_size,
> >                          data->cursor_max_w, data->cursor_max_h);
> >
> > -       igt_describe("Validates the composition of a fully opaque cursor "
> > -                    "plane, i.e., alpha channel equal to 1.0.");
> > -       igt_subtest_f("pipe-%s-cursor-alpha-opaque", kmstest_pipe_name(pipe))
> > -               run_test(data, test_cursor_opaque, data->cursor_max_w, data->cursor_max_h);
> > -
> > -       igt_describe("Validates the composition of a fully transparent cursor "
> > -                    "plane, i.e., alpha channel equal to 0.0.");
> > -       igt_subtest_f("pipe-%s-cursor-alpha-transparent", kmstest_pipe_name(pipe))
> > -               run_test(data, test_cursor_transparent, data->cursor_max_w, data->cursor_max_h);
> > +       igt_describe("Validates the composition of alpha cursor plane "
> > +                    "from fully opaque to fully transparent alpha range");
> > +       igt_subtest_f("pipe-%s-cursor-alpha", kmstest_pipe_name(pipe))
> > +               run_test(data, test_cursor_alpha, data->cursor_max_w, data->cursor_max_h);
> >
> >         igt_fixture
> >                 create_cursor_fb(data, data->cursor_max_w, data->cursor_max_h);
> > --
> > 2.28.0
> >
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
