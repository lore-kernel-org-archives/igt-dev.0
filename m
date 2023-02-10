Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF1D10EC59
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Feb 2023 04:48:01 +0000 (UTC)
Message-ID: <c9b321df-70e8-05c8-f76d-3d1e44d29647@intel.com>
Date: Fri, 10 Feb 2023 10:17:35 +0530
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230209062322.1562797-1-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230209062322.1562797-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 1/2] tests/kms_atomic_transition: Reduce the
 execution time on simulation
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


On 2/9/2023 11:53 AM, Bhanuprakash Modem wrote:
> Due to the more number of iterations, "modest-transition" tests are
> getting timed out on pre-si CI. Reducing the number of iterations to
> half can save a lot of execution time.
>
> V2: - Separate patch for cleanup
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_atomic_transition.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 6d2ebbbff..e1b74ac2c 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -858,6 +858,9 @@ retry:
>   
>   	iter_max = 1 << j;
>   
> +	if (igt_run_in_simulation() && iter_max > 1)
> +		iter_max = iter_max >> 1;
> +
>   	if (igt_display_try_commit_atomic(&data->display,
>   				DRM_MODE_ATOMIC_TEST_ONLY |
>   				DRM_MODE_ATOMIC_ALLOW_MODESET,
