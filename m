Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09DA5113B5B
 for <igt-dev@lists.freedesktop.org>; Tue, 17 May 2022 23:01:56 +0000 (UTC)
Message-ID: <28e03df9-c980-ea79-2e2b-915ed55d3aed@quicinc.com>
Date: Tue, 17 May 2022 16:01:52 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Petri Latvala <petri.latvala@intel.com>, Jessica Zhang
 <quic_jesszhan@quicinc.com>
References: <20220513234838.174-1-quic_jesszhan@quicinc.com>
 <YoJr4WezCoTObi4M@platvala-desk.ger.corp.intel.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <YoJr4WezCoTObi4M@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v1] tests/kms_writeback: Add helper
 method to detach pipe from output when test finishes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, quic_aravindh@quicinc.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This has been applied now.

Thanks Jessica and Petri.

Abhinav

On 5/16/2022 8:21 AM, Petri Latvala wrote:
> On Fri, May 13, 2022 at 04:48:38PM -0700, Jessica Zhang wrote:
>> Currently, after a writeback test is run, the writeback connecter doesn't
>> release the pipe for other connecters to use. This can cause the device
>> to crash if another connector tries to use the same pipe (for other IGT
>> tests, for example).
>>
>> In addition, a slight change [1] to DRM's implementation of the rmfb ioctl
>> means that calling igt_remove_fb() alone will not detach the CRTC --
>> instead, an explicit disable will be needed to do that.
>>
>> [1]
>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/drm_framebuffer.c#L997
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> 
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>
> 
>> ---
>>   tests/kms_writeback.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
>> index 21d62faabf6b..b6c815db413c 100644
>> --- a/tests/kms_writeback.c
>> +++ b/tests/kms_writeback.c
>> @@ -139,6 +139,11 @@ static igt_output_t *kms_writeback_get_output(igt_display_t *display)
>>   	return NULL;
>>   }
>>   
>> +static void detach_crtc(igt_display_t *display, igt_output_t *output) {
>> +	igt_output_set_pipe(output, PIPE_NONE);
>> +	igt_display_commit2(display, COMMIT_ATOMIC);
>> +}
>> +
>>   static void check_writeback_fb_id(igt_output_t *output)
>>   {
>>   	uint64_t check_fb_id;
>> @@ -449,6 +454,7 @@ igt_main
>>   	}
>>   
>>   	igt_fixture {
>> +		detach_crtc(&display, output);
>>   		igt_remove_fb(display.drm_fd, &input_fb);
>>   		igt_display_fini(&display);
>>   	}
>> -- 
>> 2.31.0
>>
