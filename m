Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEEF10E13C
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Nov 2023 08:21:09 +0000 (UTC)
Date: Thu, 23 Nov 2023 09:21:05 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231123082105.k33n23gxiyytzvwd@kamilkon-desk.igk.intel.com>
References: <20231123064405.157754-1-swati2.sharma@intel.com>
 <20231123064405.157754-2-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231123064405.157754-2-swati2.sharma@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] tests/kms_feature_discovery: add
 display-1x test
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
On 2023-11-23 at 12:14:04 +0530, Swati Sharma wrote:
> Add display-1x test to check if we have min 1 display connected.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/kms_feature_discovery.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
> index 56da009b7..1baa93f5f 100644
> --- a/tests/kms_feature_discovery.c
> +++ b/tests/kms_feature_discovery.c
> @@ -72,7 +72,7 @@
>   * Mega feature: General Display Features
>   * Test category: functionality test
>   *
> - * arg[1].values: 2, 3, 4
> + * arg[1].values: 1, 2, 3, 4
>   */
>  
>  #include "igt.h"
> @@ -130,6 +130,11 @@ igt_main {
>  				}
>  			}
>  
> +			igt_describe("Make sure that we can use at least 1 output at the same time.");
> +			igt_subtest("display-1x") {
> +				igt_require(output_count >= 1);
> +			}
> +
>  			igt_describe("Make sure that we can use at least 2 outputs at the same time.");
>  			igt_subtest("display-2x") {
>  				igt_require(output_count >= 2);
> -- 
> 2.25.1
> 
