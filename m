Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E9D6E529
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Sep 2021 15:26:03 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id b15so50906841lfe.7
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Sep 2021 08:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210916142722.17881-1-vidya.srinivas@intel.com>
 <DM8PR11MB571976A46DFFE625ED0F1D068DA09@DM8PR11MB5719.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB571976A46DFFE625ED0F1D068DA09@DM8PR11MB5719.namprd11.prod.outlook.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Mon, 20 Sep 2021 11:24:10 -0400
Message-ID: <CAJUqKUorZH-6Lq+1Dp8+ft7zgdRc6_k_-9CEhWyfajQ-=xA=xA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cursor_legacy: Fix CRC
 mismatch for flip-vs-cursor-busy-crc-*
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Cc: "Srinivas, Vidya" <vidya.srinivas@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "markyacoub@google.com" <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

Applied. Thanks Vidya and Bhanu.

On Mon, Sep 20, 2021 at 6:51 AM Modem, Bhanuprakash
<bhanuprakash.modem@intel.com> wrote:
>
> > From: Srinivas, Vidya <vidya.srinivas@intel.com>
> > Sent: Thursday, September 16, 2021 7:57 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; markyacoub@google.com;
> > Srinivas, Vidya <vidya.srinivas@intel.com>
> > Subject: [PATCH i-g-t] tests/kms_cursor_legacy: Fix CRC mismatch for flip-vs-
> > cursor-busy-crc-*
> >
> > Few variants of Intel devices are failing randomly with CRC mismatch for
> > flip-vs-cursor-busy-crc-atomic and flip-vs-cursor-busy-crc-legacy.
> > Patch adds stop of CRC collection to fix this issue.
> >
> > Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> > ---
> >  tests/kms_cursor_legacy.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> > index 3ddea9c35340..8136280701e6 100644
> > --- a/tests/kms_cursor_legacy.c
> > +++ b/tests/kms_cursor_legacy.c
> > @@ -1401,6 +1401,7 @@ static void flip_vs_cursor_busy_crc(igt_display_t
> > *display, bool atomic)
> >               igt_assert_crc_equal(&crcs[i], &test_crc);
> >       }
> >
> > +     igt_pipe_crc_stop(pipe_crc);
>
> LGTM:
> Reviewed-by: Bhanuprakash Modem <Bhanuprakash.modem@intel.com>
>
> - Bhanu
>
> >       igt_remove_fb(display->drm_fd, &fb_info[1]);
> >       igt_remove_fb(display->drm_fd, &fb_info[0]);
> >       igt_remove_fb(display->drm_fd, &cursor_fb);
> > --
> > 2.33.0
>
