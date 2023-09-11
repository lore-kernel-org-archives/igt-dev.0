Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA4610E30B
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Sep 2023 14:45:06 +0000 (UTC)
Message-ID: <75bdc363-2e93-5f1f-90de-4c99d49d85d3@intel.com>
Date: Mon, 11 Sep 2023 20:14:45 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230908175039.1291593-1-swati2.sharma@intel.com>
 <20230908175039.1291593-3-swati2.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230908175039.1291593-3-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/5] tests/intel/kms_pm_lpsp: Add XE
 support
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

Hi Swati,

On Fri-08-09-2023 11:20 pm, Swati Sharma wrote:
> Add XE driver support for kms pm tests.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_pm_lpsp.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
> index 9b5547cda..7d697b1e2 100644
> --- a/tests/intel/kms_pm_lpsp.c
> +++ b/tests/intel/kms_pm_lpsp.c
> @@ -39,7 +39,7 @@
>    *
>    * SUBTEST: kms-lpsp
>    * Description: This test validates lpsp on all connected outputs on low power PIPE_A
> - * Driver requirement: i915
> + * Driver requirement: i915, xe
>    * Functionality: pm_lpsp
>    * Mega feature: Display Power
>    * Run type: FULL
> @@ -194,8 +194,7 @@ igt_main
>   	data_t data = {};
>   
>   	igt_fixture {
> -
> -		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
> +		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>   		igt_require(data.drm_fd >= 0);
>   		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
>   		igt_require(data.debugfs_fd >= 0);
> @@ -208,6 +207,7 @@ igt_main
>   
>   	igt_describe("This test validates lpsp while all crtc are disabled");
>   	igt_subtest("screens-disabled") {
> +		igt_require_i915(data.drm_fd);

Why it is i915 specific?

- Bhanu

>   		igt_require_f(!dmc_supported(data.debugfs_fd),
>   			      "DC states supported platform don't have ROI for this subtest\n");
>   		screens_disabled_subtest(&data);
