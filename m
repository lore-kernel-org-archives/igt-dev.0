Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4C489DA4
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Jan 2021 13:30:17 +0000 (UTC)
Date: Fri, 8 Jan 2021 15:30:13 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20210108133013.GU7444@platvala-desk.ger.corp.intel.com>
References: <20210107104328.4020431-1-chris@chris-wilson.co.uk>
 <20210108130157.4037735-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210108130157.4037735-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Process kernel taints
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

On Fri, Jan 08, 2021 at 01:01:57PM +0000, Chris Wilson wrote:
> A small library routine to read '/proc/sys/kernel/taints' and check for
> a fatal condition. This is currently used by the runner, but is also
> useful for some tests.
> =

> v2: function docs
> =

> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Petri Latvala <petri.latvala@intel.com>
> ---
>  lib/Makefile.sources |  2 +
>  lib/igt_taints.c     | 98 ++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_taints.h     | 19 +++++++++
>  lib/meson.build      |  1 +
>  runner/executor.c    | 73 +++++++--------------------------
>  5 files changed, 134 insertions(+), 59 deletions(-)
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
> index 000000000..a5a7e6cae
> --- /dev/null
> +++ b/lib/igt_taints.c
> @@ -0,0 +1,98 @@
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
> +/**
> + * igt_explain_taints:
> + * @taints: mask of taints requiring an explanation [inout]
> + *
> + * Inspects the mask and looks up the first reason correspoding to a set
> + * bit in the mast. It returns the reason as a string constant, and remo=
ves
> + * the bit from the mask. If the mask is empty, or we have no known reas=
on
> + * matching the match, NULL is returned.
> + *
> + * This may be used in a loop to extract all known reasons for why the
> + * kernel tained:

s/correspoding/corresponding/
s/mast/mask/
s/matching the match/matching the mask/

> + *
> + * while (reason =3D igt_explain_taints(&taints))
> + * 	igt_info("%s", reason);
> + *
> + * Returns the first reason corresponding to a taint bit.
> + */
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
> +
> +/**
> + * igt_bad_taints:
> + *
> + * Returns the mask of kernel taints that IGT considers fatal.
> + * Such as TAINT_WARN set when the kernel oopses.
> + */
> +unsigned long igt_bad_taints(void)
> +{
> +	static unsigned long bad_taints;
> +
> +	if (!bad_taints) {
> +		for (typeof(*abort_taints) *taint =3D abort_taints;
> +		     taint->bit >=3D 0;
> +		     taint++) {
> +			if (taint->bad)
> +				bad_taints |=3D 1ul << taint->bit;
> +		}
> +	}
> +
> +	return bad_taints;
> +}
> +
> +/**
> + * igt_kernel_tainted:
> + * @taints: bitmask of kernel taints [out]
> + *
> + * Reads "/prco/sys/kernel/tainted" and returns both the set of all
> + * taints reported via @taints, and the set of fatal taints as the
> + * return parameters.
> + *
> + * Returns a mask of fatal taints; 0 if untainted.
> + */

s/prco/proc/

Move the "both" word later so it's clear it's returning the same thing
with two means, instead of returning two things.


With those

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> +unsigned long igt_kernel_tainted(unsigned long *taints)
> +{
> +	FILE *f;
> +
> +	*taints =3D 0;
> +
> +	f =3D fopen("/proc/sys/kernel/tainted", "r");
> +	if (f) {
> +		fscanf(f, "%lu", taints);
> +		fclose(f);
> +	}
> +
> +	return is_tainted(*taints);
> +}
> diff --git a/lib/igt_taints.h b/lib/igt_taints.h
> new file mode 100644
> index 000000000..be4195c5a
> --- /dev/null
> +++ b/lib/igt_taints.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =A9 2021 Intel Corporation
> + */
> +
> +#ifndef __IGT_TAINTS_H__
> +#define __IGT_TAINTS_H__
> +
> +unsigned long igt_kernel_tainted(unsigned long *taints);
> +const char *igt_explain_taints(unsigned long *taints);
> +
> +unsigned long igt_bad_taints(void);
> +
> +static inline unsigned long is_tainted(unsigned long taints)
> +{
> +	return taints & igt_bad_taints();
> +}
> +
> +#endif /* __IGT_TAINTS_H__ */
> diff --git a/lib/meson.build b/lib/meson.build
> index 540facb24..3abc42cb3 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -27,6 +27,7 @@ lib_sources =3D [
>  	'igt_syncobj.c',
>  	'igt_sysfs.c',
>  	'igt_sysrq.c',
> +	'igt_taints.c',
>  	'igt_thread.c',
>  	'igt_vec.c',
>  	'igt_vgem.c',
> diff --git a/runner/executor.c b/runner/executor.c
> index faf272d85..93db8bb36 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -24,6 +24,7 @@
>  =

>  #include "igt_aux.h"
>  #include "igt_core.h"
> +#include "igt_taints.h"
>  #include "executor.h"
>  #include "output_strings.h"
>  =

> @@ -307,70 +308,23 @@ static char *handle_lockdep(void)
>  	return NULL;
>  }
>  =

> -/* see Linux's include/linux/kernel.h */
> -static const struct {
> -	unsigned long bit;
> -	const char *explanation;
> -} abort_taints[] =3D {
> -  {(1 << 5), "TAINT_BAD_PAGE: Bad page reference or an unexpected page f=
lags."},
> -  {(1 << 7), "TAINT_DIE: Kernel has died - BUG/OOPS."},
> -  {(1 << 9), "TAINT_WARN: WARN_ON has happened."},
> -  {0, 0}};
> -
> -static unsigned long bad_taints(void)
> -{
> -	static unsigned long __bad_taints;
> -
> -	if (!__bad_taints) {
> -		for (typeof(*abort_taints) *taint =3D abort_taints;
> -		     taint->bit;
> -		     taint++)
> -			__bad_taints |=3D taint->bit;
> -	}
> -
> -	return __bad_taints;
> -}
> -
> -static unsigned long is_tainted(unsigned long taints)
> -{
> -	return taints & bad_taints();
> -}
> -
> -static unsigned long tainted(unsigned long *taints)
> -{
> -	FILE *f;
> -
> -	*taints =3D 0;
> -
> -	f =3D fopen("/proc/sys/kernel/tainted", "r");
> -	if (f) {
> -		fscanf(f, "%lu", taints);
> -		fclose(f);
> -	}
> -
> -	return is_tainted(*taints);
> -}
> -
>  static char *handle_taint(void)
>  {
> -	unsigned long taints;
> +	unsigned long taints, bad;
> +	char *explain;
>  	char *reason;
>  =

> -	if (!tainted(&taints))
> +	bad =3D igt_kernel_tainted(&taints);
> +	if (!bad)
>  		return NULL;
>  =

> -	asprintf(&reason, "Kernel badly tainted (%#lx) (check dmesg for details=
):\n",
> -		 taints);
> -
> -	for (typeof(*abort_taints) *taint =3D abort_taints; taint->bit; taint++=
) {
> -		if (taint->bit & taints) {
> -			char *old_reason =3D reason;
> -			asprintf(&reason, "%s\t(%#lx) %s\n",
> -					old_reason,
> -					taint->bit,
> -					taint->explanation);
> -			free(old_reason);
> -		}
> +	asprintf(&reason, "Kernel badly tainted (%#lx, %#lx) (check dmesg for d=
etails):\n",
> +		 taints, bad);
> +
> +	while ((explain =3D igt_explain_taints(&bad))) {
> +		char *old_reason =3D reason;
> +		asprintf(&reason, "%s\t%s\n", old_reason, explain);
> +		free(old_reason);
>  	}
>  =

>  	return reason;
> @@ -1142,7 +1096,8 @@ static int monitor_output(pid_t child,
>  			sigfd =3D -1; /* we are dying, no signal handling for now */
>  		}
>  =

> -		timeout_reason =3D need_to_timeout(settings, killed, tainted(&taints),
> +		timeout_reason =3D need_to_timeout(settings, killed,
> +						 igt_kernel_tainted(&taints),
>  						 igt_time_elapsed(&time_last_activity, &time_now),
>  						 igt_time_elapsed(&time_last_subtest, &time_now),
>  						 igt_time_elapsed(&time_killed, &time_now),
> -- =

> 2.30.0
> =

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
