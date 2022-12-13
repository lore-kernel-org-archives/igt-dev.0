Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0495010E1C4
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Dec 2022 17:39:41 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-144b21f5e5fso13421355fac.12
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Dec 2022 09:39:41 -0800 (PST)
MIME-Version: 1.0
References: <20221211195302.120794-1-robdclark@gmail.com>
 <Y5c3G5t7DhBvFwc6@kamilkon-desk1>
 <CAF6AEGvYp1rdfrpyaQBz=Agi=z-Xtg4LGDM-YxsW5z9YHn5=BA@mail.gmail.com>
 <Y5helPICqjYD3tE9@kamilkon-desk1>
In-Reply-To: <Y5helPICqjYD3tE9@kamilkon-desk1>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 13 Dec 2022 09:39:35 -0800
Message-ID: <CAF6AEGtWSw3YvfDM=WVKemz=+ouND2GqMd2mzfa1j2vyF2637w@mail.gmail.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH igt] tests/msm: Read the devcore back in
 recovery tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Dec 13, 2022 at 3:14 AM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Rob,
>
> On 2022-12-12 at 13:54:39 -0800, Rob Clark wrote:
> > On Mon, Dec 12, 2022 at 6:15 AM Kamil Konieczny
> > <kamil.konieczny@linux.intel.com> wrote:
> > >
> > > Hi Rob,
> > >
> > > before sending again please rebase on current igt (see logs from
> > > gitlab).
> >
> > sure.. but I was based on ToT as of the 7th, and it rebased cleanly..
> > not sure if you had some concern than I'm overlooking
>
> Well it depends on previous ones, especially this one:
>
> [1/2] lib: Add helper to wait and close fence fd
>

there is a trivial conflict to resolve if this is merged before that
series.. but I can deal with that before pushing, once patches get
r-b's ;-)

BR,
-R

> so please either send it as part of whole series or wait for
> others to be merged.
> Btw it would help if you at least note such dependancy in cover
> letter or in patch description after "---" like:
>
> ---
> some notes that will not go into git repo, for example:
> This patch depends on "lib: Add helper to wait and close fence fd"
>
> It will help maintainters to look at this only after other parts
> will go.
>
> Regards,
> Kamil
>
> >
> > > I have also one small nit below.
> > >
> > > On 2022-12-11 at 11:53:02 -0800, Rob Clark wrote:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > This also adds coverage for codepaths related to reading back the
> > > > devcore file from sysfs, to help catch issues like
> > > > https://gitlab.freedesktop.org/drm/msm/-/issues/20
> > > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > ---
> > > >  tests/msm/msm_recovery.c | 42 ++++++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 42 insertions(+)
> > > >
> > > > diff --git a/tests/msm/msm_recovery.c b/tests/msm/msm_recovery.c
> > > > index e01087b4..4c2f2846 100644
> > > > --- a/tests/msm/msm_recovery.c
> > > > +++ b/tests/msm/msm_recovery.c
> > > > @@ -22,14 +22,54 @@
> > > >   */
> > > >
> > > >  #include <fcntl.h>
> > > > +#include <glob.h>
> > > >
> > > >  #include "igt.h"
> > > >  #include "igt_msm.h"
> > > > +#include "igt_io.h"
> > > >
> > > >  static struct msm_device *dev;
> > > >  static struct msm_bo *scratch_bo;
> > > >  static uint32_t *scratch;
> > > >
> > > > +/*
> > > > + * Helper to read and clear devcore.  We want to read it completely to ensure
> > > > + * we catch any kernel side regressions like:
> > > > + * https://gitlab.freedesktop.org/drm/msm/-/issues/20
> > > > + */
> > > > +
> > > > +static void
> > > > +read_and_clear_devcore(void)
> > > > +{
> > > > +     glob_t glob_buf = {0};
> > > > +     int ret, fd;
> > > > +
> > > > +     ret = glob("/sys/class/devcoredump/devcd*/data", GLOB_NOSORT, NULL, &glob_buf);
> > > > +     if ((ret == GLOB_NOMATCH) || !glob_buf.gl_pathc)
> > > > +             return;
> > > > +
> > > > +     fd = open(glob_buf.gl_pathv[0], O_RDWR);
> > > > +
> > > > +     if (fd >= 0) {
> > > > +             char buf[0x1000];
> > > > +
> > > > +             /*
> > > > +              * We want to read the entire file but we can throw away the
> > > > +              * contents.. we just want to make sure that we exercise the
> > > > +              * kernel side codepaths hit when reading the devcore from
> > > > +              * sysfs
> > > > +              */
> > > > +             do {
> > > > +                     ret = igt_readn(fd, buf, sizeof(buf));
> > > > +             } while (ret > 0);
> > > > +
> > > > +             /* Clear the devcore: */
> > > > +             igt_writen(fd, "1", 1);
> > >
> > > Put here:
> > >                 fclose(fd);
> > >
> >
> > oh, right, good catch
> >
> > BR,
> > -R
> >
> > > Regards,
> > > Kamil
> > >
> > > > +     }
> > > > +
> > > > +     globfree(&glob_buf);
> > > > +}
> > > > +
> > > >  /*
> > > >   * Helpers for cmdstream packet building:
> > > >   */
> > > > @@ -102,6 +142,8 @@ do_hang_test(struct msm_pipe *pipe)
> > > >                       continue;
> > > >               igt_assert_eq(scratch[1+i], 2+i);
> > > >       }
> > > > +
> > > > +     read_and_clear_devcore();
> > > >  }
> > > >
> > > >  /*
> > > > --
> > > > 2.38.1
> > > >
