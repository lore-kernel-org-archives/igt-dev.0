Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3CA2BB40
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Aug 2022 21:31:12 +0000 (UTC)
Message-ID: <bc3ba67f-49e6-f490-ed0c-1f0441061cee@quicinc.com>
Date: Mon, 8 Aug 2022 14:31:10 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, <igt-dev@lists.freedesktop.org>
References: <20220808203909.403-1-quic_jesszhan@quicinc.com>
 <4eeab4a5-f42f-0227-ded9-959578ef8991@quicinc.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <4eeab4a5-f42f-0227-ded9-959578ef8991@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t v1] tests/kms_writeback: Fix build
 warnings
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: quic_aravindh@quicinc.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 8/8/2022 2:09 PM, Abhinav Kumar wrote:
> 
> 
> On 8/8/2022 1:39 PM, Jessica Zhang wrote:
>> Fix the following build warnings for kms_writeback:
>>
>> $ ninja -C build
>> ninja: Entering directory `build'
>> [120/1183] Compiling C object tests/kms_writeback.p/kms_writeback.c.o
>> ../tests/kms_writeback.c: In function ‘__igt_unique____real_main480’:
>> ../tests/kms_writeback.c:532:17: warning: ISO C90 forbids mixed 
>> declarations and code [-Wdeclaration-after-statement]
>>    532 |                 drmModePropertyBlobRes *formats_blob = 
>> get_writeback_formats_blob(output);
>>        |                 ^~~~~~~~~~~~~~~~~~~~~~
>> ../tests/kms_writeback.c:555:17: warning: ISO C90 forbids mixed 
>> declarations and code [-Wdeclaration-after-statement]
>>    555 |                 igt_fb_t invalid_output_fb;
>>        |                 ^~~~~~~~
>> ../tests/kms_writeback.c:571:17: warning: ISO C90 forbids mixed 
>> declarations and code [-Wdeclaration-after-statement]
>>    571 |                 igt_fb_t output_fb;
>>        |                 ^~~~~~~~
>> ../tests/kms_writeback.c:586:17: warning: ISO C90 forbids mixed 
>> declarations and code [-Wdeclaration-after-statement]
>>    86 |                 igt_fb_t output_fb;
>>       |                 ^~~~~~~~
>>
>> Reported-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> 
> LGTM,

Merged and applied. Thanks!

- Jessica Zhang

> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
>> ---
>>   tests/kms_writeback.c | 18 ++++++++++++------
>>   1 file changed, 12 insertions(+), 6 deletions(-)
>>
>> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
>> index 82c244ffaa01..9d13458577b6 100644
>> --- a/tests/kms_writeback.c
>> +++ b/tests/kms_writeback.c
>> @@ -528,11 +528,14 @@ igt_main_args("b:c:dl", long_options, help_str, 
>> opt_handler, NULL)
>>        */
>>       igt_describe("Check the writeback format");
>>       igt_subtest("writeback-pixel-formats") {
>> -        igt_skip_on(data.dump_check || data.list_modes);
>> -        drmModePropertyBlobRes *formats_blob = 
>> get_writeback_formats_blob(output);
>> -        const char *valid_chars = "01234568 ABCGNRUVXY";
>>           unsigned int i;
>>           char *c;
>> +        drmModePropertyBlobRes *formats_blob;
>> +        const char *valid_chars;
>> +
>> +        igt_skip_on(data.dump_check || data.list_modes);
>> +        formats_blob = get_writeback_formats_blob(output);
>> +        valid_chars = "01234568 ABCGNRUVXY";
>>           /*
>>            * We don't have a comprehensive list of formats, so just check
>> @@ -551,8 +554,9 @@ igt_main_args("b:c:dl", long_options, help_str, 
>> opt_handler, NULL)
>>                "(output framebuffer and fence); this test goes through"
>>                "the combination of possible bad options");
>>       igt_subtest("writeback-invalid-parameters") {
>> -        igt_skip_on(data.dump_check || data.list_modes);
>>           igt_fb_t invalid_output_fb;
>> +
>> +        igt_skip_on(data.dump_check || data.list_modes);
>>           fb_id = igt_create_fb(display.drm_fd, mode.hdisplay / 2,
>>                         mode.vdisplay / 2,
>>                         DRM_FORMAT_XRGB8888,
>> @@ -567,8 +571,9 @@ igt_main_args("b:c:dl", long_options, help_str, 
>> opt_handler, NULL)
>>       igt_describe("Validate WRITEBACK_FB_ID with valid and invalid 
>> options");
>>       igt_subtest("writeback-fb-id") {
>> -        igt_skip_on(data.dump_check || data.list_modes);
>>           igt_fb_t output_fb;
>> +
>> +        igt_skip_on(data.dump_check || data.list_modes);
>>           fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, 
>> mode.vdisplay,
>>                         DRM_FORMAT_XRGB8888,
>>                         DRM_FORMAT_MOD_LINEAR,
>> @@ -582,8 +587,9 @@ igt_main_args("b:c:dl", long_options, help_str, 
>> opt_handler, NULL)
>>       igt_describe("Check writeback output with CRC validation");
>>       igt_subtest("writeback-check-output") {
>> -        igt_skip_on(data.dump_check || data.list_modes);
>>           igt_fb_t output_fb;
>> +
>> +        igt_skip_on(data.dump_check || data.list_modes);
>>           fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, 
>> mode.vdisplay,
>>                         DRM_FORMAT_XRGB8888,
>>                         igt_fb_mod_to_tiling(0),
