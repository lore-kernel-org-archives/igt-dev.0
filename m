Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42C410E490
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 08:05:06 +0000 (UTC)
Message-ID: <e770ce76-8ffc-affc-5d02-6fc12d24158f@intel.com>
Date: Fri, 3 Nov 2023 13:34:45 +0530
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20231031110424.4127934-1-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20231031110424.4127934-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] tests/intel/kms_pm_lpsp: Fix test constraint
 for bigjoiner
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


On 10/31/2023 4:34 PM, Bhanuprakash Modem wrote:
> If there is no Bigjoiner involved, the test constraint returns
> 'false', which causes the test to be skipped. Fix the test
> constraint logic to handle both bigjoiner & non-bigjoiner cases.
>
> Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/9340
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel/kms_pm_lpsp.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
> index cb3c3e379..a85e4e795 100644
> --- a/tests/intel/kms_pm_lpsp.c
> +++ b/tests/intel/kms_pm_lpsp.c
> @@ -174,9 +174,11 @@ static bool test_constraint(data_t *data)
>   
>   			return true;
>   		}
> +
> +		return false;
>   	}
>   
> -	return false;
> +	return true;
>   }
>   
>   static void test_lpsp(data_t *data)
