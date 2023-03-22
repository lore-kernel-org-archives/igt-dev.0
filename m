Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBDB410E930
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Mar 2023 12:06:37 +0000 (UTC)
Date: Wed, 22 Mar 2023 13:06:28 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230322120628.z524vkuhfauujdxx@kamilkon-desk1>
References: <20230321144614.1676419-1-mauro.chehab@linux.intel.com>
 <20230321144614.1676419-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230321144614.1676419-3-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] xe/xe_module_load: add a test to
 load/unload Xe driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,

On 2023-03-21 at 15:46:14 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> This is helpful to allow IGT to check if there are issues
> during module load/unload.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  tests/intel-ci/xe-fast-feedback.testlist |   3 +
>  tests/meson.build                        |   1 +
>  tests/xe/xe_module_load.c                | 163 +++++++++++++++++++++++
>  3 files changed, 167 insertions(+)
>  create mode 100644 tests/xe/xe_module_load.c
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index 6525b1676b6f..3140d648833a 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -1,3 +1,6 @@
> +# Should be the first test
> +igt@xe_module_load@force-load
> +
>  igt@xe_compute@compute-square
>  igt@xe_debugfs@base
>  igt@xe_debugfs@gt
> diff --git a/tests/meson.build b/tests/meson.build
> index 632e36e059d8..f9fef103a736 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -256,6 +256,7 @@ xe_progs = [
>  	'xe_huc_copy',
>  	'xe_mmap',
>  	'xe_mmio',
> +	'xe_module_load',
>  	'xe_pm',
>  	'xe_prime_self_import',
>  	'xe_query',
> diff --git a/tests/xe/xe_module_load.c b/tests/xe/xe_module_load.c
> new file mode 100644
> index 000000000000..00302be561c1
> --- /dev/null
> +++ b/tests/xe/xe_module_load.c
> @@ -0,0 +1,163 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +/**
> + * TEST: Tests the xe module loading
> + * Category: Sofware building block
> + * Sub-category: driver
> + * Test category: functionality test
> + */
> +
> +#include "igt.h"
------------ ^
Move this after system includes.

> +#include <dirent.h>
> +#include <sys/utsname.h>
> +#ifdef __linux__
> +#include <linux/limits.h>
> +#endif
> +#include <signal.h>
------------ ^
> +#include <libgen.h>
> +#include <signal.h>
------------ ^
Duplicated.

> +#include <sys/ioctl.h>
> +#include <fcntl.h>

Consider sorting system include aplhabetically.

> +
> +#include "igt_debugfs.h"
> +#include "igt_aux.h"
> +#include "igt_kmod.h"
> +#include "igt_sysfs.h"
> +#include "igt_core.h"

These also may be sorted.

Please add global description here, for example:

IGT_TEST_DESCRIPTION("Check Xe module loading.");

> +
> +#define BAR_SIZE_SHIFT 20
> +#define MIN_BAR_SIZE 256
> +
> +static void
> +hda_dynamic_debug(bool enable)

Please write it on one line:

static void hda_dynamic_debug(bool enable)

> +{
> +	FILE *fp;
> +	const char snd_hda_intel_on[] = "module snd_hda_intel +pf";
------- ^
Add static to const char*, here and below.

> +	const char snd_hda_core_on[] = "module snd_hda_core +pf";
> +
> +	const char snd_hda_intel_off[] = "module snd_hda_core =_";
> +	const char snd_hda_core_off[] = "module snd_hda_intel =_";
> +
> +	fp = fopen("/sys/kernel/debug/dynamic_debug/control", "w");
> +	if (!fp) {
> +		igt_debug("hda dynamic debug not available\n");
> +		return;
> +	}
> +
> +	if (enable) {
> +		fwrite(snd_hda_intel_on, 1, sizeof(snd_hda_intel_on), fp);
> +		fwrite(snd_hda_core_on, 1, sizeof(snd_hda_core_on), fp);
> +	} else {
> +		fwrite(snd_hda_intel_off, 1, sizeof(snd_hda_intel_off), fp);
> +		fwrite(snd_hda_core_off, 1, sizeof(snd_hda_core_off), fp);
> +	}
> +
> +	fclose(fp);
> +}
> +
> +static void load_and_check_xe(const char *opts)
> +{
> +	int error;
> +	int drm_fd;
> +
> +	hda_dynamic_debug(true);
> +	error = igt_xe_driver_load(opts);
> +	hda_dynamic_debug(false);
> +
> +	igt_assert_eq(error, 0);
> +
> +	/* driver is ready, check if it's bound */
> +	drm_fd = __drm_open_driver(DRIVER_XE);
> +	igt_fail_on_f(drm_fd < 0, "Cannot open the xe DRM driver after modprobing xe.\n");
> +}
> +
> +/**
> + * SUBTEST: force-load
> + * Description: Load the Xe driver passing ``force_probe=*`` parameter
> + * Run type: BAT
> + *
> + * SUBTEST: load
> + * Description: Load the Xe driver
> + * Run type: FULL
> + *
> + * SUBTEST: unload
> + * Description: Unload the Xe driver
> + * Run type: FULL
> + *
> + * SUBTEST: reload
> + * Description: Reload the Xe driver
> + * Run type: FULL
> + *
> + * SUBTEST: reload-no-display
> + * Description: Reload the Xe driver passing ``enable_display=0`` parameter
> + * Run type: FULL
> + *
> + * SUBTEST: many-reload
> + * Description: Reload the Xe driver many times
> + * Run type: FULL
> + */
> +igt_main
> +{
> +	igt_describe("Check if xe and friends are not yet loaded, then load them.");
> +	igt_subtest("load") {
> +		const char * unwanted_drivers[] = {
--------------- ^ --------- ^
		static const char *unwanted_drivers[] = {

> +			"xe",
> +			"i915",
> +			NULL
> +		};
> +
> +		for (int i = 0; unwanted_drivers[i] != NULL; i++) {
> +			igt_skip_on_f(igt_kmod_is_loaded(unwanted_drivers[i]),
> +			              "%s is already loaded\n", unwanted_drivers[i]);
-- ^
Use more tabs.

> +		}
> +
> +		load_and_check_xe(NULL);
> +	}
> +

Add here description with igt_describe.

> +	igt_subtest("unload") {
> +		igt_xe_driver_unload();
> +	}
> +

Same here.

> +	igt_subtest("force-load") {
> +		const char * unwanted_drivers[] = {
--------------- ^ --------- ^
These are the same as above, maybe declare that before all tests
in igt_main ? Or maybe make it separate function and call it
from two places ?

> +			"xe",
> +			"i915",
> +			NULL
> +		};
> +
> +		for (int i = 0; unwanted_drivers[i] != NULL; i++) {
> +			igt_skip_on_f(igt_kmod_is_loaded(unwanted_drivers[i]),
> +			              "%s is already loaded\n", unwanted_drivers[i]);
-- ^
Use more tabs.

> +		}
> +
> +		load_and_check_xe("force_probe=*");
> +	}
> +

Same here, write description.

> +	igt_subtest("reload-no-display") {
> +		igt_xe_driver_unload();
> +		load_and_check_xe("enable_display=0");
> +	}
> +
> +

Remove extra empty line, add description.

> +	igt_subtest("many-reload") {
> +		int i;
> +
> +		for (i = 0; i < 10; i++) {

imho here it is worth printing igt_debug("reload cycle: %d\n", i);

> +			igt_xe_driver_unload();
> +			load_and_check_xe(NULL);
> +			sleep(1);
> +		}
> +	}
> +

Add description.

Regards,
Kamil

> +	igt_subtest("reload") {
> +		igt_xe_driver_unload();
> +		load_and_check_xe(NULL);
> +
> +		/* only default modparams, can leave module loaded */
> +	}
> +
> +	/* Subtests should unload the module themselves if they use modparams */
> +}
> -- 
> 2.39.2
> 

