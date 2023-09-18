Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4E710E18F
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Sep 2023 06:19:19 +0000 (UTC)
Message-ID: <7cb7ed3c-be08-173c-4ae9-1b2757ae0dd9@intel.com>
Date: Mon, 18 Sep 2023 11:49:04 +0530
To: Badal Nilawar <badal.nilawar@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230918062248.3109570-1-badal.nilawar@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20230918062248.3109570-1-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/intel/hwmon: Scale hwmon tests
 to support xe kmd
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



On 9/18/2023 11:52 AM, Badal Nilawar wrote:
> Scale hwmon tests to support xe kmd
> 
> v2: s/||/&& [Riana]
> 
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   lib/igt_hwmon.c                             |  5 ++++-
>   tests/intel/{i915_hwmon.c => intel_hwmon.c} | 10 +++++-----
>   tests/meson.build                           |  2 +-
>   3 files changed, 10 insertions(+), 7 deletions(-)
>   rename tests/intel/{i915_hwmon.c => intel_hwmon.c} (89%)
> 
> diff --git a/lib/igt_hwmon.c b/lib/igt_hwmon.c
> index 309019d69..f37ced2d9 100644
> --- a/lib/igt_hwmon.c
> +++ b/lib/igt_hwmon.c
> @@ -66,7 +66,10 @@ int igt_hwmon_open(int device)
>   {
>   	char path[PATH_MAX];
>   
> -	if (!is_i915_device(device) || !igt_hwmon_path(device, path, "i915"))
> +	if (!is_intel_device(device))
> +		return -1;
> +
> +	if (!igt_hwmon_path(device, path, "i915") && !igt_hwmon_path(device, path, "xe"))
>   		return -1;
LGTM
Reviewed-by: Riana Tauro <riana.tauro@intel.com>

>   
>   	return open(path, O_RDONLY);
> diff --git a/tests/intel/i915_hwmon.c b/tests/intel/intel_hwmon.c
> similarity index 89%
> rename from tests/intel/i915_hwmon.c
> rename to tests/intel/intel_hwmon.c
> index 48ed9f3b7..1cc9cd399 100644
> --- a/tests/intel/i915_hwmon.c
> +++ b/tests/intel/intel_hwmon.c
> @@ -9,11 +9,11 @@
>   #include "igt_hwmon.h"
>   #include "igt_sysfs.h"
>   /**
> - * TEST: i915 hwmon
> - * Description: Tests for i915 hwmon
> + * TEST: intel hwmon
> + * Description: Tests for intel hwmon
>    * Feature: hwmon
>    * Run type: FULL
> - * Test category: GEM_Legacy
> + * Test category: functionality
>    *
>    * SUBTEST: hwmon-read
>    * Description: Verify we can read all hwmon attributes
> @@ -22,7 +22,7 @@
>    * Description: Verify writable hwmon attributes
>    */
>   
> -IGT_TEST_DESCRIPTION("Tests for i915 hwmon");
> +IGT_TEST_DESCRIPTION("Tests for intel hwmon");
>   
>   static void hwmon_read(int hwm)
>   {
> @@ -79,7 +79,7 @@ igt_main
>   	int fd, hwm;
>   
>   	igt_fixture {
> -		fd = drm_open_driver_master(DRIVER_INTEL);
> +		fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>   		hwm = igt_hwmon_open(fd);
>   		igt_require(hwm >= 0);
>   	}
> diff --git a/tests/meson.build b/tests/meson.build
> index 31492bf7b..cf5c8a2fa 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -84,6 +84,7 @@ test_progs = [
>   
>   intel_i915_xe_progs = [
>   	'api_intel_allocator',
> +	'intel_hwmon',
>   ]
>   
>   intel_i915_progs = [
> @@ -218,7 +219,6 @@ intel_i915_progs = [
>   	'i915_getparams_basic',
>   	'i915_pm_freq_api',
>   	'i915_hangman',
> -	'i915_hwmon',
>   	'i915_module_load',
>   	'i915_pciid',
>   	'i915_pipe_stress',
