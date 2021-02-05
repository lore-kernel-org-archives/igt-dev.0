Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5586E1CE
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Feb 2021 07:34:40 +0000 (UTC)
Date: Fri, 5 Feb 2021 09:34:36 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YBz1DKRTq3MWcNpY@platvala-desk.ger.corp.intel.com>
References: <20210204140841.15972-1-jose.souza@intel.com>
 <YBwOoJ1ptEeFIyY1@platvala-desk.ger.corp.intel.com>
 <39506df03e52b7b83d7a51cd277dd91cf73353cc.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <39506df03e52b7b83d7a51cd277dd91cf73353cc.camel@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_psr2_sf: Enable selective
 fetch
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Souza, Jose" <jose.souza@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Feb 04, 2021 at 05:17:30PM +0200, Souza, Jose wrote:
> On Thu, 2021-02-04 at 17:11 +0200, Petri Latvala wrote:
> > On Thu, Feb 04, 2021 at 06:08:41AM -0800, Jos=E9 Roberto de Souza wrote:
> > > Reload driver enabling PSR2 selective fetch to start to have
> > > some tests coverage of this feature by CI.
> > > =

> > > Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> > > Cc: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> > > Signed-off-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> > > ---
> > > =A0tests/kms_psr2_sf.c | 14 ++++++++++++++
> > > =A01 file changed, 14 insertions(+)
> > > =

> > > diff --git a/tests/kms_psr2_sf.c b/tests/kms_psr2_sf.c
> > > index 296ed8476..751d6ff03 100644
> > > --- a/tests/kms_psr2_sf.c
> > > +++ b/tests/kms_psr2_sf.c
> > > @@ -24,6 +24,7 @@
> > > =A0
> > > =

> > > =

> > > =

> > > =A0#include "igt.h"
> > > =A0#include "igt_sysfs.h"
> > > +#include "igt_kmod.h"
> > > =A0#include "igt_psr.h"
> > > =A0#include <errno.h>
> > > =A0#include <stdbool.h>
> > > @@ -544,6 +545,14 @@ static void cleanup(data_t *data)
> > > =A0	igt_remove_fb(data->drm_fd, &data->fb_test);
> > > =A0}
> > > =A0
> > > =

> > > =

> > > =

> > > +static void reload_driver(bool enable_sel_fetch)
> > > +{
> > > +	const char *params =3D enable_sel_fetch ? "enable_psr2_sel_fetch=3D=
1" : "";
> > > +
> > > +	igt_i915_driver_unload();
> > > +	igt_assert_eq(igt_i915_driver_load(params), 0);
> > > +}
> > =

> > =

> > Does this parameter need to be set at load time or would igt_params_set=
() suffice?
> =

> At driver load time, otherwise more handling would be needed in kernel an=
d IGT.
> But yeah the kernel parameter right now have the wrong permission, sendin=
g a kernel patch fixing it.

We're blacklisting module reloads anyway (see top of
tests/intel-ci/blacklist.txt), and this test will need to be as well
for the same reasons.

What's the test runtime? Are we able to add it to
fast-feedback.testlist until the reload is no longer needed?


-- =

Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
