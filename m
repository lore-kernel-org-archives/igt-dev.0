Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D1A10E223
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Apr 2023 08:07:43 +0000 (UTC)
Message-ID: <b2f7d0c6-da1d-858b-599d-4a39091f5e20@intel.com>
Date: Fri, 21 Apr 2023 13:37:19 +0530
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
 <20230418164501.1687266-20-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20230418164501.1687266-20-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 19/45] tests/i915/kms_flip_scaled_crc: Add XE
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

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

On 4/18/2023 10:14 PM, Bhanuprakash Modem wrote:
> Add XE driver support for kms tests.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/i915/kms_flip_scaled_crc.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/tests/i915/kms_flip_scaled_crc.c b/tests/i915/kms_flip_scaled_crc.c
> index 7f7a59b93..f5dc430e3 100644
> --- a/tests/i915/kms_flip_scaled_crc.c
> +++ b/tests/i915/kms_flip_scaled_crc.c
> @@ -623,7 +623,7 @@ igt_main
>   	drmModeModeInfoPtr modetoset = NULL;
>   
>   	igt_fixture {
> -		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
> +		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>   		data.gen = intel_display_ver(intel_get_drm_devid(data.drm_fd));
>   		igt_require(data.gen >= 9);
>   		igt_display_require(&data.display, data.drm_fd);
> @@ -644,6 +644,12 @@ igt_main
>   	for (int index = 0; index < ARRAY_SIZE(flip_scenario_test); index++) {
>   		igt_describe(flip_scenario_test[index].describe);
>   		igt_subtest_with_dynamic(flip_scenario_test[index].name) {
> +			/* No tiling support in XE. */
> +			if (is_xe_device(data.drm_fd) &&
> +			    (flip_scenario_test[index].firstmodifier != DRM_FORMAT_MOD_LINEAR ||
> +			     flip_scenario_test[index].secondmodifier != DRM_FORMAT_MOD_LINEAR))
> +				continue;
> +
>   			free_fbs(&data);
>   			for_each_pipe(&data.display, pipe) {
>   				bool found = false;
