Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B4DB10F7F9
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Apr 2022 10:27:39 +0000 (UTC)
Message-ID: <5097aebf-62cf-176c-77e0-a5ee0765723e@intel.com>
Date: Thu, 21 Apr 2022 15:57:29 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220413102608.1795110-1-bhanuprakash.modem@intel.com>
 <20220413102608.1795110-3-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20220413102608.1795110-3-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 2/2] tests/kms_setmode: Fix the corner case in
 handling 5k+ modes
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

On 4/13/2022 3:56 PM, Bhanuprakash Modem wrote:
> In below example, second combination (Pipe-B & Pipe-A) is invalid
> as bigjoiner come in to the picture. Somehow we missed this corner
> case in earlier fix, hence fixing now.
>
> Starting dynamic subtest: pipe-A-DP-1-pipe-B-DP-4
>    Test id#1 CRTC count 2
>      CRTC[115] [Pipe A] Mode: 3840x2160@30Hz Connectors: DP-1[384]
>      CRTC[203] [Pipe B] Mode: 7680x4320@30Hz Connectors: DP-4[416]
> Dynamic subtest pipe-A-DP-1-pipe-B-DP-4: SUCCESS (0.509s)
> Starting dynamic subtest: pipe-B-DP-1-pipe-A-DP-4
>    Test id#2 CRTC count 2
>      CRTC[203] [Pipe B] Mode: 3840x2160@30Hz Connectors: DP-1[384]
>      CRTC[115] [Pipe A] Mode: 7680x4320@30Hz Connectors: DP-4[416]
> Dynamic subtest pipe-B-DP-1-pipe-A-DP-4: FAIL (0.272s)
>
> V2:
> * Improve the logic
> * Add comments
>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_setmode.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 969ad75c..8c755091 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -676,10 +676,16 @@ static void test_one_combination(const struct test_config *tconf,
>   			 * if mode.hdisplay > 5120, then ignore
>   			 *   - last crtc in single/multi-connector config
>   			 *   - consecutive crtcs in multi-connector config
> +			 *
> +			 * in multi-connector config ignore if
> +			 *   - previous crtc mode.hdisplay > 5120 and
> +			 *   - current & previous crtcs are consecutive
>   			 */
> -			if ((crtc->mode.hdisplay > MAX_HDISPLAY_PER_CRTC) &&
> -			    ((crtc->crtc_idx >= (tconf->resources->count_crtcs - 1)) ||
> -			     (i < (crtc_count - 1) && abs(crtcs[i + 1].crtc_idx - crtc->crtc_idx) <= 1))) {
> +			if (((crtc->mode.hdisplay > MAX_HDISPLAY_PER_CRTC) &&
> +			     ((crtc->crtc_idx >= (tconf->resources->count_crtcs - 1)) ||
> +			      ((i < (crtc_count - 1)) && (abs(crtcs[i + 1].crtc_idx - crtc->crtc_idx) <= 1)))) ||
> +			    ((i > 0) && (crtc[i - 1].mode.hdisplay > MAX_HDISPLAY_PER_CRTC) &&
> +			     (abs(crtc->crtc_idx - crtcs[i - 1].crtc_idx) <= 1))) {
>   				igt_info("Combo: %s is not possible with selected mode(s).\n", test_name);
>   				goto out;
>   			}

