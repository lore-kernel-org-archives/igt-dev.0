Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FC410EC34
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Mar 2022 05:53:47 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Mon, 28 Mar 2022 05:53:42 +0000
Message-ID: <9f44d78980ee4f909b0981044b4b5b80@intel.com>
References: <20220328051727.119142-1-riana.tauro@intel.com>
 <20220328051727.119142-3-riana.tauro@intel.com>
 <fa54b7ba3eea4a5ea5d8f025dae4424a@intel.com>
In-Reply-To: <fa54b7ba3eea4a5ea5d8f025dae4424a@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] tests/i915/i915_suspend: Add
 system-suspend-without-i915 subtest
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
> Sent: Monday, March 28, 2022 11:22 AM
> To: Tauro, Riana <riana.tauro@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Ewins, Jon <jon.ewins@intel.com>; Dixit, Ashutosh
> <ashutosh.dixit@intel.com>
> Subject: RE: [PATCH i-g-t 2/3] tests/i915/i915_suspend: Add system-suspen=
d-
> without-i915 subtest
>=20
>=20
>=20
> > -----Original Message-----
> > From: Tauro, Riana <riana.tauro@intel.com>
> > Sent: Monday, March 28, 2022 10:47 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> > <anshuman.gupta@intel.com>; Ewins, Jon <jon.ewins@intel.com>; Dixit,
> > Ashutosh <ashutosh.dixit@intel.com>
> > Subject: [PATCH i-g-t 2/3] tests/i915/i915_suspend: Add
> > system-suspend-
> > without-i915 subtest
> >
> > From: "Tauro, Riana" <riana.tauro@intel.com>
> >
> > Add a new test system-suspend-without-i915 to exercise suspend/resume
> > cycle without i915 module to know the system wide health of
> > suspend/resume feature.
> > This test will be part of CI fast-feedback test list.
> >
> > Signed-off-by: Tauro, Riana <riana.tauro@intel.com>
> > ---
> >  tests/i915/i915_suspend.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
> > index
> > da27ce09..4660d7a7 100644
> > --- a/tests/i915/i915_suspend.c
> > +++ b/tests/i915/i915_suspend.c
> > @@ -41,6 +41,7 @@
> >  #include "i915/gem.h"
> >  #include "i915/gem_create.h"
> >  #include "igt.h"
> > +#include "igt_kmod.h"
> >  #include "igt_device.h"
> >
> >  #define OBJECT_SIZE (16*1024*1024)
> > @@ -202,6 +203,22 @@ test_forcewake(int fd, bool hibernate)
> >  	close (fw_fd);
> >  }
> >
> > +static int
> > +test_suspend_without_i915(int fd)
> > +{
> > +	close(fd);
> > +	fd =3D -1;
> > +	drm_cancel_work_at_exit();
> > +	igt_i915_driver_unload();
> > +
> > +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> > SUSPEND_TEST_NONE);
> > +
> > +	igt_kmsg(KMSG_INFO "Re-loading i915 \n");
> > +	igt_assert_eq(igt_i915_driver_load(NULL), 0);
> > +	fd =3D drm_open_driver(DRIVER_INTEL);
> > +	return fd;
> > +}
> > +
> >  int fd;
> >
> >  igt_main
> > @@ -209,6 +226,9 @@ igt_main
> >  	igt_fixture
> >  		fd =3D drm_open_driver(DRIVER_INTEL);
> >
> > +	igt_subtest("system-suspend-without-i915")
Need to add a description for test with igt_describe()
Thanks,
Anshuman.
> > +		fd =3D test_suspend_without_i915(fd);
> > +
> Move above code block to above of igt_fixture(), this subtest doesn't nee=
d
> igt_fixture.
> With that we don't need to close the fd and reopen it back and forth ?
> This will avoid to call drm_cancel_work_at_exit() ?
> >  	igt_subtest("fence-restore-tiled2untiled") {
> >  		gem_require_mappable_ggtt(fd);
> >  		test_fence_restore(fd, true, false);
> > --
> > 2.25.1
