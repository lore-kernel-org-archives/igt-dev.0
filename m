Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4056510EBB4
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Jul 2022 01:40:31 +0000 (UTC)
Message-ID: <d4ad3e76-c11e-1b11-17c1-a647f3562f4a@quicinc.com>
Date: Tue, 19 Jul 2022 18:14:11 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Mark Yacoub <markyacoub@chromium.org>
References: <20220718221541.144-1-quic_jesszhan@quicinc.com>
 <CAJUqKUoST0Ov9zcxdW0J7=RKPifqO7XbxPMG9pFg9DQ9iNSTJA@mail.gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <CAJUqKUoST0Ov9zcxdW0J7=RKPifqO7XbxPMG9pFg9DQ9iNSTJA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v1] tests/kms_cursor_legacy: Add check
 for overlay planes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, quic_aravindh@quicinc.com,
 petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 7/19/2022 7:10 AM, Mark Yacoub wrote:
> On Mon, Jul 18, 2022 at 6:16 PM Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>
>> For the dynamic subtests atomic-transitions and
>> atomic-transitions-varying-size, check if the pipe has an overlay plane
>> before forking the process.
>>
>> This will avoid the test trying to skip within a forked process and
>> throwing a SIGABRT.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Reviewed-by: Mark Yacoub <markyacoub@chromium.org>

Applied with braces added to the conditional. Thanks!

- Jessica Zhang

>> ---
>>   tests/kms_cursor_legacy.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
>> index fc4a291d85b6..06751bac4f40 100644
>> --- a/tests/kms_cursor_legacy.c
>> +++ b/tests/kms_cursor_legacy.c
>> @@ -438,6 +438,11 @@ static void flip(igt_display_t *display,
>>          if (mode >= flip_test_atomic)
>>                  igt_require(display->is_atomic);
>>
>> +       if (mode == flip_test_atomic_transitions ||
>> +               mode == flip_test_atomic_transitions_varying_size)
>> +               igt_require(igt_pipe_get_plane_type(&display->pipes[flip_pipe],
>> +                                       DRM_PLANE_TYPE_OVERLAY));
>> +
> nit: because it's spanning multiple lines, i'd prefer putting the
> if-statement in { }
> otherwise it looks reasonable to me.
>>          igt_require((output = set_fb_on_crtc(display, flip_pipe, &fb_info)));
>>          if (flip_pipe != cursor_pipe) {
>>                  igt_require((output2 = set_fb_on_crtc(display, cursor_pipe, &fb_info2)));
>> --
>> 2.31.0
>>
