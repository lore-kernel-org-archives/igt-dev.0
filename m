Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F252810E0A4
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Apr 2023 09:57:20 +0000 (UTC)
Message-ID: <ce1cf8c9-8cb2-778c-937f-239dbbabae04@intel.com>
Date: Fri, 21 Apr 2023 15:27:08 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
 <20230418164501.1687266-21-bhanuprakash.modem@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20230418164501.1687266-21-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 20/45] tests/i915/kms_flip_tiling: Add XE
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
>   tests/i915/kms_flip_tiling.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/tests/i915/kms_flip_tiling.c b/tests/i915/kms_flip_tiling.c
> index 4cc063f63..a22f12382 100644
> --- a/tests/i915/kms_flip_tiling.c
> +++ b/tests/i915/kms_flip_tiling.c
> @@ -177,7 +177,7 @@ igt_output_t *output;
>   igt_main
>   {
>   	igt_fixture {
> -		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
> +		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>   		data.gen = intel_display_ver(intel_get_drm_devid(data.drm_fd));
>   
>   		data.testformat = DRM_FORMAT_XRGB8888;
> @@ -217,6 +217,12 @@ igt_main
>   					if (plane->formats[j] != data.testformat)
>   						continue;
>   
> +					/* No tiling support in XE. */
> +					if (is_xe_device(data.drm_fd) &&
> +					    (plane->modifiers[i] != DRM_FORMAT_MOD_LINEAR ||
> +					     plane->modifiers[j] != DRM_FORMAT_MOD_LINEAR))
> +						continue;
> +
>   					igt_dynamic_f("%s-pipe-%s-%s-to-%s",
>   						      igt_output_name(output),
>   						      kmstest_pipe_name(pipe),
