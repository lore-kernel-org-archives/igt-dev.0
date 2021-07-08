Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1FC6E8BE
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jul 2021 12:15:49 +0000 (UTC)
References: <20210708100832.799-1-jeevan.b@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
Message-ID: <915fefab-1033-e97f-ee37-3712a914af87@intel.com>
Date: Thu, 8 Jul 2021 17:45:44 +0530
MIME-Version: 1.0
In-Reply-To: <20210708100832.799-1-jeevan.b@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_psr: Skip h/w tracking PSR2
 tests for ADL-P
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 08-Jul-21 3:38 PM, Jeevan B wrote:
> From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> 
> Currently, PSR2 functionality has not been tested on ADL-P.
> Add ADL-P platform specific check to skip PSR2 hw tracking tests.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_psr.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/tests/kms_psr.c b/tests/kms_psr.c
> index a80abf19..cc713e27 100644
> --- a/tests/kms_psr.c
> +++ b/tests/kms_psr.c
> @@ -416,6 +416,11 @@ static void test_setup(data_t *data)
>   	igt_require_f(data->mode,
>   		      "No available mode found on %s\n",
>   		      data->output->name);
> +
> +	if (data->op_psr_mode == PSR_MODE_2)
> +		igt_require_f(intel_display_ver(intel_get_drm_devid(data->drm_fd)) < 13,
> +			      "Intentionally not testing this on Display 13+, Kernel change required to enable testing\n");
> +
>   	if (data->op_psr_mode == PSR_MODE_2)
>   		igt_require(data->supports_psr2);
>   
> 

-- 
~Swati Sharma
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
