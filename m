Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3718210E6E6
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Nov 2023 08:20:11 +0000 (UTC)
Date: Thu, 23 Nov 2023 09:19:43 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231123081943.fr7uoup3vozumhpd@kamilkon-desk.igk.intel.com>
References: <20231123064405.157754-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231123064405.157754-1-swati2.sharma@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] tests/kms_feature_discovery: check
 display support only
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
On 2023-11-23 at 12:14:03 +0530, Swati Sharma wrote:
> This test to be used only to check display support.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/kms_feature_discovery.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
> index 428f97ffe..56da009b7 100644
> --- a/tests/kms_feature_discovery.c
> +++ b/tests/kms_feature_discovery.c
> @@ -30,8 +30,7 @@
>   *		anything else means we have a serious problem.
>   *
>   * SUBTEST: display
> - * Description: Make sure that we have display support with
> - * 		some outputs connected.
> + * Description: Make sure that we have display support.
>   * Driver requirement: i915, xe
>   * Functionality: feature_discovery
>   * Mega feature: General Display Features
> @@ -104,7 +103,7 @@ igt_main {
>  			igt_display_require(&display, fd);
>  		}
>  
> -		igt_describe("Make sure that we have display support with some outputs connected.");
> +		igt_describe("Make sure that we have display support.");
>  		igt_subtest("display") {
>  			/* will skip because of the fixture */
>  		}
> -- 
> 2.25.1
> 
