Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF8D10E75E
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Sep 2023 05:42:32 +0000 (UTC)
Message-ID: <9964a6a1-498e-f2a6-cc50-1ab68071f822@intel.com>
Date: Thu, 7 Sep 2023 11:10:50 +0530
Content-Language: en-US
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230829161759.9315-1-mohammed.thasleem@intel.com>
 <20220421141935.1460-1-mohammed.thasleem@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220421141935.1460-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_atomic_transition: Reduce the
 number of iterations on modeset-transition
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


On Thu-21-04-2022 07:49 pm, Mohammed Thasleem wrote:
> Due to the higher number of iterations, "modeset-transition" tests are
> getting timed out on CI. Reducing the number of iterations can save a
> lot of execution time.
> 
> Instead of having (2 ^ j) iterations, reduce it to (2 * j) where j is
> the number of active pipes.
> 
> v2: Update commit message.
> v3: Update commit message and minor changes.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>   tests/kms_atomic_transition.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index a470eb88c..6c914ec21 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -966,10 +966,7 @@ retry:
>   		}
>   	}
>   
> -	iter_max = 1 << j;
> -
> -	if (igt_run_in_simulation() && iter_max > 1)
> -		iter_max = iter_max >> 1;
> +	iter_max = (j > 0) ? (j << 1) : 1;
>   
>   	if (igt_display_try_commit_atomic(&data->display,
>   				DRM_MODE_ATOMIC_TEST_ONLY |
