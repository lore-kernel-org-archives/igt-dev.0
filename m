Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D590D89971
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jan 2020 10:45:25 +0000 (UTC)
References: <20200103081107.28144-1-ramalingam.c@intel.com>
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Message-ID: <3d6719b6-22eb-ad14-02e6-879dca7cb082@intel.com>
Date: Fri, 3 Jan 2020 16:15:23 +0530
MIME-Version: 1.0
In-Reply-To: <20200103081107.28144-1-ramalingam.c@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] kms_content_protection: add check for
 DPMS off state
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
To: Ramalingam C <ramalingam.c@intel.com>, igt-dev <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 1/3/2020 1:41 PM, Ramalingam C wrote:
> During DPMS off HDCP state should be DESIRED.
> Lets add a check for that.
Not related to this patch but DPMS is connector property
and test name is DPMS but sub-test is setting crtc property.
slightly confusing. Leaving up to you to change it.
> 
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> cc: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   tests/kms_content_protection.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index 8b361fdefb2e..eb6cd9ec50b1 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -513,6 +513,11 @@ static void test_content_protection_on_output(igt_output_t *output,
>   						IGT_CRTC_ACTIVE, 0);
>   			igt_display_commit2(display, s);
>   
> +			/* Wait for HDCP to be disabled, before crtc off */
> +			ret = wait_for_prop_value(output, CP_DESIRED,
> +						  KERNEL_DISABLE_TIME_ALLOWED_MSEC);
> +			igt_assert_f(ret, "Content Protection not cleared\n");
> +
>   			igt_pipe_set_prop_value(display, pipe,
>   						IGT_CRTC_ACTIVE, 1);
>   			igt_display_commit2(display, s);
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
