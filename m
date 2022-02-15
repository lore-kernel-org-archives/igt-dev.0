Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0E310E172
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Feb 2022 01:49:45 +0000 (UTC)
Message-ID: <3a33b623-0ef2-a5d5-4b31-d9c82f9b416e@quicinc.com>
Date: Mon, 14 Feb 2022 17:49:40 -0800
MIME-Version: 1.0
Content-Language: en-US
References: <1628134823-27763-1-git-send-email-maitreye@codeaurora.org>
 <1628134823-27763-2-git-send-email-maitreye@codeaurora.org>
 <YRZYejwRAKyXO9XA@platvala-desk.ger.corp.intel.com>
 <4951ee20ab1d8446e08de1c6dc09bd93@codeaurora.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <4951ee20ab1d8446e08de1c6dc09bd93@codeaurora.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/igt_fb: add an API to support
 color square DP CTS pattern
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: quic_khsieh@quicinc.com, swboyd@chromium.org, igt-dev@lists.freedesktop.org, nganji@codeaurora.org, seanpaul@chromium.org, aravindh@codeaurora.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Petri

Thanks for the comments and sorry for the late response.

Once Maitreyee left, this patch got abandoned.

I will take this over and address your comments.

Thanks

Abhinav

On 2/14/2022 5:46 PM, abhinavk@codeaurora.org wrote:
> 
> 
> -------- Original Message --------
> Subject: Re: [PATCH i-g-t 2/2] lib/igt_fb: add an API to support color 
> square DP CTS pattern
> Date: 2021-08-13 04:33
> From: Petri Latvala <petri.latvala@intel.com>
> To: maitreye <maitreye@codeaurora.org>
> Cc: igt-dev@lists.freedesktop.org, robdclark@gmail.com, 
> seanpaul@chromium.org, swboyd@chromium.org, nganji@codeaurora.org, 
> aravindh@codeaurora.org, abhinavk@codeaurora.org, khsieh@codeaurora.org, 
> manasi.d.navare@intel.com
> 
> On Wed, Aug 04, 2021 at 08:40:23PM -0700, maitreye wrote:
>> Add an api to support the CTA range color square video test
>> pattern as explained in section 3.2.5.3 of the DP CTS
>> specification. This pattern is required for supporting
>> the CTA range for RGB formats.
>>
>> Also rename the existing api igt_fill_cts_framebuffer to
>> igt_fill_cts_color_ramp_framebuffer to higlight the
>> pattern type.
>>
>> Signed-off-by: maitreye <maitreye@codeaurora.org>
> 
> Can you use your real name here?
> 
>> ---
>>  lib/igt_fb.c                | 125 
>> +++++++++++++++++++++++++++++++++++++++++++-
>>  lib/igt_fb.h                |   4 +-
>>  tools/intel_dp_compliance.c |   2 +-
>>  tools/msm_dp_compliance.c   |  43 +++++++++++----
>>  4 files changed, 160 insertions(+), 14 deletions(-)
>>
>> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
>> index 583cc9e..3d34457 100644
>> --- a/lib/igt_fb.c
>> +++ b/lib/igt_fb.c
>> @@ -1396,7 +1396,128 @@ void igt_paint_color(cairo_t *cr, int x, int 
>> y, int w, int h,
>>  }
>>
>>  /**
>> - * igt_fill_cts_framebuffer:
>> + *
>> + * igt_fill_cts_color_square_framebuffer:
>> + * @pixmap: handle to mapped buffer
>> + * @video_width: required width for pattern
>> + * @video_height: required height for pattern
>> + * @bitdepth: required bitdepth fot pattern
>> + * @alpha: required alpha for the pattern
>> + *
>> + * This function draws a color square pattern for given width and height
>> + * as per the specifications mentioned in section 3.2.5.3 of DP CTS 
>> spec.
>> + */
>> +int igt_fill_cts_color_square_framebuffer(uint32_t *pixmap, uint32_t 
>> video_width,
>> +        uint32_t video_height, uint32_t bitdepth, int alpha)
>> +{
>> +    uint32_t max_color_val = 0;
>> +    uint32_t min_color_val = 0;
>> +    uint32_t* pmax = &max_color_val;
>> +    uint32_t* pmin = &min_color_val;
> 
> 
> I'm not fully understanding why these pointers are used?
> 
> 
> 
