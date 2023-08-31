Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A43810E0DC
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 16:50:00 +0000 (UTC)
Message-ID: <998db4f9-0f2a-f4b3-581f-7760ebad19ae@intel.com>
Date: Thu, 31 Aug 2023 22:19:39 +0530
Content-Language: en-US
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230829161759.9315-1-mohammed.thasleem@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230829161759.9315-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_atomic_transition: Reduce the
 execution time on modest-transition
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

Hi Thasleem,

On Tue-29-08-2023 09:47 pm, Thasleem, Mohammed wrote:
> Due to the more number of iterations, "modest-transition" tests are
> getting timed out on CI. Reducing the number of iterations to half
> can save a lot of execution time.
> 
> Signed-off-by: Thasleem, Mohammed <mohammed.thasleem@intel.com>
> ---
>   tests/kms_atomic_transition.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index a470eb88c..690202271 100644
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
> +	iter_max = j << 1;

Looks this logic is not correct & it will not make the iter_max to half.

Please check below table:

j  | 1 << j | j << 1
---------------------
0  |    1   |   0
1  |    2   |   2
2  |    4   |   4
3  |    8   |   6
4  |   16   |   8
5  |   32   |   10

- Bhanu

>   
>   	if (igt_display_try_commit_atomic(&data->display,
>   				DRM_MODE_ATOMIC_TEST_ONLY |
