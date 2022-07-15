Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E7B11285C
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Jul 2022 04:36:41 +0000 (UTC)
Message-ID: <ded91e06-3b1a-0319-ed54-dd67fed1bc1d@intel.com>
Date: Fri, 15 Jul 2022 10:06:28 +0530
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220714092858.31543-1-nidhi1.gupta@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20220714092858.31543-1-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/kms_frintbuffer_tracking:
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

On 7/14/2022 2:58 PM, Nidhi Gupta wrote:
> Currently the poll timeout value is 1000ms which is very less for
> simulation, hence increased it to 10000ms.
>
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>

Please fix the typo in subject line. 'frintbuffer -> frontbuffer'

With that,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

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

