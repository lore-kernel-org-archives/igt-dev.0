Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9786E113
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jun 2020 11:48:16 +0000 (UTC)
Date: Fri, 5 Jun 2020 14:48:13 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200605114813.GA9497@platvala-desk.ger.corp.intel.com>
References: <20200602111330.910039-1-arkadiusz.hiler@intel.com>
 <20200602111330.910039-2-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200602111330.910039-2-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] lib/igt_device_scan: Make
 igt_device_scan independent from igt_core
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jun 02, 2020 at 02:13:28PM +0300, Arkadiusz Hiler wrote:
> From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
> =

> igt_device_scan can now be used as a separate library which only depends
> glib and libudev - some IGT internals are being stubbed in this case.
> =

> v2: (mostly) sort includes (Lucas)
> =

> Cc: Lucas De Marchi <lucas.de.marchi@gmail.com>
> Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
> Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> ---
>  lib/Makefile.am       |  8 ++++++-
>  lib/drmtest.c         |  1 +
>  lib/igt_device_scan.c | 11 +++++-----
>  lib/igt_device_scan.h |  8 ++++++-
>  lib/igt_tools_stub.c  | 51 +++++++++++++++++++++++++++++++++++++++++++
>  lib/meson.build       | 15 +++++++++++++
>  6 files changed, 86 insertions(+), 8 deletions(-)
>  create mode 100644 lib/igt_tools_stub.c
> =

> diff --git a/lib/Makefile.am b/lib/Makefile.am
> index fba7fcab..e9753d3c 100644
> --- a/lib/Makefile.am
> +++ b/lib/Makefile.am
> @@ -102,6 +102,12 @@ include Makefile.sources
>  =

>  libintel_tools_la_SOURCES =3D $(lib_source_list)
>  =

> +libigt_device_scan_la_SOURCES =3D \
> +	igt_list.c		\
> +	igt_tools_stub.c	\
> +	igt_device_scan.c	\
> +	igt_device_scan.h
> +
>  libigt_perf_la_SOURCES =3D \
>  	igt_perf.c	 \
>  	igt_perf.h
> @@ -121,7 +127,7 @@ pkgconfig_DATA =3D i915-perf.pc
>  =

>  lib_LTLIBRARIES =3D libi915_perf.la
>  =

> -noinst_LTLIBRARIES =3D libintel_tools.la libigt_perf.la
> +noinst_LTLIBRARIES =3D libintel_tools.la libigt_perf.la libigt_device_sc=
an.la
>  noinst_HEADERS =3D check-ndebug.h
>  =

>  if !HAVE_LIBDRM_INTEL
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 70fd64c9..e4e710d4 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -55,6 +55,7 @@
>  #include "igt_device.h"
>  #include "igt_gt.h"
>  #include "igt_kmod.h"
> +#include "igt_params.h"
>  #include "igt_sysfs.h"
>  #include "igt_device_scan.h"
>  #include "version.h"
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 7b0fc00e..d4c5cfdf 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -22,18 +22,17 @@
>   *
>   */
>  =

> -#include "igt.h"
> -#include "igt_list.h"
> -#include "igt_sysfs.h"
> -#include "igt_device.h"
> +#include "igt_core.h"
>  #include "igt_device_scan.h"
> +#include "igt_list.h"
> +
> +#include <dirent.h>
> +#include <fcntl.h>
>  #include <glib.h>
>  #include <libudev.h>
>  #include <linux/limits.h>
>  #include <sys/stat.h>
>  #include <sys/types.h>
> -#include <dirent.h>
> -#include <fcntl.h>
>  =

>  /**
>   * SECTION:igt_device_scan
> diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
> index 24eafe62..3526f1da 100644
> --- a/lib/igt_device_scan.h
> +++ b/lib/igt_device_scan.h
> @@ -25,8 +25,14 @@
>  #ifndef __IGT_DEVICE_SCAN_H__
>  #define __IGT_DEVICE_SCAN_H__
>  =

> +#include <errno.h>
> +#include <fcntl.h>
> +#include <getopt.h>
>  #include <limits.h>
> -#include <igt.h>
> +#include <stdbool.h>
> +#include <stdint.h>
> +#include <stdio.h>
> +#include <unistd.h>
>  =

>  enum igt_devices_print_type {
>  	IGT_PRINT_SIMPLE,
> diff --git a/lib/igt_tools_stub.c b/lib/igt_tools_stub.c
> new file mode 100644
> index 00000000..9a0ec621
> --- /dev/null
> +++ b/lib/igt_tools_stub.c
> @@ -0,0 +1,51 @@
> +/*
> + * Copyright =A9 2020 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the =
next
> + * paragraph) shall be included in all copies or substantial portions of=
 the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
> + * IN THE SOFTWARE.
> + *
> + */
> +#include "igt_core.h"
> +
> +/* Stub for igt_log, this stub will simply print the msg on stderr devic=
e.
> + * Domain and log level are ignored.
> + */
> +
> +void igt_log(const char *domain, enum igt_log_level level, const char *f=
ormat, ...)
> +{
> +	va_list args;
> +
> +	va_start(args, format);
> +	vfprintf(stderr, format, args);
> +	va_end(args);
> +}
> +
> +
> +/* Stub for __igt_fail_assert, this stub will simply print the msg on st=
derr device and
> + * exit the application, domain and log level are ignored.
> + */
> +
> +void __igt_fail_assert(const char *domain, const char *file,
> +		       const int line, const char *func, const char *assertion,
> +		       const char *format, ...)
> +{
> +	fprintf(stderr, "%s: %d %s Failed assertion: %s\n", file, line,
> +		func, assertion);
> +	exit(1);
> +}
> diff --git a/lib/meson.build b/lib/meson.build
> index 99aee6ee..6cf78663 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -172,6 +172,21 @@ lib_igt_perf_build =3D static_library('igt_perf',
>  lib_igt_perf =3D declare_dependency(link_with : lib_igt_perf_build,
>  				  include_directories : inc)
>  =

> +scan_dep =3D [
> +	glib,
> +	libudev,
> +]
> +
> +lib_igt_device_scan_build =3D static_library('igt_device_scan',
> +	['igt_device_scan.c',
> +	'igt_list.c',
> +	'igt_tools_stub.c',
> +	],
> +	dependencies : scan_dep,
> +	include_directories : inc)
> +
> +lib_igt_device_scan =3D declare_dependency(link_with : lib_igt_device_sc=
an_build,
> +				  include_directories : inc)
>  =




Reviewed-by: Petri Latvala <petri.latvala@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
