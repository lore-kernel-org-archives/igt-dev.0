Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D09D10E160
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Apr 2022 19:59:57 +0000 (UTC)
Date: Wed, 13 Apr 2022 22:59:54 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <YlcrunS4ZbDn36V0@intel.com>
References: <20220405191215.76309-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220405191215.76309-1-jose.souza@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib: Add DRRS helpers
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

On Tue, Apr 05, 2022 at 12:12:14PM -0700, José Roberto de Souza wrote:
> Due to recent refactors in i915, it completely changed
> i915_drrs_status breaking all DRRS tests in kms_frontbuffer_tracking
> so here adding DRRS helpers to a separate file so it can be used by
> kms_frontbuffer_tracking and any future tests.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  lib/igt_drrs.c  | 151 ++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_drrs.h  |  31 ++++++++++
>  lib/meson.build |   1 +
>  3 files changed, 183 insertions(+)
>  create mode 100644 lib/igt_drrs.c
>  create mode 100644 lib/igt_drrs.h
> 
> diff --git a/lib/igt_drrs.c b/lib/igt_drrs.c
> new file mode 100644
> index 0000000000..8c424c32e3
> --- /dev/null
> +++ b/lib/igt_drrs.c
> @@ -0,0 +1,151 @@
> +/*
> + * Copyright © 2022 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + */
> +
> +#include "drmtest.h"
> +#include "igt_drrs.h"
> +
> +#define DRRS_ENABLE_STR "DRRS Enabled: "
> +#define DRRS_ACTIVE_STR "DRRS Active: "
> +#define DRRS_REFRESH_RATE_STR "DRRS refresh rate: "
> +
> +struct drrs_status {
> +	bool enabled;
> +	bool active;
> +	bool low_refresh_rate;
> +};
> +
> +static bool is_yes_or_no(char *ch)
> +{
> +	return strncmp(ch, "yes", 3) == 0;
> +}
> +
> +static const char *yes_or_no(bool r)
> +{
> +	return r ? "yes" : "no";
> +}
> +
> +static bool parse(int debugfs_fd, enum pipe pipe, struct drrs_status *status)
> +{
> +	char buf[1024], search[16], *ch;
> +	int ret;
> +
> +	ret = igt_debugfs_simple_read(debugfs_fd, "i915_drrs_status", buf,
> +				      sizeof(buf));
> +	if (ret < 0) {
> +		igt_info("Could not read i915_drrs_status: %s\n",
> +			 strerror(-ret));
> +		return false;
> +	}
> +
> +	snprintf(search, sizeof(search), ":pipe %s]:", kmstest_pipe_name(pipe));

We should probably just move DRRS over to per-crtc/connector
debugfs files. Would avoid nasty stuff like this.

> +	ch = strstr(buf, search);
> +	if (!ch)
> +		return false;
> +
> +	ch = strstr(buf, DRRS_ENABLE_STR);
> +	if (!ch)
> +		return false;
> +	ch += sizeof(DRRS_ENABLE_STR);
> +	status->enabled = is_yes_or_no(ch);
> +
> +	ch = strstr(buf, DRRS_ACTIVE_STR);
> +	if (!ch)
> +		return false;
> +	ch += sizeof(DRRS_ACTIVE_STR);
> +	status->active = is_yes_or_no(ch);
> +
> +	ch = strstr(buf, DRRS_REFRESH_RATE_STR);
> +	if (!ch)
> +		return false;
> +	ch += sizeof(DRRS_REFRESH_RATE_STR);
> +	status->low_refresh_rate = strncmp(ch, "low", 3) == 0;
> +
> +	return true;
> +}
> +
> +bool drrs_is_enabled(int debugfs_fd, enum pipe pipe)
> +{
> +	struct drrs_status status;
> +	bool ret;
> +
> +	ret = parse(debugfs_fd, pipe, &status);
> +	if (!ret)
> +		return false;
> +
> +	return status.enabled;
> +}
> +
> +bool drrs_is_active(int debugfs_fd, enum pipe pipe)
> +{
> +	struct drrs_status status;
> +	bool ret;
> +
> +	ret = parse(debugfs_fd, pipe, &status);
> +	if (!ret)
> +		return false;
> +
> +	return status.active;
> +}
> +
> +bool drrs_is_low_refresh_rate(int debugfs_fd, enum pipe pipe)
> +{
> +	struct drrs_status status;
> +	bool ret;
> +
> +	ret = parse(debugfs_fd, pipe, &status);
> +	if (!ret)
> +		return false;
> +
> +	return status.low_refresh_rate;
> +}
> +
> +bool drrs_write_status(int debugfs_fd, enum pipe pipe, char *buf, int len)
> +{
> +	struct drrs_status status;
> +	int ret, used = 0;
> +
> +	ret = parse(debugfs_fd, pipe, &status);
> +	if (!ret)
> +		return false;
> +
> +	ret = snprintf(buf, len - used, DRRS_ENABLE_STR "%s\n",
> +		       yes_or_no(status.enabled));
> +	if (ret < 0 || ret >= (len - used))
> +		return false;
> +	used += ret;
> +	buf += ret;
> +
> +	ret = snprintf(buf, len - used, DRRS_ACTIVE_STR "%s\n",
> +		       yes_or_no(status.active));
> +	if (ret < 0 || ret >= (len - used))
> +		return false;
> +	used += ret;
> +	buf += ret;
> +
> +	ret = snprintf(buf, len - used, DRRS_REFRESH_RATE_STR "%s\n",
> +		       status.low_refresh_rate ? "low" : "high");
> +	if (ret < 0 || ret >= (len - used))
> +		return false;
> +
> +	return true;
> +}
> \ No newline at end of file
> diff --git a/lib/igt_drrs.h b/lib/igt_drrs.h
> new file mode 100644
> index 0000000000..ff79fb20fb
> --- /dev/null
> +++ b/lib/igt_drrs.h
> @@ -0,0 +1,31 @@
> +/*
> + * Copyright © 2022 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + */
> +
> +#pragma once
> +
> +#include "igt_kms.h"
> +
> +bool drrs_is_enabled(int debugfs_fd, enum pipe pipe);
> +bool drrs_is_active(int debugfs_fd, enum pipe pipe);
> +bool drrs_is_low_refresh_rate(int debugfs_fd, enum pipe pipe);
> +bool drrs_write_status(int debugfs_fd, enum pipe pipe, char *buf, int len);
> diff --git a/lib/meson.build b/lib/meson.build
> index ccee7a5965..3176b27813 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -77,6 +77,7 @@ lib_sources = [
>  	'igt_dummyload.c',
>  	'igt_store.c',
>  	'uwildmat/uwildmat.c',
> +	'igt_drrs.c',
>  	'igt_kmod.c',
>  	'igt_panfrost.c',
>  	'igt_v3d.c',
> -- 
> 2.35.1

-- 
Ville Syrjälä
Intel
