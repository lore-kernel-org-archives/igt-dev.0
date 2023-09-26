Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C1510E229
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 16:42:38 +0000 (UTC)
Message-ID: <0d03e792-c502-d633-6b31-2c25dddaf8a5@intel.com>
Date: Tue, 26 Sep 2023 22:12:13 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230918101150.258055-1-swati2.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230918101150.258055-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_content_protection: rename
 subtests
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


On Mon-18-09-2023 03:41 pm, Swati Sharma wrote:
> Use '-' instead of '_' while naming subtests and subtest name
> should use small case.

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_content_protection.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index 9378a76c1..ea0c4a0ab 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -491,14 +491,14 @@ test_fini(igt_output_t *output, enum igt_commit_style s)
>   }
>   
>   /**
> - * SUBTEST: LIC
> + * SUBTEST: lic
>    * Description: Test for the integrity of link.
>    * Driver requirement: i915, xe
>    * Functionality: hdcp1.4
>    * Mega feature: HDCP
>    * Test category: functionality test
>    *
> - * SUBTEST: content_type_change
> + * SUBTEST: content-type-change
>    * Description: Test the content type change when the content protection already
>    *              enabled
>    * Driver requirement: i915, xe
> @@ -506,7 +506,7 @@ test_fini(igt_output_t *output, enum igt_commit_style s)
>    * Mega feature: HDCP
>    * Test category: functionality test
>    *
> - * SUBTEST: mei_interface
> + * SUBTEST: mei-interface
>    * Description: Test the teardown and rebuild of the interface between Intel
>    *              and mei hdcp.
>    * Driver requirement: i915, xe
> @@ -802,7 +802,7 @@ static const struct {
>   	  .content_type = HDCP_CONTENT_TYPE_0
>   	},
>   	{ .desc = "Test for the integrity of link.",
> -	  .name = "LIC",
> +	  .name = "lic",
>   	  .cp_tests = CP_LIC,
>   	  .content_type = HDCP_CONTENT_TYPE_0,
>   	},
> @@ -814,12 +814,12 @@ static const struct {
>   	},
>   	{ .desc = "Test the teardown and rebuild of the interface between "
>   		  "Intel and mei hdcp.",
> -	  .name = "mei_interface",
> +	  .name = "mei-interface",
>   	  .cp_tests = CP_MEI_RELOAD,
>   	  .content_type = HDCP_CONTENT_TYPE_1,
>   	},
>   	{ .desc = "Test the content type change when the content protection already enabled",
> -	  .name = "content_type_change",
> +	  .name = "content-type-change",
>   	  .cp_tests = CP_TYPE_CHANGE,
>   	  .content_type = HDCP_CONTENT_TYPE_1,
>   	},
