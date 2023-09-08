Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5DF10E89E
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 11:29:17 +0000 (UTC)
Date: Fri, 8 Sep 2023 13:29:12 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <20230908132912.7a9fc403@maurocar-mobl2>
In-Reply-To: <ZPrjUs7lyYxA1loA@fdugast-desk.home>
References: <20230905133309.365109-1-zbigniew.kempczynski@intel.com>
 <20230905133309.365109-3-zbigniew.kempczynski@intel.com>
 <ZPrjUs7lyYxA1loA@fdugast-desk.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/9] lib/intel_compute: Add
 compatibility flags for running compute
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, 8 Sep 2023 11:03:14 +0200
Francois Dugast <francois.dugast@intel.com> wrote:

> On Tue, Sep 05, 2023 at 03:33:02PM +0200, Zbigniew Kempczy=C5=84ski wrote:
> > Allow selectively turn on/off compute tests on both i915 and xe
> > drivers.
> >=20
> > Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.co=
m>
> > Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > ---
> >  lib/intel_compute.c | 19 ++++++++++++++++++-
> >  1 file changed, 18 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> > index 647bce0e43..dd9f686d0c 100644
> > --- a/lib/intel_compute.c
> > +++ b/lib/intel_compute.c
> > @@ -446,17 +446,27 @@ static void tgl_compute_exec(int fd, const unsign=
ed char *kernel,
> >  }
> > =20
> >  /*
> > - * Generic code
> > + * Compatibility flags.
> > + *
> > + * There will be some time period in which both drivers (i915 and xe)
> > + * will support compute runtime tests. Lets define compat flags to all=
ow
> > + * the code to be shared between two drivers allowing disabling this in
> > + * the future.
> >   */
> > +#define COMPAT_FLAG(f) (1 << (f))
> > +#define COMPAT_I915 COMPAT_FLAG(INTEL_DRIVER_I915)
> > +#define COMPAT_XE   COMPAT_FLAG(INTEL_DRIVER_XE) =20
>=20
> This approach allows solving the issue of unsupported combinations of
> platforms and drivers. I cannot think of something better but my concern
> is there could be some confusion if the test is skipped on a platform
> that appears to be supported because it is listed in the compute_batches.
>=20
> s/COMPAT_I915/COMPAT_DRIVER_I915/ and s/COMPAT_XE/COMPAT_DRIVER_XE/ can
> help make it not ambiguous.
>=20
> It would be good to get ack from someone else on the compat flag
> approach, Mauro maybe?

This approach looks sane to me, as, if we add support for < 12,
this will only be supported by i915 driver. The same will be true
in the future when we add support for newer generations, as it
is unlikely that those will be added for both drivers.

Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>
