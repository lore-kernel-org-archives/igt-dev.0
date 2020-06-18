Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D026E419
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2020 12:51:42 +0000 (UTC)
Date: Thu, 18 Jun 2020 15:51:39 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200618125139.GJ20883@platvala-desk.ger.corp.intel.com>
References: <20200616141450.1181127-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200616141450.1181127-1-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/core: Print thred:tid with
 igt_log for non-main threads
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jun 16, 2020 at 05:14:48PM +0300, Arkadiusz Hiler wrote:
> So that we know what's the source of messages.
> =

> igt_thread.c is created to facilitate more threading-related
> functionality that will come in the following patch.
> =

> Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>

"lib/core: Print thred:tid with igt_log for non-main threads"

Typo, thred -> thread

Otherwise,
Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  lib/Makefile.sources |  2 ++
>  lib/igt_core.c       | 44 +++++++++++++++++++++++++++++++++++++-------
>  lib/igt_thread.c     | 39 +++++++++++++++++++++++++++++++++++++++
>  lib/igt_thread.h     | 24 ++++++++++++++++++++++++
>  lib/meson.build      |  1 +
>  5 files changed, 103 insertions(+), 7 deletions(-)
>  create mode 100644 lib/igt_thread.c
>  create mode 100644 lib/igt_thread.h
> =

> diff --git a/lib/Makefile.sources b/lib/Makefile.sources
> index 09aedb40..00374c97 100644
> --- a/lib/Makefile.sources
> +++ b/lib/Makefile.sources
> @@ -64,6 +64,8 @@ lib_source_list =3D	 	\
>  	igt_sysfs.h		\
>  	igt_sysrq.c		\
>  	igt_sysrq.h		\
> +	igt_thread.c		\
> +	igt_thread.h		\
>  	igt_x86.h		\
>  	igt_x86.c		\
>  	igt_vec.c		\
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index cbcc3f4d..c95295c7 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -72,6 +72,7 @@
>  #include "igt_rc.h"
>  #include "igt_list.h"
>  #include "igt_device_scan.h"
> +#include "igt_thread.h"
>  =

>  #define UNW_LOCAL_ONLY
>  #include <libunwind.h>
> @@ -2687,6 +2688,12 @@ void igt_log(const char *domain, enum igt_log_leve=
l level, const char *format, .
>  	va_end(args);
>  }
>  =

> +static pthread_key_t __vlog_line_continuation;
> +
> +igt_constructor {
> +	pthread_key_create(&__vlog_line_continuation, NULL);
> +}
> +
>  /**
>   * igt_vlog:
>   * @domain: the log domain, or NULL for no domain
> @@ -2705,6 +2712,7 @@ void igt_vlog(const char *domain, enum igt_log_leve=
l level, const char *format,
>  {
>  	FILE *file;
>  	char *line, *formatted_line;
> +	char *thread_id;
>  	const char *program_name;
>  	const char *igt_log_level_str[] =3D {
>  		"DEBUG",
> @@ -2713,7 +2721,8 @@ void igt_vlog(const char *domain, enum igt_log_leve=
l level, const char *format,
>  		"CRITICAL",
>  		"NONE"
>  	};
> -	static bool line_continuation =3D false;
> +
> +	static pthread_mutex_t print_mutex =3D PTHREAD_MUTEX_INITIALIZER;
>  =

>  	assert(format);
>  =

> @@ -2723,23 +2732,37 @@ void igt_vlog(const char *domain, enum igt_log_le=
vel level, const char *format,
>  	program_name =3D command_str;
>  #endif
>  =

> +
> +	if (igt_thread_is_main()) {
> +		thread_id =3D strdup("");
> +	} else {
> +		if (asprintf(&thread_id, "[thread:%d] ", gettid()) =3D=3D -1)
> +			thread_id =3D NULL;
> +	}
> +
> +	if (!thread_id)
> +		goto out;
> +
>  	if (list_subtests && level <=3D IGT_LOG_WARN)
>  		return;
>  =

>  	if (vasprintf(&line, format, args) =3D=3D -1)
>  		return;
>  =

> -	if (line_continuation) {
> +	if (pthread_getspecific(__vlog_line_continuation)) {
>  		formatted_line =3D strdup(line);
>  		if (!formatted_line)
>  			goto out;
> -	} else if (asprintf(&formatted_line, "(%s:%d) %s%s%s: %s", program_name,
> -		     getpid(), (domain) ? domain : "", (domain) ? "-" : "",
> +	} else if (asprintf(&formatted_line, "(%s:%d) %s%s%s%s: %s", program_na=
me,
> +		     getpid(), thread_id, (domain) ? domain : "", (domain) ? "-" : "",
>  		     igt_log_level_str[level], line) =3D=3D -1) {
>  		goto out;
>  	}
>  =

> -	line_continuation =3D line[strlen(line) - 1] !=3D '\n';
> +	if (line[strlen(line) - 1] =3D=3D '\n')
> +		pthread_setspecific(__vlog_line_continuation, (void*) false);
> +	else
> +		pthread_setspecific(__vlog_line_continuation, (void*) true);
>  =

>  	/* append log buffer */
>  	_igt_log_buffer_append(formatted_line);
> @@ -2758,6 +2781,8 @@ void igt_vlog(const char *domain, enum igt_log_leve=
l level, const char *format,
>  			goto out;
>  	}
>  =

> +	pthread_mutex_lock(&print_mutex);
> +
>  	/* use stderr for warning messages and above */
>  	if (level >=3D IGT_LOG_WARN) {
>  		file =3D stderr;
> @@ -2768,13 +2793,18 @@ void igt_vlog(const char *domain, enum igt_log_le=
vel level, const char *format,
>  =

>  	/* prepend all except information messages with process, domain and log
>  	 * level information */
> -	if (level !=3D IGT_LOG_INFO)
> +	if (level !=3D IGT_LOG_INFO) {
>  		fwrite(formatted_line, sizeof(char), strlen(formatted_line),
>  		       file);
> -	else
> +	} else {
> +		fwrite(thread_id, sizeof(char), strlen(thread_id), file);
>  		fwrite(line, sizeof(char), strlen(line), file);
> +	}
> +
> +	pthread_mutex_unlock(&print_mutex);
>  =

>  out:
> +	free(thread_id);
>  	free(line);
>  }
>  =

> diff --git a/lib/igt_thread.c b/lib/igt_thread.c
> new file mode 100644
> index 00000000..deab6225
> --- /dev/null
> +++ b/lib/igt_thread.c
> @@ -0,0 +1,39 @@
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
> + */
> +
> +#include <pthread.h>
> +
> +#include "igt_core.h"
> +#include "igt_thread.h"
> +
> +static pthread_key_t __igt_is_main_thread;
> +
> +bool igt_thread_is_main(void)
> +{
> +	return pthread_getspecific(__igt_is_main_thread) !=3D NULL;
> +}
> +
> +igt_constructor {
> +	pthread_key_create(&__igt_is_main_thread, NULL);
> +	pthread_setspecific(__igt_is_main_thread, (void*) 0x1);
> +}
> diff --git a/lib/igt_thread.h b/lib/igt_thread.h
> new file mode 100644
> index 00000000..b16f803f
> --- /dev/null
> +++ b/lib/igt_thread.h
> @@ -0,0 +1,24 @@
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
> + */
> +
> +bool igt_thread_is_main(void);
> diff --git a/lib/meson.build b/lib/meson.build
> index 6cf78663..6c71ae3d 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -26,6 +26,7 @@ lib_sources =3D [
>  	'igt_syncobj.c',
>  	'igt_sysfs.c',
>  	'igt_sysrq.c',
> +	'igt_thread.c',
>  	'igt_vec.c',
>  	'igt_vgem.c',
>  	'igt_x86.c',
> -- =

> 2.25.4
> =

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
