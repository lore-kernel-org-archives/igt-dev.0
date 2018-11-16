Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 070CC6E6DD
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Nov 2018 12:28:12 +0000 (UTC)
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
References: <1540473975-32669-1-git-send-email-juhapekka.heikkila@gmail.com>
 <1540558693-28252-1-git-send-email-juhapekka.heikkila@gmail.com>
Message-ID: <d44881f5-2e61-3e0f-f1ce-e5991771aa1f@intel.com>
Date: Fri, 16 Nov 2018 17:58:06 +0530
MIME-Version: 1.0
In-Reply-To: <1540558693-28252-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_rotation_crc: Add multi plane
 tests.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1182282719=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1182282719==
Content-Type: multipart/alternative;
 boundary="------------1CADA74B083C053BFAD726AD"

This is a multi-part message in MIME format.
--------------1CADA74B083C053BFAD726AD
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juha-Pekka,

The new test added do cover the gap of having multiple-plane rotation 
together, along with the top and bottom cropping scenarios.

The test work well for square figures i.e. the width = height =512, but 
for rectangular figure, the test needs some fix in get_multiplane_crc(), 
as this function does not assume that the width and height are same.

Please find suggestions inline.

Other than that, I could only nitpick some of the styling issues given 
inline.

On 10/26/2018 6:28 PM, Juha-Pekka Heikkila wrote:
> Add three new tests which try primary and sprite planes
> next to each other with different plane formats, rotations
> and tiling modes.
>
> multiplane-rotation subtest run test through with both planes
> fully visible.
>
> multiplane-rotation-cropping-top will crop primary plane to
> left/top corner and sprite plane to right/top corner while running
> rotation tests.
>
> multiplane-rotation-cropping-bottom will crop primary plane to
> left/bottom corner and sprite plane to right/bottom corner while
> running rotation tests.
>
> Signed-off-by: Juha-Pekka Heikkila<juhapekka.heikkila@gmail.com>
> ---
>   tests/kms_rotation_crc.c | 249 +++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 249 insertions(+)
>
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index 366c254..df9ac91 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -26,6 +26,25 @@
>   #include <math.h>
>   
>   #define MAX_FENCES 32
> +#define MAXMULTIPLANESAMOUNT 2
> +
> +struct p_struct {
> +	igt_plane_t *plane;
> +	struct igt_fb fb;
> +};
> +
> +enum p_pointorigo {
> +	p_top = 1 << 0,
> +	p_bottom = 1 << 1,
> +	p_left = 1 << 2,
> +	p_right = 1 << 3
> +};
> +
> +struct p_point{
> +	enum p_pointorigo origo;
> +	int32_t x;
> +	int32_t y;
> +};
>   
>   typedef struct {
>   	int gfx_fd;
> @@ -43,6 +62,9 @@ typedef struct {
>   	uint32_t override_fmt;
>   	uint64_t override_tiling;
>   	int devid;
> +
> +	struct p_struct *multiplaneoldview;
> +	struct p_point planepos[MAXMULTIPLANESAMOUNT];
>   } data_t;
>   
>   typedef struct {
> @@ -395,6 +417,197 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
>   	}
>   }
>   
> +typedef struct {
> +	int32_t x1, y1;
> +	uint64_t width, height, tiling, planetype, format;
> +	igt_rotation_t rotation_sw, rotation_hw;
> +} planeinfos;
> +
> +static void get_multiplane_crc(data_t *data, igt_output_t *output,
> +			       igt_crc_t *crc_output, planeinfos* planeinfo,
> +			       int numplanes)
> +{
> +	uint32_t w, h;
> +	igt_display_t *display = &data->display;
> +	struct p_struct *planes, *oldplanes;
> +	int c, ret;
> +
> +	oldplanes = data->multiplaneoldview;
> +	planes = malloc(sizeof(*planes)*numplanes);
> +
> +	for (c = 0; c < numplanes; c++) {
> +		planes[c].plane = igt_output_get_plane_type(output,
> +							    planeinfo[c].planetype);
> +
> +		w = planeinfo[c].width;
> +		h = planeinfo[c].height;
> +
> +		if ((planeinfo[c].rotation_hw|planeinfo[c].rotation_sw)
> +		    &(IGT_ROTATION_90|IGT_ROTATION_270))
> +			igt_swap(w, h);
> +
In case of an actual hardware rotation 90 and 270, the width and height 
should not be swapped.
The 'if condition' should have only check for rotation_sw, and not for 
rotation_hw.

> +		igt_plane_set_size(planes[c].plane, w, h);
For 90 and 270 degree rotation (i.e. rotation_hw) , igt_plane_set_size() 
should have height in place of width and vice-versa.

if (rotation_hw & (IGT_ROTATION_90 | IGT_ROTATION_270)
         igt_plane_set_size(plane[c].plane, h, w);

Further more this function igt_plane_set_size should be called after 
igt_plane_set_fb(), because igt_plane_set_fb sets the plane size with 
fb.width and fb.height, thereby overwriting our values.

> +
> +		igt_create_fb(data->gfx_fd, w, h, planeinfo[c].format,
> +			      planeinfo[c].tiling, &planes[c].fb);
> +
> +		paint_squares(data, planeinfo[c].rotation_sw, &planes[c].fb, 1.0f);
> +		igt_plane_set_fb(planes[c].plane, &planes[c].fb);
> +		igt_plane_set_position(planes[c].plane, planeinfo[c].x1, planeinfo[c].y1);
> +		igt_plane_set_rotation(planes[c].plane, planeinfo[c].rotation_hw);
> +	}
> +
> +	ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
> +	igt_assert_eq(ret, 0);
> +
> +	igt_pipe_crc_get_current(data->gfx_fd, data->pipe_crc, crc_output);
> +
> +	for (c = 0; c < numplanes && oldplanes; c++)
> +		igt_remove_fb(data->gfx_fd, &oldplanes[c].fb);
> +
> +	free(oldplanes);
> +	data->multiplaneoldview = (void*)planes;
> +}
> +
> +static void pointlocation(data_t *data, planeinfos* p, drmModeModeInfo *mode,
> +			  int c)
> +{
> +	p[c].x1 = data->planepos[c].x
> +			+((data->planepos[c].origo&p_right)?mode->hdisplay:0);
> +	p[c].y1 = data->planepos[c].y
> +			+((data->planepos[c].origo&p_bottom)?mode->vdisplay:0);
> +}

Space around '&' and '?'

> +
> +/*
> + * Here is pipe parameter which is now used only for first pipe.
> + * It is left here if this test ever was wanted to be run on
> + * different pipes.
> + */
> +static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
> +{
> +	igt_display_t *display = &data->display;
> +	igt_output_t *output;
> +	igt_crc_t retcrc_sw, retcrc_hw;
> +	planeinfos p[2];
> +	int c;
> +	struct p_struct *oldplanes;
> +	drmModeModeInfo *mode;
> +
> +	const static struct {
> +		igt_rotation_t	rotation;
> +		uint64_t	width;
> +		uint64_t	height;
> +		uint64_t	tiling;
> +	} planeconfigs[] = {
> +	{IGT_ROTATION_0, 512, 512, LOCAL_DRM_FORMAT_MOD_NONE },

In my humble opinion, we can use a rectangle content, instead of a 
square content. The function get_muliplane_crc already takes care of 
different width and height.
Only change will be required in function point_location.

> +	{IGT_ROTATION_0, 512, 512, LOCAL_I915_FORMAT_MOD_X_TILED },
> +	{IGT_ROTATION_0, 512, 512, LOCAL_I915_FORMAT_MOD_Y_TILED },
> +	{IGT_ROTATION_0, 512, 512, LOCAL_I915_FORMAT_MOD_Yf_TILED },
> +	{IGT_ROTATION_90, 512, 512, LOCAL_I915_FORMAT_MOD_Y_TILED },
> +	{IGT_ROTATION_90, 512, 512, LOCAL_I915_FORMAT_MOD_Yf_TILED },
> +	{IGT_ROTATION_180, 512, 512, LOCAL_DRM_FORMAT_MOD_NONE },
> +	{IGT_ROTATION_180, 512, 512, LOCAL_I915_FORMAT_MOD_X_TILED },
> +	{IGT_ROTATION_180, 512, 512, LOCAL_I915_FORMAT_MOD_Y_TILED },
> +	{IGT_ROTATION_180, 512, 512, LOCAL_I915_FORMAT_MOD_Yf_TILED },
> +	{IGT_ROTATION_270, 512, 512, LOCAL_I915_FORMAT_MOD_Y_TILED },
> +	{IGT_ROTATION_270, 512, 512, LOCAL_I915_FORMAT_MOD_Yf_TILED },
> +	};
> +
> +	/*
> +	* These are those modes which are tested. For testing feel interesting
> +	* case with tiling are 2 byte wide and 4 byte wide.
> +	*
> +	* TODO:
> +	* Built support for NV12 here.
> +	*/
> +	const static uint32_t  formatlist[] = {DRM_FORMAT_RGB565,
> +					       DRM_FORMAT_XRGB8888};
> +
> +
> +	for_each_valid_output_on_pipe(display, pipe, output) {
> +		int i, j, k, l;
> +		igt_output_set_pipe(output, pipe);
> +
> +		mode = igt_output_get_mode(output);
> +
> +		igt_display_require_output(display);
> +		igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +		data->pipe_crc = igt_pipe_crc_new(data->gfx_fd, pipe,
> +						  INTEL_PIPE_CRC_SOURCE_AUTO);
> +		igt_pipe_crc_start(data->pipe_crc);
> +
> +		for (i = 0; i < ARRAY_SIZE(planeconfigs); i++) {
> +			p[0].planetype = DRM_PLANE_TYPE_PRIMARY;
> +			p[0].width = planeconfigs[i].width;
> +			p[0].height = planeconfigs[i].height;
> +			p[0].tiling = planeconfigs[i].tiling;
> +			pointlocation(data, (planeinfos*)&p, mode, 0);
> +
> +			for (k = 0; k < ARRAY_SIZE(formatlist); k++) {
> +				p[0].format = formatlist[k];
> +
> +				for (j = 0; j < ARRAY_SIZE(planeconfigs); j++) {
> +					p[1].planetype = DRM_PLANE_TYPE_OVERLAY;
> +					p[1].width = planeconfigs[j].width;
> +					p[1].height = planeconfigs[j].height;
> +					p[1].tiling = planeconfigs[j].tiling;
> +					pointlocation(data, (planeinfos*)&p,
> +						      mode, 1);
> +
> +					for (l = 0; l < ARRAY_SIZE(formatlist); l++) {
> +						p[1].format = formatlist[l];
> +
> +						/*
> +						 * RGB565 90/270 degrees rotation is supported
> +						 * from gen11 onwards.
> +						 */
> +						if (p[0].format == DRM_FORMAT_RGB565 &&
> +						     (planeconfigs[i].rotation&(IGT_ROTATION_90|IGT_ROTATION_270))
> +						     && intel_gen(data->devid) < 11)
> +							continue;
> +
> +						if (p[1].format == DRM_FORMAT_RGB565 &&
> +						     (planeconfigs[j].rotation&(IGT_ROTATION_90|IGT_ROTATION_270))
Space around '&' and '|'
> +						     && intel_gen(data->devid) < 11)
> +							continue;
> +
> +
> +						p[0].rotation_sw = planeconfigs[i].rotation;
> +						p[0].rotation_hw = IGT_ROTATION_0;
> +						p[1].rotation_sw = planeconfigs[j].rotation;
> +						p[1].rotation_hw = IGT_ROTATION_0;
> +						get_multiplane_crc(data, output, &retcrc_sw,
> +								   (planeinfos*)&p, MAXMULTIPLANESAMOUNT);
> +
> +						igt_swap(p[0].rotation_sw, p[0].rotation_hw);
> +						igt_swap(p[1].rotation_sw, p[1].rotation_hw);
> +						get_multiplane_crc(data, output, &retcrc_hw,
> +								   (planeinfos*)&p, MAXMULTIPLANESAMOUNT);
> +
> +						igt_assert_crc_equal(&retcrc_sw, &retcrc_hw);
> +					}
> +				}
> +			}
> +		}
> +		igt_pipe_crc_stop(data->pipe_crc);
> +		igt_pipe_crc_free(data->pipe_crc);
> +		igt_output_set_pipe(output, PIPE_ANY);
> +	}
> +
> +	/*
> +	* Old fbs are deleted only after new ones are set on planes.
> +	* This is done to speed up the test
> +	*/
> +	oldplanes = data->multiplaneoldview;
> +	for (c = 0; c < MAXMULTIPLANESAMOUNT && oldplanes; c++)
> +		igt_remove_fb(data->gfx_fd, &oldplanes[c].fb);
> +
> +	free(oldplanes);
> +	data->multiplaneoldview = NULL;
> +	data->pipe_crc = NULL;
> +}
> +
>   static void test_plane_rotation_exhaust_fences(data_t *data,
>   					       enum pipe pipe,
>   					       igt_output_t *output,
> @@ -595,6 +808,42 @@ igt_main
>   		}
>   	}
>   
> +	igt_subtest_f("multiplane-rotation") {
> +		igt_require(gen >= 9);
> +		cleanup_crtc(&data);
> +		data.planepos[0].origo = p_top|p_left;
> +		data.planepos[0].x = 128;
> +		data.planepos[0].y = 128;
> +		data.planepos[1].origo = p_top|p_right;
> +		data.planepos[1].x = -128-512;
Space around '|' and '-' operators. Valid for few more lines below.
Not sure if we will ever hit a case where there is a lower resolution 
e.g. 640x480, the figure will be cropped, which is not desired, the test 
however would still pass as crc would match.
Perhaps we can skip if resolution is less than some threshold.

> +		data.planepos[1].y = 128;
> +		test_multi_plane_rotation(&data, 0);
> +	}
> +
> +	igt_subtest_f("multiplane-rotation-cropping-top") {
> +		igt_require(gen >= 9);
> +		cleanup_crtc(&data);
> +		data.planepos[0].origo = p_top|p_left;
> +		data.planepos[0].x = -128;
> +		data.planepos[0].y = -128;
> +		data.planepos[1].origo = p_top|p_right;
> +		data.planepos[1].x = -512+128;
> +		data.planepos[1].y = -128;
> +		test_multi_plane_rotation(&data, 0);
> +	}
> +
> +	igt_subtest_f("multiplane-rotation-cropping-bottom") {
> +		igt_require(gen >= 9);
> +		cleanup_crtc(&data);
> +		data.planepos[0].origo = p_bottom|p_left;
> +		data.planepos[0].x = -128;
> +		data.planepos[0].y = -512+128;
> +		data.planepos[1].origo = p_bottom|p_right;
> +		data.planepos[1].x = -512+128;
> +		data.planepos[1].y = -512+128;
> +		test_multi_plane_rotation(&data, 0);
> +	}
> +
>   	/*
>   	 * exhaust-fences should be last test, if it fails we may OOM in
>   	 * the following subtests otherwise.
>
>    
>

--------------1CADA74B083C053BFAD726AD
Content-Type: text/html; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html;
      charset=3Diso-8859-15">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    <p>Hi Juha-Pekka,<br>
    </p>
    <p>The new test added do cover the gap of having multiple-plane
      rotation together, along with the top and bottom cropping
      scenarios. <br>
    </p>
    <p>The test work well for square figures i.e. the width =3D height
      =3D512, but for rectangular figure, the test needs some fix in
      get_multiplane_crc(), as this function does not assume that the
      width and height are same.</p>
    <p>Please find suggestions inline.</p>
    Other than that, I could only nitpick some of the styling issues
    given inline.<br>
    <br>
    On 10/26/2018 6:28 PM, Juha-Pekka Heikkila wrote:<br>
    <blockquote
cite=3D"mid:1540558693-28252-1-git-send-email-juhapekka.heikkila@gmail.com"
      type=3D"cite">
      <pre wrap=3D"">Add three new tests which try primary and sprite planes
next to each other with different plane formats, rotations
and tiling modes.

multiplane-rotation subtest run test through with both planes
fully visible.

multiplane-rotation-cropping-top will crop primary plane to
left/top corner and sprite plane to right/top corner while running
rotation tests.

multiplane-rotation-cropping-bottom will crop primary plane to
left/bottom corner and sprite plane to right/bottom corner while
running rotation tests.

Signed-off-by: Juha-Pekka Heikkila <a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:juhapekka.heikkila@gmail.com">&lt;juhapekka.heikkila@gmail.com&g=
t;</a>
---
 tests/kms_rotation_crc.c | 249 +++++++++++++++++++++++++++++++++++++++++++=
++++
 1 file changed, 249 insertions(+)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 366c254..df9ac91 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -26,6 +26,25 @@
 #include &lt;math.h&gt;
=20
 #define MAX_FENCES 32
+#define MAXMULTIPLANESAMOUNT 2
+
+struct p_struct {
+	igt_plane_t *plane;
+	struct igt_fb fb;
+};
+
+enum p_pointorigo {
+	p_top =3D 1 &lt;&lt; 0,
+	p_bottom =3D 1 &lt;&lt; 1,
+	p_left =3D 1 &lt;&lt; 2,
+	p_right =3D 1 &lt;&lt; 3
+};
+
+struct p_point{
+	enum p_pointorigo origo;
+	int32_t x;
+	int32_t y;
+};
=20
 typedef struct {
 	int gfx_fd;
@@ -43,6 +62,9 @@ typedef struct {
 	uint32_t override_fmt;
 	uint64_t override_tiling;
 	int devid;
+
+	struct p_struct *multiplaneoldview;
+	struct p_point planepos[MAXMULTIPLANESAMOUNT];
 } data_t;
=20
 typedef struct {
@@ -395,6 +417,197 @@ static void test_plane_rotation(data_t *data, int pla=
ne_type, bool test_bad_form
 	}
 }
=20
+typedef struct {
+	int32_t x1, y1;
+	uint64_t width, height, tiling, planetype, format;
+	igt_rotation_t rotation_sw, rotation_hw;
+} planeinfos;
+
+static void get_multiplane_crc(data_t *data, igt_output_t *output,
+			       igt_crc_t *crc_output, planeinfos* planeinfo,
+			       int numplanes)
+{
+	uint32_t w, h;
+	igt_display_t *display =3D &amp;data-&gt;display;
+	struct p_struct *planes, *oldplanes;
+	int c, ret;
+
+	oldplanes =3D data-&gt;multiplaneoldview;
+	planes =3D malloc(sizeof(*planes)*numplanes);
+
+	for (c =3D 0; c &lt; numplanes; c++) {
+		planes[c].plane =3D igt_output_get_plane_type(output,
+							    planeinfo[c].planetype);
+
+		w =3D planeinfo[c].width;
+		h =3D planeinfo[c].height;
+
+		if ((planeinfo[c].rotation_hw|planeinfo[c].rotation_sw)
+		    &amp;(IGT_ROTATION_90|IGT_ROTATION_270))
+			igt_swap(w, h);
+</pre>
    </blockquote>
    In case of an actual hardware rotation 90 and 270, the width and
    height should not be swapped.<br>
    The 'if condition' should have only check for rotation_sw, and not
    for rotation_hw.<br>
    <br>
    <blockquote
cite=3D"mid:1540558693-28252-1-git-send-email-juhapekka.heikkila@gmail.com"
      type=3D"cite">
      <pre wrap=3D"">
+		igt_plane_set_size(planes[c].plane, w, h);</pre>
    </blockquote>
    For 90 and 270 degree rotation (i.e. rotation_hw) ,=A0
    igt_plane_set_size() should have height in place of width and
    vice-versa.<br>
    <br>
    if (rotation_hw &amp; (IGT_ROTATION_90 | IGT_ROTATION_270)<br>
    =A0=A0=A0 =A0=A0=A0 igt_plane_set_size(plane[c].plane, h, w);<br>
    <br>
    Further more this function igt_plane_set_size should be called after
    igt_plane_set_fb(), because igt_plane_set_fb sets the plane size
    with fb.width and fb.height, thereby overwriting our values.<br>
    <br>
    <blockquote
cite=3D"mid:1540558693-28252-1-git-send-email-juhapekka.heikkila@gmail.com"
      type=3D"cite">
      <pre wrap=3D"">
+
+		igt_create_fb(data-&gt;gfx_fd, w, h, planeinfo[c].format,
+			      planeinfo[c].tiling, &amp;planes[c].fb);
+
+		paint_squares(data, planeinfo[c].rotation_sw, &amp;planes[c].fb, 1.0f);
+		igt_plane_set_fb(planes[c].plane, &amp;planes[c].fb);
+		igt_plane_set_position(planes[c].plane, planeinfo[c].x1, planeinfo[c].y1=
);
+		igt_plane_set_rotation(planes[c].plane, planeinfo[c].rotation_hw);
+	}
+
+	ret =3D igt_display_try_commit2(display, COMMIT_ATOMIC);
+	igt_assert_eq(ret, 0);
+
+	igt_pipe_crc_get_current(data-&gt;gfx_fd, data-&gt;pipe_crc, crc_output);
+
+	for (c =3D 0; c &lt; numplanes &amp;&amp; oldplanes; c++)
+		igt_remove_fb(data-&gt;gfx_fd, &amp;oldplanes[c].fb);
+
+	free(oldplanes);
+	data-&gt;multiplaneoldview =3D (void*)planes;
+}
+
+static void pointlocation(data_t *data, planeinfos* p, drmModeModeInfo *mo=
de,
+			  int c)
+{
+	p[c].x1 =3D data-&gt;planepos[c].x
+			+((data-&gt;planepos[c].origo&amp;p_right)?mode-&gt;hdisplay:0);
+	p[c].y1 =3D data-&gt;planepos[c].y
+			+((data-&gt;planepos[c].origo&amp;p_bottom)?mode-&gt;vdisplay:0);
+}</pre>
    </blockquote>
    <br>
    Space around '&amp;' and '?'<br>
    <br>
    <blockquote
cite=3D"mid:1540558693-28252-1-git-send-email-juhapekka.heikkila@gmail.com"
      type=3D"cite">
      <pre wrap=3D"">+
+/*
+ * Here is pipe parameter which is now used only for first pipe.
+ * It is left here if this test ever was wanted to be run on
+ * different pipes.
+ */
+static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
+{
+	igt_display_t *display =3D &amp;data-&gt;display;
+	igt_output_t *output;
+	igt_crc_t retcrc_sw, retcrc_hw;
+	planeinfos p[2];
+	int c;
+	struct p_struct *oldplanes;
+	drmModeModeInfo *mode;
+
+	const static struct {
+		igt_rotation_t	rotation;
+		uint64_t	width;
+		uint64_t	height;
+		uint64_t	tiling;
+	} planeconfigs[] =3D {
+	{IGT_ROTATION_0, 512, 512, LOCAL_DRM_FORMAT_MOD_NONE },</pre>
    </blockquote>
    <br>
    In my humble opinion, we can use a rectangle content, instead of a
    square content. The function get_muliplane_crc already takes care of
    different width and height.<br>
    Only change will be required in function point_location.<br>
    <br>
    <blockquote
cite=3D"mid:1540558693-28252-1-git-send-email-juhapekka.heikkila@gmail.com"
      type=3D"cite">
      <pre wrap=3D"">+	{IGT_ROTATION_0, 512, 512, LOCAL_I915_FORMAT_MOD_X_T=
ILED },
+	{IGT_ROTATION_0, 512, 512, LOCAL_I915_FORMAT_MOD_Y_TILED },
+	{IGT_ROTATION_0, 512, 512, LOCAL_I915_FORMAT_MOD_Yf_TILED },
+	{IGT_ROTATION_90, 512, 512, LOCAL_I915_FORMAT_MOD_Y_TILED },
+	{IGT_ROTATION_90, 512, 512, LOCAL_I915_FORMAT_MOD_Yf_TILED },
+	{IGT_ROTATION_180, 512, 512, LOCAL_DRM_FORMAT_MOD_NONE },
+	{IGT_ROTATION_180, 512, 512, LOCAL_I915_FORMAT_MOD_X_TILED },
+	{IGT_ROTATION_180, 512, 512, LOCAL_I915_FORMAT_MOD_Y_TILED },
+	{IGT_ROTATION_180, 512, 512, LOCAL_I915_FORMAT_MOD_Yf_TILED },
+	{IGT_ROTATION_270, 512, 512, LOCAL_I915_FORMAT_MOD_Y_TILED },
+	{IGT_ROTATION_270, 512, 512, LOCAL_I915_FORMAT_MOD_Yf_TILED },
+	};
+
+	/*
+	* These are those modes which are tested. For testing feel interesting
+	* case with tiling are 2 byte wide and 4 byte wide.
+	*
+	* TODO:
+	* Built support for NV12 here.
+	*/
+	const static uint32_t  formatlist[] =3D {DRM_FORMAT_RGB565,
+					       DRM_FORMAT_XRGB8888};
+
+
+	for_each_valid_output_on_pipe(display, pipe, output) {
+		int i, j, k, l;
+		igt_output_set_pipe(output, pipe);
+
+		mode =3D igt_output_get_mode(output);
+
+		igt_display_require_output(display);
+		igt_display_commit2(display, COMMIT_ATOMIC);
+
+		data-&gt;pipe_crc =3D igt_pipe_crc_new(data-&gt;gfx_fd, pipe,
+						  INTEL_PIPE_CRC_SOURCE_AUTO);
+		igt_pipe_crc_start(data-&gt;pipe_crc);
+
+		for (i =3D 0; i &lt; ARRAY_SIZE(planeconfigs); i++) {
+			p[0].planetype =3D DRM_PLANE_TYPE_PRIMARY;
+			p[0].width =3D planeconfigs[i].width;
+			p[0].height =3D planeconfigs[i].height;
+			p[0].tiling =3D planeconfigs[i].tiling;
+			pointlocation(data, (planeinfos*)&amp;p, mode, 0);
+
+			for (k =3D 0; k &lt; ARRAY_SIZE(formatlist); k++) {
+				p[0].format =3D formatlist[k];
+
+				for (j =3D 0; j &lt; ARRAY_SIZE(planeconfigs); j++) {
+					p[1].planetype =3D DRM_PLANE_TYPE_OVERLAY;
+					p[1].width =3D planeconfigs[j].width;
+					p[1].height =3D planeconfigs[j].height;
+					p[1].tiling =3D planeconfigs[j].tiling;
+					pointlocation(data, (planeinfos*)&amp;p,
+						      mode, 1);
+
+					for (l =3D 0; l &lt; ARRAY_SIZE(formatlist); l++) {
+						p[1].format =3D formatlist[l];
+
+						/*
+						 * RGB565 90/270 degrees rotation is supported
+						 * from gen11 onwards.
+						 */
+						if (p[0].format =3D=3D DRM_FORMAT_RGB565 &amp;&amp;
+						     (planeconfigs[i].rotation&amp;(IGT_ROTATION_90|IGT_ROTATION_270=
))
+						     &amp;&amp; intel_gen(data-&gt;devid) &lt; 11)
+							continue;
+
+						if (p[1].format =3D=3D DRM_FORMAT_RGB565 &amp;&amp;
+						     (planeconfigs[j].rotation&amp;(IGT_ROTATION_90|IGT_ROTATION_270=
))</pre>
    </blockquote>
    Space around '&amp;' and '|'<br>
    <blockquote
cite=3D"mid:1540558693-28252-1-git-send-email-juhapekka.heikkila@gmail.com"
      type=3D"cite">
      <pre wrap=3D"">+						     &amp;&amp; intel_gen(data-&gt;devid) &lt; =
11)
+							continue;
+
+
+						p[0].rotation_sw =3D planeconfigs[i].rotation;
+						p[0].rotation_hw =3D IGT_ROTATION_0;
+						p[1].rotation_sw =3D planeconfigs[j].rotation;
+						p[1].rotation_hw =3D IGT_ROTATION_0;
+						get_multiplane_crc(data, output, &amp;retcrc_sw,
+								   (planeinfos*)&amp;p, MAXMULTIPLANESAMOUNT);
+
+						igt_swap(p[0].rotation_sw, p[0].rotation_hw);
+						igt_swap(p[1].rotation_sw, p[1].rotation_hw);
+						get_multiplane_crc(data, output, &amp;retcrc_hw,
+								   (planeinfos*)&amp;p, MAXMULTIPLANESAMOUNT);
+
+						igt_assert_crc_equal(&amp;retcrc_sw, &amp;retcrc_hw);
+					}
+				}
+			}
+		}
+		igt_pipe_crc_stop(data-&gt;pipe_crc);
+		igt_pipe_crc_free(data-&gt;pipe_crc);
+		igt_output_set_pipe(output, PIPE_ANY);
+	}
+
+	/*
+	* Old fbs are deleted only after new ones are set on planes.
+	* This is done to speed up the test
+	*/
+	oldplanes =3D data-&gt;multiplaneoldview;
+	for (c =3D 0; c &lt; MAXMULTIPLANESAMOUNT &amp;&amp; oldplanes; c++)
+		igt_remove_fb(data-&gt;gfx_fd, &amp;oldplanes[c].fb);
+
+	free(oldplanes);
+	data-&gt;multiplaneoldview =3D NULL;
+	data-&gt;pipe_crc =3D NULL;
+}
+
 static void test_plane_rotation_exhaust_fences(data_t *data,
 					       enum pipe pipe,
 					       igt_output_t *output,
@@ -595,6 +808,42 @@ igt_main
 		}
 	}
=20
+	igt_subtest_f("multiplane-rotation") {
+		igt_require(gen &gt;=3D 9);
+		cleanup_crtc(&amp;data);
+		data.planepos[0].origo =3D p_top|p_left;
+		data.planepos[0].x =3D 128;
+		data.planepos[0].y =3D 128;
+		data.planepos[1].origo =3D p_top|p_right;
+		data.planepos[1].x =3D -128-512;</pre>
    </blockquote>
    Space around '|' and '-' operators. Valid for few more lines below.<br>
    Not sure if we will ever hit a case where there is a lower
    resolution e.g. 640x480, the figure will be cropped, which is not
    desired, the test however would still pass as crc would match.<br>
    Perhaps we can skip if resolution is less than some threshold. <br>
    <br>
    <blockquote
cite=3D"mid:1540558693-28252-1-git-send-email-juhapekka.heikkila@gmail.com"
      type=3D"cite">
      <pre wrap=3D"">
+		data.planepos[1].y =3D 128;
+		test_multi_plane_rotation(&amp;data, 0);
+	}
+
+	igt_subtest_f("multiplane-rotation-cropping-top") {
+		igt_require(gen &gt;=3D 9);
+		cleanup_crtc(&amp;data);
+		data.planepos[0].origo =3D p_top|p_left;
+		data.planepos[0].x =3D -128;
+		data.planepos[0].y =3D -128;
+		data.planepos[1].origo =3D p_top|p_right;</pre>
    </blockquote>
    <blockquote
cite=3D"mid:1540558693-28252-1-git-send-email-juhapekka.heikkila@gmail.com"
      type=3D"cite">
      <pre wrap=3D"">+		data.planepos[1].x =3D -512+128;
+		data.planepos[1].y =3D -128;
+		test_multi_plane_rotation(&amp;data, 0);
+	}
+
+	igt_subtest_f("multiplane-rotation-cropping-bottom") {
+		igt_require(gen &gt;=3D 9);
+		cleanup_crtc(&amp;data);
+		data.planepos[0].origo =3D p_bottom|p_left;
+		data.planepos[0].x =3D -128;
+		data.planepos[0].y =3D -512+128;
+		data.planepos[1].origo =3D p_bottom|p_right;</pre>
    </blockquote>
    <blockquote
cite=3D"mid:1540558693-28252-1-git-send-email-juhapekka.heikkila@gmail.com"
      type=3D"cite">
      <pre wrap=3D"">+		data.planepos[1].x =3D -512+128;
+		data.planepos[1].y =3D -512+128;
+		test_multi_plane_rotation(&amp;data, 0);
+	}
+
 	/*
 	 * exhaust-fences should be last test, if it fails we may OOM in
 	 * the following subtests otherwise.

 =20

</pre>
    </blockquote>
  </body>
</html>

--------------1CADA74B083C053BFAD726AD--

--===============1182282719==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1182282719==--
