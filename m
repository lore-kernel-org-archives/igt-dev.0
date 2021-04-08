Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC6B6EA42
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Apr 2021 09:37:22 +0000 (UTC)
From: "Surendrakumar Upadhyay, TejaskumarX"
 <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Thu, 8 Apr 2021 09:37:16 +0000
Message-ID: <SN6PR11MB34213A9CE130D5A5D20DD0EADF749@SN6PR11MB3421.namprd11.prod.outlook.com>
References: <20210407093857.45333-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <20210408091614.GA49645@zkempczy-mobl2>
In-Reply-To: <20210408091614.GA49645@zkempczy-mobl2>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] lib/gem_execbuf_wr: Add gem_has_relocations
 check
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pandey,
 Hariom" <hariom.pandey@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Zbigniew Kempczy=F1ski <zbigniew.kempczynski@intel.com>
> Sent: 08 April 2021 14:46
> To: Surendrakumar Upadhyay, TejaskumarX
> <tejaskumarx.surendrakumar.upadhyay@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Pandey, Hariom
> <hariom.pandey@intel.com>
> Subject: Re: [igt-dev] [i-g-t] lib/gem_execbuf_wr: Add gem_has_relocations
> check
> =

> On Wed, Apr 07, 2021 at 03:08:57PM +0530, Tejas Upadhyay wrote:
> > Check if relocation and execbuf ioctls are supported on respective
> > platform or not. This will mark it skip instead of misleading fail if
> > relocations are not supported.
> >
> > Gitlab#3276
> =

> NAK.
> =

> That means we're not able to use gen12+ in IGT anymore.
> How do we could run GPU jobs then?

Whichever tests are using relocations are failing not all GPU tests.

> =

> --
> Zbigniew
> =

> >
> > Signed-off-by: Tejas Upadhyay
> > <tejaskumarx.surendrakumar.upadhyay@intel.com>
> > ---
> >  lib/ioctl_wrappers.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c index
> > 4440004c..465da0bc 100644
> > --- a/lib/ioctl_wrappers.c
> > +++ b/lib/ioctl_wrappers.c
> > @@ -57,6 +57,7 @@
> >  #include "igt_sysfs.h"
> >  #include "config.h"
> >  #include "i915/gem_mman.h"
> > +#include "i915/gem_submission.h"
> >
> >  #ifdef HAVE_VALGRIND
> >  #include <valgrind/valgrind.h>
> > @@ -636,6 +637,9 @@ void gem_execbuf(int fd, struct
> > drm_i915_gem_execbuffer2 *execbuf)  int __gem_execbuf_wr(int fd,
> > struct drm_i915_gem_execbuffer2 *execbuf)  {
> >  	int err =3D 0;
> > +
> > +	/* Check if relocations is supported with execbuffer2 */
> > +	igt_require(gem_has_relocations(fd));
> >  	if (igt_ioctl(fd, DRM_IOCTL_I915_GEM_EXECBUFFER2_WR, execbuf))
> {
> >  		err =3D -errno;
> >  		igt_assume(err !=3D 0);
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
