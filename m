Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E170D10E080
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Aug 2022 18:54:44 +0000 (UTC)
Message-ID: <bdcdae01-f001-e4b8-0bec-70046d99b794@quicinc.com>
Date: Fri, 26 Aug 2022 11:49:12 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220825210611.19636-1-nidhi1.gupta@intel.com>
 <20220825210611.19636-3-nidhi1.gupta@intel.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20220825210611.19636-3-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH 2/2] tests/kms_writeback: Test Cleanup
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

On 8/25/2022 2:06 PM, Nidhi Gupta wrote:
> Sanitize the system state before starting the subtest.
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/kms_writeback.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index 2508b1e1..0c6c64b3 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -169,6 +169,7 @@ static void detach_crtc(igt_display_t *display, igt_output_t *output)
>   	if (get_writeback_fb_id(output) == 0)
>   		return;
>   
> +	igt_display_fini(&display);

igt_display_fini() frees the memory for various members of the 
igt_display_t struct [1]. Since there's already a call to 
igt_display_fini() in the same fixture that detach_crtc() is called [2], 
adding an extra call here will cause a double free.

[1] 
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/lib/igt_kms.c#L2752

[2] 
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_writeback.c#L607

>   	igt_output_set_pipe(output, PIPE_NONE);
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   }
> @@ -580,6 +581,9 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
>   		     "the combination of possible bad options");
>   	igt_subtest_with_dynamic("writeback-invalid-parameters") {
>   		igt_fb_t invalid_output_fb;
> +		igt_display_reset(&display);
> +		igt_display_commit(&display);

I have a doubt about this:

There's a lot of set up going on in the initial igt_fixture here [3], 
specifically within kms_writeback_get_output() [4], where the output 
pipe is set.

If you just reset the display then do a commit, the output->pending pipe 
will be set to NONE within igt_output_reset() [5]. This will cause the 
commit to detach the CRTC (in a similar manner to what detach_crtc() 
does [6]).

If you don't redo the setup from the initial igt_fixture after resetting 
the display, the commits within do_writeback_test() will fail since 
there won't be a CRTC attached to the connector.

Thanks,

Jessica Zhang

[3] 
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_writeback.c#L491

[4] 
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_writeback.c#L108

[5] 
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/lib/igt_kms.c#L2180

[6] 
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_writeback.c#L167

> +
>   
>   		igt_skip_on(data.dump_check || data.list_modes);
>   		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay / 2,
> @@ -597,6 +601,8 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
>   	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid options");
>   	igt_subtest_with_dynamic("writeback-fb-id") {
>   		igt_fb_t output_fb;
> +		igt_display_reset(&display);
> +		igt_display_commit(&display);
>   
>   		igt_skip_on(data.dump_check || data.list_modes);
>   		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
> @@ -613,6 +619,8 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
>   	igt_describe("Check writeback output with CRC validation");
>   	igt_subtest_with_dynamic("writeback-check-output") {
>   		igt_fb_t output_fb;
> +		igt_display_reset(&display);
> +		igt_display_commit(&display);
>   
>   		igt_skip_on(data.dump_check || data.list_modes);
>   		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
> -- 
> 2.36.0
> 
