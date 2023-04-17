Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F46A10E111
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Apr 2023 07:33:50 +0000 (UTC)
Message-ID: <4b3167b4-85e5-ec9b-1aec-d185db58d746@intel.com>
Date: Mon, 17 Apr 2023 13:03:37 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230414135319.1270913-1-bhanuprakash.modem@intel.com>
 <20230414135319.1270913-7-bhanuprakash.modem@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20230414135319.1270913-7-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V4 6/6] tests/kms_setmode: Fix Bigjoiner checks
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


On 4/14/2023 7:23 PM, Bhanuprakash Modem wrote:
> Bigjoiner will come in the picture when the resolution > 5K or
> clock > max dot-clock. Add a support to check the selected mode
> clock is greater than the max dot-clock.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_setmode.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index bfa108916ce..7932a3ec285 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -40,13 +40,12 @@
>   /* restricted pipe count */
>   #define CRTC_RESTRICT_CNT 2
>   
> -#define MAX_HDISPLAY_PER_CRTC 5120
> -
>   static int drm_fd;
>   static drmModeRes *drm_resources;
>   static int filter_test_id;
>   static bool dry_run;
>   static bool extended = false;
> +static int max_dotclock;
>   
>   const drmModeModeInfo mode_640_480 = {
>   	.name		= "640x480",
> @@ -664,18 +663,20 @@ static void test_one_combination(const struct test_config *tconf,
>   			struct crtc_config *crtc = &crtcs[i];
>   
>   			/*
> -			 * if mode.hdisplay > 5120, then ignore
> +			 * if mode resolution > 5K (or) mode clock > max_dotclock,
> +			 * then ignore
>   			 *   - last crtc in single/multi-connector config
>   			 *   - consecutive crtcs in multi-connector config
>   			 *
>   			 * in multi-connector config ignore if
> -			 *   - previous crtc mode.hdisplay > 5120 and
> +			 *   - previous crtc (mode resolution > 5K (or)
> +			 *     mode clock > max_dotclock) and
>   			 *   - current & previous crtcs are consecutive
>   			 */
> -			if (((crtc->mode.hdisplay > MAX_HDISPLAY_PER_CRTC) &&
> +			if ((igt_bigjoiner_possible(&crtc->mode, max_dotclock) &&

As mentioned in other patch as well, lets have the bigjoiner check only 
for i915 case.

Regards,

Ankit


>   			     ((crtc->crtc_idx >= (tconf->resources->count_crtcs - 1)) ||
>   			      ((i < (crtc_count - 1)) && (abs(crtcs[i + 1].crtc_idx - crtc->crtc_idx) <= 1)))) ||
> -			    ((i > 0) && (crtc[i - 1].mode.hdisplay > MAX_HDISPLAY_PER_CRTC) &&
> +			    ((i > 0) && igt_bigjoiner_possible(&crtc[i - 1].mode, max_dotclock) &&
>   			     (abs(crtc->crtc_idx - crtcs[i - 1].crtc_idx) <= 1))) {
>   				igt_info("Combo: %s is not possible with selected mode(s).\n", test_name);
>   				goto out;
> @@ -954,6 +955,8 @@ igt_main_args("det:", NULL, help_str, opt_handler, NULL)
>   
>   		drm_resources = drmModeGetResources(drm_fd);
>   		igt_require(drm_resources);
> +
> +		max_dotclock = igt_get_max_dotclock(drm_fd);
>   	}
>   
>   	for (i = 0; i < ARRAY_SIZE(tests); i++) {
