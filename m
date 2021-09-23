Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FFF6ED92
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Sep 2021 16:44:41 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id b36so440174ljr.6
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Sep 2021 09:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210922193623.3891030-1-markyacoub@chromium.org>
 <YUxDC8oOF03Ixnux@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YUxDC8oOF03Ixnux@platvala-desk.ger.corp.intel.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 23 Sep 2021 12:44:28 -0400
Message-ID: <CAJUqKUpAfwP39A88i-k-JiYzmAxew_7HiMN4+r+eQQv4o7fipg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH] tests/template: Use DRIVER_ANY in for
 drm_open_driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>, Ilja Friedel <ihf@chromium.org>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

Applied, with the removal of igt_require. Thanks!

On Thu, Sep 23, 2021 at 5:00 AM Petri Latvala <petri.latvala@intel.com> wrote:
>
> On Wed, Sep 22, 2021 at 07:36:23PM +0000, Mark Yacoub wrote:
> > From: Mark Yacoub <markyacoub@google.com>
> >
> > [Why]
> > Make it run on all drivers.
> >
> > [How]
> > open any driver instead of intel only.
> >
> > Tested-on: ChromeOS Zork(amdgpu)
> >
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > ---
> >  tests/template.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tests/template.c b/tests/template.c
> > index 5fbd3104..eed81dbf 100644
> > --- a/tests/template.c
> > +++ b/tests/template.c
> > @@ -61,7 +61,7 @@ int drm_fd;
> >  igt_main
> >  {
> >       igt_fixture {
> > -             drm_fd = drm_open_driver(DRIVER_INTEL);
> > +             drm_fd = drm_open_driver(DRIVER_ANY);
> >               igt_require(drm_fd >= 0);
>
> Template becoming a more useful template, thanks.
>
> Also remove that igt_require line, drm_open_driver cannot return <0.
>
>
> With that change,
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>
>
>
> >
> >               /* Set up other interesting stuff shared by all tests. */
> > --
> > 2.33.0.685.g46640cef36-goog
> >
