Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D3A10E1D7
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Dec 2022 12:50:10 +0000 (UTC)
Message-ID: <d9f4102f-2a09-0fa2-9d33-97a729f2d9d1@intel.com>
Date: Tue, 13 Dec 2022 18:19:57 +0530
Content-Language: en-US
To: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 <igt-dev@lists.freedesktop.org>, Anshuman Gupta <anshuman.gupta@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
References: <20221212061233.2220742-1-ashutosh.dixit@intel.com>
 <20221212061233.2220742-3-ashutosh.dixit@intel.com>
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20221212061233.2220742-3-ashutosh.dixit@intel.com>
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


Hi Ashutosh

On 12/12/2022 11:42 AM, Ashutosh Dixit wrote:
> Ensure we can read all hwmon attributes. For writable attributes, also
> ensure the read value approximately matches the written value, taking the
> clamping of writes into account.
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   tests/i915/i915_hwmon.c | 82 +++++++++++++++++++++++++++++++++++++++++
>   tests/meson.build       |  1 +
>   2 files changed, 83 insertions(+)
>   create mode 100644 tests/i915/i915_hwmon.c
> 
> diff --git a/tests/i915/i915_hwmon.c b/tests/i915/i915_hwmon.c
> new file mode 100644
> index 00000000000..a0b2c48a96d
> --- /dev/null
> +++ b/tests/i915/i915_hwmon.c
> @@ -0,0 +1,82 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2021 Intel Corporation
> + */
> +
Year 2022

Thanks
Riana
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
> +	struct dirent *de;
> +	struct stat st;
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
> +		igt_assert(!fstatat(hwm, de->d_name, &st, 0));
> +		if (!(st.st_mode & 0222))
> +			continue;
> +
> +		igt_sysfs_clamped_attr_verify(hwm, de->d_name);
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
