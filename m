Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDEA10E10A
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Dec 2023 18:57:43 +0000 (UTC)
Message-ID: <03d8c64e-b5a4-4b8e-81fa-e5b041edd26f@intel.com>
Date: Mon, 18 Dec 2023 10:06:59 +0530
Subject: Re: [igt-dev] [PATCH v2 5/8] tests/kms_vrr: Change the pattern
 displayed in the test
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
To: Sean Paul <sean@poorly.run>, <igt-dev@lists.freedesktop.org>
References: <20231023205910.3556533-1-sean@poorly.run>
 <20231023205910.3556533-6-sean@poorly.run>
 <64e81c86-4676-375b-c8be-d140de1256b0@intel.com>
In-Reply-To: <64e81c86-4676-375b-c8be-d140de1256b0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sean Paul <seanpaul@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 16-11-2023 01:55 pm, Modem, Bhanuprakash wrote:
> 
> On Tue-24-10-2023 02:26 am, Sean Paul wrote:
>> From: Sean Paul <seanpaul@chromium.org>
>>
>> Upgrade the tiny box in the top left corner to some vertical color
>> bars with horizontal grey and white bars at the bottom.
>>
>> Cc: Mark Yacoub <markyacoub@chromium.org>
>> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> Signed-off-by: Sean Paul <seanpaul@chromium.org>
>>
>> Changes in v2 (Bhanu):
>> - Removed hardcoded bar heights
>> - Made number of vertical bars configurable
>> - Fill in the entire screen horizontally
>> ---
>>   tests/kms_vrr.c | 45 +++++++++++++++++++++++++++++++++++++++++----
>>   1 file changed, 41 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
>> index af61c312e..34d75d648 100644
>> --- a/tests/kms_vrr.c
>> +++ b/tests/kms_vrr.c
>> @@ -232,11 +232,31 @@ static void set_vrr_on_pipe(data_t *data, enum 
>> pipe pipe, bool enabled)
>>       igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>   }
>> +static void paint_bar(cairo_t *cr, unsigned int x, unsigned int y,
>> +              unsigned int w, unsigned int h,
>> +              unsigned int bar, unsigned int num_bars,
>> +              float start_r, float start_g, float start_b,
>> +              float end_r, float end_g, float end_b)
>> +{
>> +    float progress = (float)bar / (float)num_bars;
>> +    float color[] = {
>> +        start_r + progress * (end_r - start_r),
>> +        start_g + progress * (end_g - start_g),
>> +        start_b + progress * (end_b - start_b)
>> +    };
>> +    igt_paint_color(cr, x, y, w, h,
>> +            color[0] > 0 ? color[0] : 0.0,
>> +            color[1] > 0 ? color[1] : 0.0,
>> +            color[2] > 0 ? color[2] : 0.0);
>> +}
>> +
>>   /* Prepare the display for testing on the given pipe. */
>>   static void prepare_test(data_t *data, igt_output_t *output, enum 
>> pipe pipe)
>>   {
>> +    static const unsigned int num_bars = 256;
> 
> Why static?
> 
>>       drmModeModeInfo mode;
>>       cairo_t *cr;
>> +    int bar_width, bar_height, bar_remaining, horizontal_bar_height;
>>       /* Reset output */
>>       igt_display_reset(&data->display);
>> @@ -279,11 +299,28 @@ static void prepare_test(data_t *data, 
>> igt_output_t *output, enum pipe pipe)
>>                   DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>>                   0.50, 0.50, 0.50, &data->fb[1]);
>> +    bar_width = mode.hdisplay / num_bars;
>> +    horizontal_bar_height = mode.vdisplay / 8 > +    bar_height = 
>> mode.vdisplay - horizontal_bar_height * 2;
>> +    bar_remaining = mode.hdisplay % bar_width;
>>       cr = igt_get_cairo_ctx(data->drm_fd, &data->fb[0]);
>> -
>> -    igt_paint_color(cr, 0, 0, mode.hdisplay / 10, mode.vdisplay / 10,
>> -            1.00, 0.00, 0.00);
>> -
>> +    for (int j = 0; j < num_bars; ++j) {
>> +        unsigned int width = bar_width;
>> +        if (j == num_bars - 1)
>> +            width += bar_remaining;
>> +
>> +        /* Red->Green->Blue gradient */
>> +        if (j < num_bars / 2)
>> +            paint_bar(cr, j * bar_width, 0, width, bar_height,
>> +                  j, num_bars / 2,
>> +                  1.0, 0.0, 0.0, 0.0, 1.0, 0.0);
>> +        else
>> +            paint_bar(cr, j * bar_width, 0, width, bar_height,
>> +                  j - num_bars / 2, num_bars / 2,
>> +                  0.0, 1.0, 0.0, 0.0, 0.0, 1.0);
>> +    }
> 
> As per the commit message, grey bar is missing here.
> 
> igt_paint_color(cr, 0, bar_height,
>          mode.hdisplay, horizontal_bar_height, 0.5, 0.5, 0.5);

Got it, As we already created a gray framebuffer & painting the patters 
on it, no need to paint the gray bar again.

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

- Bhanu

> 
>> +    igt_paint_color(cr, 0, mode.vdisplay - horizontal_bar_height,
> -------------------------------^
> Should be (bar_height + horizontal_bar_height), right?
> 
> - Bhanu
> 
>> +            mode.hdisplay, horizontal_bar_height, 1.00, 1.00, 1.00);
>>       igt_put_cairo_ctx(cr);
>>       /* Take care of any required modesetting before the test begins. */
