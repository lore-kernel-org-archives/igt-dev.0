Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5ED66EDED
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jul 2021 16:31:00 +0000 (UTC)
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Date: Thu, 29 Jul 2021 16:30:22 +0000
Message-ID: <BY5PR11MB4372553DC55C9B7C9510DA7089EB9@BY5PR11MB4372.namprd11.prod.outlook.com>
References: <20210727145714.27046-1-vidya.srinivas@intel.com>
 <20210727185445.11804-1-vidya.srinivas@intel.com>
 <BY5PR11MB4372521D9BC4A09D6A389AB589EB9@BY5PR11MB4372.namprd11.prod.outlook.com>
 <439f3520052748a284513f0e75689fbf@intel.com>
In-Reply-To: <439f3520052748a284513f0e75689fbf@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_big_fb: Fix hw stride length
 tests
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
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Lin, Charlton" <charlton.lin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Thank you very much Lakshmi.

Regards
Vidya

> -----Original Message-----
> From: Vudum, Lakshminarayana <lakshminarayana.vudum@intel.com>
> Sent: Thursday, July 29, 2021 9:55 PM
> To: Srinivas, Vidya <vidya.srinivas@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Shankar,
> Uma <uma.shankar@intel.com>; Almahallawy, Khaled
> <khaled.almahallawy@intel.com>; Lin, Charlton <charlton.lin@intel.com>;
> Lin, Charlton <charlton.lin@intel.com>
> Subject: RE: [PATCH i-g-t] tests/kms_big_fb: Fix hw stride length tests
> 
> Re-reported.
> 
> -----Original Message-----
> From: Srinivas, Vidya <vidya.srinivas@intel.com>
> Sent: Thursday, July 29, 2021 12:39 AM
> To: igt-dev@lists.freedesktop.org; Vudum, Lakshminarayana
> <lakshminarayana.vudum@intel.com>
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Shankar,
> Uma <uma.shankar@intel.com>; Almahallawy, Khaled
> <khaled.almahallawy@intel.com>; Lin, Charlton <charlton.lin@intel.com>;
> Lin, Charlton <charlton.lin@intel.com>
> Subject: RE: [PATCH i-g-t] tests/kms_big_fb: Fix hw stride length tests
> 
> Hello Lakshmi,
> 
> Could you kindly help re-run
> https://patchwork.freedesktop.org/series/92936/ Rev 3?
> Thank you so much.
> 
> Regards
> Vidya
> 
> > -----Original Message-----
> > From: Srinivas, Vidya <vidya.srinivas@intel.com>
> > Sent: Wednesday, July 28, 2021 12:25 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Shankar,
> Uma
> > <uma.shankar@intel.com>; Almahallawy, Khaled
> > <khaled.almahallawy@intel.com>; Lin, Charlton
> > <charlton.lin@intel.com>; Srinivas, Vidya <vidya.srinivas@intel.com>;
> > Lin, Charlton <charlton.lin@intel.com>
> > Subject: [PATCH i-g-t] tests/kms_big_fb: Fix hw stride length tests
> >
> > We see the HW stride length tests are crashing when run in sequence.
> > Individually, they PASS.
> > This is happening due to missing data.ibb creation before the test_scanout.
> > Patch fixes the same.
> >
> > Signed-off-by: Charlton Lin <charlton.lin@intel.com>
> > Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> > Change-Id: I8a9ec8dd00ff249ef2ef72e0c2da28467e65563c
> > ---
> >  tests/kms_big_fb.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c index
> > c6f374bdd073..26c7b8b200eb 100644
> > --- a/tests/kms_big_fb.c
> > +++ b/tests/kms_big_fb.c
> > @@ -852,7 +852,6 @@ igt_main
> >  data.render_copy =
> > igt_get_render_copyfunc(data.devid);
> >
> >  data.bops = buf_ops_create(data.drm_fd); -data.ibb =
> > intel_bb_create(data.drm_fd, 4096);
> >
> >  data.planeclearrgb[0] = 0.0;
> >  data.planeclearrgb[1] = 0.0;
> > @@ -978,7 +977,9 @@ igt_main
> >  igt_require(data.format ==
> > DRM_FORMAT_C8 ||
> >
> > igt_fb_supported_format(data.format));
> >
> > igt_require(igt_display_has_format_mod(&data.display,
> > data.format, data.modifier));
> > +data.ibb =
> > intel_bb_create(data.drm_fd, 4096);
> >  test_scanout(&data);
> > +intel_bb_destroy(data.ibb);
> >  }
> >
> >  // async flip doesn't support linear fbs.
> > @@ -994,7 +995,9 @@ igt_main
> >
> > igt_require(igt_display_has_format_mod(&data.display,
> > data.format, data.modifier));
> >
> > igt_require_f(data.async_flip_support, "Async Flip is not
> > supported\n");
> >
> > data.max_hw_fb_width = min(data.hw_stride / (formats[j].bpp >> 3),
> > data.max_fb_width);
> > +data.ibb =
> > intel_bb_create(data.drm_fd, 4096);
> >  test_scanout(&data);
> > +
> > intel_bb_destroy(data.ibb);
> >  }
> >  data.async_flip_test = false;
> >  }
> > --
> > 2.32.0
> 
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
