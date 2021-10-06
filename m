Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBC76ED16
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Oct 2021 08:53:28 +0000 (UTC)
References: <20211005000145.311228-1-jose.souza@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Message-ID: <8326c8ea-ee40-ad89-a6c6-0688ddaf835d@intel.com>
Date: Wed, 6 Oct 2021 11:53:12 +0300
In-Reply-To: <20211005000145.311228-1-jose.souza@intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] Revert "tests/kms_psr: Skip h/w
 tracking PSR2 tests for ADL-P"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?UTF-8?Q?Jos=c3=a9_Roberto_de_Souza?= <jose.souza@intel.com>, igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>, Swati Sharma <swati2.sharma@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

On 10/5/21 3:01 AM, José Roberto de Souza wrote:
> PSR2 is now working on Alderlake-P so we can revert this patch.
> This reverts commit b5c6b973e7f7d33e7521825e39ddd380e80af01a.
> 
> Cc: Jeevan B <jeevan.b@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>   tests/i915/kms_psr.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/tests/i915/kms_psr.c b/tests/i915/kms_psr.c
> index 270d31504..c65b3c806 100644
> --- a/tests/i915/kms_psr.c
> +++ b/tests/i915/kms_psr.c
> @@ -441,11 +441,6 @@ static void test_setup(data_t *data)
>   	igt_require_f(data->mode,
>   		      "No available mode found on %s\n",
>   		      data->output->name);
> -
> -	if (data->op_psr_mode == PSR_MODE_2)
> -		igt_require_f(intel_display_ver(intel_get_drm_devid(data->drm_fd)) < 13,
> -			      "Intentionally not testing this on Display 13+, Kernel change required to enable testing\n");
> -
>   	if (data->op_psr_mode == PSR_MODE_2)
>   		igt_require(data->supports_psr2);
>   
> 
