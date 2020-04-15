Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731BA6E957
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2020 10:26:08 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Wed, 15 Apr 2020 10:26:06 +0000
Message-ID: <e47ebd83e9d2472eb11746ab0da6bfb3@intel.com>
References: <20200402110729.18305-1-mika.kahola@intel.com>
 <7b5a847a-607a-74f0-e854-78bbb2a4975d@gmail.com>
In-Reply-To: <7b5a847a-607a-74f0-e854-78bbb2a4975d@gmail.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cursor_legacy: Wait for an
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
> Sent: Wednesday, April 15, 2020 11:58 AM
> To: Kahola, Mika <mika.kahola@intel.com>; igt-dev@lists.freedesktop.org
> Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cursor_legacy: Wait for an extra
> vblank
> 
> On 2.4.2020 14.07, Mika Kahola wrote:
> > kms_cursor_legacy IGT subtest 2x-nonblocking-modeset-vs-cursor-atomic
> > is failing due to busyness while trying to do atomic commit. In case,
> > we are busy, let's just wait one extra vblank before continuing the
> > test.
> >
> > References: https://gitlab.freedesktop.org/drm/intel/issues/1062
> >
> > Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> > ---
> >   tests/kms_cursor_legacy.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> > index d5f95b8d..13aadcce 100644
> > --- a/tests/kms_cursor_legacy.c
> > +++ b/tests/kms_cursor_legacy.c
> > @@ -894,7 +894,6 @@ static void
> > two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
> >
> >   	arg2[1].x = arg2[1].y = 192;
> >
> > -
> 
> random empty line deletion
Oh, that was unintentional. Good catch!

> 
> >   	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC :
> > COMMIT_LEGACY);
> >
> >   	igt_fork(child, 2) {
> > @@ -927,6 +926,7 @@ static void
> > two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
> >
> >   		if (ret == -EBUSY) {
> >   			/* Force completion on both pipes, and generate event.
> */
> > +			igt_wait_for_vblank(display->drm_fd, pipe);
> 
> I was wondering where that ebusy is coming from, it is because of above
> disabling pipe2? Anyway, would it be better to wait for ebusy to go away if
> cannot commit during that time? I'm thinking this will fail if whatever causing
> that ebusy will go past vblank..for example really slow monitor.

I chose to use an extra vblank as it turned out to be good enough to pass the test on my test platform.

Another alternative would be to wait out for ebusy to go away, like you proposed. I think in this approach we would need to add a timeout to ensure that we don't wait indefinitely.  

> 
> 
> >   			igt_display_commit_atomic(display, flags, NULL);
> >
> >   			while (nloops--) {
> >

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
