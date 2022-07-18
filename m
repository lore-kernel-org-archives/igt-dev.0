Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B59AE767
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Jul 2022 09:32:14 +0000 (UTC)
Message-ID: <ed42fcd5-be8c-574c-1b88-bb8429da2791@intel.com>
Date: Mon, 18 Jul 2022 15:01:54 +0530
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220718092329.13975-1-nidhi1.gupta@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220718092329.13975-1-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3] tests/i915/kms_frontbuffer_tracking:
 Increase the poll timeout for simulation platform
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

On Mon-18-07-2022 02:53 pm, Nidhi Gupta wrote:
> Currently the poll timeout value is 1000ms which is very less for
> simulation, hence increased it to 10000ms.
> 
> Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/6435

It seems, you tagged a wrong issue.

- Bhanu

> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/i915/kms_frontbuffer_tracking.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
> index 814ddb46..248ff36b 100644
> --- a/tests/i915/kms_frontbuffer_tracking.c
> +++ b/tests/i915/kms_frontbuffer_tracking.c
> @@ -36,6 +36,8 @@
>   #include "igt_sysfs.h"
>   #include "igt_psr.h"
>   
> +#define TIME SLOW_QUICK(1000, 10000)
> +
>   IGT_TEST_DESCRIPTION("Test the Kernel's frontbuffer tracking mechanism and "
>   		     "its related features: FBC, PSR and DRRS");
>   
> @@ -2306,7 +2308,7 @@ static void wait_flip_event(void)
>   	pfd.events = POLLIN;
>   	pfd.revents = 0;
>   
> -	rc = poll(&pfd, 1, 1000);
> +	rc = poll(&pfd, 1, TIME);
>   	switch (rc) {
>   	case 0:
>   		igt_assert_f(false, "Poll timeout\n");
