Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8662310E1BF
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Mar 2022 04:54:13 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>
Date: Fri, 25 Mar 2022 04:54:08 +0000
Message-ID: <2c8458a12a74422e9b86dda6d1f9d5c8@intel.com>
References: <20220324101852.73089-1-riana.tauro@intel.com>
 <YjypYbg8RYZH+9VN@intel.com>
In-Reply-To: <YjypYbg8RYZH+9VN@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [RFC PATCH i-g-t 0/4] Basic Suspend/Resume with i915
 unload
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Rodrig=
o
> Vivi
> Sent: Thursday, March 24, 2022 10:55 PM
> To: Tauro, Riana <riana.tauro@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [igt-dev] [RFC PATCH i-g-t 0/4] Basic Suspend/Resume with i9=
15
> unload
>=20
> On Thu, Mar 24, 2022 at 03:48:48PM +0530, Riana Tauro wrote:
> > From: "Tauro, Riana" <riana.tauro@intel.com>
> >
> > Exercise suspend/resume cycles without i915 module to know the system
> > wide health of suspend/resume feature before executing i915 suspend/res=
ume
> tests.
>=20
> The idea of having a system-wide suspend test is good so if we are failin=
g the
> i915 suspend tests but also failing the system suspend without i915 we ca=
n prove
> that i915 is not the culprit.
>=20
> But it should be totally independent. Having this before all the tests lo=
oks like a
> big cheat where you reset all the states before a test.
> Besides increasing the test time a lot.
>=20
> >
> > Tauro, Riana (4):
> >   lib/igt_aux: Suspend/resume without i915 module
>=20
> plus I don't believe this should be a library, but maybe because I believ=
e this
> should be a single independent test.
Agree here, we may need only one subtest here.
We can add a new subtest in tests/i915_suspend.c.
Thanks,
Anshuman.=20
>=20
> >   lib/drmtest : add function to  call exit handler to unload i915 modul=
e
> >   tests/i915/i915_suspend: Add suspend/resume cycle without i915 module
> >   i915/i915_pm_rpm: Add suspend/resume cycle without i915 module
> >
> >  lib/drmtest.c             | 17 +++++++++++++++++
> >  lib/drmtest.h             |  1 +
> >  lib/igt_aux.c             | 23 +++++++++++++++++++++++
> >  lib/igt_aux.h             |  3 +++
> >  tests/i915/i915_pm_rpm.c  | 12 ++++++++++++
> > tests/i915/i915_suspend.c | 39 +++++++++++++++++++++++++++++++++------
> >  6 files changed, 89 insertions(+), 6 deletions(-)
> >
> > --
> > 2.25.1
> >
