Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E723689DC9
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Aug 2021 01:47:39 +0000 (UTC)
From: "Katragadda, MastanX" <mastanx.katragadda@intel.com>
Date: Fri, 20 Aug 2021 01:47:34 +0000
Message-ID: <BN9PR11MB5290CFCEE35970B30B75107897C19@BN9PR11MB5290.namprd11.prod.outlook.com>
References: <20210819061029.610090-1-mastanx.katragadda@intel.com>
 <87zgtdb4kq.wl-ashutosh.dixit@intel.com>
 <87y28xb3x0.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87y28xb3x0.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] tests/i915/exec_balancer: Added Skip
 invalid-bonds
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Surendrakumar Upadhyay, TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>, "jason@jlekstrand.net" <jason@jlekstrand.net>, "Brost, Matthew" <matthew.brost@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Only subtest invalid-bonds failing in gem_exec_balancer when bonding not su=
pported.

-----Original Message-----
From: Dixit, Ashutosh <ashutosh.dixit@intel.com>=20
Sent: 20 August 2021 01:31
To: Katragadda, MastanX <mastanx.katragadda@intel.com>
Cc: igt-dev@lists.freedesktop.org; Surendrakumar Upadhyay, TejaskumarX <tej=
askumarx.surendrakumar.upadhyay@intel.com>; jason@jlekstrand.net; Brost, Ma=
tthew <matthew.brost@intel.com>
Subject: Re: [igt-dev] [i-g-t] tests/i915/exec_balancer: Added Skip invalid=
-bonds

On Thu, 19 Aug 2021 12:46:29 -0700, Dixit, Ashutosh wrote:
>
> On Wed, 18 Aug 2021 23:10:29 -0700, Mastan Katragadda wrote:
> >
> > Added skip which ever gen12+ platforms not supporing bonding.
> >
> > Disable bonding on gen12+ platforms aside from ones already=20
> > supported by the i915 - TGL, RKL, and ADL-S.
> >
> > Link:=20
> > https://cgit.freedesktop.org/drm-tip/commit/?id=3Dce7e75c7ef1bf8ea3d94
> > 7da8c674d2f40fd7d73
> >
> > Signed-off-by: Mastan Katragadda <mastanx.katragadda@intel.com>
> > ---
> >  tests/i915/gem_exec_balancer.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/tests/i915/gem_exec_balancer.c=20
> > b/tests/i915/gem_exec_balancer.c index 2f98950b..2d9c1a53 100644
> > --- a/tests/i915/gem_exec_balancer.c
> > +++ b/tests/i915/gem_exec_balancer.c
> > @@ -349,6 +349,10 @@ static void invalid_bonds(int i915)
> >		bonds[n].num_bonds =3D 1;
> >	}
> >	engines.extensions =3D to_user_pointer(&bonds);
> > +
> > +	igt_skip_on_f(__set_param_fresh_context(i915, p) =3D=3D -ENODEV,
> > +			"Bonding not supported\n");
> > +
> >	igt_assert_eq(__set_param_fresh_context(i915, p), 0);
>
> int ret;
>
> ret =3D __set_param_fresh_context(i915, p); igt_skip_on_f(ret  =3D=3D=20
> -ENODEV, "Bonding not supported\n"); igt_assert_eq(ret, 0);
>
> Also, is this the only test failing in gem_exec_balancer when bonding=20
> is not supported? Or are there others too? Thanks.

Looks like the invalid_balancer test introduced in 17914147aaf will also fa=
il since kernel will now return -ENODEV and not -EINVAL?
