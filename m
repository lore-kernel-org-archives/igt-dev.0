Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8870F10F22F
 for <igt-dev@lists.freedesktop.org>; Mon,  9 May 2022 16:30:43 +0000 (UTC)
Message-ID: <68ecb2ec-d5c3-f079-92b2-819d7e8f9096@quicinc.com>
Date: Mon, 9 May 2022 09:30:41 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Petri Latvala <petri.latvala@intel.com>
References: <20220506181432.165-1-quic_jesszhan@quicinc.com>
 <20220506181432.165-3-quic_jesszhan@quicinc.com>
 <Ynjad7oekC6FiUe8@platvala-desk.ger.corp.intel.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <Ynjad7oekC6FiUe8@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v1 2/3] tests/kms_universal_plane: Use
 igt_get_assigned_primary to get the primary plane
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, quic_aravindh@quicinc.com,
 robdclark@chromium.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 5/9/2022 2:10 AM, Petri Latvala wrote:
> On Fri, May 06, 2022 at 11:14:31AM -0700, Jessica Zhang wrote:
>> Currently, pageflip_test_pipe will use igt_output_get_plane_type to get
>> the primary plane of the pipe and assumes that the primary plane marked
>> by the driver will also be used by drmModePageFlip to perform the page flip.
>>
>> This is not necessarily true in cases where there are multiple possible
>> primary planes.
>>
>> To fix this, let's use igt_get_assigned_primary to get the primary plane
>> instead.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   tests/kms_universal_plane.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
>> index 3cb6d704a6ef..7bd2c667b552 100644
>> --- a/tests/kms_universal_plane.c
>> +++ b/tests/kms_universal_plane.c
>> @@ -483,7 +483,7 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>>   
>>   	pageflip_test_init(&test, output, pipe);
>>   
>> -	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> +	primary = igt_get_assigned_primary(output, &data->display.pipes[pipe]);
> 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7059/shard-glk6/igt@kms_rotation_crc@primary-rotation-270.html
> 
> The setcrtc call is getting ENOSPC there. Doing that unconditionally
> is a no-go, and needs to be handled somehow cleanly.
> 
> Check in igt_get_assigned_primary that there's multiple primary
> planes? Check that in init and store that info in igt_output_t or
> igt_pipe_t? Check for msm device specifically (I don't like this, but
> it's the option if all else is unclean)?

I see... The best option might be to check during init then storing it 
in igt_pipe_t.

Thanks,

Jessica Zhang

> 
> 
> -- 
> Petri Latvala
