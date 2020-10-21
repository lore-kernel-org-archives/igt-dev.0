Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE6F6EA8D
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2020 09:14:58 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c77so837626wmd.4
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2020 02:14:58 -0700 (PDT)
Date: Wed, 21 Oct 2020 06:14:50 -0300
From: Melissa Wen <melissa.srw@gmail.com>
Message-ID: <20201021091450.mwqlo3rbnw5tskyc@smtp.gmail.com>
References: <20200826111733.v5dvx7oraip5va6d@smtp.gmail.com>
 <20200909202207.bm2sxutnul3bzked@hatecraft.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200909202207.bm2sxutnul3bzked@hatecraft.localdomain>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cursor_crc: refactoring
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
To: Arkadiusz Hiler <arek@hiler.eu>
Cc: Petri Latvala <petri.latvala@intel.com>, kernel-usp@googlegroups.com, igt-dev@lists.freedesktop.org, twoerner@gmail.com
List-ID: <igt-dev@lists.freedesktop.org>

On 09/09, Arkadiusz Hiler wrote:
> On Wed, Aug 26, 2020 at 08:17:33AM -0300, Melissa Wen wrote:
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
> > Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> > ---
> >  tests/kms_cursor_crc.c | 82 ++++++++++++++++++++----------------------
> >  1 file changed, 39 insertions(+), 43 deletions(-)
> > 
> > diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> > index e9491847..e200b0b5 100644
> > --- a/tests/kms_cursor_crc.c
> > +++ b/tests/kms_cursor_crc.c
> > @@ -478,65 +478,66 @@ static void prepare_crtc(data_t *data, igt_output_t *output,
> >  	igt_pipe_crc_start(data->pipe_crc);
> >  }
> >  
> > -static void test_cursor_alpha(data_t *data, double a)
> > +static void test_cursor_alpha(data_t *data)
> >  {
> >  	igt_display_t *display = &data->display;
> >  	igt_pipe_crc_t *pipe_crc = data->pipe_crc;
> > -	igt_crc_t crc, ref_crc;
> > +	igt_crc_t crc[5], ref_crc;
> >  	cairo_t *cr;
> >  	uint32_t fb_id;
> >  	int curw = data->curw;
> >  	int curh = data->curh;
> > +	int i;
> > +	double alpha;
> >  
> > -	/* Alpha cursor fb with white color */
> > +	/* Alpha cursor fb */
> >  	fb_id = igt_create_fb(data->drm_fd, curw, curh,
> >  				    DRM_FORMAT_ARGB8888,
> >  				    LOCAL_DRM_FORMAT_MOD_NONE,
> >  				    &data->fb);
> >  	igt_assert(fb_id);
> > +
> > +	/* 
> > +	 * Hardware Test
> > +	 * With the cursor enabled, get the PF CRCs from the composition with a
> > +	 * white cursor with different alpha values.
> > +	 */
> >  	cr = igt_get_cairo_ctx(data->drm_fd, &data->fb);
> > -	igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, a);
> > -	igt_put_cairo_ctx(cr);
> > +	cairo_set_operator (cr, CAIRO_OPERATOR_SOURCE);
> >  
> > -	/* Hardware Test - enable cursor and get PF CRC */
> >  	cursor_enable(data);
> > -	igt_display_commit(display);
> > -	igt_wait_for_vblank(data->drm_fd,
> > -			display->pipes[data->pipe].crtc_offset);
> > -	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
> > +	for (i = 0, alpha = 1.0; alpha >= 0.0; alpha -= 0.25, i++) {
> > +		igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, alpha);
> > +
> > +		igt_display_commit(display);
> > +		igt_wait_for_vblank(data->drm_fd,
> > +				    display->pipes[data->pipe].crtc_offset);
> > +		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc[i]);
> > +	}
> > +	igt_put_cairo_ctx(cr);
> >  
> >  	cursor_disable(data);
> >  	igt_remove_fb(data->drm_fd, &data->fb);
> >  
> > -	/* Software Test - render cursor in software, drawn it directly on PF */
> > +	/* Software Test - render cursor in software, drawn it directly on PF*/
> >  	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
> > -	igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, a);
> > -	igt_put_cairo_ctx(cr);
> >  
> > -	igt_display_commit(display);
> > -	igt_wait_for_vblank(data->drm_fd,
> > -			display->pipes[data->pipe].crtc_offset);
> > -	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
> > +	for (i = 0, alpha = 1.0; alpha >= 0.0; alpha -= 0.25, i++) {
> > +		igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, alpha);
> >  
> > -	/* Compare CRC from Hardware/Software tests */
> > -	igt_assert_crc_equal(&crc, &ref_crc);
> > -
> > -	/*Clear Screen*/
> > -	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
> > -	igt_paint_color(cr, 0, 0, data->screenw, data->screenh,
> > -			0.0, 0.0, 0.0);
> > -	igt_put_cairo_ctx(cr);
> > -}
> > -
> > -static void test_cursor_transparent(data_t *data)
> > -{
> > -	test_cursor_alpha(data, 0.0);
> > +		igt_display_commit(display);
> > +		igt_wait_for_vblank(data->drm_fd,
> > +				display->pipes[data->pipe].crtc_offset);
> > +		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
> >  
> > -}
> > +		/* Compare CRC from Hardware/Software tests */
> > +		igt_assert_crc_equal(&crc[i], &ref_crc);
> 
> Hey,
> 
> Sorry it took so long for me to review this. I was taking a bit of a
> break from DRM work.
> 
> The change is sound, checking multiple alpha levels makes sense, and
> looks like the test mostly passes on real HW - I was a bit afraid that
> there may be some discrepancies between SW and HW implementation of
> alpha blending.
> 
> On Intel's CI side - GLK is misbehaving a bit:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4907/shards-all.html?testfilter=cursor-alpha
> 
> But that looks like it's a HW problem. It's for alpha=0.5, which wasn't
> tested before and other generations of hardware are passing the test just
> fine.
> 
> It would be nice to improve logging in the test a bit:
>  * don't fail the test early, always go through all of the alpha levels
>  * clearly state for which alpha levels we have failed, right now you
>    I have to count the number of "commits" in the debug logs
> 
Hi Arek,

Thanks for the review.

Sorry for the delay, I left the context a little after GSoC and only now
I managed to wrap-up it.

I'm not sure if I got it right, when possible, could you give me
feedback on the v2 that I just sent?

Best regards,

Melissa

> We've been doing similar improvements in other tests.
> 
> -- 
> Cheers,
> Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
