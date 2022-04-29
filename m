Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67DC10F855
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Apr 2022 10:58:39 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Fri, 29 Apr 2022 10:58:38 +0000
Message-ID: <04bf219640fc40629b3240d8c2f5c05d@intel.com>
References: <20220425122147.1141783-1-riana.tauro@intel.com>
 <20220425122147.1141783-2-riana.tauro@intel.com>
 <d7cd5e2f83b5476aac55eee134227410@intel.com>
In-Reply-To: <d7cd5e2f83b5476aac55eee134227410@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/i915/i915_suspend: Add s2idle
 and s3 subtests without i915
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



> -----Original Message-----
> From: Gupta, Anshuman
> Sent: Friday, April 29, 2022 10:11 AM
> To: Tauro, Riana <riana.tauro@intel.com>; igt-dev@lists.freedesktop.org
> Subject: RE: [PATCH i-g-t 1/2] tests/i915/i915_suspend: Add s2idle and s3
> subtests without i915
>=20
>=20
>=20
> > -----Original Message-----
> > From: Tauro, Riana <riana.tauro@intel.com>
> > Sent: Monday, April 25, 2022 5:52 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> > <anshuman.gupta@intel.com>
> > Subject: [PATCH i-g-t 1/2] tests/i915/i915_suspend: Add s2idle and s3
> > subtests without i915
> >
> > From: "Tauro, Riana" <riana.tauro@intel.com>
> >
> > Add new tests basic-s2idle-without-i915 and basic-s3-without-i915 to
> > exercise s2idle and s3 cycles to know the system wide health of
> > suspend/resume
> >
> > Signed-off-by: Tauro, Riana <riana.tauro@intel.com>
> > ---
> >  tests/i915/i915_suspend.c | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> >
> > diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
> > index
> > d34b7a5d..8203b806 100644
> > --- a/tests/i915/i915_suspend.c
> > +++ b/tests/i915/i915_suspend.c
> > @@ -204,12 +204,12 @@ test_forcewake(int fd, bool hibernate)  }
> >
> >  static void
> > -test_suspend_without_i915(void)
> > +test_suspend_without_i915(int state)
> >  {
> >  	igt_kmsg(KMSG_INFO "Unloading i915\n");
> >  	igt_assert_eq(igt_i915_driver_unload(),0);
> >
> > -	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> > SUSPEND_TEST_NONE);
> > +	igt_system_suspend_autoresume(state, SUSPEND_TEST_NONE);
> >
> >  	igt_kmsg(KMSG_INFO "Re-loading i915 \n");
> >  	igt_assert_eq(igt_i915_driver_load(NULL), 0); @@ -219,9 +219,13 @@
> > int fd;
> >
> >  igt_main
> >  {
> > -	igt_describe("Validate system suspend cycle without i915 module");
> > -	igt_subtest("system-suspend-without-i915")
> > -		test_suspend_without_i915();
> > +	igt_describe("Validate suspend-to-idle without i915 module");
> > +	igt_subtest("basic-s2idle-without-i915")
> > +		test_suspend_without_i915(SUSPEND_STATE_FREEZE);
> > +
> > +	igt_describe("Validate S3 without i915 module");
> > +	igt_subtest("basic-s3-without-i915")
> > +		test_suspend_without_i915(SUSPEND_STATE_MEM);
I think , we can optimize this test.
Please probe /sys/power/mem_sleep sys fs.
It shows the current default suspend state.
[s2idle] deep
In case [s2idle] is default , system will trigger always s2idle despite of =
SUSPEND_STATE_MEM input.
In case [deep] is default  then only system will trigger S3  upon requestin=
g SUSPEND_STATE_MEM input.
Thanks,
Anshuman Gupta.
> Looks Good to me.
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> >
> >  	igt_fixture
> >  		fd =3D drm_open_driver(DRIVER_INTEL);
> > --
> > 2.25.1
