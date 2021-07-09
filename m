Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E8C6EA2A
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jul 2021 12:32:34 +0000 (UTC)
Date: Fri, 9 Jul 2021 15:32:09 +0300
From: Arkadiusz Hiler <arek@hiler.eu>
Message-ID: <20210709123139.2a55qwsyvub2usii@hatecraft.localdomain>
References: <20210701174424.2261499-1-markyacoub@chromium.org>
 <20210701174424.2261499-2-markyacoub@chromium.org>
 <20210706134110.iopwgjfwpnibtyjb@outlook.office365.com>
 <CAJUqKUqCw-BMBrh4kYhs33qz0UFABi=kBvkbGn9VRqSEQyHsJg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJUqKUqCw-BMBrh4kYhs33qz0UFABi=kBvkbGn9VRqSEQyHsJg@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH 2/2] kms_addfb_basic: Check for AMDGPU and MSM
 bad pitch.
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
To: Mark Yacoub <markyacoub@chromium.org>
Cc: Mohammed Khajapasha <mohammed.khajapasha@intel.com>, Petri Latvala <petri.latvala@intel.com>, Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jul 07, 2021 at 12:09:14PM -0400, Mark Yacoub wrote:
> This is odd, idrk.
> 
> On Tue, Jul 6, 2021 at 9:41 AM Rodrigo Siqueira
> <Rodrigo.Siqueira@amd.com> wrote:
> >
> > On 07/01, Mark Yacoub wrote:
> > > From: Mark Yacoub <markyacoub@google.com>
> > >
> > > [Why]
> > > AMDGPU and MSM devices have a known errno when it fails coorectly for
> > > bad pitches.
> > >
> > > [How]
> > > Assert `errno` to `EINVAL` for both AMDGPU and MSM as well.
> > >
> > > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > > ---
> > >  tests/kms_addfb_basic.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> > > index 85c14be5..91fb6ac9 100644
> > > --- a/tests/kms_addfb_basic.c
> > > +++ b/tests/kms_addfb_basic.c
> > > @@ -310,7 +310,7 @@ static void pitch_tests(int fd)
> > >                       f.pitches[0] = bad_pitches[i];
> > >                       igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f), -1);
> > >                       igt_assert(errno != 0);
> > > -                     if (is_i915_device(fd)) {
> > > +                     if (is_i915_device(fd) || is_amdgpu_device(fd) || is_msm_device(fd)) {
> > >                               igt_assert_eq(errno, EINVAL);
> > >                       } else if (is_nouveau_device(fd)) {
> > >                               if (bad_pitches[i] > 4 * 1024)
> > > --
> > > 2.32.0.93.g670b81a890-goog
> > >
> >
> > Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> >
> > Btw, from the CI log, we have:
> >
> > igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> >   shard-apl: NOTRUN -> FAIL
> >   shard-tglb: NOTRUN -> FAIL
> >   shard-glk: NOTRUN -> FAIL
> >   shard-kbl: NOTRUN -> FAIL
> >   shard-snb: NOTRUN -> FAIL
> >   shard-iclb: NOTRUN -> FAIL
> >
> > igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> >   shard-iclb: NOTRUN -> SKIP +1 similar issue
> >
> > I don't know why your patch makes something that was not running start
> > to run. Any theory?

The CI is not perfect and the test were just not run previously due to
unrelated issues. I've merged your changes as this is not related to
them.

As of the failing tests - those are new and were introduced recently by
5bb62cb290fa ("tests/kms_addfb_basic: Add invalid buffer object test for
discrete") and seem to fail reliably:

https://intel-gfx-ci.01.org/tree/drm-tip/shards-all.html?testfilter=invalid-smem-bo-on-discrete

I've CCed the author of the tests so they can have a look and fix the
tests

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
