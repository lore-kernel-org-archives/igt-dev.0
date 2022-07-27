Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E073B9CE7
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Jul 2022 16:34:29 +0000 (UTC)
Message-ID: <bd20eb86-277e-d526-e991-23e4f973d039@quicinc.com>
Date: Wed, 27 Jul 2022 09:34:28 -0700
MIME-Version: 1.0
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, <igt-dev@lists.freedesktop.org>
References: <20220709162305.1958838-1-robdclark@gmail.com>
 <0019fe88-fd9d-31d5-106a-a44121f30dc9@quicinc.com>
In-Reply-To: <0019fe88-fd9d-31d5-106a-a44121f30dc9@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH igt] tests/kms_bw: Skip unsupported modes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 7/26/2022 5:05 PM, Jessica Zhang wrote:
> 
> 
> On 7/9/2022 9:23 AM, Rob Clark wrote:
>> From: Rob Clark <robdclark@chromium.org>
>>
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> 
> Will merge after CI passes:
> 
> Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # Trogdor (sc7180)
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> 
> Thanks,
> 
> Jessica Zhang

Applied, thanks!

Jessica Zhang

> 
>> ---
>>   tests/kms_bw.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
>> index a4553cde..7bb1332e 100644
>> --- a/tests/kms_bw.c
>> +++ b/tests/kms_bw.c
>> @@ -146,6 +146,7 @@ static void run_test_linear_tiling(data_t *data, 
>> int pipe, const drmModeModeInfo
>>       igt_crc_t zero, captured[IGT_MAX_PIPES];
>>       int i = 0, num_pipes = 0;
>>       enum pipe p;
>> +    int ret;
>>       /* Cannot use igt_display_get_n_pipes() due to fused pipes on 
>> i915 where they do
>>        * not give the numver of valid crtcs and always return 
>> IGT_MAX_PIPES */
>> @@ -175,6 +176,12 @@ static void run_test_linear_tiling(data_t *data, 
>> int pipe, const drmModeModeInfo
>>           igt_plane_set_fb(data->primary[i], &buffer[i]);
>>       }
>> +    ret = igt_display_try_commit_atomic(display,
>> +                        DRM_MODE_ATOMIC_ALLOW_MODESET |
>> +                        DRM_MODE_ATOMIC_TEST_ONLY,
>> +                        NULL);
>> +    igt_skip_on_f(ret != 0, "Unsupported mode\n");
>> +
>>       igt_display_commit_atomic(display, 
>> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>>       for (i = 0; i <= pipe; i++) {
>> -- 
>> 2.36.1
>>
