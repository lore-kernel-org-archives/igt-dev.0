Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE63E6E8E4
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2020 09:55:11 +0000 (UTC)
Date: Wed, 23 Sep 2020 12:55:06 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200923095506.GZ6112@intel.com>
References: <20200918064318.2143-1-karthik.b.s@intel.com>
 <20200918113248.GG6112@intel.com>
 <c9dbb1b8-af17-2dd4-b9b9-0c6b06f030b2@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c9dbb1b8-af17-2dd4-b9b9-0c6b06f030b2@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v8] tests/kms_async_flips: Add test to
 validate asynchronous flips
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
To: Karthik B S <karthik.b.s@intel.com>
Cc: michel@daenzer.net, igt-dev@lists.freedesktop.org, daniel.vetter@intel.com, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Sep 23, 2020 at 08:23:44AM +0530, Karthik B S wrote:
> =

> =

> On 9/18/2020 5:02 PM, Ville Syrj=E4l=E4 wrote:
> > On Fri, Sep 18, 2020 at 12:13:18PM +0530, Karthik B S wrote:
> >> Asynchronous flips are issued using the page flip IOCTL.
> >> The test consists of two subtests. The first subtest waits for
> >> the page flip event to be received before giving the next flip,
> >> and the second subtest doesn't wait for page flip events.
> >>
> >> The test passes if the IOCTL is successful.
> >>
> >> v2: -Add authors in the test file. (Paulo)
> >>      -Reduce the run time and timeouts to suit IGT needs. (Paulo)
> >>      -Replace igt_debug's with igt_assert's to catch slow flips. (Paul=
o)
> >>      -Follow IGT coding style regarding spaces. (Paulo)
> >>      -Make set up code part of igt_fixture. (Paulo)
> >>      -Skip the test if async flips are not supported. (Paulo)
> >>      -Replace suggested-by. (Paulo)
> >>      -Added description for test and subtests.
> >>
> >> v3: -Rename the test to kms_async_flips. (Paulo)
> >>      -Modify the TODO comment. (Paulo)
> >>      -Remove igt_debug in flip_handler. (Paulo)
> >>      -Use drmIoctl() in has_async function. (Paulo)
> >>      -Add more details in igt_assert in flip_handler. (Paulo)
> >>      -Remove flag variable in flip_handler. (Paulo)
> >>      -Call igt_assert in flip_handler after the warm up time.
> >>
> >> v4: -Calculate the time stamp in flip_handler from userspace, as the
> >>       kernel will return vbl timestamps and this cannot be used
> >>       for async flips.
> >>      -Add a new subtest to verify that the async flip time stamp
> >>       lies in between the previous and next vblank time stamp. (Daniel)
> >>
> >> v5: -Add test that alternates between sync and async flips. (Ville)
> >>      -Add test to verify invalid async flips. (Ville)
> >>      -Remove the subtest async-flip-without-page-flip-events. (Michel)
> >>      -Remove the intel gpu restriction and make the test generic. (Mic=
hel)
> >>
> >> v6: -Change the THRESHOLD from 10 to 8 as failures are seen on CI
> >>       on platforms <=3D gen10.
> >>      -In older platforms(<=3D gen10), async address update bit in plan=
e ctl
> >>       is double buffered. Made changes in subtests to accomodate this.
> >>      -Moved the igt_assert from flip_handler to individual subtest as =
we
> >>       now have four subtests and adding conditions for the assert in
> >>       flip handler is messy.
> >>
> >> v7: -Change flip_interval from int to float for more precision.
> >>      -Remove the fb height change case in 'invalid' subtest as per the
> >>       feedback received on the kernel patches.
> >>      -Add subtest to verify legacy cursor IOCTL. (Ville)
> >>
> >> v8: -Add a cursor flip before async flip in cursor test. (Ville)
> >>      -Make flip_interval double for more precision as failures are seen
> >>       on older platforms on CI.
> >>
> >> Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> >> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> >> ---
> >>   tests/Makefile.sources  |   1 +
> >>   tests/kms_async_flips.c | 428 ++++++++++++++++++++++++++++++++++++++=
++
> >>   tests/meson.build       |   1 +
> >>   3 files changed, 430 insertions(+)
> >>   create mode 100644 tests/kms_async_flips.c
> >>
> >> diff --git a/tests/Makefile.sources b/tests/Makefile.sources
> >> index 6ae95155..f32ea9cf 100644
> >> --- a/tests/Makefile.sources
> >> +++ b/tests/Makefile.sources
> >> @@ -32,6 +32,7 @@ TESTS_progs =3D \
> >>   	feature_discovery \
> >>   	kms_3d \
> >>   	kms_addfb_basic \
> >> +	kms_async_flips \
> >>   	kms_atomic \
> >>   	kms_atomic_interruptible \
> >>   	kms_atomic_transition \
> >> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> >> new file mode 100644
> >> index 00000000..ef63ec45
> >> --- /dev/null
> >> +++ b/tests/kms_async_flips.c
> >> @@ -0,0 +1,428 @@
> >> +/*
> >> + * Copyright =A9 2020 Intel Corporation
> >> + *
> >> + * Permission is hereby granted, free of charge, to any person obtain=
ing a
> >> + * copy of this software and associated documentation files (the "Sof=
tware"),
> >> + * to deal in the Software without restriction, including without lim=
itation
> >> + * the rights to use, copy, modify, merge, publish, distribute, subli=
cense,
> >> + * and/or sell copies of the Software, and to permit persons to whom =
the
> >> + * Software is furnished to do so, subject to the following condition=
s:
> >> + *
> >> + * The above copyright notice and this permission notice (including t=
he next
> >> + * paragraph) shall be included in all copies or substantial portions=
 of the
> >> + * Software.
> >> + *
> >> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EX=
PRESS OR
> >> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,
> >> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT=
 SHALL
> >> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES =
OR OTHER
> >> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, AR=
ISING
> >> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHE=
R DEALINGS
> >> + * IN THE SOFTWARE.
> >> + *
> >> + * Authors:
> >> + *  Paulo Zanoni <paulo.r.zanoni@intel.com>
> >> + *  Karthik B S <karthik.b.s@intel.com>
> >> + */
> >> +
> >> +#include "igt.h"
> >> +#include "igt_aux.h"
> >> +#include <sys/ioctl.h>
> >> +#include <sys/time.h>
> >> +#include <poll.h>
> >> +
> >> +#define BUFS 4
> > =

> > I'd just truct igt_fb bufs[4], and replace all the other
> > "BUFS" usages with ARRAY_SIZE(bufs).
> =

> Thanks for the review.
> Sure, I'll change this.
> > =

> >> +#define SYNC_FLIP 0
> >> +#define ASYNC_FLIP 1
> > =

> > enum
> > =

> =

> Will update this.
> =

> >> +#define CURSOR_RES 64
> > =

> > Should query that from the kernel so that test is driver agnostic.
> > =

> =

> Sure. Will change this.
> >> +#define CURSOR_POS 128
> >> +
> >> +/*
> >> + * These constants can be tuned in case we start getting unexpected
> >> + * results in CI.
> >> + */
> >> +
> >> +#define WARM_UP_TIME 1
> >> +#define RUN_TIME 2
> >> +#define THRESHOLD 8
> > =

> > A rather non-descriptive name. I guess this is "min flips per frame" or
> > something along those lines?
> > =

> =

> Sure. I will change this to MIN_FLIPS_PER_FRAME.
> >> +
> >> +IGT_TEST_DESCRIPTION("Test asynchrous page flips.");
> > =

> > Check the spelling
> > =

> =

> Will fix this.
> >> +
> >> +typedef struct {
> >> +	int drm_fd;
> >> +	uint32_t crtc_id;
> >> +	struct igt_fb bufs[BUFS];
> >> +	igt_display_t display;
> >> +} data_t;
> >> +
> >> +uint32_t refresh_rate;
> >> +unsigned long flip_timestamp_us;
> >> +double flip_interval;
> > =

> > Hmm. I wonder why these are outside the data_t?
> > =

> =

> Will move the refresh_rate variable inside data_t.
> The other two are getting updated in flip_handler. Hence kept them =

> global. Would you suggest making data_t global. Or any other way I can =

> handle this better?

It should be possible to pass arbitrary data to the event handler.

<snip>
> Sure. Will add a TODO here and add these changes as a follow up.
> >> +		      LOCAL_I915_FORMAT_MOD_Y_TILED, &fb2);
> >> +
> >> +	ret =3D drmModePageFlip(data->drm_fd, data->crtc_id,
> >> +			      fb1.fb_id, flags, NULL);
> >> +
> >> +	igt_assert(ret =3D=3D 0);
> > =

> > Not quite sure why we have this first page flip here?
> > =

> =

> First to have an async flip with xtiled buffer and then follow it up =

> with an async flip with a y-tiled buffer, so the second one is expected =

> to fail. Could this be done in one flip? Am I missing something here?

What does the fist async flip achieve for us? Nothing AFAICS. We must
already be scanning out a similar fb or else the first async flip would
also fail.

If it's possible that we are not already scanning out a similar fb to
the first one then we should do a full modeset/atomic commit to make
it so. Otherwise the second async flip is going to be testing random
things.

> >> +
> >> +	wait_flip_event(data);
> >> +
> >> +	/* Flip with a different fb modifier which is expected to be rejecte=
d */
> >> +	ret =3D drmModePageFlip(data->drm_fd, data->crtc_id,
> >> +			      fb2.fb_id, flags, NULL);
> >> +

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
