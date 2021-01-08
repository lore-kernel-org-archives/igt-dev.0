Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546826E825
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Jan 2021 12:26:50 +0000 (UTC)
Date: Fri, 8 Jan 2021 14:26:46 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20210108122646.GS7444@platvala-desk.ger.corp.intel.com>
References: <20210107104328.4020431-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210107104328.4020431-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib: Process kernel taints
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jan 07, 2021 at 10:43:27AM +0000, Chris Wilson wrote:
> A small library routine to read '/proc/sys/kernel/taints' and check for
> a fatal condition. This is currently used by the runner, but is also
> useful for some tests.
> =

> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  lib/Makefile.sources |  2 ++
>  lib/igt_taints.c     | 65 +++++++++++++++++++++++++++++++++++++++
>  lib/igt_taints.h     | 19 ++++++++++++
>  lib/meson.build      |  1 +
>  runner/executor.c    | 73 +++++++++-----------------------------------
>  5 files changed, 101 insertions(+), 59 deletions(-)
>  create mode 100644 lib/igt_taints.c
>  create mode 100644 lib/igt_taints.h
> =

> diff --git a/lib/Makefile.sources b/lib/Makefile.sources
> index 67b386457..7102f95e7 100644
> --- a/lib/Makefile.sources
> +++ b/lib/Makefile.sources
> @@ -64,6 +64,8 @@ lib_source_list =3D	 	\
>  	igt_sysfs.h		\
>  	igt_sysrq.c		\
>  	igt_sysrq.h		\
> +	igt_taints.c		\
> +	igt_taints.h		\
>  	igt_thread.c		\
>  	igt_thread.h		\
>  	igt_x86.h		\
> diff --git a/lib/igt_taints.c b/lib/igt_taints.c
> new file mode 100644
> index 000000000..f9b32d106
> --- /dev/null
> +++ b/lib/igt_taints.c
> @@ -0,0 +1,65 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =A9 2021 Intel Corporation
> + */
> +
> +#include <stdio.h>
> +
> +#include "igt_taints.h"
> +
> +/* see Linux's include/linux/kernel.h */
> +static const struct {
> +	int bit;
> +	int bad;
> +	const char *explanation;
> +} abort_taints[] =3D {
> +  { 5, 1, "TAINT_BAD_PAGE: Bad page reference or an unexpected page flag=
s." },
> +  { 7, 1, "TAINT_DIE: Kernel has died - BUG/OOPS." },
> +  { 9, 1, "TAINT_WARN: WARN_ON has happened." },
> +  { -1 }
> +};
> +
> +const char *igt_explain_taints(unsigned long *taints)
> +{
> +	for (typeof(*abort_taints) *taint =3D abort_taints;
> +	     taint->bit >=3D 0;
> +	     taint++) {
> +		if (*taints & (1ul << taint->bit)) {
> +			*taints &=3D ~(1ul << taint->bit);
> +			return taint->explanation;
> +		}
> +	}
> +
> +	return NULL;
> +}

Docs for these functions are now in order now that they found a place
in lib/. Especially this function with the required "call until funny"
semantics.


-- =

Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
