Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7620F6ECCB
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jul 2021 07:42:41 +0000 (UTC)
From: "Shankar, Uma" <uma.shankar@intel.com>
Date: Thu, 29 Jul 2021 07:42:36 +0000
Message-ID: <83448a629c114a5394f98af83accee25@intel.com>
References: <20210722150700.18435-1-vidya.srinivas@intel.com>
 <BY5PR11MB4372DC7CD6A6F7BF06ECEE0689E59@BY5PR11MB4372.namprd11.prod.outlook.com>
 <60ca1d0569f548c58664966995b6264f@intel.com>
 <BY5PR11MB43721158F69B22B17A661D2189E69@BY5PR11MB4372.namprd11.prod.outlook.com>
 <BY5PR11MB43721449F6D48620A43FC23B89EB9@BY5PR11MB4372.namprd11.prod.outlook.com>
 <SN6PR11MB3421F31D4487939E06DE3FB0DFEB9@SN6PR11MB3421.namprd11.prod.outlook.com>
In-Reply-To: <SN6PR11MB3421F31D4487939E06DE3FB0DFEB9@SN6PR11MB3421.namprd11.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] Revert the wrong fix for
 coverage-premultiplied-constant
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
To: "Surendrakumar Upadhyay, TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>, "Srinivas, Vidya" <vidya.srinivas@intel.com>, "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Joshi, Kunal1" <kunal1.joshi@intel.com>
Cc: "Latvala, Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Surendrakumar Upadhyay, TejaskumarX
> <tejaskumarx.surendrakumar.upadhyay@intel.com>
> Sent: Thursday, July 29, 2021 12:09 PM
> To: Srinivas, Vidya <vidya.srinivas@intel.com>; Vudum, Lakshminarayana
> <lakshminarayana.vudum@intel.com>; igt-dev@lists.freedesktop.org; Joshi, Kunal1
> <kunal1.joshi@intel.com>
> Cc: Latvala, Petri <petri.latvala@intel.com>; Modem, Bhanuprakash
> <bhanuprakash.modem@intel.com>; Shankar, Uma <uma.shankar@intel.com>
> Subject: RE: [PATCH i-g-t 0/2] Revert the wrong fix for coverage-premultiplied-
> constant
> 
> Reviewed-by : Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>

Request to all, please refrain from top posting. Have all your comments inline.

Regards,
Uma Shankar
> Thanks,
> Tejas
> 
> > -----Original Message-----
> > From: Srinivas, Vidya <vidya.srinivas@intel.com>
> > Sent: 29 July 2021 12:07
> > To: Vudum, Lakshminarayana <lakshminarayana.vudum@intel.com>; igt-
> > dev@lists.freedesktop.org; Joshi, Kunal1 <kunal1.joshi@intel.com>;
> > Surendrakumar Upadhyay, TejaskumarX
> > <tejaskumarx.surendrakumar.upadhyay@intel.com>
> > Cc: Latvala, Petri <petri.latvala@intel.com>; Modem, Bhanuprakash
> > <bhanuprakash.modem@intel.com>; Shankar, Uma <uma.shankar@intel.com>
> > Subject: RE: [PATCH i-g-t 0/2] Revert the wrong fix for coverage-
> > premultiplied-constant
> >
> > @Surendrakumar Upadhyay, TejaskumarX Can you kindly review the patch
> > series - Please provide RB for full series? Thank you.
> > Kunal, kindly help merge. Thank you.
> >
> > Regards
> > Vidya
> >
> > > -----Original Message-----
> > > From: Srinivas, Vidya
> > > Sent: Saturday, July 24, 2021 9:39 PM
> > > To: Vudum, Lakshminarayana <Lakshminarayana.Vudum@intel.com>; igt-
> > > dev@lists.freedesktop.org
> > > Cc: Latvala, Petri <petri.latvala@intel.com>; Modem, Bhanuprakash
> > > <Bhanuprakash.Modem@intel.com>; Shankar, Uma
> > <uma.shankar@intel.com>
> > > Subject: RE: [PATCH i-g-t 0/2] Revert the wrong fix for coverage-
> > > premultiplied-constant
> > >
> > > Thank you so much Lakshmi. This time it has PASSED.
> > >
> > > Regards
> > > Vidya
> > >
> > > > -----Original Message-----
> > > > From: Vudum, Lakshminarayana <lakshminarayana.vudum@intel.com>
> > > > Sent: Friday, July 23, 2021 9:00 PM
> > > > To: Srinivas, Vidya <vidya.srinivas@intel.com>;
> > > > igt-dev@lists.freedesktop.org
> > > > Cc: Latvala, Petri <petri.latvala@intel.com>; Modem, Bhanuprakash
> > > > <bhanuprakash.modem@intel.com>; Shankar, Uma
> > > <uma.shankar@intel.com>
> > > > Subject: RE: [PATCH i-g-t 0/2] Revert the wrong fix for coverage-
> > > > premultiplied-constant
> > > >
> > > > Hi,
> > > >
> > > > Failures are addressed and results are re-reported.
> > > >
> > > > Lakshmi.
> > > > -----Original Message-----
> > > > From: Srinivas, Vidya <vidya.srinivas@intel.com>
> > > > Sent: Friday, July 23, 2021 1:46 AM
> > > > To: igt-dev@lists.freedesktop.org
> > > > Cc: Latvala, Petri <petri.latvala@intel.com>; Modem, Bhanuprakash
> > > > <bhanuprakash.modem@intel.com>; Shankar, Uma
> > > <uma.shankar@intel.com>;
> > > > Vudum, Lakshminarayana <lakshminarayana.vudum@intel.com>
> > > > Subject: RE: [PATCH i-g-t 0/2] Revert the wrong fix for coverage-
> > > > premultiplied-constant
> > > >
> > > > Hello Lakshmi,
> > > >
> > > > We need to revert this series. But there is a false positive.
> > > > Could you kindly help with re-run? Thank you so much.
> > > >
> > > > https://patchwork.freedesktop.org/series/92898/
> > > >
> > > > Regards
> > > > Vidya
> > > >
> > > > > -----Original Message-----
> > > > > From: Srinivas, Vidya <vidya.srinivas@intel.com>
> > > > > Sent: Thursday, July 22, 2021 8:37 PM
> > > > > To: igt-dev@lists.freedesktop.org
> > > > > Cc: Latvala, Petri <petri.latvala@intel.com>; Modem,
> > > > > Bhanuprakash <bhanuprakash.modem@intel.com>; Shankar, Uma
> > > > <uma.shankar@intel.com>;
> > > > > Srinivas, Vidya <vidya.srinivas@intel.com>
> > > > > Subject: [PATCH i-g-t 0/2] Revert the wrong fix for
> > > > > coverage-premultiplied- constant
> > > > >
> > > > > Subtest coverage-premultiplied-constant was failing due to
> > > > > buffer alignment issue. It was not due to 6bpc.
> > > > > Hence, we need to revert this patch which was wrongly submitted.
> > > > >
> > > > > Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> 
> Reviewed-by : Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> 
> > > > >
> > > > >
> > > > > Vidya Srinivas (2):
> > > > >   Revert "tests/kms_plane_alpha_blend: Fix a check in is_6bpc function"
> > > > >   Revert "tests/kms_plane_alpha_blend: Skip
> > > > > coverage-vs-premult-vs-
> > > none
> > > > >     for 6bpc panels"
> > > > >
> > > > >  tests/kms_plane_alpha_blend.c | 36
> > > > > -----------------------------------
> > > > >  1 file changed, 36 deletions(-)
> > > > >
> > > > > --
> > > > > 2.32.0
> > > >
> > > >
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
