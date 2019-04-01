Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398706E0C7
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Apr 2019 09:19:20 +0000 (UTC)
References: <1553842214-16928-1-git-send-email-swati2.sharma@intel.com>
 <20190329095453.GM2665@phenom.ffwll.local> <20190329103433.GR3888@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
Message-ID: <03153ee5-b073-a77f-2c80-8969c4fae685@intel.com>
Date: Mon, 1 Apr 2019 14:49:14 +0530
MIME-Version: 1.0
In-Reply-To: <20190329103433.GR3888@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH] tests/kms_color: Change in commit style from
 legacy to atomic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2098545937=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: jani.nikula@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============2098545937==
Content-Type: multipart/alternative;
 boundary="------------1CC87771DB28A7298647B962"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------1CC87771DB28A7298647B962
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

On 29-Mar-19 4:04 PM, Ville Syrjälä wrote:
> On Fri, Mar 29, 2019 at 10:54:53AM +0100, Daniel Vetter wrote:
>> On Fri, Mar 29, 2019 at 12:20:14PM +0530, Swati Sharma wrote:
>>> Existing kms_color i-g-t, commit style by default is legacy for
>>> all the ctm/gamma/degamma subtests.
>>>
>>> In this patch, legacy commit is changed to atomic (since i915
>>> no longer supports legacy commit)
>>>
>>> v1: As per Daniel's comments switching over to atomic.
>>> v2: As per Maarten's comments did COMMIT_ATOMIC, and added
>>>      igt_require(display.is_atomic)
>>> v3: Fixed stupid mistake, now test cases are not getting skipped
>>>
>>> Need Feedback?
>>> Still there are few functions like pipe_set_property_blob_id,
>>> pipe_set_property_blob, invalid_lut_sizes where provision of
>>> both legacy and atomic is there. Should I change them too to
>>> atomic only like I did for other func?
>>>
>>> Also, this patch is floating since ages, it will be nice if
>>> I can have a closure(=>rb) on this and move forward :)
>>>
>>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> Typed this on jira already months ago, replicating here: The idea is to
>> add an atomic test (with crc checks every frame and all that) to make sure
>> lut updates are atomic on screen.
> I have a test for that. It needs my vblank workers (still a bit wip) to
> actually work (well, mostly work).
>
>> Switching to atomic commit style for
>> everything else just means we can't run this on older drivers anymore (not
>> that there are many of those left), which seems a bit pointless.
>> -Daniel

Hi Daniel,
I think there is some misunderstanding from my end. When I first sent this patch as
an RFChttps://patchwork.freedesktop.org/patch/254752/  there I had given provision
for both legacy and atomic.
That time feedback which I received was:
Imo just switch over to atomic. There's no upstream driver supporting
color management props that doesn't support atomic.
-Daniel
That's y I switched to atomic completely.

I still feel provision for both legacy and atomic should be given. Though this change is
not adding atomic test(now which is already Ville is doing) but like other IGTs
it should allow commit through both the paths.
Please do let me know what you think. Thanks in advance.

>>
>>> ---
>>>   tests/kms_color.c | 42 +++++++++++++++++++++---------------------
>>>   1 file changed, 21 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/tests/kms_color.c b/tests/kms_color.c
>>> index decf3c2..92f5c12 100644
>>> --- a/tests/kms_color.c
>>> +++ b/tests/kms_color.c
>>> @@ -63,7 +63,6 @@ typedef struct {
>>>   	uint64_t gamma_lut_size;
>>>   } data_t;
>>>   
>>> -
>>>   static void paint_gradient_rectangles(data_t *data,
>>>   				      drmModeModeInfo *mode,
>>>   				      color_t *colors,
>>> @@ -311,12 +310,12 @@ static void test_pipe_degamma(data_t *data,
>>>   		disable_ctm(primary->pipe);
>>>   		disable_degamma(primary->pipe);
>>>   		set_gamma(data, primary->pipe, gamma_linear);
>>> -		igt_display_commit(&data->display);
>>> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>>   
>>>   		/* Draw solid colors with no degamma transformation. */
>>>   		paint_rectangles(data, mode, red_green_blue, &fb);
>>>   		igt_plane_set_fb(primary, &fb);
>>> -		igt_display_commit(&data->display);
>>> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>>   		igt_wait_for_vblank(data->drm_fd, primary->pipe->pipe);
>>>   		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
>>>   
>>> @@ -326,7 +325,7 @@ static void test_pipe_degamma(data_t *data,
>>>   		paint_gradient_rectangles(data, mode, red_green_blue, &fb);
>>>   		igt_plane_set_fb(primary, &fb);
>>>   		set_degamma(data, primary->pipe, degamma_full);
>>> -		igt_display_commit(&data->display);
>>> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>>   		igt_wait_for_vblank(data->drm_fd, primary->pipe->pipe);
>>>   		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
>>>   
>>> @@ -391,12 +390,12 @@ static void test_pipe_gamma(data_t *data,
>>>   		disable_ctm(primary->pipe);
>>>   		disable_degamma(primary->pipe);
>>>   		set_gamma(data, primary->pipe, gamma_full);
>>> -		igt_display_commit(&data->display);
>>> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>>   
>>>   		/* Draw solid colors with no gamma transformation. */
>>>   		paint_rectangles(data, mode, red_green_blue, &fb);
>>>   		igt_plane_set_fb(primary, &fb);
>>> -		igt_display_commit(&data->display);
>>> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>>   		igt_wait_for_vblank(data->drm_fd, primary->pipe->pipe);
>>>   		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
>>>   
>>> @@ -405,7 +404,7 @@ static void test_pipe_gamma(data_t *data,
>>>   		 */
>>>   		paint_gradient_rectangles(data, mode, red_green_blue, &fb);
>>>   		igt_plane_set_fb(primary, &fb);
>>> -		igt_display_commit(&data->display);
>>> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>>   		igt_wait_for_vblank(data->drm_fd, primary->pipe->pipe);
>>>   		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
>>>   
>>> @@ -477,12 +476,12 @@ static void test_pipe_legacy_gamma(data_t *data,
>>>   		disable_degamma(primary->pipe);
>>>   		disable_gamma(primary->pipe);
>>>   		disable_ctm(primary->pipe);
>>> -		igt_display_commit(&data->display);
>>> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>>   
>>>   		/* Draw solid colors with no gamma transformation. */
>>>   		paint_rectangles(data, mode, red_green_blue, &fb);
>>>   		igt_plane_set_fb(primary, &fb);
>>> -		igt_display_commit(&data->display);
>>> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>>   		igt_wait_for_vblank(data->drm_fd, primary->pipe->pipe);
>>>   		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
>>>   
>>> @@ -497,7 +496,7 @@ static void test_pipe_legacy_gamma(data_t *data,
>>>   			red_lut[i] = green_lut[i] = blue_lut[i] = 0xffff;
>>>   		igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->pipe->crtc_id,
>>>   						  legacy_lut_size, red_lut, green_lut, blue_lut), 0);
>>> -		igt_display_commit(&data->display);
>>> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>>   		igt_wait_for_vblank(data->drm_fd, primary->pipe->pipe);
>>>   		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
>>>   
>>> @@ -512,7 +511,7 @@ static void test_pipe_legacy_gamma(data_t *data,
>>>   
>>>   		igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->pipe->crtc_id,
>>>   						  legacy_lut_size, red_lut, green_lut, blue_lut), 0);
>>> -		igt_display_commit(&data->display);
>>> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>>   
>>>   		igt_plane_set_fb(primary, NULL);
>>>   		igt_output_set_pipe(output, PIPE_NONE);
>>> @@ -566,7 +565,7 @@ static void test_pipe_legacy_gamma_reset(data_t *data,
>>>   		disable_degamma(primary->pipe);
>>>   		disable_ctm(primary->pipe);
>>>   		disable_gamma(primary->pipe);
>>> -		igt_display_commit(&data->display);
>>> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>>   
>>>   		/* Set a degama & gamma LUT and a CTM using the
>>>   		 * properties and verify the content of the
>>> @@ -574,7 +573,7 @@ static void test_pipe_legacy_gamma_reset(data_t *data,
>>>   		set_degamma(data, primary->pipe, degamma_linear);
>>>   		set_ctm(primary->pipe, ctm_identity);
>>>   		set_gamma(data, primary->pipe, gamma_zero);
>>> -		igt_display_commit(&data->display);
>>> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>>   
>>>   		blob = get_blob(data, primary->pipe, IGT_CRTC_DEGAMMA_LUT);
>>>   		igt_assert(blob &&
>>> @@ -617,7 +616,7 @@ static void test_pipe_legacy_gamma_reset(data_t *data,
>>>   						  legacy_lut_size,
>>>   						  red_lut, green_lut, blue_lut),
>>>   			      0);
>>> -		igt_display_commit(&data->display);
>>> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>>   
>>>   		igt_assert(get_blob(data, primary->pipe,
>>>   				    IGT_CRTC_DEGAMMA_LUT) == NULL);
>>> @@ -699,12 +698,12 @@ static bool test_pipe_ctm(data_t *data,
>>>   		set_degamma(data, primary->pipe, degamma_linear);
>>>   		set_gamma(data, primary->pipe, gamma_linear);
>>>   		disable_ctm(primary->pipe);
>>> -		igt_display_commit(&data->display);
>>> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>>   
>>>   		paint_rectangles(data, mode, after, &fb);
>>>   		igt_plane_set_fb(primary, &fb);
>>>   		set_ctm(primary->pipe, ctm_identity);
>>> -		igt_display_commit(&data->display);
>>> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>>   		igt_wait_for_vblank(data->drm_fd, primary->pipe->pipe);
>>>   		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_software);
>>>   
>>> @@ -712,7 +711,7 @@ static bool test_pipe_ctm(data_t *data,
>>>   		paint_rectangles(data, mode, before, &fb);
>>>   		igt_plane_set_fb(primary, &fb);
>>>   		set_ctm(primary->pipe, ctm_matrix);
>>> -		igt_display_commit(&data->display);
>>> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>>   		igt_wait_for_vblank(data->drm_fd, primary->pipe->pipe);
>>>   		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_hardware);
>>>   
>>> @@ -807,7 +806,7 @@ static void test_pipe_limited_range_ctm(data_t *data,
>>>   		igt_output_set_prop_value(output, IGT_CONNECTOR_BROADCAST_RGB, BROADCAST_RGB_FULL);
>>>   		paint_rectangles(data, mode, red_green_blue_limited, &fb);
>>>   		igt_plane_set_fb(primary, &fb);
>>> -		igt_display_commit(&data->display);
>>> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>>   		igt_wait_for_vblank(data->drm_fd, primary->pipe->pipe);
>>>   		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_full);
>>>   
>>> @@ -815,7 +814,7 @@ static void test_pipe_limited_range_ctm(data_t *data,
>>>   		igt_output_set_prop_value(output, IGT_CONNECTOR_BROADCAST_RGB, BROADCAST_RGB_16_235);
>>>   		paint_rectangles(data, mode, red_green_blue_full, &fb);
>>>   		igt_plane_set_fb(primary, &fb);
>>> -		igt_display_commit(&data->display);
>>> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>>   		igt_wait_for_vblank(data->drm_fd, primary->pipe->pipe);
>>>   		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_limited);
>>>   
>>> @@ -1043,7 +1042,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
>>>   		disable_degamma(primary->pipe);
>>>   		disable_gamma(primary->pipe);
>>>   		disable_ctm(primary->pipe);
>>> -		igt_display_commit(&data->display);
>>> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>>   
>>>   		igt_pipe_crc_free(data->pipe_crc);
>>>   		data->pipe_crc = NULL;
>>> @@ -1085,7 +1084,7 @@ invalid_lut_sizes(data_t *data)
>>>   	struct _drm_color_lut *degamma_lut = malloc(data->degamma_lut_size * sizeof(struct _drm_color_lut) * 2);
>>>   	struct _drm_color_lut *gamma_lut = malloc(data->gamma_lut_size * sizeof(struct _drm_color_lut) * 2);
>>>   
>>> -	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>>> +	igt_display_commit2(display, COMMIT_ATOMIC);
>>>   
>>>   	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_DEGAMMA_LUT)) {
>>>   		igt_assert_eq(pipe_set_property_blob(pipe, IGT_CRTC_DEGAMMA_LUT,
>>> @@ -1173,6 +1172,7 @@ igt_main
>>>   		kmstest_set_vt_graphics_mode();
>>>   
>>>   		igt_display_require(&data.display, data.drm_fd);
>>> +		igt_require(data.display.is_atomic);
>>>   	}
>>>   
>>>   	for_each_pipe_static(pipe)
>>> -- 
>>> 1.9.1
>>>
>> -- 
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch


-- 
~Swati Sharma


--------------1CC87771DB28A7298647B962
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 29-Mar-19 4:04 PM, Ville Syrjälä
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20190329103433.GR3888@intel.com">
      <pre class="moz-quote-pre" wrap="">On Fri, Mar 29, 2019 at 10:54:53AM +0100, Daniel Vetter wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Fri, Mar 29, 2019 at 12:20:14PM +0530, Swati Sharma wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Existing kms_color i-g-t, commit style by default is legacy for
all the ctm/gamma/degamma subtests.

In this patch, legacy commit is changed to atomic (since i915
no longer supports legacy commit)

v1: As per Daniel's comments switching over to atomic.
v2: As per Maarten's comments did COMMIT_ATOMIC, and added
    igt_require(display.is_atomic)
v3: Fixed stupid mistake, now test cases are not getting skipped

Need Feedback?
Still there are few functions like pipe_set_property_blob_id,
pipe_set_property_blob, invalid_lut_sizes where provision of
both legacy and atomic is there. Should I change them too to
atomic only like I did for other func?

Also, this patch is floating since ages, it will be nice if
I can have a closure(=&gt;rb) on this and move forward :)

Signed-off-by: Swati Sharma <a class="moz-txt-link-rfc2396E" href="mailto:swati2.sharma@intel.com">&lt;swati2.sharma@intel.com&gt;</a>
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Typed this on jira already months ago, replicating here: The idea is to
add an atomic test (with crc checks every frame and all that) to make sure
lut updates are atomic on screen.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I have a test for that. It needs my vblank workers (still a bit wip) to
actually work (well, mostly work).

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Switching to atomic commit style for
everything else just means we can't run this on older drivers anymore (not
that there are many of those left), which seems a bit pointless.
-Daniel</pre>
      </blockquote>
    </blockquote>
    <pre>Hi Daniel,
I think there is some misunderstanding from my end. When I first sent this patch as
an RFC <a href="https://patchwork.freedesktop.org/patch/254752/">https://patchwork.freedesktop.org/patch/254752/</a> there I had given provision
for both legacy and atomic.
That time feedback which I received was:
Imo just switch over to atomic. There's no upstream driver supporting
color management props that doesn't support atomic.
-Daniel
That's y I switched to atomic completely. 

I still feel provision for both legacy and atomic should be given. Though this change is
not adding atomic test(now which is already Ville is doing) but like other IGTs 
it should allow commit through both the paths.
Please do let me know what you think. Thanks in advance.
</pre>
    <blockquote type="cite" cite="mid:20190329103433.GR3888@intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">---
 tests/kms_color.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index decf3c2..92f5c12 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -63,7 +63,6 @@ typedef struct {
 	uint64_t gamma_lut_size;
 } data_t;
 
-
 static void paint_gradient_rectangles(data_t *data,
 				      drmModeModeInfo *mode,
 				      color_t *colors,
@@ -311,12 +310,12 @@ static void test_pipe_degamma(data_t *data,
 		disable_ctm(primary-&gt;pipe);
 		disable_degamma(primary-&gt;pipe);
 		set_gamma(data, primary-&gt;pipe, gamma_linear);
-		igt_display_commit(&amp;data-&gt;display);
+		igt_display_commit2(&amp;data-&gt;display, COMMIT_ATOMIC);
 
 		/* Draw solid colors with no degamma transformation. */
 		paint_rectangles(data, mode, red_green_blue, &amp;fb);
 		igt_plane_set_fb(primary, &amp;fb);
-		igt_display_commit(&amp;data-&gt;display);
+		igt_display_commit2(&amp;data-&gt;display, COMMIT_ATOMIC);
 		igt_wait_for_vblank(data-&gt;drm_fd, primary-&gt;pipe-&gt;pipe);
 		igt_pipe_crc_collect_crc(data-&gt;pipe_crc, &amp;crc_fullcolors);
 
@@ -326,7 +325,7 @@ static void test_pipe_degamma(data_t *data,
 		paint_gradient_rectangles(data, mode, red_green_blue, &amp;fb);
 		igt_plane_set_fb(primary, &amp;fb);
 		set_degamma(data, primary-&gt;pipe, degamma_full);
-		igt_display_commit(&amp;data-&gt;display);
+		igt_display_commit2(&amp;data-&gt;display, COMMIT_ATOMIC);
 		igt_wait_for_vblank(data-&gt;drm_fd, primary-&gt;pipe-&gt;pipe);
 		igt_pipe_crc_collect_crc(data-&gt;pipe_crc, &amp;crc_fullgamma);
 
@@ -391,12 +390,12 @@ static void test_pipe_gamma(data_t *data,
 		disable_ctm(primary-&gt;pipe);
 		disable_degamma(primary-&gt;pipe);
 		set_gamma(data, primary-&gt;pipe, gamma_full);
-		igt_display_commit(&amp;data-&gt;display);
+		igt_display_commit2(&amp;data-&gt;display, COMMIT_ATOMIC);
 
 		/* Draw solid colors with no gamma transformation. */
 		paint_rectangles(data, mode, red_green_blue, &amp;fb);
 		igt_plane_set_fb(primary, &amp;fb);
-		igt_display_commit(&amp;data-&gt;display);
+		igt_display_commit2(&amp;data-&gt;display, COMMIT_ATOMIC);
 		igt_wait_for_vblank(data-&gt;drm_fd, primary-&gt;pipe-&gt;pipe);
 		igt_pipe_crc_collect_crc(data-&gt;pipe_crc, &amp;crc_fullcolors);
 
@@ -405,7 +404,7 @@ static void test_pipe_gamma(data_t *data,
 		 */
 		paint_gradient_rectangles(data, mode, red_green_blue, &amp;fb);
 		igt_plane_set_fb(primary, &amp;fb);
-		igt_display_commit(&amp;data-&gt;display);
+		igt_display_commit2(&amp;data-&gt;display, COMMIT_ATOMIC);
 		igt_wait_for_vblank(data-&gt;drm_fd, primary-&gt;pipe-&gt;pipe);
 		igt_pipe_crc_collect_crc(data-&gt;pipe_crc, &amp;crc_fullgamma);
 
@@ -477,12 +476,12 @@ static void test_pipe_legacy_gamma(data_t *data,
 		disable_degamma(primary-&gt;pipe);
 		disable_gamma(primary-&gt;pipe);
 		disable_ctm(primary-&gt;pipe);
-		igt_display_commit(&amp;data-&gt;display);
+		igt_display_commit2(&amp;data-&gt;display, COMMIT_ATOMIC);
 
 		/* Draw solid colors with no gamma transformation. */
 		paint_rectangles(data, mode, red_green_blue, &amp;fb);
 		igt_plane_set_fb(primary, &amp;fb);
-		igt_display_commit(&amp;data-&gt;display);
+		igt_display_commit2(&amp;data-&gt;display, COMMIT_ATOMIC);
 		igt_wait_for_vblank(data-&gt;drm_fd, primary-&gt;pipe-&gt;pipe);
 		igt_pipe_crc_collect_crc(data-&gt;pipe_crc, &amp;crc_fullcolors);
 
@@ -497,7 +496,7 @@ static void test_pipe_legacy_gamma(data_t *data,
 			red_lut[i] = green_lut[i] = blue_lut[i] = 0xffff;
 		igt_assert_eq(drmModeCrtcSetGamma(data-&gt;drm_fd, primary-&gt;pipe-&gt;crtc_id,
 						  legacy_lut_size, red_lut, green_lut, blue_lut), 0);
-		igt_display_commit(&amp;data-&gt;display);
+		igt_display_commit2(&amp;data-&gt;display, COMMIT_ATOMIC);
 		igt_wait_for_vblank(data-&gt;drm_fd, primary-&gt;pipe-&gt;pipe);
 		igt_pipe_crc_collect_crc(data-&gt;pipe_crc, &amp;crc_fullgamma);
 
@@ -512,7 +511,7 @@ static void test_pipe_legacy_gamma(data_t *data,
 
 		igt_assert_eq(drmModeCrtcSetGamma(data-&gt;drm_fd, primary-&gt;pipe-&gt;crtc_id,
 						  legacy_lut_size, red_lut, green_lut, blue_lut), 0);
-		igt_display_commit(&amp;data-&gt;display);
+		igt_display_commit2(&amp;data-&gt;display, COMMIT_ATOMIC);
 
 		igt_plane_set_fb(primary, NULL);
 		igt_output_set_pipe(output, PIPE_NONE);
@@ -566,7 +565,7 @@ static void test_pipe_legacy_gamma_reset(data_t *data,
 		disable_degamma(primary-&gt;pipe);
 		disable_ctm(primary-&gt;pipe);
 		disable_gamma(primary-&gt;pipe);
-		igt_display_commit(&amp;data-&gt;display);
+		igt_display_commit2(&amp;data-&gt;display, COMMIT_ATOMIC);
 
 		/* Set a degama &amp; gamma LUT and a CTM using the
 		 * properties and verify the content of the
@@ -574,7 +573,7 @@ static void test_pipe_legacy_gamma_reset(data_t *data,
 		set_degamma(data, primary-&gt;pipe, degamma_linear);
 		set_ctm(primary-&gt;pipe, ctm_identity);
 		set_gamma(data, primary-&gt;pipe, gamma_zero);
-		igt_display_commit(&amp;data-&gt;display);
+		igt_display_commit2(&amp;data-&gt;display, COMMIT_ATOMIC);
 
 		blob = get_blob(data, primary-&gt;pipe, IGT_CRTC_DEGAMMA_LUT);
 		igt_assert(blob &amp;&amp;
@@ -617,7 +616,7 @@ static void test_pipe_legacy_gamma_reset(data_t *data,
 						  legacy_lut_size,
 						  red_lut, green_lut, blue_lut),
 			      0);
-		igt_display_commit(&amp;data-&gt;display);
+		igt_display_commit2(&amp;data-&gt;display, COMMIT_ATOMIC);
 
 		igt_assert(get_blob(data, primary-&gt;pipe,
 				    IGT_CRTC_DEGAMMA_LUT) == NULL);
@@ -699,12 +698,12 @@ static bool test_pipe_ctm(data_t *data,
 		set_degamma(data, primary-&gt;pipe, degamma_linear);
 		set_gamma(data, primary-&gt;pipe, gamma_linear);
 		disable_ctm(primary-&gt;pipe);
-		igt_display_commit(&amp;data-&gt;display);
+		igt_display_commit2(&amp;data-&gt;display, COMMIT_ATOMIC);
 
 		paint_rectangles(data, mode, after, &amp;fb);
 		igt_plane_set_fb(primary, &amp;fb);
 		set_ctm(primary-&gt;pipe, ctm_identity);
-		igt_display_commit(&amp;data-&gt;display);
+		igt_display_commit2(&amp;data-&gt;display, COMMIT_ATOMIC);
 		igt_wait_for_vblank(data-&gt;drm_fd, primary-&gt;pipe-&gt;pipe);
 		igt_pipe_crc_collect_crc(data-&gt;pipe_crc, &amp;crc_software);
 
@@ -712,7 +711,7 @@ static bool test_pipe_ctm(data_t *data,
 		paint_rectangles(data, mode, before, &amp;fb);
 		igt_plane_set_fb(primary, &amp;fb);
 		set_ctm(primary-&gt;pipe, ctm_matrix);
-		igt_display_commit(&amp;data-&gt;display);
+		igt_display_commit2(&amp;data-&gt;display, COMMIT_ATOMIC);
 		igt_wait_for_vblank(data-&gt;drm_fd, primary-&gt;pipe-&gt;pipe);
 		igt_pipe_crc_collect_crc(data-&gt;pipe_crc, &amp;crc_hardware);
 
@@ -807,7 +806,7 @@ static void test_pipe_limited_range_ctm(data_t *data,
 		igt_output_set_prop_value(output, IGT_CONNECTOR_BROADCAST_RGB, BROADCAST_RGB_FULL);
 		paint_rectangles(data, mode, red_green_blue_limited, &amp;fb);
 		igt_plane_set_fb(primary, &amp;fb);
-		igt_display_commit(&amp;data-&gt;display);
+		igt_display_commit2(&amp;data-&gt;display, COMMIT_ATOMIC);
 		igt_wait_for_vblank(data-&gt;drm_fd, primary-&gt;pipe-&gt;pipe);
 		igt_pipe_crc_collect_crc(data-&gt;pipe_crc, &amp;crc_full);
 
@@ -815,7 +814,7 @@ static void test_pipe_limited_range_ctm(data_t *data,
 		igt_output_set_prop_value(output, IGT_CONNECTOR_BROADCAST_RGB, BROADCAST_RGB_16_235);
 		paint_rectangles(data, mode, red_green_blue_full, &amp;fb);
 		igt_plane_set_fb(primary, &amp;fb);
-		igt_display_commit(&amp;data-&gt;display);
+		igt_display_commit2(&amp;data-&gt;display, COMMIT_ATOMIC);
 		igt_wait_for_vblank(data-&gt;drm_fd, primary-&gt;pipe-&gt;pipe);
 		igt_pipe_crc_collect_crc(data-&gt;pipe_crc, &amp;crc_limited);
 
@@ -1043,7 +1042,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 		disable_degamma(primary-&gt;pipe);
 		disable_gamma(primary-&gt;pipe);
 		disable_ctm(primary-&gt;pipe);
-		igt_display_commit(&amp;data-&gt;display);
+		igt_display_commit2(&amp;data-&gt;display, COMMIT_ATOMIC);
 
 		igt_pipe_crc_free(data-&gt;pipe_crc);
 		data-&gt;pipe_crc = NULL;
@@ -1085,7 +1084,7 @@ invalid_lut_sizes(data_t *data)
 	struct _drm_color_lut *degamma_lut = malloc(data-&gt;degamma_lut_size * sizeof(struct _drm_color_lut) * 2);
 	struct _drm_color_lut *gamma_lut = malloc(data-&gt;gamma_lut_size * sizeof(struct _drm_color_lut) * 2);
 
-	igt_display_commit2(display, display-&gt;is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+	igt_display_commit2(display, COMMIT_ATOMIC);
 
 	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_DEGAMMA_LUT)) {
 		igt_assert_eq(pipe_set_property_blob(pipe, IGT_CRTC_DEGAMMA_LUT,
@@ -1173,6 +1172,7 @@ igt_main
 		kmstest_set_vt_graphics_mode();
 
 		igt_display_require(&amp;data.display, data.drm_fd);
+		igt_require(data.display.is_atomic);
 	}
 
 	for_each_pipe_static(pipe)
-- 
1.9.1

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
-- 
Daniel Vetter
Software Engineer, Intel Corporation
<a class="moz-txt-link-freetext" href="http://blog.ffwll.ch">http://blog.ffwll.ch</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
~Swati Sharma
</pre>
  </body>
</html>

--------------1CC87771DB28A7298647B962--

--===============2098545937==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============2098545937==--
