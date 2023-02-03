Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3090410E763
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Feb 2023 11:18:09 +0000 (UTC)
Message-ID: <45c872a9-6e56-ee9c-05c4-0c9bc4e2c1f4@intel.com>
Date: Fri, 3 Feb 2023 16:47:51 +0530
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230203110431.21248-1-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230203110431.21248-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/kms_dsc: Rename subtest
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


On 2/3/2023 4:34 PM, Swati Sharma wrote:
> Test is renamed from basic-dsc to dsc-basic for consistency
> with other subtest names.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/i915/kms_dsc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
> index 21addb234..b3c5e60c7 100644
> --- a/tests/i915/kms_dsc.c
> +++ b/tests/i915/kms_dsc.c
> @@ -225,7 +225,7 @@ igt_main
>   	igt_describe("Tests basic display stream compression functionality if supported "
>   		     "by a connector by forcing DSC on all connectors that support it "
>   		     "with default parameters");
> -	igt_subtest_with_dynamic("basic-dsc")
> +	igt_subtest_with_dynamic("dsc-basic")
>   			test_dsc(&data, TEST_DSC_BASIC, 0, DRM_FORMAT_XRGB8888);
>   
>   	igt_describe("Tests basic display stream compression functionality if supported "
