Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C90689F3B
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Apr 2021 07:10:26 +0000 (UTC)
From: "Surendrakumar Upadhyay, TejaskumarX"
 <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Mon, 19 Apr 2021 07:10:20 +0000
Message-ID: <SN6PR11MB3421E4E2E3815CE72DD5E394DF499@SN6PR11MB3421.namprd11.prod.outlook.com>
References: <20210419060928.671111-1-viswax.krishna.raveendra.talabattula@intel.com>
 <87sg3mpyfl.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87sg3mpyfl.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] [i-g-t] tests/i915: Remove I915_CACHING_NONE
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Talabattula, ViswaX Krishna
 Raveendra" <viswax.krishna.raveendra.talabattula@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pandey,
 Hariom" <hariom.pandey@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Sent: 19 April 2021 12:13
> To: Talabattula, ViswaX Krishna Raveendra
> <viswax.krishna.raveendra.talabattula@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Surendrakumar Upadhyay, TejaskumarX
> <tejaskumarx.surendrakumar.upadhyay@intel.com>; Pandey, Hariom
> <hariom.pandey@intel.com>; Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>
> Subject: Re: [igt-dev] [PATCH] [i-g-t] tests/i915: Remove
> I915_CACHING_NONE
> 
> On Sun, 18 Apr 2021 23:09:28 -0700,
> <viswax.krishna.raveendra.talabattula@intel.com> wrote:
> >
> > From: Viswa Krishna Raveendra Talabattula
> > <viswax.krishna.raveendra.talabattula@intel.com>
> >
> > The userptr memory does not support I915_CACHING_NONE(no caching)
> > level as per the below commit related to i915 in the kernel
> >
> > drm/i915: Reject more ioctls for userptr, v2.
> >
> > Hence removing the cache level of I915_CACHING_NONE from the test case
> 
> Instead of dropping the test should we check for -ENXIO return?

As far as our understanding is concern, no caching is dropped for all platforms. In that case we think keeping it in tests has no meaning. Please suggest.

Thanks,
Tejas
> 
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Signed-off-by: Viswa Krishna Raveendra Talabattula
> > <viswax.krishna.raveendra.talabattula@intel.com>
> > ---
> >  tests/i915/gem_userptr_blits.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/tests/i915/gem_userptr_blits.c
> > b/tests/i915/gem_userptr_blits.c index aad5f141..f0c63535 100644
> > --- a/tests/i915/gem_userptr_blits.c
> > +++ b/tests/i915/gem_userptr_blits.c
> > @@ -2011,7 +2011,6 @@ static void test_sd_probe(int i915)
> >  static void test_set_caching(int i915)
> >  {
> >	const int levels[] = {
> > -		I915_CACHING_NONE,
> >		I915_CACHING_CACHED,
> >	};
> >	uint32_t handle;
> > --
> > 2.30.0
> >
> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
