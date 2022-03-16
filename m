Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1912010E54C
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Mar 2022 10:48:51 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Latvala, Petri" <petri.latvala@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>
Date: Wed, 16 Mar 2022 10:48:47 +0000
Message-ID: <b94ef3bf350145b7bd94090584573646@intel.com>
References: <20220316050037.28295-1-anshuman.gupta@intel.com>
 <7d555079-7084-8cbe-3329-fa7d30dd7dc2@intel.com>
 <YjG17yY9hT8afZ5a@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YjG17yY9hT8afZ5a@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] test/i915_pm_rpm: Remove igt_describe()
 from dynamic subtest
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
> From: Latvala, Petri <petri.latvala@intel.com>
> Sent: Wednesday, March 16, 2022 3:33 PM
> To: Nilawar, Badal <badal.nilawar@intel.com>
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; igt-
> dev@lists.freedesktop.org
> Subject: Re: [igt-dev] [PATCH i-g-t] test/i915_pm_rpm: Remove igt_describ=
e()
> from dynamic subtest
>=20
> On Wed, Mar 16, 2022 at 11:28:54AM +0530, Nilawar, Badal wrote:
> >
> >
> > On 16-03-2022 10:30, Anshuman Gupta wrote:
> > > Remove igt_describe() from gem-execbuf-stress() dynamic subtest to
> > > avoid the igt internal assert.
> > >
> > > Fixes: aa6eb64bac51 ("i915_pm_rpm: Add placement to
> > > gem_exec_stress")
> > > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > > ---
> > >   tests/i915/i915_pm_rpm.c | 6 ++----
> > >   1 file changed, 2 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
> > > index 8ae407e50..461730e8a 100644
> > > --- a/tests/i915/i915_pm_rpm.c
> > > +++ b/tests/i915/i915_pm_rpm.c
> > > @@ -2170,14 +2170,12 @@ igt_main_args("", long_options, help_str,
> opt_handler, NULL)
> > >   		system_suspend_subtest(SUSPEND_STATE_DISK,
> SUSPEND_TEST_NONE);
> > >   	/* GEM stress */
> > > +	igt_describe("Validate execbuf submission while exercising rpm "
> > > +		     "suspend/resume cycles.");
> > This change looks fine.
> > Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>=20
>=20
> Merged, thanks!
Thanks Badal and Petri for review and merge.
Br,
Anshuman Gupta.
>=20
>=20
> --
> Petri Latvala
