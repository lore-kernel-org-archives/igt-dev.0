Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243E610E180
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Jul 2022 16:08:29 +0000 (UTC)
Message-ID: <47a20867-ea9b-14d0-2af5-79470245017b@quicinc.com>
Date: Wed, 13 Jul 2022 09:08:26 -0700
MIME-Version: 1.0
To: Rob Clark <robdclark@gmail.com>
References: <20220622163915.364-1-quic_jesszhan@quicinc.com>
 <CAF6AEGudF4G7yQHK+jk_jP0nd62JMoLYL+P29GnfLfG4A3ETZg@mail.gmail.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <CAF6AEGudF4G7yQHK+jk_jP0nd62JMoLYL+P29GnfLfG4A3ETZg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_writeback: Detach pipe
 only for valid FB_ID
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 7/12/2022 6:27 PM, Rob Clark wrote:
> On Wed, Jun 22, 2022 at 9:39 AM Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>
>> Currently, the writeback DRM driver will accept a commit on the
>> writeback connector only if a valid FB_ID is presented. When we run
>> the "writeback-invalid-parameters" or "writeback-format-pixels" subtests
>> individually, this will not be true because no successful commit has
>> happened. So there is no need to clean up the pipes in detach_crtc.
>>
>> Only issue a NULL commit if FB_ID is greater than zero. This will make
>> sure that a cleanup happens only when necessary.
>>
>> Changes since V1:
>> - Fix improper brace style for detach_crtc()
>> - Rebase onto tip of master
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> 
> Reviewed-by: Rob Clark <robdclark@gmail.com>

Applied. Thanks!

- Jessica Zhang

> 
>> ---
>>   tests/kms_writeback.c | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
>> index 6efc72df4327..1a623655da49 100644
>> --- a/tests/kms_writeback.c
>> +++ b/tests/kms_writeback.c
>> @@ -139,7 +139,16 @@ static igt_output_t *kms_writeback_get_output(igt_display_t *display)
>>          return NULL;
>>   }
>>
>> -static void detach_crtc(igt_display_t *display, igt_output_t *output) {
>> +static uint64_t get_writeback_fb_id(igt_output_t *output)
>> +{
>> +       return igt_output_get_prop(output, IGT_CONNECTOR_WRITEBACK_FB_ID);
>> +}
>> +
>> +static void detach_crtc(igt_display_t *display, igt_output_t *output)
>> +{
>> +       if (get_writeback_fb_id(output) == 0)
>> +               return;
>> +
>>          igt_output_set_pipe(output, PIPE_NONE);
>>          igt_display_commit2(display, COMMIT_ATOMIC);
>>   }
>> --
>> 2.31.0
>>
