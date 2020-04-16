Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0298D6E2D7
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2020 11:32:33 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Thu, 16 Apr 2020 11:32:31 +0000
Message-ID: <d84facfe6e7a41a09ca32a11d664cad3@intel.com>
References: <20200416061014.16130-1-mika.kahola@intel.com>
 <159c568c-7560-950c-5e73-6e7b2444a317@gmail.com>
In-Reply-To: <159c568c-7560-950c-5e73-6e7b2444a317@gmail.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_cursor_legacy: Wait for an
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
> Sent: Thursday, April 16, 2020 12:57 PM
> To: Kahola, Mika <mika.kahola@intel.com>; igt-dev@lists.freedesktop.org
> Subject: Re: [PATCH i-g-t v2] tests/kms_cursor_legacy: Wait for an extra vblank
> 
> On 16.4.2020 9.10, Mika Kahola wrote:
> > kms_cursor_legacy IGT subtest 2x-nonblocking-modeset-vs-cursor-atomic
> > is failing due to busyness while trying to do atomic commit. In case,
> > we are busy, let's just wait one extra vblank before continuing the
> > test.
> >
> > References: https://gitlab.freedesktop.org/drm/intel/issues/1062
> >
> > v2: Wait out for max 5 seconds for commit busyness (Juha-Pekka)
> >
> > Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> > ---
> >   tests/kms_cursor_legacy.c | 6 +++++-
> >   1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> > index d5f95b8d..6467e646 100644
> > --- a/tests/kms_cursor_legacy.c
> > +++ b/tests/kms_cursor_legacy.c
> > @@ -927,7 +927,11 @@ static void
> > two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
> >
> >   		if (ret == -EBUSY) {
> >   			/* Force completion on both pipes, and generate event.
> */
> > -			igt_display_commit_atomic(display, flags, NULL);
> > +			while (ret == -EBUSY) {
> > +				igt_set_timeout(5, "stuck with -EBUSY");
> 
> Timeout should be set outside while loop.
Right, otherwise we just keep resetting the timeout on each iteration.

> 
> > +				igt_wait_for_vblank(display->drm_fd, pipe);
> 
> I don't think vblank wait here does any good, that ebusy doesn't depend on
> vblank.
Actually, there is a similar functionality later in that function. It would be useful just use that routine here as well. I move this into a separate function, so code repetition is avoided.

> 
> > +				ret = igt_display_try_commit_atomic(display,
> flags, NULL);
> > +			}
> 
> You should call igt_reset_timeout() here. If not reaching next timeout block
> from here within this timeout this timer will fail the test.
> 
> >
> >   			while (nloops--) {
> >   				shared[1] = nloops & 1;
> >

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
