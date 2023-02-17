Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED33810E460
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Feb 2023 20:43:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------mwtCnVRByMyZ96ICHctM8EvC"
Message-ID: <3e752ec3-a6ca-c835-fb92-2a5ef7ba7278@amd.com>
Date: Fri, 17 Feb 2023 15:43:24 -0500
To: Leo Li <sunpeng.li@amd.com>, igt-dev@lists.freedesktop.org,
 rodrigo.siqueira@amd.com, harry.wentland@amd.com, nicholas.kazlauskas@amd.com
References: <20230213181651.863367-1-Bhawanpreet.Lakha@amd.com>
 <9212eb43-3204-79f1-c507-01c1824cebe9@amd.com>
Content-Language: en-US
From: Bhawanpreet Lakha <Bhawanpreet.lakha@amd.com>
In-Reply-To: <9212eb43-3204-79f1-c507-01c1824cebe9@amd.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/2] amdgpu/amd_plane: Add multi MPO XRGB8888
 test
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

--------------mwtCnVRByMyZ96ICHctM8EvC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2023-02-17 15:24, Leo Li wrote:
>
>
>
> On 2/13/23 13:16, Bhawanpreet Lakha wrote:
>> [Why]
>> Some of our ASICs  support multiple overlay planes, so create
>> a test to test them
>>
>> [How]
>> Create a plane with two holes and fill them up with 2 overlay planes
>>
>> Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
>> Change-Id: If527d67ead59f64906a97c340845ac423d93a0aa
>> ---
>>   tests/amdgpu/amd_plane.c | 128 ++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 127 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
>> index b9eec677..d34cd1d9 100644
>> --- a/tests/amdgpu/amd_plane.c
>> +++ b/tests/amdgpu/amd_plane.c
>> @@ -42,6 +42,7 @@ typedef struct data {
>>           igt_plane_t *primary[MAX_PIPES];
>>           igt_plane_t *cursor[MAX_PIPES];
>>       igt_plane_t *overlay[MAX_PIPES];
>> +    igt_plane_t *overlay2[MAX_PIPES];
>>           igt_output_t *output[MAX_PIPES];
>>           igt_pipe_t *pipe[MAX_PIPES];
>>           igt_pipe_crc_t *pipe_crc[MAX_PIPES];
>> @@ -144,7 +145,8 @@ static void lut_free(lut_t *lut)
>>   enum test {
>>       MPO_SINGLE_PAN,
>>       MPO_MULTI_PAN,
>> -    MPO_SCALE
>> +    MPO_SCALE,
>> +    MPO_MULTI_OVERLAY
>>   };
>>     static void test_init(data_t *data)
>> @@ -159,6 +161,8 @@ static void test_init(data_t *data)
>>               data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
>>           data->overlay[i] = igt_pipe_get_plane_type_index(
>>               data->pipe[i], DRM_PLANE_TYPE_OVERLAY, 0);
>> +        data->overlay2[i] = igt_pipe_get_plane_type_index(
>> +            data->pipe[i], DRM_PLANE_TYPE_OVERLAY, 1);
>>           data->cursor[i] = igt_pipe_get_plane_type(
>>               data->pipe[i], DRM_PLANE_TYPE_CURSOR);
>>           data->pipe_crc[i] =
>> @@ -252,6 +256,7 @@ struct fbc {
>>       igt_fb_t ref_primary;
>>       igt_fb_t test_primary;
>>       igt_fb_t test_overlay;
>> +    igt_fb_t test_overlay2;
>>       igt_crc_t ref_crc;
>>   };
>>   @@ -264,6 +269,115 @@ static void set_regamma_lut(data_t *data, 
>> lut_t const *lut, int n)
>>                          size);
>>   }
>>   +/*
>> + * Compares the result of white backgroud with white window with and 
>> without MPO
>> + *
>> + * Reference crc:
>> + * Draws a White background of size (pw,ph).
>> + *
>> + * Test crc:
>> + * Draws a White Overlay of size (pw,ph) then creates a cutout of 
>> size (w,h) at location (x1, y1) and (x2, y2)
>> + * Draws a White Primary plane of size (w, h) at location (x1,y1) 
>> (under the overlay)
>> + * Draws a White Overlay of size (w, h) at location (x2,y2)
>> + *
>> + * NOTE: The reason for using White+White is to speed up the crc 
>> (reuse the ref crc for all cases vs taking
>> + * a ref crc per flip)
>> + */
>> +static void test_plane2(data_t *data, int n, int x1, int y1, int x2, 
>> int y2, int w, int h, int pw, int ph, struct fbc *fbc){
>> +
>> +    igt_crc_t test_crc;
>> +    igt_display_t *display = &data->display;
>> +
>> +    /* Reference: */
>> +
>> +    igt_plane_set_fb(data->primary[n], &fbc[n].ref_primary);
>> +
>> +    igt_plane_set_position(data->primary[n], 0, 0);
>> +    igt_plane_set_size(data->primary[n], pw, ph);
>> +
>> +    igt_display_commit_atomic(display, 0, 0);
>> +
>
> Should ref_crc be collected here?

reference is stored in &fbc[n].ref_crc inside the main function 
test_display_mpo(). The Other MPO tests had alot of iterations so the 
reference crc was saved before starting the tests. Since the setup code 
is the same for this test, its using the same logic.

>
>> +    /* Test: */
>> +    /* Draw a white overlay with two cutouts at (x1,y1) and (x2,y2) */
>> +    draw_color_alpha(&fbc[n].test_overlay2, 0, 0, pw, ph, 1.0, 1.0, 
>> 1.0, 1.0);
>> +    draw_color_alpha(&fbc[n].test_overlay2, x1, y1, w, h, 0.0, 0.0, 
>> 0.0, 0.0);
>> +    draw_color_alpha(&fbc[n].test_overlay2, x2, y2, w, h, 0.0, 0.0, 
>> 0.0, 0.0);
>> +
>> +    /* Draw a overlay to cover up one hole */
>> +    draw_color_alpha(&fbc[n].test_overlay, 0, 0, pw, ph, 0.0, 0.0, 
>> 0.0, 0.0);
>> +    draw_color_alpha(&fbc[n].test_overlay, x2, y2, w, h, 1.0, 1.0, 
>> 1.0, 1.0);
>> +
>> +    /* Draw a primary to cover up the other hole */
>> +    draw_color_alpha(&fbc[n].test_primary, 0, 0, w, h, 0.0, 0.0, 
>> 0.0, 0.0);
>> +    draw_color_alpha(&fbc[n].test_primary, 0, 0, w, h, 1.0, 1.0, 
>> 1.0, 1.0);
>> +
>> +    igt_plane_set_fb(data->primary[n], &fbc[n].test_primary);
>> +    igt_plane_set_fb(data->overlay[n], &fbc[n].test_overlay);
>> +    igt_plane_set_fb(data->overlay2[n], &fbc[n].test_overlay2);
>> +
>> +    /* Move the primary to cover one of the holes*/
>> +    igt_plane_set_position(data->primary[n], x1, y1);
>> +    igt_plane_set_size(data->primary[n], w, h);
>> +
>> +
>> +    igt_display_commit_atomic(display, 0, 0);
>> +    igt_pipe_crc_collect_crc(data->pipe_crc[n], &test_crc);
>> +    igt_plane_set_fb(data->overlay[n], NULL);
>> +    igt_plane_set_fb(data->overlay2[n], NULL);
>> +
>> +    igt_assert_crc_equal(&fbc[n].ref_crc, &test_crc);
>> +
>> +    /* Set window to white, this is to avoid flashing between 
>> black/white after each flip */
>> +    draw_color_alpha(&fbc[n].ref_primary, 0, 0, w, h, 1.0, 1.0, 1.0, 
>> 1.00);
>> +    igt_plane_set_fb(data->primary[n], &fbc[n].ref_primary);
>> +    igt_plane_set_position(data->primary[n], 0, 0);
>> +    igt_plane_set_size(data->primary[n], pw, ph);
>> +    igt_display_commit_atomic(display, 0, 0);
>> +
>> +
>> +}
>> +
>> +/*
>> + * MPO_MULTI_OVERLAY: This test takes the plane sizes and assigns 
>> random position within the screen
>> + *
>> + * The test creates a white screen with 2 cutouts which are to be 
>> filled with 2 overlay planes.
>> + * Testing multiple overlay planes
>> + */
>> +static void test_multi_overlay(data_t *data, int display_count, int 
>> w, int h, struct fbc *fb)
>> +{
>> +
>> +    int x1,x2,y1,y2;
>> +
>> +    for (int n = 0; n < display_count; n++) {
>> +
>> +        int pw = data->w[n];
>> +        int ph = data->h[n];
>> +
>> +        for (int i = 0; i < 1; i++){
>> +
>> +            if (pw <= w && ph <= h)
>> +                break;
>> +
>> +            srand(time(NULL));
>> +
>> +            /* Generate random x,y positions for two cutouts*/
>> +            x1 = (rand() % (pw-w));
>> +            y1 = (rand() % (ph-h));
>> +
>> +            x2 = (rand() % (pw-w));
>> +            y2 = (rand() % (ph-h));
>> +
>
> I wonder if using random positions can cause hard-to-reproduce failures.
> Is there something in particular being tested via rand, or can we use a
> fixed set of positions similar to test_cursor_spots() in
> kms_plane_cursor?
> Thanks,
> Leo


No particular reason for using random positions, I will take a look at 
test_cursor_spots(). Thanks

>
>> +
>> +            test_plane2(data, n, x1, y1, x2, y2, w,h, pw, ph, fb);
>> +
>> +        }
>> +    }
>> +
>> +    return;
>> +
>> +
>> +}
>> +
>>   /*
>>    * Compares the result of white backgroud with white window with 
>> and without MPO
>>    *
>> @@ -467,6 +581,10 @@ static void test_display_mpo(data_t *data, enum 
>> test test, uint32_t format, int
>>         test_init(data);
>>   +    /* Skip test if we don't have 2 overlay planes */
>> +    if (test == MPO_MULTI_OVERLAY)
>> +        igt_skip_on(!data->overlay2[0]);
>> +
>>       /* Skip if there is less valid outputs than the required. */
>>       for_each_connected_output(display, output)
>>           valid_outputs++;
>> @@ -494,6 +612,7 @@ static void test_display_mpo(data_t *data, enum 
>> test test, uint32_t format, int
>>           igt_create_fb(data->fd, w, h, DRM_FORMAT_XRGB8888, 0, 
>> &fb[n].ref_primary);
>>           igt_create_color_fb(data->fd, w, h, DRM_FORMAT_XRGB8888, 0, 
>> 1.0, 1.0, 1.0, &fb[n].ref_primary);
>>           igt_create_fb(data->fd, w, h, DRM_FORMAT_ARGB8888, 0, 
>> &fb[n].test_overlay);
>> +        igt_create_fb(data->fd, w, h, DRM_FORMAT_ARGB8888, 0, 
>> &fb[n].test_overlay2);
>>             igt_plane_set_fb(data->primary[n], &fb[n].ref_primary);
>>   @@ -520,6 +639,8 @@ static void test_display_mpo(data_t *data, enum 
>> test test, uint32_t format, int
>>             if (test == MPO_SINGLE_PAN)
>>               test_panning_1_display(data, display_count, 
>> videos[i][0], videos[i][1], fb);
>> +        if (test == MPO_MULTI_OVERLAY)
>> +            test_multi_overlay(data, display_count, videos[i][0], 
>> videos[i][1], fb);
>>           if (test == MPO_MULTI_PAN)
>>               test_panning_2_display(data, videos[i][0], 
>> videos[i][1], fb);
>>           if(test == MPO_SCALE)
>> @@ -536,6 +657,7 @@ static void test_display_mpo(data_t *data, enum 
>> test test, uint32_t format, int
>>       for (int n = 0; n < display_count; n++) {
>>           igt_remove_fb(data->fd, &fb[n].ref_primary);
>>           igt_remove_fb(data->fd, &fb[n].test_overlay);
>> +        igt_remove_fb(data->fd, &fb[n].test_overlay2);
>>       }
>>   }
>>   /*
>> @@ -798,6 +920,10 @@ igt_main
>>       igt_subtest("mpo-pan-multi-p010")
>>           test_display_mpo(&data, MPO_MULTI_PAN, DRM_FORMAT_P010, 
>> DISPLAYS_TO_TEST);
>>   +    igt_describe("Multi MPO");
>> +    igt_subtest("multi-mpo")
>> +        test_display_mpo(&data, MPO_MULTI_OVERLAY, DRM_FORMAT_NV12, 1);
>> +
>>       igt_describe("MPO and scaling RGB primary plane");
>>       igt_subtest("mpo-scale-rgb")
>>           test_display_mpo(&data, MPO_SCALE, DRM_FORMAT_XRGB8888, 1);
--------------mwtCnVRByMyZ96ICHctM8EvC
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023-02-17 15:24, Leo Li wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:9212eb43-3204-79f1-c507-01c1824cebe9@amd.com">
      <br>
      <br>
      <br>
      On 2/13/23 13:16, Bhawanpreet Lakha wrote:
      <br>
      <blockquote type="cite">[Why]
        <br>
        Some of our ASICs&nbsp; support multiple overlay planes, so create
        <br>
        a test to test them
        <br>
        <br>
        [How]
        <br>
        Create a plane with two holes and fill them up with 2 overlay
        planes
        <br>
        <br>
        Signed-off-by: Bhawanpreet Lakha
        <a class="moz-txt-link-rfc2396E" href="mailto:Bhawanpreet.Lakha@amd.com">&lt;Bhawanpreet.Lakha@amd.com&gt;</a>
        <br>
        Change-Id: If527d67ead59f64906a97c340845ac423d93a0aa
        <br>
        ---
        <br>
        &nbsp; tests/amdgpu/amd_plane.c | 128
        ++++++++++++++++++++++++++++++++++++++-
        <br>
        &nbsp; 1 file changed, 127 insertions(+), 1 deletion(-)
        <br>
        <br>
        diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
        <br>
        index b9eec677..d34cd1d9 100644
        <br>
        --- a/tests/amdgpu/amd_plane.c
        <br>
        +++ b/tests/amdgpu/amd_plane.c
        <br>
        @@ -42,6 +42,7 @@ typedef struct data {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_t *primary[MAX_PIPES];
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_t *cursor[MAX_PIPES];
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_t *overlay[MAX_PIPES];
        <br>
        +&nbsp;&nbsp;&nbsp; igt_plane_t *overlay2[MAX_PIPES];
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output[MAX_PIPES];
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_t *pipe[MAX_PIPES];
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_crc_t *pipe_crc[MAX_PIPES];
        <br>
        @@ -144,7 +145,8 @@ static void lut_free(lut_t *lut)
        <br>
        &nbsp; enum test {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MPO_SINGLE_PAN,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MPO_MULTI_PAN,
        <br>
        -&nbsp;&nbsp;&nbsp; MPO_SCALE
        <br>
        +&nbsp;&nbsp;&nbsp; MPO_SCALE,
        <br>
        +&nbsp;&nbsp;&nbsp; MPO_MULTI_OVERLAY
        <br>
        &nbsp; };
        <br>
        &nbsp; &nbsp; static void test_init(data_t *data)
        <br>
        @@ -159,6 +161,8 @@ static void test_init(data_t *data)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;pipe[i], DRM_PLANE_TYPE_PRIMARY);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;overlay[i] = igt_pipe_get_plane_type_index(
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;pipe[i], DRM_PLANE_TYPE_OVERLAY, 0);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;overlay2[i] = igt_pipe_get_plane_type_index(
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;pipe[i], DRM_PLANE_TYPE_OVERLAY, 1);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;cursor[i] = igt_pipe_get_plane_type(
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;pipe[i], DRM_PLANE_TYPE_CURSOR);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;pipe_crc[i] =
        <br>
        @@ -252,6 +256,7 @@ struct fbc {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fb_t ref_primary;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fb_t test_primary;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fb_t test_overlay;
        <br>
        +&nbsp;&nbsp;&nbsp; igt_fb_t test_overlay2;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_crc_t ref_crc;
        <br>
        &nbsp; };
        <br>
        &nbsp; @@ -264,6 +269,115 @@ static void set_regamma_lut(data_t
        *data, lut_t const *lut, int n)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size);
        <br>
        &nbsp; }
        <br>
        &nbsp; +/*
        <br>
        + * Compares the result of white backgroud with white window
        with and without MPO
        <br>
        + *
        <br>
        + * Reference crc:
        <br>
        + * Draws a White background of size (pw,ph).
        <br>
        + *
        <br>
        + * Test crc:
        <br>
        + * Draws a White Overlay of size (pw,ph) then creates a cutout
        of size (w,h) at location (x1, y1) and (x2, y2)
        <br>
        + * Draws a White Primary plane of size (w, h) at location
        (x1,y1) (under the overlay)
        <br>
        + * Draws a White Overlay of size (w, h) at location (x2,y2)
        <br>
        + *
        <br>
        + * NOTE: The reason for using White+White is to speed up the
        crc (reuse the ref crc for all cases vs taking
        <br>
        + * a ref crc per flip)
        <br>
        + */
        <br>
        +static void test_plane2(data_t *data, int n, int x1, int y1,
        int x2, int y2, int w, int h, int pw, int ph, struct fbc *fbc){
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_crc_t test_crc;
        <br>
        +&nbsp;&nbsp;&nbsp; igt_display_t *display = &amp;data-&gt;display;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; /* Reference: */
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;primary[n],
        &amp;fbc[n].ref_primary);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_plane_set_position(data-&gt;primary[n], 0, 0);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_plane_set_size(data-&gt;primary[n], pw, ph);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_display_commit_atomic(display, 0, 0);
        <br>
        +
        <br>
      </blockquote>
      <br>
      Should ref_crc be collected here?
      <br>
    </blockquote>
    <p><font size="2"><span style="font-size:11pt;">reference is stored
          in &amp;fbc[n].ref_crc inside the main function </span></font><font size="2"><span style="font-size:11pt;">test_display_mpo(). The
          Other MPO tests had alot of iterations so the reference crc
          was saved before starting the tests. Since the setup code is
          the same for this test, its using the same logic. <br>
        </span></font></p>
    <blockquote type="cite" cite="mid:9212eb43-3204-79f1-c507-01c1824cebe9@amd.com">
      <br>
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp; /* Test: */
        <br>
        +&nbsp;&nbsp;&nbsp; /* Draw a white overlay with two cutouts at (x1,y1) and
        (x2,y2) */
        <br>
        +&nbsp;&nbsp;&nbsp; draw_color_alpha(&amp;fbc[n].test_overlay2, 0, 0, pw, ph,
        1.0, 1.0, 1.0, 1.0);
        <br>
        +&nbsp;&nbsp;&nbsp; draw_color_alpha(&amp;fbc[n].test_overlay2, x1, y1, w, h,
        0.0, 0.0, 0.0, 0.0);
        <br>
        +&nbsp;&nbsp;&nbsp; draw_color_alpha(&amp;fbc[n].test_overlay2, x2, y2, w, h,
        0.0, 0.0, 0.0, 0.0);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; /* Draw a overlay to cover up one hole */
        <br>
        +&nbsp;&nbsp;&nbsp; draw_color_alpha(&amp;fbc[n].test_overlay, 0, 0, pw, ph,
        0.0, 0.0, 0.0, 0.0);
        <br>
        +&nbsp;&nbsp;&nbsp; draw_color_alpha(&amp;fbc[n].test_overlay, x2, y2, w, h,
        1.0, 1.0, 1.0, 1.0);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; /* Draw a primary to cover up the other hole */
        <br>
        +&nbsp;&nbsp;&nbsp; draw_color_alpha(&amp;fbc[n].test_primary, 0, 0, w, h, 0.0,
        0.0, 0.0, 0.0);
        <br>
        +&nbsp;&nbsp;&nbsp; draw_color_alpha(&amp;fbc[n].test_primary, 0, 0, w, h, 1.0,
        1.0, 1.0, 1.0);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;primary[n],
        &amp;fbc[n].test_primary);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;overlay[n],
        &amp;fbc[n].test_overlay);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;overlay2[n],
        &amp;fbc[n].test_overlay2);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; /* Move the primary to cover one of the holes*/
        <br>
        +&nbsp;&nbsp;&nbsp; igt_plane_set_position(data-&gt;primary[n], x1, y1);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_plane_set_size(data-&gt;primary[n], w, h);
        <br>
        +
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_display_commit_atomic(display, 0, 0);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_pipe_crc_collect_crc(data-&gt;pipe_crc[n],
        &amp;test_crc);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;overlay[n], NULL);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;overlay2[n], NULL);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; igt_assert_crc_equal(&amp;fbc[n].ref_crc, &amp;test_crc);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; /* Set window to white, this is to avoid flashing between
        black/white after each flip */
        <br>
        +&nbsp;&nbsp;&nbsp; draw_color_alpha(&amp;fbc[n].ref_primary, 0, 0, w, h, 1.0,
        1.0, 1.0, 1.00);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;primary[n],
        &amp;fbc[n].ref_primary);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_plane_set_position(data-&gt;primary[n], 0, 0);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_plane_set_size(data-&gt;primary[n], pw, ph);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_display_commit_atomic(display, 0, 0);
        <br>
        +
        <br>
        +
        <br>
        +}
        <br>
        +
        <br>
        +/*
        <br>
        + * MPO_MULTI_OVERLAY: This test takes the plane sizes and
        assigns random position within the screen
        <br>
        + *
        <br>
        + * The test creates a white screen with 2 cutouts which are to
        be filled with 2 overlay planes.
        <br>
        + * Testing multiple overlay planes
        <br>
        + */
        <br>
        +static void test_multi_overlay(data_t *data, int display_count,
        int w, int h, struct fbc *fb)
        <br>
        +{
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; int x1,x2,y1,y2;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; for (int n = 0; n &lt; display_count; n++) {
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int pw = data-&gt;w[n];
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ph = data-&gt;h[n];
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (int i = 0; i &lt; 1; i++){
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pw &lt;= w &amp;&amp; ph &lt;= h)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; srand(time(NULL));
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Generate random x,y positions for two cutouts*/
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; x1 = (rand() % (pw-w));
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; y1 = (rand() % (ph-h));
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; x2 = (rand() % (pw-w));
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; y2 = (rand() % (ph-h));
        <br>
        +
        <br>
      </blockquote>
      <br>
      I wonder if using random positions can cause hard-to-reproduce
      failures.
      <br>
      Is there something in particular being tested via rand, or can we
      use a
      <br>
      fixed set of positions similar to test_cursor_spots() in
      <br>
      kms_plane_cursor?
      <br>
    </blockquote>
    <blockquote type="cite" cite="mid:9212eb43-3204-79f1-c507-01c1824cebe9@amd.com">Thanks,
      <br>
      Leo
      <br>
    </blockquote>
    <p><br>
      No particular reason for using random positions, I will take a
      look at test_cursor_spots(). Thanks<br>
    </p>
    <blockquote type="cite" cite="mid:9212eb43-3204-79f1-c507-01c1824cebe9@amd.com">
      <br>
      <blockquote type="cite">+
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_plane2(data, n, x1, y1, x2, y2, w,h, pw, ph,
        fb);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; return;
        <br>
        +
        <br>
        +
        <br>
        +}
        <br>
        +
        <br>
        &nbsp; /*
        <br>
        &nbsp;&nbsp; * Compares the result of white backgroud with white window
        with and without MPO
        <br>
        &nbsp;&nbsp; *
        <br>
        @@ -467,6 +581,10 @@ static void test_display_mpo(data_t *data,
        enum test test, uint32_t format, int
        <br>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_init(data);
        <br>
        &nbsp; +&nbsp;&nbsp;&nbsp; /* Skip test if we don't have 2 overlay planes */
        <br>
        +&nbsp;&nbsp;&nbsp; if (test == MPO_MULTI_OVERLAY)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_skip_on(!data-&gt;overlay2[0]);
        <br>
        +
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Skip if there is less valid outputs than the required.
        */
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_connected_output(display, output)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valid_outputs++;
        <br>
        @@ -494,6 +612,7 @@ static void test_display_mpo(data_t *data,
        enum test test, uint32_t format, int
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_create_fb(data-&gt;fd, w, h, DRM_FORMAT_XRGB8888,
        0, &amp;fb[n].ref_primary);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_create_color_fb(data-&gt;fd, w, h,
        DRM_FORMAT_XRGB8888, 0, 1.0, 1.0, 1.0, &amp;fb[n].ref_primary);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_create_fb(data-&gt;fd, w, h, DRM_FORMAT_ARGB8888,
        0, &amp;fb[n].test_overlay);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_create_fb(data-&gt;fd, w, h, DRM_FORMAT_ARGB8888,
        0, &amp;fb[n].test_overlay2);
        <br>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;primary[n],
        &amp;fb[n].ref_primary);
        <br>
        &nbsp; @@ -520,6 +639,8 @@ static void test_display_mpo(data_t *data,
        enum test test, uint32_t format, int
        <br>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (test == MPO_SINGLE_PAN)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_panning_1_display(data, display_count,
        videos[i][0], videos[i][1], fb);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (test == MPO_MULTI_OVERLAY)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_multi_overlay(data, display_count,
        videos[i][0], videos[i][1], fb);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (test == MPO_MULTI_PAN)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_panning_2_display(data, videos[i][0],
        videos[i][1], fb);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(test == MPO_SCALE)
        <br>
        @@ -536,6 +657,7 @@ static void test_display_mpo(data_t *data,
        enum test test, uint32_t format, int
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (int n = 0; n &lt; display_count; n++) {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_remove_fb(data-&gt;fd, &amp;fb[n].ref_primary);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_remove_fb(data-&gt;fd, &amp;fb[n].test_overlay);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_remove_fb(data-&gt;fd, &amp;fb[n].test_overlay2);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        &nbsp; }
        <br>
        &nbsp; /*
        <br>
        @@ -798,6 +920,10 @@ igt_main
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;mpo-pan-multi-p010&quot;)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_display_mpo(&amp;data, MPO_MULTI_PAN,
        DRM_FORMAT_P010, DISPLAYS_TO_TEST);
        <br>
        &nbsp; +&nbsp;&nbsp;&nbsp; igt_describe(&quot;Multi MPO&quot;);
        <br>
        +&nbsp;&nbsp;&nbsp; igt_subtest(&quot;multi-mpo&quot;)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_display_mpo(&amp;data, MPO_MULTI_OVERLAY,
        DRM_FORMAT_NV12, 1);
        <br>
        +
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;MPO and scaling RGB primary plane&quot;);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;mpo-scale-rgb&quot;)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_display_mpo(&amp;data, MPO_SCALE,
        DRM_FORMAT_XRGB8888, 1);
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------mwtCnVRByMyZ96ICHctM8EvC--
