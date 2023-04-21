Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF6F10EDB8
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Apr 2023 07:56:21 +0000 (UTC)
Date: Fri, 21 Apr 2023 09:56:16 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Anna Karas <anna.karas@intel.com>
Message-ID: <20230421075616.fhqdnodprkx57jry@zkempczy-mobl2>
References: <20230420191454.497237-1-anna.karas@intel.com>
 <20230420191454.497237-2-anna.karas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230420191454.497237-2-anna.karas@intel.com>
Subject: Re: [igt-dev] [RFC 1/2] lib/xe_gpu: Introduce xe_gpu library
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Joonas Lahtinen <joonas.lahtinen@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Apr 20, 2023 at 09:14:53PM +0200, Anna Karas wrote:
> Add helpers for requiring the XE driver, reopening drm fd and restoring
> engine properties between tests.
> This lib is a direct port of gem.c from i915.
> 
> Reference: Jira VLK-46235
> Signed-off-by: Anna Karas <anna.karas@intel.com>
> ---
>  lib/meson.build |   1 +
>  lib/xe/xe_gpu.c | 136 ++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_gpu.h |  19 +++++++
>  3 files changed, 156 insertions(+)
>  create mode 100644 lib/xe/xe_gpu.c
>  create mode 100644 lib/xe/xe_gpu.h
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index b21c252b..b33f8ae6 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -100,6 +100,7 @@ lib_sources = [
>  	'igt_msm.c',
>  	'igt_dsc.c',
>  	'xe/xe_compute.c',
> +	'xe/xe_gpu.c',
>  	'xe/xe_compute_square_kernels.c',
>  	'xe/xe_ioctl.c',
>  	'xe/xe_query.c',
> diff --git a/lib/xe/xe_gpu.c b/lib/xe/xe_gpu.c
> new file mode 100644
> index 00000000..7abd8057
> --- /dev/null
> +++ b/lib/xe/xe_gpu.c
> @@ -0,0 +1,136 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + *
> + * Authors:
> + *    Anna Karas <anna.karas@intel.com>
> + */
> +
> +#include <dirent.h>
> +#include <fcntl.h>
> +#include <sys/ioctl.h>
> +
> +#include "xe/xe_gpu.h"
> +#include "igt_sysfs.h"
> +#include "igt.h"
> +
> +
> +/*
> + * Resets all engine properties to defaults prior to the start of a test.
> + */
> +static void __restore_defaults(int engine)
> +{
> +	struct dirent *de;
> +	int defaults;
> +	DIR *dir;
> +
> +	defaults = openat(engine, ".defaults", O_RDONLY);
> +	if (defaults < 0)
> +		return;
> +
> +	dir = fdopendir(defaults);
> +	if (!dir) {
> +		close(defaults);
> +		return;
> +	}
> +
> +	while ((de = readdir(dir))) {
> +		char buf[256];
> +		int fd, len;
> +
> +		if (*de->d_name == '.')
> +			continue;
> +
> +		fd = openat(defaults, de->d_name, O_RDONLY);
> +		if (fd < 0)
> +			continue;
> +
> +		len = read(fd, buf, sizeof(buf));
> +		close(fd);
> +		if (len < 0)
> +			continue;
> +
> +		fd = openat(engine, de->d_name, O_WRONLY);
> +		if (fd < 0)
> +			continue;
> +
> +		write(fd, buf, len);
> +		close(fd);
> +	}
> +
> +	closedir(dir);
> +}
> +
> +static void restore_defaults(int fd)
> +{
> +	struct dirent *de;
> +	int engines;
> +	DIR *dir;
> +	int sys;
> +
> +	sys = igt_sysfs_open(fd);
> +	if (sys < 0)
> +		return;
> +
> +	engines = openat(sys, "engine", O_RDONLY);
> +	if (engines < 0)
> +		goto close_sys;
> +
> +	dir = fdopendir(engines);
> +	if (!dir) {
> +		close(engines);
> +		goto close_sys;
> +	}
> +
> +	while ((de = readdir(dir))) {
> +		int engine;
> +
> +		if (*de->d_name == '.')
> +			continue;
> +
> +		engine = openat(engines, de->d_name, O_RDONLY);
> +		if (engine < 0)
> +			continue;
> +
> +		__restore_defaults(engine);
> +		close(engine);
> +	}
> +
> +	closedir(dir);
> +
> +close_sys:
> +	close(sys);
> +}
> +
> +/**
> + * xe_reopen_driver:
> + * @fd: re-open the xe drm file descriptor
> + *
> + * Re-opens the drm fd which is useful in instances where a clean default
> + * context is needed.
> + */
> +int xe_reopen_driver(int fd)
> +{
> +	char path[256];
> +
> +	snprintf(path, sizeof(path), "/proc/self/fd/%d", fd);
> +	fd = open(path, O_RDWR);
> +	igt_assert_fd(fd);
> +
> +	return fd;
> +}

On quick first look:

Duplicates gem_reopen_driver() code, maybe just replace 'i915' to 'fd'
there?

--
Zbigniew

> +
> +/**
> + * xe_require_gpu:
> + * @fd: the xe drm file descriptor
> + *
> + * Helper to be used prior to the start of a tests, useful in instances
> + * where a clean default context is needed.
> + */
> +void xe_require_gpu(int fd)
> +{
> +	igt_require_xe(fd);
> +	fd = xe_reopen_driver(fd);
> +	restore_defaults(fd);
> +	close(fd);
> +}
> diff --git a/lib/xe/xe_gpu.h b/lib/xe/xe_gpu.h
> new file mode 100644
> index 00000000..020040ac
> --- /dev/null
> +++ b/lib/xe/xe_gpu.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + *
> + * Authors:
> + *    Anna Karas <anna.karas@intel.com>
> + */
> +
> +#ifndef XE_GPU_H
> +#define XE_GPU_H
> +
> +#include <stdint.h>
> +#include <xe_drm.h>
> +
> +int xe_reopen_driver(int fd);
> +void xe_require_gpu(int fd);
> +
> +#endif	/* XE_GPU_H */
> +
> -- 
> 2.25.1
> 
> ---------------------------------------------------------------------
> Intel Technology Poland sp. z o.o.
> ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydzial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-316 | Kapital zakladowy 200.000 PLN.
> Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu ustawy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w transakcjach handlowych.
> 
> Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek przegladanie lub rozpowszechnianie jest zabronione.
> This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by others is strictly prohibited.
