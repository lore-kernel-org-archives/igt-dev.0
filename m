Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF836E41A
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Sep 2021 14:29:04 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id e15so26198189lfr.10
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Sep 2021 07:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151334.15818-1-vidya.srinivas@intel.com>
 <20210916135955.17270-1-vidya.srinivas@intel.com>
 <fa1e3d36b6a94da4bfaf33d77e6aa316@intel.com>
 <MWHPR11MB13128EB944916330DFA0CD1989AA9@MWHPR11MB1312.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB13128EB944916330DFA0CD1989AA9@MWHPR11MB1312.namprd11.prod.outlook.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 30 Sep 2021 10:28:46 -0400
Message-ID: <CAJUqKUqcT0_bLo=XQdpo_SpSsZiTyL7E084OgKgFZDKXhcauKA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_psr2_sf: Skip tests if
 selected fetch is not available
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>, jaswanthx.kattamanchi@intel.com
Cc: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>, "Srinivas,
 Vidya" <vidya.srinivas@intel.com>, "markyacoub@google.com" <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lakshmi/Jaswanth

I checked the patch
https://patchwork.freedesktop.org/series/94288/#rev2 and it looks like
a false positive, can we re-report?

Thanks,
Mark

On Thu, Sep 30, 2021 at 8:10 AM Srinivas, Vidya
<vidya.srinivas@intel.com> wrote:
>
>
>
> > -----Original Message-----
> > From: B, Jeevan <jeevan.b@intel.com>
> > Sent: Thursday, September 30, 2021 3:26 PM
> > To: Srinivas, Vidya <vidya.srinivas@intel.com>; igt-dev@lists.freedesktop.org
> > Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>;
> > markyacoub@google.com; Srinivas, Vidya <vidya.srinivas@intel.com>
> > Subject: RE: [igt-dev] [PATCH i-g-t] tests/kms_psr2_sf: Skip tests if selected
> > fetch is not available
> >
> > Looks good to me.
>
> Thank you very much Jeevan.
>
> Regards
> Vidya
> >
> > >-----Original Message-----
> > >From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > >Vidya Srinivas
> > >Sent: Thursday, September 16, 2021 7:30 PM
> > >To: igt-dev@lists.freedesktop.org
> > >Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>;
> > >markyacoub@google.com; Srinivas, Vidya <vidya.srinivas@intel.com>
> > >Subject: [igt-dev] [PATCH i-g-t] tests/kms_psr2_sf: Skip tests if
> > >selected fetch is not available
> > >
> > >Currently the tests are failing on systems where selected fetch feature
> > >is not availble. Kernel returns -EINVAL when the test executes
> > >reporting "Invalid debug mask 4".
> > >Patch skips if selected fetch feature is not available in the kernel.
> > >
> > >v2: Incorportated Mark Yacoub's comments.
> > >Changed igt_skip to igt_require_f
> > >
> > >Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> > Reviewed-by: Jeevan B<jeevan.b@intel.com>
> > >---
> > > lib/igt_psr.c | 2 +-
> > > 1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > >diff --git a/lib/igt_psr.c b/lib/igt_psr.c index
> > >68240f9a33b4..0af503fb796e 100644
> > >--- a/lib/igt_psr.c
> > >+++ b/lib/igt_psr.c
> > >@@ -167,7 +167,7 @@ static bool psr_set(int device, int debugfs_fd, int
> > >mode)  }
> > >
> > > ret = psr_write(debugfs_fd, debug_val); -igt_assert(ret > 0);
> > >+igt_require_f(ret == 0, "PSR2 SF feature not available\n");
> > > }
> > >
> > > /* Restore original value on exit */
> > >--
> > >2.33.0
> >
>
