Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8916E84A
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Mar 2021 04:04:39 +0000 (UTC)
Date: Tue, 30 Mar 2021 07:05:23 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YGKjg/mkZpjWp592@platvala-desk.ger.corp.intel.com>
References: <20210329140714.3921-1-petri.latvala@intel.com>
 <06018ecd06bd1699079e02ac84f79c115ff7fd81.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <06018ecd06bd1699079e02ac84f79c115ff7fd81.camel@redhat.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Don't use libdrm_nouveau if not
 found
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
To: Lyude Paul <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Mar 29, 2021 at 12:25:22PM -0400, Lyude Paul wrote:
> whoops - nice catch with this one:
> =

> Reviewed-by: Lyude Paul <lyude@redhat.com>


Thanks, merged.

For the record, the build-test in .gitlab-ci.yml for this didn't catch
it, because the situation there is that libdrm_nouveau is installed
but unused, the build error happens when libdrm_nouveau is completely
missing. Arek said he'll look into finetuning the minimal-setup build
tests.


-- =

Petri Latvala


> =

> On Mon, 2021-03-29 at 17:07 +0300, Petri Latvala wrote:
> > Only #include the libdrm_nouveau headers if HAVE_LIBDRM_NOUVEAU is set
> > so IGT builds again without it installed.
> > =

> > Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> > Cc: Lyude Paul <lyude@redhat.com>
> > ---
> > =A0lib/igt_nouveau.h | 8 ++++----
> > =A01 file changed, 4 insertions(+), 4 deletions(-)
> > =

> > diff --git a/lib/igt_nouveau.h b/lib/igt_nouveau.h
> > index ea44adb2..c518de3c 100644
> > --- a/lib/igt_nouveau.h
> > +++ b/lib/igt_nouveau.h
> > @@ -26,10 +26,6 @@
> > =A0#include <stddef.h>
> > =A0#include <inttypes.h>
> > =A0
> > -#include <nouveau/nouveau.h>
> > -#include <nouveau/nvif/class.h>
> > -#include <nouveau/nvif/cl0080.h>
> > -
> > =A0#include "igt_core.h"
> > =A0
> > =A0#define IGT_NOUVEAU_CHIPSET_GV100 0x140
> > @@ -37,6 +33,10 @@
> > =A0typedef struct igt_fb igt_fb_t;
> > =A0
> > =A0#ifdef HAVE_LIBDRM_NOUVEAU
> > +#include <nouveau/nouveau.h>
> > +#include <nouveau/nvif/class.h>
> > +#include <nouveau/nvif/cl0080.h>
> > +
> > =A0#define DECL(d) d
> > =A0#else
> > =A0/* There shouldn't be any code that calls igt_nouveau_* functions wi=
thout
> > libdrm support enabled, as
> =

> -- =

> Sincerely,
>    Lyude Paul (she/her)
>    Software Engineer at Red Hat
>    =

> Note: I deal with a lot of emails and have a lot of bugs on my plate. If =
you've
> asked me a question, are waiting for a review/merge on a patch, etc. and I
> haven't responded in a while, please feel free to send me another email t=
o check
> on my status. I don't bite!
> =

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
