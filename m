Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F34810E0FA
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jul 2023 05:40:49 +0000 (UTC)
Message-ID: <9ed9d6a3-b7f5-b330-b2a3-0a36df9a091e@intel.com>
Date: Mon, 24 Jul 2023 11:10:17 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230704173107.842296-1-swati2.sharma@intel.com>
 <20230704173107.842296-6-swati2.sharma@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20230704173107.842296-6-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [v2 5/9] tests/i915/kms_dsc: add subtest
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

Lets add a little more detail in subject line phrase.

Same for the other patch with same subject line.

Otherwise LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


On 7/4/2023 11:01 PM, Swati Sharma wrote:
> New subtest is added validating output format with different
> input bpc.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/i915/kms_dsc.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
> index df9b27225..d1935dcd3 100644
> --- a/tests/i915/kms_dsc.c
> +++ b/tests/i915/kms_dsc.c
> @@ -357,6 +357,19 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
>   				 output_format_list[k]);
>   	}
>   
> +	igt_describe("Tests basic display stream compression functionality if supported "
> +		     "by a connector by forcing DSC and output format on all connectors "
> +		     "that support it with certain input BPC for the connector");
> +	igt_subtest_with_dynamic("dsc-with-output-formats-with-bpc") {
> +		for (int k = 0; k < ARRAY_SIZE(output_format_list); k++) {
> +			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
> +				test_dsc(&data, TEST_DSC_OUTPUT_FORMAT | TEST_DSC_BPC,
> +					 bpc_list[j], DRM_FORMAT_XRGB8888,
> +					 output_format_list[k]);
> +			}
> +		}
> +	}
> +
>   	igt_fixture {
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
