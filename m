Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA64910E0FA
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jul 2023 05:33:04 +0000 (UTC)
Message-ID: <11a8c555-e8ff-8063-4f53-aa29c57cd270@intel.com>
Date: Mon, 24 Jul 2023 11:02:47 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230704173107.842296-1-swati2.sharma@intel.com>
 <20230704173107.842296-9-swati2.sharma@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20230704173107.842296-9-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [v2 8/9] tests/i915/kms_dsc: add subtest
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

On 7/4/2023 11:01 PM, Swati Sharma wrote:
> New subtest is added to validate fractional bpp with different
> input bpc.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/i915/kms_dsc.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
> index 26d6e2ffb..d46a5e74d 100644
> --- a/tests/i915/kms_dsc.c
> +++ b/tests/i915/kms_dsc.c
> @@ -392,6 +392,16 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
>   				 DEFAULT_BPC, DRM_FORMAT_XRGB8888,
>   				 DSC_FORMAT_RGB);
>   
> +	igt_describe("Tests fractional compressed bpp functionality if supported "
> +		     "by a connector by forcing fractional_bpp on all connectors that support it "
> +		     "with certain input BPC for the connector.");
> +	igt_subtest_with_dynamic("dsc-fractional-bpp-with-bpc") {
> +		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
> +			test_dsc(&data, TEST_DSC_FRACTIONAL_BPP | TEST_DSC_BPC,
> +				 bpc_list[j], DRM_FORMAT_XRGB8888,
> +				 DSC_FORMAT_RGB);
> +	}
> +
>   	igt_fixture {
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
