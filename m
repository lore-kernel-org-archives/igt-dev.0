Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5786A6E01C
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Feb 2019 14:21:52 +0000 (UTC)
From: "Sharma, Swati2" <swati2.sharma@intel.com>
References: <20190201111544.7920-1-maarten.lankhorst@linux.intel.com>
 <20190201111544.7920-3-maarten.lankhorst@linux.intel.com>
 <8d6ab2f0-afbb-6b74-9cf5-877576974320@intel.com>
 <caf94464-aae0-7f15-4705-7e9511acc514@linux.intel.com>
 <6dc3d71e-b946-0e6c-60f1-b14b6147a618@intel.com>
Message-ID: <4f39c744-a4d8-68ee-39b3-56a60bfd75bf@intel.com>
Date: Wed, 6 Feb 2019 19:51:48 +0530
MIME-Version: 1.0
In-Reply-To: <6dc3d71e-b946-0e6c-60f1-b14b6147a618@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] lib/igt_fb: Add support for Y21x
 formats as well.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0145553470=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0145553470==
Content-Type: multipart/alternative;
 boundary="------------23EDC4D64CAC209A6C98D5CD"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------23EDC4D64CAC209A6C98D5CD
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

On 06-Feb-19 12:17 PM, Sharma, Swati2 wrote:

>
> On 05-Feb-19 8:01 PM, Maarten Lankhorst wrote:
>> Op 05-02-2019 om 14:14 schreef Sharma, Swati2:
>>> On 01-Feb-19 4:45 PM, Maarten Lankhorst wrote:
>>>> Those formats are packed like YUYV, but only 16 bits per component.
>>>>
>>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>> ---
>>>>    include/drm-uapi/drm_fourcc.h |   6 +-
>>>>    lib/igt_color_encoding.c      |   3 +
>>>>    lib/igt_fb.c                  | 146 
>>>> ++++++++++++++++++++++++++++++++++
>>>>    3 files changed, 154 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/include/drm-uapi/drm_fourcc.h 
>>>> b/include/drm-uapi/drm_fourcc.h
>>>> index c9a5e5787031..8f1b5f832a09 100644
>>>> --- a/include/drm-uapi/drm_fourcc.h
>>>> +++ b/include/drm-uapi/drm_fourcc.h
>>>> @@ -149,10 +149,14 @@ extern "C" {
>>>>    #define DRM_FORMAT_YVYU        fourcc_code('Y', 'V', 'Y', 'U') 
>>>> /* [31:0] Cb0:Y1:Cr0:Y0 8:8:8:8 little endian */
>>>>    #define DRM_FORMAT_UYVY        fourcc_code('U', 'Y', 'V', 'Y') 
>>>> /* [31:0] Y1:Cr0:Y0:Cb0 8:8:8:8 little endian */
>>>>    #define DRM_FORMAT_VYUY        fourcc_code('V', 'Y', 'U', 'Y') 
>>>> /* [31:0] Y1:Cb0:Y0:Cr0 8:8:8:8 little endian */
>>>> -
>>>>    #define DRM_FORMAT_AYUV        fourcc_code('A', 'Y', 'U', 'V') 
>>>> /* [31:0] A:Y:Cb:Cr 8:8:8:8 little endian */
>>>>    #define DRM_FORMAT_XYUV8888    fourcc_code('X', 'Y', 'U', 'V') 
>>>> /* [31:0] X:Y:Cb:Cr 8:8:8:8 little endian */
>>>>    +/* Like YUYV, but 16 bpc, lowest bits unused like in 
>>>> DRM_FORMAT_P01X */
>>>> +#define DRM_FORMAT_Y210        fourcc_code('Y', '2', '1', '0')
>>>> +#define DRM_FORMAT_Y212        fourcc_code('Y', '2', '1', '2')
>>>> +#define DRM_FORMAT_Y216        fourcc_code('Y', '2', '1', '6')
>>>> +
>>>>    /*
>>>>     * packed YCbCr420 2x2 tiled formats
>>>>     * first 64 bits will contain Y,Cb,Cr components for a 2x2 tile
>>>> diff --git a/lib/igt_color_encoding.c b/lib/igt_color_encoding.c
>>>> index b7a12a1e07f7..6f82fcec62e4 100644
>>>> --- a/lib/igt_color_encoding.c
>>>> +++ b/lib/igt_color_encoding.c
>>>> @@ -144,6 +144,9 @@ static const struct color_encoding_format {
>>>>        { DRM_FORMAT_P010, 65472.f, 4096.f, 60160.f, 4096.f, 
>>>> 32768.f, 61440.f },
>>>>        { DRM_FORMAT_P012, 65520.f, 4096.f, 60160.f, 4096.f, 
>>>> 32768.f, 61440.f },
>>>>        { DRM_FORMAT_P016, 65535.f, 4096.f, 60160.f, 4096.f, 
>>>> 32768.f, 61440.f },
>>>> +    { DRM_FORMAT_Y210, 65472.f, 4096.f, 60160.f, 4096.f, 32768.f, 
>>>> 61440.f },
>>>> +    { DRM_FORMAT_Y212, 65520.f, 4096.f, 60160.f, 4096.f, 32768.f, 
>>>> 61440.f },
>>>> +    { DRM_FORMAT_Y216, 65535.f, 4096.f, 60160.f, 4096.f, 32768.f, 
>>>> 61440.f },
>>>>    };
>>>>      static const struct color_encoding_format 
>>>> *lookup_fourcc(uint32_t fourcc)
>>>> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
>>>> index 8bd0420fc2e4..c14cc10d1b73 100644
>>>> --- a/lib/igt_fb.c
>>>> +++ b/lib/igt_fb.c
>>>> @@ -151,6 +151,18 @@ static const struct format_desc_struct {
>>>>          .cairo_id = CAIRO_FORMAT_RGB24,
>>>>          .num_planes = 1, .plane_bpp = { 16, },
>>>>        },
>>>> +    { .name = "Y210", .depth = -1, .drm_id = DRM_FORMAT_Y210,
>>>> +      .cairo_id = CAIRO_FORMAT_RGB96F,
>>>> +      .num_planes = 1, .plane_bpp = { 32, },
>>>> +    },
>>>> +    { .name = "Y212", .depth = -1, .drm_id = DRM_FORMAT_Y212,
>>>> +      .cairo_id = CAIRO_FORMAT_RGB96F,
>>>> +      .num_planes = 1, .plane_bpp = { 32, },
>>>> +    },
>>>> +    { .name = "Y216", .depth = -1, .drm_id = DRM_FORMAT_Y216,
>>>> +      .cairo_id = CAIRO_FORMAT_RGB96F,
>>>> +      .num_planes = 1, .plane_bpp = { 32, },
>>>> +    },
>>>>        { .name = "P010", .depth = -1, .drm_id = DRM_FORMAT_P010,
>>>>          .cairo_id = CAIRO_FORMAT_RGB96F,
>>>>          .num_planes = 2, .plane_bpp = { 16, 32 },
>>>> @@ -553,6 +565,13 @@ static int create_bo_for_fb(struct igt_fb *fb)
>>>>                        fb->offsets[1] / sizeof(wchar_t));
>>>>                    wmemset(ptr + fb->offsets[1], 0x80008000,
>>>>                        DIV_ROUND_UP(fb->height,2) * fb->strides[1] 
>>>> / sizeof(wchar_t));
>>>> +            case DRM_FORMAT_Y210:
>>>> +            case DRM_FORMAT_Y212:
>>>> +            case DRM_FORMAT_Y216:
>>>> +                wmemset(ptr + fb->offsets[0],
>>>> +                    full_range ? 0x80000000 : 0x80001000,
>>>> +                    fb->strides[0] * fb->plane_height[0] / 
>>>> sizeof(wchar_t));
>>>> +                break;
>>>>                }
>>>>                gem_munmap(ptr, fb->size);
>>> Hi Maarten,
>>>
>>> While testing Y210 pixel format, IGT is failing with debug message 
>>> showing igt_create_fb() failure
>>>
>>> (kms_plane:3974) igt_fb-CRITICAL: Test assertion failure function 
>>> igt_create_fb_with_bo_size, file ../lib/igt_fb.c:1051:
>>> (kms_plane:3974) igt_fb-CRITICAL: Failed assertion: 
>>> (__kms_addfb(fb->fd, fb->gem_handle, fb->width, fb->height, 
>>> fb->drm_format, fb->tiling, fb->strides, fb->offsets, 
>>> fb->num_planes, flags, &fb->fb_id)) == 0
>>> (kms_plane:3974) igt_fb-CRITICAL: Last errno: 22, Invalid argument
>>>
>>> dmesg showing bad pitch 12800 for Y210 pixel format
>>>
>>> [  634.066608] [drm:drm_internal_framebuffer_create] bad pitch 12800 
>>> for plane 0
>>> [  634.104444] [IGT] kms_plane: exiting, ret=99
>>>
>>> Can you please confirm whether changes needs to be done from igt or 
>>> some issue with Y2xx driver patches?
>>>
>>>> @@ -2139,6 +2158,120 @@ static void convert_float_to_p01X(struct 
>>>> fb_convert *cvt)
>>>>        }
>>>>    }
>>>>    +
>>>> +static void convert_Y21X_to_float(struct fb_convert *cvt)
>>>> +{
>>>> +    int i, j;
>>>> +    const uint16_t *yuyv;
>>>> +    uint16_t *buf;
>>>> +    float *ptr = cvt->dst.ptr;
>>>> +    unsigned int float_stride = cvt->dst.fb->strides[0] / 
>>>> sizeof(*ptr);
>>>> +    unsigned int yuyv_stride = cvt->src.fb->strides[0] / 
>>>> sizeof(*yuyv);
>>>> +    struct igt_mat4 m = 
>>>> igt_ycbcr_to_rgb_matrix(cvt->src.fb->drm_format,
>>>> +                            cvt->dst.fb->drm_format,
>>>> + cvt->src.fb->color_encoding,
>>>> + cvt->src.fb->color_range);
>>>> +
>>>> +    igt_assert((cvt->src.fb->drm_format == DRM_FORMAT_Y210 ||
>>>> +            cvt->src.fb->drm_format == DRM_FORMAT_Y212 ||
>>>> +            cvt->src.fb->drm_format == DRM_FORMAT_Y216) &&
>>>> +           cvt->dst.fb->drm_format == IGT_FORMAT_FLOAT);
>>>> +
>>>> +    yuyv = buf = convert_src_get(cvt);
>>>> +
>>>> +    for (i = 0; i < cvt->dst.fb->height; i++) {
>>>> +        for (j = 0; j < cvt->dst.fb->width / 2; j++) {
>>>> +            /* Convert 2x1 pixel blocks */
>>>> +            struct igt_vec4 yuv[2];
>>>> +            struct igt_vec4 rgb[2];
>>>> +
>>>> +            yuv[0].d[0] = yuyv[j * 4 + 0];
>>>> +            yuv[1].d[0] = yuyv[j * 4 + 2];
>>>> +            yuv[0].d[1] = yuv[1].d[1] = yuyv[j * 4 + 1];
>>>> +            yuv[0].d[2] = yuv[1].d[2] = yuyv[j * 4 + 3];
>>>> +            yuv[0].d[3] = yuv[1].d[3] = 1.0f;
>>>> +
>>>> +            rgb[0] = igt_matrix_transform(&m, &yuv[0]);
>>>> +            rgb[1] = igt_matrix_transform(&m, &yuv[1]);
>>>> +
>>>> +            write_rgbf(&ptr[j * 6 + 0], &rgb[0]);
>>>> +            write_rgbf(&ptr[j * 6 + 3], &rgb[1]);
>>>> +        }
>>>> +
>>>> +        if (cvt->dst.fb->width & 1) {
>>>> +            struct igt_vec4 yuv;
>>>> +            struct igt_vec4 rgb;
>>>> +
>>>> +            yuv.d[0] = yuyv[j * 4 + 0];
>>>> +            yuv.d[1] = yuyv[j * 4 + 1];
>>>> +            yuv.d[2] = yuyv[j * 4 + 3];
>>>> +            yuv.d[3] = 1.0f;
>>>> +
>>>> +            rgb = igt_matrix_transform(&m, &yuv);
>>>> +
>>>> +            write_rgbf(&ptr[j * 6 + 0], &rgb);
>>>> +        }
>>>> +
>>>> +        ptr += float_stride;
>>>> +        yuyv += yuyv_stride;
>>>> +    }
>>>> +
>>>> +    convert_src_put(cvt, buf);
>>>> +}
>>>> +
>>>> +static void convert_float_to_Y21X(struct fb_convert *cvt)
>>>> +{
>>>> +    int i, j;
>>>> +    uint16_t *yuyv = cvt->dst.ptr;
>>>> +    const float *ptr = cvt->src.ptr;
>>>> +    unsigned float_stride = cvt->src.fb->strides[0] / sizeof(*ptr);
>>>> +    unsigned yuyv_stride = cvt->dst.fb->strides[0] / sizeof(*yuyv);
>>>> +    struct igt_mat4 m = 
>>>> igt_rgb_to_ycbcr_matrix(cvt->src.fb->drm_format,
>>>> +                            cvt->dst.fb->drm_format,
>>>> + cvt->dst.fb->color_encoding,
>>>> + cvt->dst.fb->color_range);
>>>> +
>>>> +    igt_assert(cvt->src.fb->drm_format == IGT_FORMAT_FLOAT &&
>>>> +           (cvt->dst.fb->drm_format == DRM_FORMAT_Y210 ||
>>>> +            cvt->dst.fb->drm_format == DRM_FORMAT_Y212 ||
>>>> +            cvt->dst.fb->drm_format == DRM_FORMAT_Y216));
>>>> +
>>>> +    for (i = 0; i < cvt->dst.fb->height; i++) {
>>>> +        for (j = 0; j < cvt->dst.fb->width / 2; j++) {
>>>> +            /* Convert 2x1 pixel blocks */
>>>> +            struct igt_vec4 rgb[2];
>>>> +            struct igt_vec4 yuv[2];
>>>> +
>>>> +            read_rgbf(&rgb[0], &ptr[j * 6 + 0]);
>>>> +            read_rgbf(&rgb[1], &ptr[j * 6 + 3]);
>>>> +
>>>> +            yuv[0] = igt_matrix_transform(&m, &rgb[0]);
>>>> +            yuv[1] = igt_matrix_transform(&m, &rgb[1]);
>>>> +
>>>> +            yuyv[j * 4 + 0] = yuv[0].d[0];
>>>> +            yuyv[j * 4 + 2] = yuv[1].d[0];
>>>> +            yuyv[j * 4 + 1] = (yuv[0].d[1] + yuv[1].d[1]) / 2.0f;
>>>> +            yuyv[j * 4 + 3] = (yuv[0].d[2] + yuv[1].d[2]) / 2.0f;
>>>> +        }
>>>> +
>>>> +        if (cvt->dst.fb->width & 1) {
>>>> +            struct igt_vec4 rgb;
>>>> +            struct igt_vec4 yuv;
>>>> +
>>>> +            read_rgbf(&rgb, &ptr[j * 6 + 0]);
>>>> +
>>>> +            yuv = igt_matrix_transform(&m, &rgb);
>>>> +
>>>> +            yuyv[j * 4 + 0] = yuv.d[0];
>>>> +            yuyv[j * 4 + 1] = yuv.d[1];
>>>> +            yuyv[j * 4 + 3] = yuv.d[2];
>>>> +        }
>>>> +
>>>> +        ptr += float_stride;
>>>> +        yuyv += yuyv_stride;
>>>> +    }
>>>> +}
>>>> +
>>>>    static void convert_pixman(struct fb_convert *cvt)
>>>>    {
>>>>        pixman_format_code_t src_pixman = 
>>>> drm_format_to_pixman(cvt->src.fb->drm_format);
>>>> @@ -2221,6 +2354,11 @@ static void fb_convert(struct fb_convert *cvt)
>>>>            case DRM_FORMAT_P016:
>>>>                convert_p01X_to_float(cvt);
>>>>                return;
>>>> +        case DRM_FORMAT_Y210:
>>>> +        case DRM_FORMAT_Y212:
>>>> +        case DRM_FORMAT_Y216:
>>>> +            convert_Y21X_to_float(cvt);
>>>> +            return;
>>>>            }
>>>>        } else if (cvt->src.fb->drm_format == IGT_FORMAT_FLOAT) {
>>>>            switch (cvt->dst.fb->drm_format) {
>>>> @@ -2229,6 +2367,11 @@ static void fb_convert(struct fb_convert *cvt)
>>>>            case DRM_FORMAT_P016:
>>>>                convert_float_to_p01X(cvt);
>>>>                return;
>>>> +        case DRM_FORMAT_Y210:
>>>> +        case DRM_FORMAT_Y212:
>>>> +        case DRM_FORMAT_Y216:
>>>> +            convert_float_to_Y21X(cvt);
>>>> +            return;
>>>>            }
>>>>        }
>>>>    @@ -2583,6 +2726,9 @@ bool igt_format_is_yuv(uint32_t drm_format)
>>>>        case DRM_FORMAT_P010:
>>>>        case DRM_FORMAT_P012:
>>>>        case DRM_FORMAT_P016:
>>>> +    case DRM_FORMAT_Y210:
>>>> +    case DRM_FORMAT_Y212:
>>>> +    case DRM_FORMAT_Y216:
>>>>        case DRM_FORMAT_YUYV:
>>>>        case DRM_FORMAT_YVYU:
>>>>        case DRM_FORMAT_UYVY:
>> Can I get the full IGT / dmesg logs? I can't see what the fb 
>> dimensions they are.
>
> IGT Logs:
>
> (kms_plane:4960) INFO: Testing format Y210 (0x30313259) on A.0
> (kms_plane:4960) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=3200, 
> height=1800, format=0x30313259, tiling=0x0, size=0)
> (kms_plane:4960) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=2, 
> pitch=12800)
> (kms_plane:4960) ioctl_wrappers-DEBUG: Test requirement passed: 
> igt_has_fb_modifiers(fd)
> (kms_plane:4960) igt_fb-CRITICAL: Test assertion failure function 
> igt_create_fb_with_bo_size, file ../lib/igt_fb.c:1051:
> (kms_plane:4960) igt_fb-CRITICAL: Failed assertion: 
> (__kms_addfb(fb->fd, fb->gem_handle, fb->width, fb->height, 
> fb->drm_format, fb->tiling, fb->strides, fb->offsets, fb->num_planes, 
> flags, &fb->fb_id)) == 0
> (kms_plane:4960) igt_fb-CRITICAL: Last errno: 22, Invalid argument
> (kms_plane:4960) igt_core-INFO: Stack trace:
> (kms_plane:4960) igt_core-INFO:   #0 ../lib/igt_core.c:1474 
> __igt_fail_assert()
> (kms_plane:4960) igt_core-INFO:   #1 ../lib/igt_fb.c:1053 
> igt_create_fb_with_bo_size()
> (kms_plane:4960) igt_core-INFO:   #2 ../lib/igt_fb.c:1078 igt_create_fb()
> (kms_plane:4960) igt_core-INFO:   #3 ../lib/igt_fb.c:1113 
> igt_create_color_fb()
> (kms_plane:4960) igt_core-INFO:   #4 ../tests/kms_plane.c:417 
> test_format_plane_color()
> (kms_plane:4960) igt_core-INFO:   #5 ../tests/kms_plane.c:556 
> test_format_plane()
> (kms_plane:4960) igt_core-INFO:   #6 ../tests/kms_plane.c:587 
> test_pixel_formats()
> (kms_plane:4960) igt_core-INFO:   #7 ../tests/kms_plane.c:602 
> run_tests_for_pipe_plane()
> (kms_plane:4960) igt_core-INFO:   #8 ../tests/kms_plane.c:657 
> __real_main642()
> (kms_plane:4960) igt_core-INFO:   #9 ../tests/kms_plane.c:642 main()
> (kms_plane:4960) igt_core-INFO:   #10 ../csu/libc-start.c:325 
> __libc_start_main()
> (kms_plane:4960) igt_core-INFO:   #11 [_start+0x29]
> (kms_plane:4960) igt_core-INFO:   #12 [<unknown>+0x0]
> ****  END  ****
>
> Dmesg Logs: Attached y210_dmesg_failure.txt
>
Same failure exists for all the Y2xx formats Y210/Y212/Y216.
>>
>> ~Maarten
>>
>>
>> _______________________________________________
>> igt-dev mailing list
>> igt-dev@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/igt-dev
-- 
Thanks and Regards, Swati

--------------23EDC4D64CAC209A6C98D5CD
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>On 06-Feb-19 12:17 PM, Sharma, Swati2 wrote:<br>
    </p>
    <blockquote type="cite"
      cite="mid:6dc3d71e-b946-0e6c-60f1-b14b6147a618@intel.com">
      <br>
      On 05-Feb-19 8:01 PM, Maarten Lankhorst wrote:
      <br>
      <blockquote type="cite">Op 05-02-2019 om 14:14 schreef Sharma,
        Swati2:
        <br>
        <blockquote type="cite">On 01-Feb-19 4:45 PM, Maarten Lankhorst
          wrote:
          <br>
          <blockquote type="cite">Those formats are packed like YUYV,
            but only 16 bits per component.
            <br>
            <br>
            Signed-off-by: Maarten Lankhorst
            <a class="moz-txt-link-rfc2396E" href="mailto:maarten.lankhorst@linux.intel.com">&lt;maarten.lankhorst@linux.intel.com&gt;</a>
            <br>
            ---
            <br>
               include/drm-uapi/drm_fourcc.h |   6 +-
            <br>
               lib/igt_color_encoding.c      |   3 +
            <br>
               lib/igt_fb.c                  | 146
            ++++++++++++++++++++++++++++++++++
            <br>
               3 files changed, 154 insertions(+), 1 deletion(-)
            <br>
            <br>
            diff --git a/include/drm-uapi/drm_fourcc.h
            b/include/drm-uapi/drm_fourcc.h
            <br>
            index c9a5e5787031..8f1b5f832a09 100644
            <br>
            --- a/include/drm-uapi/drm_fourcc.h
            <br>
            +++ b/include/drm-uapi/drm_fourcc.h
            <br>
            @@ -149,10 +149,14 @@ extern "C" {
            <br>
               #define DRM_FORMAT_YVYU        fourcc_code('Y', 'V', 'Y',
            'U') /* [31:0] Cb0:Y1:Cr0:Y0 8:8:8:8 little endian */
            <br>
               #define DRM_FORMAT_UYVY        fourcc_code('U', 'Y', 'V',
            'Y') /* [31:0] Y1:Cr0:Y0:Cb0 8:8:8:8 little endian */
            <br>
               #define DRM_FORMAT_VYUY        fourcc_code('V', 'Y', 'U',
            'Y') /* [31:0] Y1:Cb0:Y0:Cr0 8:8:8:8 little endian */
            <br>
            -
            <br>
               #define DRM_FORMAT_AYUV        fourcc_code('A', 'Y', 'U',
            'V') /* [31:0] A:Y:Cb:Cr 8:8:8:8 little endian */
            <br>
               #define DRM_FORMAT_XYUV8888    fourcc_code('X', 'Y', 'U',
            'V') /* [31:0] X:Y:Cb:Cr 8:8:8:8 little endian */
            <br>
               +/* Like YUYV, but 16 bpc, lowest bits unused like in
            DRM_FORMAT_P01X */
            <br>
            +#define DRM_FORMAT_Y210        fourcc_code('Y', '2', '1',
            '0')
            <br>
            +#define DRM_FORMAT_Y212        fourcc_code('Y', '2', '1',
            '2')
            <br>
            +#define DRM_FORMAT_Y216        fourcc_code('Y', '2', '1',
            '6')
            <br>
            +
            <br>
               /*
            <br>
                * packed YCbCr420 2x2 tiled formats
            <br>
                * first 64 bits will contain Y,Cb,Cr components for a
            2x2 tile
            <br>
            diff --git a/lib/igt_color_encoding.c
            b/lib/igt_color_encoding.c
            <br>
            index b7a12a1e07f7..6f82fcec62e4 100644
            <br>
            --- a/lib/igt_color_encoding.c
            <br>
            +++ b/lib/igt_color_encoding.c
            <br>
            @@ -144,6 +144,9 @@ static const struct
            color_encoding_format {
            <br>
                   { DRM_FORMAT_P010, 65472.f, 4096.f, 60160.f, 4096.f,
            32768.f, 61440.f },
            <br>
                   { DRM_FORMAT_P012, 65520.f, 4096.f, 60160.f, 4096.f,
            32768.f, 61440.f },
            <br>
                   { DRM_FORMAT_P016, 65535.f, 4096.f, 60160.f, 4096.f,
            32768.f, 61440.f },
            <br>
            +    { DRM_FORMAT_Y210, 65472.f, 4096.f, 60160.f, 4096.f,
            32768.f, 61440.f },
            <br>
            +    { DRM_FORMAT_Y212, 65520.f, 4096.f, 60160.f, 4096.f,
            32768.f, 61440.f },
            <br>
            +    { DRM_FORMAT_Y216, 65535.f, 4096.f, 60160.f, 4096.f,
            32768.f, 61440.f },
            <br>
               };
            <br>
                 static const struct color_encoding_format
            *lookup_fourcc(uint32_t fourcc)
            <br>
            diff --git a/lib/igt_fb.c b/lib/igt_fb.c
            <br>
            index 8bd0420fc2e4..c14cc10d1b73 100644
            <br>
            --- a/lib/igt_fb.c
            <br>
            +++ b/lib/igt_fb.c
            <br>
            @@ -151,6 +151,18 @@ static const struct format_desc_struct
            {
            <br>
                     .cairo_id = CAIRO_FORMAT_RGB24,
            <br>
                     .num_planes = 1, .plane_bpp = { 16, },
            <br>
                   },
            <br>
            +    { .name = "Y210", .depth = -1, .drm_id =
            DRM_FORMAT_Y210,
            <br>
            +      .cairo_id = CAIRO_FORMAT_RGB96F,
            <br>
            +      .num_planes = 1, .plane_bpp = { 32, },
            <br>
            +    },
            <br>
            +    { .name = "Y212", .depth = -1, .drm_id =
            DRM_FORMAT_Y212,
            <br>
            +      .cairo_id = CAIRO_FORMAT_RGB96F,
            <br>
            +      .num_planes = 1, .plane_bpp = { 32, },
            <br>
            +    },
            <br>
            +    { .name = "Y216", .depth = -1, .drm_id =
            DRM_FORMAT_Y216,
            <br>
            +      .cairo_id = CAIRO_FORMAT_RGB96F,
            <br>
            +      .num_planes = 1, .plane_bpp = { 32, },
            <br>
            +    },
            <br>
                   { .name = "P010", .depth = -1, .drm_id =
            DRM_FORMAT_P010,
            <br>
                     .cairo_id = CAIRO_FORMAT_RGB96F,
            <br>
                     .num_planes = 2, .plane_bpp = { 16, 32 },
            <br>
            @@ -553,6 +565,13 @@ static int create_bo_for_fb(struct
            igt_fb *fb)
            <br>
                                   fb-&gt;offsets[1] / sizeof(wchar_t));
            <br>
                               wmemset(ptr + fb-&gt;offsets[1],
            0x80008000,
            <br>
                                   DIV_ROUND_UP(fb-&gt;height,2) *
            fb-&gt;strides[1] / sizeof(wchar_t));
            <br>
            +            case DRM_FORMAT_Y210:
            <br>
            +            case DRM_FORMAT_Y212:
            <br>
            +            case DRM_FORMAT_Y216:
            <br>
            +                wmemset(ptr + fb-&gt;offsets[0],
            <br>
            +                    full_range ? 0x80000000 : 0x80001000,
            <br>
            +                    fb-&gt;strides[0] *
            fb-&gt;plane_height[0] / sizeof(wchar_t));
            <br>
            +                break;
            <br>
                           }
            <br>
                           gem_munmap(ptr, fb-&gt;size);
            <br>
          </blockquote>
          Hi Maarten,
          <br>
          <br>
          While testing Y210 pixel format, IGT is failing with debug
          message showing igt_create_fb() failure
          <br>
          <br>
          (kms_plane:3974) igt_fb-CRITICAL: Test assertion failure
          function igt_create_fb_with_bo_size, file
          ../lib/igt_fb.c:1051:
          <br>
          (kms_plane:3974) igt_fb-CRITICAL: Failed assertion:
          (__kms_addfb(fb-&gt;fd, fb-&gt;gem_handle, fb-&gt;width,
          fb-&gt;height, fb-&gt;drm_format, fb-&gt;tiling,
          fb-&gt;strides, fb-&gt;offsets, fb-&gt;num_planes, flags,
          &amp;fb-&gt;fb_id)) == 0
          <br>
          (kms_plane:3974) igt_fb-CRITICAL: Last errno: 22, Invalid
          argument
          <br>
          <br>
          dmesg showing bad pitch 12800 for Y210 pixel format
          <br>
          <br>
          [  634.066608] [drm:drm_internal_framebuffer_create] bad pitch
          12800 for plane 0
          <br>
          [  634.104444] [IGT] kms_plane: exiting, ret=99
          <br>
          <br>
          Can you please confirm whether changes needs to be done from
          igt or some issue with Y2xx driver patches?
          <br>
          <br>
          <blockquote type="cite">@@ -2139,6 +2158,120 @@ static void
            convert_float_to_p01X(struct fb_convert *cvt)
            <br>
                   }
            <br>
               }
            <br>
               +
            <br>
            +static void convert_Y21X_to_float(struct fb_convert *cvt)
            <br>
            +{
            <br>
            +    int i, j;
            <br>
            +    const uint16_t *yuyv;
            <br>
            +    uint16_t *buf;
            <br>
            +    float *ptr = cvt-&gt;dst.ptr;
            <br>
            +    unsigned int float_stride =
            cvt-&gt;dst.fb-&gt;strides[0] / sizeof(*ptr);
            <br>
            +    unsigned int yuyv_stride =
            cvt-&gt;src.fb-&gt;strides[0] / sizeof(*yuyv);
            <br>
            +    struct igt_mat4 m =
            igt_ycbcr_to_rgb_matrix(cvt-&gt;src.fb-&gt;drm_format,
            <br>
            +                            cvt-&gt;dst.fb-&gt;drm_format,
            <br>
            +                           
            cvt-&gt;src.fb-&gt;color_encoding,
            <br>
            +                           
            cvt-&gt;src.fb-&gt;color_range);
            <br>
            +
            <br>
            +    igt_assert((cvt-&gt;src.fb-&gt;drm_format ==
            DRM_FORMAT_Y210 ||
            <br>
            +            cvt-&gt;src.fb-&gt;drm_format ==
            DRM_FORMAT_Y212 ||
            <br>
            +            cvt-&gt;src.fb-&gt;drm_format ==
            DRM_FORMAT_Y216) &amp;&amp;
            <br>
            +           cvt-&gt;dst.fb-&gt;drm_format ==
            IGT_FORMAT_FLOAT);
            <br>
            +
            <br>
            +    yuyv = buf = convert_src_get(cvt);
            <br>
            +
            <br>
            +    for (i = 0; i &lt; cvt-&gt;dst.fb-&gt;height; i++) {
            <br>
            +        for (j = 0; j &lt; cvt-&gt;dst.fb-&gt;width / 2;
            j++) {
            <br>
            +            /* Convert 2x1 pixel blocks */
            <br>
            +            struct igt_vec4 yuv[2];
            <br>
            +            struct igt_vec4 rgb[2];
            <br>
            +
            <br>
            +            yuv[0].d[0] = yuyv[j * 4 + 0];
            <br>
            +            yuv[1].d[0] = yuyv[j * 4 + 2];
            <br>
            +            yuv[0].d[1] = yuv[1].d[1] = yuyv[j * 4 + 1];
            <br>
            +            yuv[0].d[2] = yuv[1].d[2] = yuyv[j * 4 + 3];
            <br>
            +            yuv[0].d[3] = yuv[1].d[3] = 1.0f;
            <br>
            +
            <br>
            +            rgb[0] = igt_matrix_transform(&amp;m,
            &amp;yuv[0]);
            <br>
            +            rgb[1] = igt_matrix_transform(&amp;m,
            &amp;yuv[1]);
            <br>
            +
            <br>
            +            write_rgbf(&amp;ptr[j * 6 + 0], &amp;rgb[0]);
            <br>
            +            write_rgbf(&amp;ptr[j * 6 + 3], &amp;rgb[1]);
            <br>
            +        }
            <br>
            +
            <br>
            +        if (cvt-&gt;dst.fb-&gt;width &amp; 1) {
            <br>
            +            struct igt_vec4 yuv;
            <br>
            +            struct igt_vec4 rgb;
            <br>
            +
            <br>
            +            yuv.d[0] = yuyv[j * 4 + 0];
            <br>
            +            yuv.d[1] = yuyv[j * 4 + 1];
            <br>
            +            yuv.d[2] = yuyv[j * 4 + 3];
            <br>
            +            yuv.d[3] = 1.0f;
            <br>
            +
            <br>
            +            rgb = igt_matrix_transform(&amp;m, &amp;yuv);
            <br>
            +
            <br>
            +            write_rgbf(&amp;ptr[j * 6 + 0], &amp;rgb);
            <br>
            +        }
            <br>
            +
            <br>
            +        ptr += float_stride;
            <br>
            +        yuyv += yuyv_stride;
            <br>
            +    }
            <br>
            +
            <br>
            +    convert_src_put(cvt, buf);
            <br>
            +}
            <br>
            +
            <br>
            +static void convert_float_to_Y21X(struct fb_convert *cvt)
            <br>
            +{
            <br>
            +    int i, j;
            <br>
            +    uint16_t *yuyv = cvt-&gt;dst.ptr;
            <br>
            +    const float *ptr = cvt-&gt;src.ptr;
            <br>
            +    unsigned float_stride = cvt-&gt;src.fb-&gt;strides[0] /
            sizeof(*ptr);
            <br>
            +    unsigned yuyv_stride = cvt-&gt;dst.fb-&gt;strides[0] /
            sizeof(*yuyv);
            <br>
            +    struct igt_mat4 m =
            igt_rgb_to_ycbcr_matrix(cvt-&gt;src.fb-&gt;drm_format,
            <br>
            +                            cvt-&gt;dst.fb-&gt;drm_format,
            <br>
            +                           
            cvt-&gt;dst.fb-&gt;color_encoding,
            <br>
            +                           
            cvt-&gt;dst.fb-&gt;color_range);
            <br>
            +
            <br>
            +    igt_assert(cvt-&gt;src.fb-&gt;drm_format ==
            IGT_FORMAT_FLOAT &amp;&amp;
            <br>
            +           (cvt-&gt;dst.fb-&gt;drm_format ==
            DRM_FORMAT_Y210 ||
            <br>
            +            cvt-&gt;dst.fb-&gt;drm_format ==
            DRM_FORMAT_Y212 ||
            <br>
            +            cvt-&gt;dst.fb-&gt;drm_format ==
            DRM_FORMAT_Y216));
            <br>
            +
            <br>
            +    for (i = 0; i &lt; cvt-&gt;dst.fb-&gt;height; i++) {
            <br>
            +        for (j = 0; j &lt; cvt-&gt;dst.fb-&gt;width / 2;
            j++) {
            <br>
            +            /* Convert 2x1 pixel blocks */
            <br>
            +            struct igt_vec4 rgb[2];
            <br>
            +            struct igt_vec4 yuv[2];
            <br>
            +
            <br>
            +            read_rgbf(&amp;rgb[0], &amp;ptr[j * 6 + 0]);
            <br>
            +            read_rgbf(&amp;rgb[1], &amp;ptr[j * 6 + 3]);
            <br>
            +
            <br>
            +            yuv[0] = igt_matrix_transform(&amp;m,
            &amp;rgb[0]);
            <br>
            +            yuv[1] = igt_matrix_transform(&amp;m,
            &amp;rgb[1]);
            <br>
            +
            <br>
            +            yuyv[j * 4 + 0] = yuv[0].d[0];
            <br>
            +            yuyv[j * 4 + 2] = yuv[1].d[0];
            <br>
            +            yuyv[j * 4 + 1] = (yuv[0].d[1] + yuv[1].d[1]) /
            2.0f;
            <br>
            +            yuyv[j * 4 + 3] = (yuv[0].d[2] + yuv[1].d[2]) /
            2.0f;
            <br>
            +        }
            <br>
            +
            <br>
            +        if (cvt-&gt;dst.fb-&gt;width &amp; 1) {
            <br>
            +            struct igt_vec4 rgb;
            <br>
            +            struct igt_vec4 yuv;
            <br>
            +
            <br>
            +            read_rgbf(&amp;rgb, &amp;ptr[j * 6 + 0]);
            <br>
            +
            <br>
            +            yuv = igt_matrix_transform(&amp;m, &amp;rgb);
            <br>
            +
            <br>
            +            yuyv[j * 4 + 0] = yuv.d[0];
            <br>
            +            yuyv[j * 4 + 1] = yuv.d[1];
            <br>
            +            yuyv[j * 4 + 3] = yuv.d[2];
            <br>
            +        }
            <br>
            +
            <br>
            +        ptr += float_stride;
            <br>
            +        yuyv += yuyv_stride;
            <br>
            +    }
            <br>
            +}
            <br>
            +
            <br>
               static void convert_pixman(struct fb_convert *cvt)
            <br>
               {
            <br>
                   pixman_format_code_t src_pixman =
            drm_format_to_pixman(cvt-&gt;src.fb-&gt;drm_format);
            <br>
            @@ -2221,6 +2354,11 @@ static void fb_convert(struct
            fb_convert *cvt)
            <br>
                       case DRM_FORMAT_P016:
            <br>
                           convert_p01X_to_float(cvt);
            <br>
                           return;
            <br>
            +        case DRM_FORMAT_Y210:
            <br>
            +        case DRM_FORMAT_Y212:
            <br>
            +        case DRM_FORMAT_Y216:
            <br>
            +            convert_Y21X_to_float(cvt);
            <br>
            +            return;
            <br>
                       }
            <br>
                   } else if (cvt-&gt;src.fb-&gt;drm_format ==
            IGT_FORMAT_FLOAT) {
            <br>
                       switch (cvt-&gt;dst.fb-&gt;drm_format) {
            <br>
            @@ -2229,6 +2367,11 @@ static void fb_convert(struct
            fb_convert *cvt)
            <br>
                       case DRM_FORMAT_P016:
            <br>
                           convert_float_to_p01X(cvt);
            <br>
                           return;
            <br>
            +        case DRM_FORMAT_Y210:
            <br>
            +        case DRM_FORMAT_Y212:
            <br>
            +        case DRM_FORMAT_Y216:
            <br>
            +            convert_float_to_Y21X(cvt);
            <br>
            +            return;
            <br>
                       }
            <br>
                   }
            <br>
               @@ -2583,6 +2726,9 @@ bool igt_format_is_yuv(uint32_t
            drm_format)
            <br>
                   case DRM_FORMAT_P010:
            <br>
                   case DRM_FORMAT_P012:
            <br>
                   case DRM_FORMAT_P016:
            <br>
            +    case DRM_FORMAT_Y210:
            <br>
            +    case DRM_FORMAT_Y212:
            <br>
            +    case DRM_FORMAT_Y216:
            <br>
                   case DRM_FORMAT_YUYV:
            <br>
                   case DRM_FORMAT_YVYU:
            <br>
                   case DRM_FORMAT_UYVY:
            <br>
          </blockquote>
        </blockquote>
        Can I get the full IGT / dmesg logs? I can't see what the fb
        dimensions they are.
        <br>
      </blockquote>
      <br>
      IGT Logs:
      <br>
      <br>
      (kms_plane:4960) INFO: Testing format Y210 (0x30313259) on A.0
      <br>
      (kms_plane:4960) igt_fb-DEBUG:
      igt_create_fb_with_bo_size(width=3200, height=1800,
      format=0x30313259, tiling=0x0, size=0)
      <br>
      (kms_plane:4960) igt_fb-DEBUG:
      igt_create_fb_with_bo_size(handle=2, pitch=12800)
      <br>
      (kms_plane:4960) ioctl_wrappers-DEBUG: Test requirement passed:
      igt_has_fb_modifiers(fd)
      <br>
      (kms_plane:4960) igt_fb-CRITICAL: Test assertion failure function
      igt_create_fb_with_bo_size, file ../lib/igt_fb.c:1051:
      <br>
      (kms_plane:4960) igt_fb-CRITICAL: Failed assertion:
      (__kms_addfb(fb-&gt;fd, fb-&gt;gem_handle, fb-&gt;width,
      fb-&gt;height, fb-&gt;drm_format, fb-&gt;tiling, fb-&gt;strides,
      fb-&gt;offsets, fb-&gt;num_planes, flags, &amp;fb-&gt;fb_id)) == 0
      <br>
      (kms_plane:4960) igt_fb-CRITICAL: Last errno: 22, Invalid argument
      <br>
      (kms_plane:4960) igt_core-INFO: Stack trace:
      <br>
      (kms_plane:4960) igt_core-INFO:   #0 ../lib/igt_core.c:1474
      __igt_fail_assert()
      <br>
      (kms_plane:4960) igt_core-INFO:   #1 ../lib/igt_fb.c:1053
      igt_create_fb_with_bo_size()
      <br>
      (kms_plane:4960) igt_core-INFO:   #2 ../lib/igt_fb.c:1078
      igt_create_fb()
      <br>
      (kms_plane:4960) igt_core-INFO:   #3 ../lib/igt_fb.c:1113
      igt_create_color_fb()
      <br>
      (kms_plane:4960) igt_core-INFO:   #4 ../tests/kms_plane.c:417
      test_format_plane_color()
      <br>
      (kms_plane:4960) igt_core-INFO:   #5 ../tests/kms_plane.c:556
      test_format_plane()
      <br>
      (kms_plane:4960) igt_core-INFO:   #6 ../tests/kms_plane.c:587
      test_pixel_formats()
      <br>
      (kms_plane:4960) igt_core-INFO:   #7 ../tests/kms_plane.c:602
      run_tests_for_pipe_plane()
      <br>
      (kms_plane:4960) igt_core-INFO:   #8 ../tests/kms_plane.c:657
      __real_main642()
      <br>
      (kms_plane:4960) igt_core-INFO:   #9 ../tests/kms_plane.c:642
      main()
      <br>
      (kms_plane:4960) igt_core-INFO:   #10 ../csu/libc-start.c:325
      __libc_start_main()
      <br>
      (kms_plane:4960) igt_core-INFO:   #11 [_start+0x29]
      <br>
      (kms_plane:4960) igt_core-INFO:   #12 [&lt;unknown&gt;+0x0]
      <br>
      ****  END  ****
      <br>
      <br>
      Dmesg Logs: Attached y210_dmesg_failure.txt
      <br>
      <br>
    </blockquote>
    <font face="Calibri">Same failure exists for all the Y2xx formats
      Y210/Y212/Y216. </font>
    <blockquote type="cite"
      cite="mid:6dc3d71e-b946-0e6c-60f1-b14b6147a618@intel.com">
      <blockquote type="cite">
        <br>
        ~Maarten
        <br>
        <br>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
        <pre class="moz-quote-pre" wrap="">_______________________________________________
igt-dev mailing list
<a class="moz-txt-link-abbreviated" href="mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/igt-dev">https://lists.freedesktop.org/mailman/listinfo/igt-dev</a>
</pre>
      </blockquote>
    </blockquote>
    <div class="moz-signature">-- <br>
      Thanks and Regards,
      Swati
    </div>
  </body>
</html>

--------------23EDC4D64CAC209A6C98D5CD--

--===============0145553470==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0145553470==--
