Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC5C610EBAC
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Sep 2022 18:22:18 +0000 (UTC)
Message-ID: <a326de42-679e-c63f-827a-87ad62e2fd55@quicinc.com>
Date: Thu, 8 Sep 2022 11:03:07 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220908084845.4102-1-nidhi1.gupta@intel.com>
 <20220908084845.4102-3-nidhi1.gupta@intel.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20220908084845.4102-3-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH 2/2] tests/kms_writeback: Test cleanup
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

Hi Nidhi,

On 9/8/2022 1:48 AM, Nidhi Gupta wrote:
> Sanitize the system state before starting the subtest.
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/kms_writeback.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index 2c5421ce..79a5760f 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -186,6 +186,7 @@ static int do_writeback_test(igt_output_t *output, uint32_t fb_id,
>   {
>   	int ret;
>   	igt_display_t *display = output->display;
> +	igt_display_reset(display);

I might not have communicated this clearly in the v1 comments, but 
igt_display_reset() will undo all the setup done in the first 
igt_fixture [1] and disable the CRTCs. Furthermore, it would cause the 
commit in do_writeback_test() [2] to fail, since the CRTC would be 
disabled. If you want to call igt_display_reset(), you'll have to re-do 
the setup within that fixture.

Thanks,

Jessica Zhang

[1] 
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_writeback.c#L491

[2] 
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_writeback.c#L198

>   	struct kmstest_connector_config *config = &output->config;
>   
>   	igt_output_set_prop_value(output, IGT_CONNECTOR_CRTC_ID, config->crtc->crtc_id);
> -- 
> 2.36.0
> 
