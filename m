Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D576E198
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2020 06:50:20 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Mon, 20 Apr 2020 06:50:18 +0000
Message-ID: <67f9e4a21e3d4baa94894e82819bb03e@intel.com>
References: <20200416131915.533-1-mika.kahola@intel.com>
 <08a08eea-3b79-4347-5377-47e7413b9e51@gmail.com>
In-Reply-To: <08a08eea-3b79-4347-5377-47e7413b9e51@gmail.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3] tests/kms_cursor_legacy: Wait for an
 extra vblank
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
To: "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

> -----Original Message-----
> From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Sent: Friday, April 17, 2020 5:43 PM
> To: Kahola, Mika <mika.kahola@intel.com>; igt-dev@lists.freedesktop.org
> Subject: Re: [PATCH i-g-t v3] tests/kms_cursor_legacy: Wait for an extra vblank
> 
> I don't think that fifo underrun error on kbl has anything to do with your patch.
> 
> Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Patch pushed. Thanks for the review!

> 
> On 16.4.2020 16.19, Mika Kahola wrote:
> > kms_cursor_legacy IGT subtest 2x-nonblocking-modeset-vs-cursor-atomic
> > is failing due to busyness while trying to do atomic commit. In case,
> > we are busy, let's just wait one extra vblank before continuing the
> > test.
> >
> > References: https://gitlab.freedesktop.org/drm/intel/issues/1062
> >
> > v2: Wait out for max 5 seconds for commit busyness (Juha-Pekka)
> > v3: Move igt_set_timeout() outside of the loop, remove wait for vblank (Juha-
> Pekka)
> >      Move routine that waits for -ebusy into a separate function
> >
> > Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> > ---
> >   tests/kms_cursor_legacy.c | 22 +++++++++++++++-------
> >   1 file changed, 15 insertions(+), 7 deletions(-)
> >
> > diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> > index d5f95b8d..ba66e1bd 100644
> > --- a/tests/kms_cursor_legacy.c
> > +++ b/tests/kms_cursor_legacy.c
> > @@ -852,6 +852,19 @@ static void
> nonblocking_modeset_vs_cursor(igt_display_t *display, int loops)
> >   	igt_remove_fb(display->drm_fd, &cursor_fb);
> >   }
> >
> > +static void wait_for_modeset(igt_display_t *display, unsigned flags, int
> timeout,
> > +			     const char *info)
> > +{
> > +	int ret;
> > +
> > +	igt_set_timeout(timeout, info);
> > +	do {
> > +		ret = igt_display_try_commit_atomic(display, flags, NULL);
> > +	} while (ret == -EBUSY);
> > +	igt_assert(!ret);
> > +	igt_reset_timeout();
> > +}
> > +
> >   static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
> modeset, bool atomic)
> >   {
> >   	struct drm_mode_cursor arg1[2], arg2[2]; @@ -927,7 +940,7 @@ static
> > void two_screens_flip_vs_cursor(igt_display_t *display, int nloops,
> > bool
> >
> >   		if (ret == -EBUSY) {
> >   			/* Force completion on both pipes, and generate event.
> */
> > -			igt_display_commit_atomic(display, flags, NULL);
> > +			wait_for_modeset(display, flags, 5, "Stuck with -
> EBUSY");
> >
> >   			while (nloops--) {
> >   				shared[1] = nloops & 1;
> > @@ -945,12 +958,7 @@ static void two_screens_flip_vs_cursor(igt_display_t
> *display, int nloops, bool
> >   				igt_output_set_pipe(output2, enabled ?
> PIPE_NONE : pipe2);
> >   				enabled = !enabled;
> >
> > -				igt_set_timeout(5, "Scheduling modeset\n");
> > -				do {
> > -					ret =
> igt_display_try_commit_atomic(display, flags, NULL);
> > -				} while (ret == -EBUSY);
> > -				igt_assert(!ret);
> > -				igt_reset_timeout();
> > +				wait_for_modeset(display, flags, 5, "Scheduling
> modeset");
> >   			}
> >
> >   			goto done;
> >

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
