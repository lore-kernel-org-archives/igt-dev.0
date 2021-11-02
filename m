Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45B372E91
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Nov 2021 09:57:42 +0000 (UTC)
Date: Tue, 2 Nov 2021 11:56:23 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YYELRwNKnEPTTo7l@platvala-desk.ger.corp.intel.com>
References: <20211030000744.231762-1-jose.souza@intel.com>
 <20211030000744.231762-2-jose.souza@intel.com>
 <YX+zF4gVGP8EjMWR@platvala-desk.ger.corp.intel.com>
 <e157a5049ed3c123520e3f6f60005aa9d8a7b1cf.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e157a5049ed3c123520e3f6f60005aa9d8a7b1cf.camel@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms_async_flips: Skip test
 when running with Intel's PSR2 selective fetch enabled
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Souza, Jose" <jose.souza@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Nov 02, 2021 at 05:17:10AM +0200, Souza, Jose wrote:
> On Mon, 2021-11-01 at 11:27 +0200, Petri Latvala wrote:
> > On Fri, Oct 29, 2021 at 05:07:44PM -0700, Jos=E9 Roberto de Souza wrote:
> > > Intel's PSR2 selective fetch adds other planes to state when
> > > necessary, causing the async flip to fail because async flip is not
> > > supported in cursor plane.
> > >=20
> > > Cc: Karthik B S <karthik.b.s@intel.com>
> > > Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
> > > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > Signed-off-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> > > ---
> > >  lib/igt_psr.c           | 16 ++++++++++++++++
> > >  lib/igt_psr.h           |  2 ++
> > >  tests/kms_async_flips.c |  8 ++++++++
> > >  3 files changed, 26 insertions(+)
> > >=20
> > > diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> > > index 857eb591c..8fa8b192f 100644
> > > --- a/lib/igt_psr.c
> > > +++ b/lib/igt_psr.c
> > > @@ -21,6 +21,7 @@
> > >   * IN THE SOFTWARE.
> > >   */
> > > =20
> > > +#include "drmtest.h"
> > >  #include "igt_params.h"
> > >  #include "igt_psr.h"
> > >  #include "igt_sysfs.h"
> > > @@ -264,3 +265,18 @@ void psr_print_debugfs(int debugfs_fd)
> > > =20
> > >  	igt_info("%s", buf);
> > >  }
> > > +
> > > +bool i915_psr2_selective_fetch_check(int drm_fd)
> > > +{
> > > +	int debugfs_fd;
> > > +	bool ret;
> > > +
> > > +	if (!is_i915_device(drm_fd))
> > > +		return false;
> > > +
> > > +	debugfs_fd =3D igt_debugfs_dir(drm_fd);
> > > +	ret =3D psr2_selective_fetch_check(debugfs_fd);
> > > +	close(debugfs_fd);
> > > +
> > > +	return ret;
> > > +}
> > > diff --git a/lib/igt_psr.h b/lib/igt_psr.h
> > > index c47b197b1..a075f336d 100644
> > > --- a/lib/igt_psr.h
> > > +++ b/lib/igt_psr.h
> > > @@ -47,4 +47,6 @@ bool psr_sink_support(int device, int debugfs_fd, e=
num psr_mode mode);
> > >  bool psr2_wait_su(int debugfs_fd, uint16_t *num_su_blocks);
> > >  void psr_print_debugfs(int debugfs_fd);
> > > =20
> > > +bool i915_psr2_selective_fetch_check(int drm_fd);
> > > +
> > >  #endif
> > > diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> > > index 4ff7a196a..c35565f69 100644
> > > --- a/tests/kms_async_flips.c
> > > +++ b/tests/kms_async_flips.c
> > > @@ -27,6 +27,7 @@
> > > =20
> > >  #include "igt.h"
> > >  #include "igt_aux.h"
> > > +#include "igt_psr.h"
> > >  #include <sys/ioctl.h>
> > >  #include <sys/time.h>
> > >  #include <poll.h>
> > > @@ -299,6 +300,13 @@ static void test_cursor(data_t *data)
> > >  	struct igt_fb cursor_fb;
> > >  	struct drm_mode_cursor cur;
> > > =20
> > > +	/*
> > > +	 * Intel's PSR2 selective fetch adds other planes to state when
> > > +	 * necessary, causing the async flip to fail because async flip is =
not
> > > +	 * supported in cursor plane.
> > > +	 */
> > > +	igt_skip_on(i915_psr2_selective_fetch_check(data->drm_fd));
> > > +
> >=20
> > Please use the _f variant of this function and add a descriptive
> > message to this skip.
>=20
> Okay
>=20
> >=20
> > How does real userspace fare with this stuff? What even are the
> > implications, I'm not sure I get this fully. I think I saw you and
> > Ville discuss this on IRC but I missed the conclusion and what X does
> > on PSR2. Fall back to synchronous flips with some effect on
> > performance?
>=20
> We were discussing on IRC about failures in kms_cursor_legacy.
>=20
> About async flip, we will inactivate and activate PSR around async flips =
with a kernel patch to avoid visual corruption:
> https://patchwork.freedesktop.org/series/96440/
>=20
> But even with this kernel patch this test will fail when PSR2 selective f=
etch is supported because even with PSR2 inactive, i915 will still compute
> and add other planes that intersect with damaged areas.
> So a page flip in the primary plane will add the cursor plane(as it overl=
aps) and the cursor plane do not support async flip causing the commit check
> to fail and by consequence this test will fail in 'igt_assert(ret =3D=3D =
0);'.

Right. So on the scale of "papering over shortcomings" <-> "non-issue,
real userspace has never been promised that this operation will work"
this lands far on the ->

Hence, with a descriptive message on the skip this is
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
