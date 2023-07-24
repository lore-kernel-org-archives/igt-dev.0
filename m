Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CA210E040
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jul 2023 06:37:38 +0000 (UTC)
Message-ID: <014c1ca0-4d86-5bef-03bb-9427bf5f3318@intel.com>
Date: Mon, 24 Jul 2023 12:07:02 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230704173107.842296-1-swati2.sharma@intel.com>
 <20230704173107.842296-10-swati2.sharma@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20230704173107.842296-10-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [v2 9/9] tests/i915/kms_dsc: add test summary
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


On 7/4/2023 11:01 PM, Swati Sharma wrote:
> Add test summary giving overall summary of subtests.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/i915/kms_dsc.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
> index d46a5e74d..2933c6cfb 100644
> --- a/tests/i915/kms_dsc.c
> +++ b/tests/i915/kms_dsc.c
> @@ -43,6 +43,27 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
>   #define TEST_DSC_OUTPUT_FORMAT	(1<<2)
>   #define TEST_DSC_FRACTIONAL_BPP (1<<3)
>   
> +/*
> + * Starting from gen11, i915 driver supports DSC1.1. For validating
> + * DSC, the first step is to verify if the sink supports DSC.
> + * If the sink does support DSC, we will validate the following
> + * scenarios. In all the scenarios, we are forcing dsc.
> + * (i) basic modeset (ii) input bpc (iii) pixel formats
> + * (iv) output formats (v) fractional bpp
> + * In the basic subtest, we perform modeset with default parameters.
> + * Input bpc and pixel formats subtests, we perform modeset
> + * with different input bpc (12/10/8) and pixel formats (YUV/RGB),
> + * respectively. With the support of DSC1.2 from MTL, we can

Can drop ref to DSC1.2 here.

Otherwise LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


Regards,

Ankit

> + * verify fractional bpp and DSC YCBCR420 output format. The tests
> + * are executed with the RGB444 output format by default. However,
> + * in the output-format subtest, we verify output formats
> + * (RGB/YCBCR444/YCBCR420). Fractional bpp is tested with default
> + * parameter. In this, driver will ignore integer compressed bpp
> + * value and will do modeset with fractional bpp only. Also,
> + * tests are added to validate output format and fractional bpp
> + * with different input bpc.
> + */
> +
>   typedef struct {
>   	int drm_fd;
>   	uint32_t devid;
