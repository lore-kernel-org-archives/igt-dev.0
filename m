Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E443810E06B
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Dec 2022 05:30:41 +0000 (UTC)
Message-ID: <71627e7a-8412-7e40-d618-4b02895b3b5c@intel.com>
Date: Thu, 15 Dec 2022 11:00:21 +0530
To: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 <igt-dev@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>
References: <20221215023110.2436554-1-ashutosh.dixit@intel.com>
 <20221215023110.2436554-3-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20221215023110.2436554-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] i915/i915_hwmon: General
 verification of hwmon attributes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 12/15/2022 8:01 AM, Ashutosh Dixit wrote:
> Ensure we can read all hwmon attributes. For writable attributes, ensure
> the read value approximately matches the written value for a subset of all
> possible values.
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Looks good to me
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   tests/i915/i915_hwmon.c | 88 +++++++++++++++++++++++++++++++++++++++++
>   tests/meson.build       |  1 +
>   2 files changed, 89 insertions(+)
>   create mode 100644 tests/i915/i915_hwmon.c
> 
> diff --git a/tests/i915/i915_hwmon.c b/tests/i915/i915_hwmon.c
> new file mode 100644
> index 00000000000..6d9937e99dc
> --- /dev/null
> +++ b/tests/i915/i915_hwmon.c
> @@ -0,0 +1,88 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#include <dirent.h>
> +#include <sys/stat.h>
> +#include "igt.h"
> +#include "igt_hwmon.h"
> +#include "igt_sysfs.h"
> +
> +IGT_TEST_DESCRIPTION("Tests for i915 hwmon");
> +
> +static void hwmon_read(int hwm)
> +{
> +	struct dirent *de;
> +	char val[128];
> +	DIR *dir;
> +
> +	dir = fdopendir(dup(hwm));
> +	igt_assert(dir);
> +	rewinddir(dir);
> +
> +	while ((de = readdir(dir))) {
> +		if (de->d_type != DT_REG || !strcmp(de->d_name, "uevent"))
> +			continue;
> +
> +		igt_assert(igt_sysfs_scanf(hwm, de->d_name, "%127s", val) == 1);
> +		igt_debug("'%s': %s\n", de->d_name, val);
> +
> +	}
> +	closedir(dir);
> +}
> +
> +static void hwmon_write(int hwm)
> +{
> +	igt_sysfs_rw_attr_t rw;
> +	struct dirent *de;
> +	struct stat st;
> +	DIR *dir;
> +
> +	dir = fdopendir(dup(hwm));
> +	igt_assert(dir);
> +	rewinddir(dir);
> +
> +	rw.dir = hwm;
> +	rw.start = 1;
> +	rw.tol = 0.1;
> +
> +	while ((de = readdir(dir))) {
> +		if (de->d_type != DT_REG || !strcmp(de->d_name, "uevent"))
> +			continue;
> +
> +		igt_assert(!fstatat(hwm, de->d_name, &st, 0));
> +		if (!(st.st_mode & 0222))
> +			continue;
> +
> +		rw.attr = de->d_name;
> +		igt_sysfs_rw_attr_verify(&rw);
> +	}
> +	closedir(dir);
> +}
> +
> +igt_main
> +{
> +	int fd, hwm;
> +
> +	igt_fixture {
> +		fd = drm_open_driver_master(DRIVER_INTEL);
> +		hwm = igt_hwmon_open(fd);
> +		igt_require(hwm >= 0);
> +	}
> +
> +	igt_describe("Verify we can read all hwmon attributes");
> +	igt_subtest("hwmon-read") {
> +		hwmon_read(hwm);
> +	}
> +
> +	igt_describe("Verify writable hwmon attributes");
> +	igt_subtest("hwmon-write") {
> +		hwmon_write(hwm);
> +	}
> +
> +	igt_fixture {
> +		close(hwm);
> +		close(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 619c18b2516..a593055c23a 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -211,6 +211,7 @@ i915_progs = [
>   	'i915_fb_tiling',
>   	'i915_getparams_basic',
>   	'i915_hangman',
> +	'i915_hwmon',
>   	'i915_module_load',
>   	'i915_pciid',
>   	'i915_pipe_stress',
