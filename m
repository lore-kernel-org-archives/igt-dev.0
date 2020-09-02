Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA806E486
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Sep 2020 11:58:42 +0000 (UTC)
From: "Peres, Martin" <martin.peres@intel.com>
Date: Wed, 2 Sep 2020 11:58:35 +0000
Message-ID: <ce3ea5ef2a9c4356a67288cf6d8adbfa@intel.com>
References: <20200728152321.18394-1-pankaj.laxminarayan.bharadiya@intel.com>
 <b708c1e9-9fc0-2c4c-d333-b05335e9fba6@intel.com>
 <20344fc88086405da4c16b250b07a06e@intel.com>
Content-Language: en-US
Content-Type: multipart/mixed;
 boundary="_002_ce3ea5ef2a9c4356a67288cf6d8adbfaintelcom_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] tests: Remove kms_crtc_background_color test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Laxminarayan Bharadiya, Pankaj" <pankaj.laxminarayan.bharadiya@intel.com>, "Sharma, Swati2" <swati2.sharma@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Roper, Matthew D" <matthew.d.roper@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--_002_ce3ea5ef2a9c4356a67288cf6d8adbfaintelcom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

+Matt=0A=
=0A=
Hi everyone,=0A=
=0A=
On 2020-09-02 11:34, Laxminarayan Bharadiya, Pankaj wrote:=0A=
>> -----Original Message-----=0A=
>> From: Sharma, Swati2 <swati2.sharma@intel.com>=0A=
>> Sent: 02 September 2020 13:59=0A=
>> To: Laxminarayan Bharadiya, Pankaj=0A=
>> <pankaj.laxminarayan.bharadiya@intel.com>; igt-dev@lists.freedesktop.org=
;=0A=
>> Martin Peres <martin.peres@linux.intel.com>=0A=
>> Subject: Re: [igt-dev] [i-g-t] tests: Remove kms_crtc_background_color t=
est=0A=
>>=0A=
>>=0A=
>>=0A=
>> On 28-Jul-20 8:53 PM, Pankaj Bharadiya wrote:=0A=
>>> BACKGROUND_COLOR property is not supported in kernel as of now.=0A=
>>> Following patch attempted to add support but never got merged due to=0A=
>>> lack of userspace support.=0A=
>>>=0A=
>>> https://patchwork.freedesktop.org/patch/333632/?series=3D67424&rev=3D1=
=0A=
>>>=0A=
>>> This test case is always skipped, as it does not find the=0A=
>>> BACKGROUND_COLOR prop support hence remove it.=0A=
>>=0A=
>> Why we have to remove the test? What if its supported in kernel in futur=
e?=0A=
>> If test is skipping; we can add it to blacklist (listing it as expected=
=0A=
>> skip)=0A=
> =0A=
> IMO, first of all, this code should not have been added unless kernel sup=
ports it.=0A=
> It's a dead code.=0A=
> =0A=
> I don=92t think there a plan to add BACKGROUND_COLOR property in kernel s=
ince=0A=
> we don't have any reference user space implantation which uses/need this =
property.=0A=
=0A=
I tend to agree with Pankaj here. The code won't be gone, and this patch=0A=
can be reverted when the property lands in at least one DRM driver.=0A=
=0A=
That being said, please make sure with Matt that no activity is going on=0A=
around this property before landing this patch. If so, then this patch is:=
=0A=
=0A=
Acked-by: Martin Peres <martin.peres@linux.intel.com>=0A=
=0A=
Thanks,=0A=
Martin=0A=
=0A=
> =0A=
> Thanks,=0A=
> Pankaj=0A=
> =0A=
>>=0A=
>> Adding Martin Peres.=0A=
>>>=0A=
>>> Signed-off-by: Pankaj Bharadiya=0A=
>>> <pankaj.laxminarayan.bharadiya@intel.com>=0A=
>>> ---=0A=
>>>   lib/igt_kms.c                     |   1 -=0A=
>>>   lib/igt_kms.h                     |   3 +-=0A=
>>>   tests/Makefile.sources            |   1 -=0A=
>>>   tests/kms_crtc_background_color.c | 186 -----------------------------=
-=0A=
>>>   tests/meson.build                 |   1 -=0A=
>>>   5 files changed, 1 insertion(+), 191 deletions(-)=0A=
>>>   delete mode 100644 tests/kms_crtc_background_color.c=0A=
>>>=0A=
>>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index f57972f19..003f6af7b=
=0A=
>>> 100644=0A=
>>> --- a/lib/igt_kms.c=0A=
>>> +++ b/lib/igt_kms.c=0A=
>>> @@ -398,7 +398,6 @@ const char * const=0A=
>> igt_plane_prop_names[IGT_NUM_PLANE_PROPS] =3D {=0A=
>>>   };=0A=
>>>=0A=
>>>   const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] =3D {=0A=
>>> -	[IGT_CRTC_BACKGROUND] =3D "background_color",=0A=
>>>   	[IGT_CRTC_CTM] =3D "CTM",=0A=
>>>   	[IGT_CRTC_GAMMA_LUT] =3D "GAMMA_LUT",=0A=
>>>   	[IGT_CRTC_GAMMA_LUT_SIZE] =3D "GAMMA_LUT_SIZE", diff --git=0A=
>>> a/lib/igt_kms.h b/lib/igt_kms.h index 26dc9f5fb..954f7be52 100644=0A=
>>> --- a/lib/igt_kms.h=0A=
>>> +++ b/lib/igt_kms.h=0A=
>>> @@ -96,8 +96,7 @@ void kmstest_restore_vt_mode(void);=0A=
>>>   void kmstest_set_vt_text_mode(void);=0A=
>>>=0A=
>>>   enum igt_atomic_crtc_properties {=0A=
>>> -       IGT_CRTC_BACKGROUND =3D 0,=0A=
>>> -       IGT_CRTC_CTM,=0A=
>>> +       IGT_CRTC_CTM =3D 0,=0A=
>>>          IGT_CRTC_GAMMA_LUT,=0A=
>>>          IGT_CRTC_GAMMA_LUT_SIZE,=0A=
>>>          IGT_CRTC_DEGAMMA_LUT,=0A=
>>> diff --git a/tests/Makefile.sources b/tests/Makefile.sources index=0A=
>>> 93d7768c4..994011700 100644=0A=
>>> --- a/tests/Makefile.sources=0A=
>>> +++ b/tests/Makefile.sources=0A=
>>> @@ -40,7 +40,6 @@ TESTS_progs =3D \=0A=
>>>   	kms_ccs \=0A=
>>>   	kms_concurrent \=0A=
>>>   	kms_content_protection\=0A=
>>> -	kms_crtc_background_color \=0A=
>>>   	kms_cursor_crc \=0A=
>>>   	kms_cursor_edge_walk \=0A=
>>>   	kms_cursor_legacy \=0A=
>>> diff --git a/tests/kms_crtc_background_color.c=0A=
>>> b/tests/kms_crtc_background_color.c=0A=
>>> deleted file mode 100644=0A=
>>> index b4141b0df..000000000=0A=
>>> --- a/tests/kms_crtc_background_color.c=0A=
>>> +++ /dev/null=0A=
>>> @@ -1,186 +0,0 @@=0A=
>>> -/*=0A=
>>> - * Copyright =A9 2013,2014 Intel Corporation=0A=
>>> - *=0A=
>>> - * Permission is hereby granted, free of charge, to any person=0A=
>>> obtaining a=0A=
>>> - * copy of this software and associated documentation files (the=0A=
>>> "Software"),=0A=
>>> - * to deal in the Software without restriction, including without=0A=
>>> limitation=0A=
>>> - * the rights to use, copy, modify, merge, publish, distribute,=0A=
>>> sublicense,=0A=
>>> - * and/or sell copies of the Software, and to permit persons to whom=
=0A=
>>> the=0A=
>>> - * Software is furnished to do so, subject to the following conditions=
:=0A=
>>> - *=0A=
>>> - * The above copyright notice and this permission notice (including=0A=
>>> the next=0A=
>>> - * paragraph) shall be included in all copies or substantial portions=
=0A=
>>> of the=0A=
>>> - * Software.=0A=
>>> - *=0A=
>>> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,=0A=
>>> EXPRESS OR=0A=
>>> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF=0A=
>>> MERCHANTABILITY,=0A=
>>> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO=0A=
>> EVENT=0A=
>>> SHALL=0A=
>>> - * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,=0A=
>> DAMAGES=0A=
>>> OR OTHER=0A=
>>> - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,=0A=
>>> ARISING=0A=
>>> - * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR=0A=
>>> OTHER DEALINGS=0A=
>>> - * IN THE SOFTWARE.=0A=
>>> - *=0A=
>>> - */=0A=
>>> -=0A=
>>> -#include "igt.h"=0A=
>>> -#include <math.h>=0A=
>>> -=0A=
>>> -=0A=
>>> -IGT_TEST_DESCRIPTION("Test crtc background color feature");=0A=
>>> -=0A=
>>> -typedef struct {=0A=
>>> -	int gfx_fd;=0A=
>>> -	igt_display_t display;=0A=
>>> -	struct igt_fb fb;=0A=
>>> -	igt_crc_t ref_crc;=0A=
>>> -	igt_pipe_crc_t *pipe_crc;=0A=
>>> -} data_t;=0A=
>>> -=0A=
>>> -#define BLACK      0x000000           /* BGR 8bpc */=0A=
>>> -#define CYAN       0xFFFF00           /* BGR 8bpc */=0A=
>>> -#define PURPLE     0xFF00FF           /* BGR 8bpc */=0A=
>>> -#define WHITE      0xFFFFFF           /* BGR 8bpc */=0A=
>>> -=0A=
>>> -#define BLACK64    0x000000000000     /* BGR 16bpc */=0A=
>>> -#define CYAN64     0xFFFFFFFF0000     /* BGR 16bpc */=0A=
>>> -#define PURPLE64   0xFFFF0000FFFF     /* BGR 16bpc */=0A=
>>> -#define YELLOW64   0x0000FFFFFFFF     /* BGR 16bpc */=0A=
>>> -#define WHITE64    0xFFFFFFFFFFFF     /* BGR 16bpc */=0A=
>>> -#define RED64      0x00000000FFFF     /* BGR 16bpc */=0A=
>>> -#define GREEN64    0x0000FFFF0000     /* BGR 16bpc */=0A=
>>> -#define BLUE64     0xFFFF00000000     /* BGR 16bpc */=0A=
>>> -=0A=
>>> -static void=0A=
>>> -paint_background(data_t *data, struct igt_fb *fb, drmModeModeInfo=0A=
>> *mode,=0A=
>>> -		uint32_t background, double alpha)=0A=
>>> -{=0A=
>>> -	cairo_t *cr;=0A=
>>> -	int w, h;=0A=
>>> -	double r, g, b;=0A=
>>> -=0A=
>>> -	w =3D mode->hdisplay;=0A=
>>> -	h =3D mode->vdisplay;=0A=
>>> -=0A=
>>> -	cr =3D igt_get_cairo_ctx(data->gfx_fd, &data->fb);=0A=
>>> -=0A=
>>> -	/* Paint with background color */=0A=
>>> -	r =3D (double) (background & 0xFF) / 255.0;=0A=
>>> -	g =3D (double) ((background & 0xFF00) >> 8) / 255.0;=0A=
>>> -	b =3D (double) ((background & 0xFF0000) >> 16) / 255.0;=0A=
>>> -	igt_paint_color_alpha(cr, 0, 0, w, h, r, g, b, alpha);=0A=
>>> -=0A=
>>> -	igt_put_cairo_ctx(cr);=0A=
>>> -}=0A=
>>> -=0A=
>>> -static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe=
 pipe,=0A=
>>> -			igt_plane_t *plane, int opaque_buffer, int plane_color,=0A=
>>> -			uint64_t pipe_background_color)=0A=
>>> -{=0A=
>>> -	drmModeModeInfo *mode;=0A=
>>> -	igt_display_t *display =3D &data->display;=0A=
>>> -	int fb_id;=0A=
>>> -	double alpha;=0A=
>>> -=0A=
>>> -	igt_output_set_pipe(output, pipe);=0A=
>>> -=0A=
>>> -	/* create the pipe_crc object for this pipe */=0A=
>>> -	igt_pipe_crc_free(data->pipe_crc);=0A=
>>> -	data->pipe_crc =3D igt_pipe_crc_new(data->gfx_fd, pipe,=0A=
>> INTEL_PIPE_CRC_SOURCE_AUTO);=0A=
>>> -=0A=
>>> -	mode =3D igt_output_get_mode(output);=0A=
>>> -=0A=
>>> -	fb_id =3D igt_create_fb(data->gfx_fd,=0A=
>>> -			mode->hdisplay, mode->vdisplay,=0A=
>>> -			DRM_FORMAT_XRGB8888,=0A=
>>> -			LOCAL_DRM_FORMAT_MOD_NONE, /* tiled */=0A=
>>> -			&data->fb);=0A=
>>> -	igt_assert(fb_id);=0A=
>>> -=0A=
>>> -	/* To make FB pixel win with background color, set alpha as full opaq=
ue=0A=
>> */=0A=
>>> -	igt_pipe_set_prop_value(display, pipe, IGT_CRTC_BACKGROUND,=0A=
>> pipe_background_color);=0A=
>>> -	if (opaque_buffer)=0A=
>>> -		alpha =3D 1.0;    /* alpha 1 is fully opque */=0A=
>>> -	else=0A=
>>> -		alpha =3D 0.0;    /* alpha 0 is fully transparent */=0A=
>>> -	paint_background(data, &data->fb, mode, plane_color, alpha);=0A=
>>> -=0A=
>>> -	igt_plane_set_fb(plane, &data->fb);=0A=
>>> -	igt_display_commit2(display, COMMIT_UNIVERSAL);=0A=
>>> -}=0A=
>>> -=0A=
>>> -static void cleanup_crtc(data_t *data, igt_output_t *output,=0A=
>>> igt_plane_t *plane) -{=0A=
>>> -	igt_display_t *display =3D &data->display;=0A=
>>> -=0A=
>>> -	igt_pipe_crc_free(data->pipe_crc);=0A=
>>> -	data->pipe_crc =3D NULL;=0A=
>>> -=0A=
>>> -	igt_remove_fb(data->gfx_fd, &data->fb);=0A=
>>> -=0A=
>>> -	igt_pipe_obj_set_prop_value(plane->pipe, IGT_CRTC_BACKGROUND,=0A=
>> BLACK64);=0A=
>>> -	igt_plane_set_fb(plane, NULL);=0A=
>>> -	igt_output_set_pipe(output, PIPE_ANY);=0A=
>>> -=0A=
>>> -	igt_display_commit2(display, COMMIT_UNIVERSAL);=0A=
>>> -}=0A=
>>> -=0A=
>>> -static void test_crtc_background(data_t *data) -{=0A=
>>> -	igt_display_t *display =3D &data->display;=0A=
>>> -	igt_output_t *output;=0A=
>>> -	enum pipe pipe;=0A=
>>> -	int valid_tests =3D 0;=0A=
>>> -=0A=
>>> -	for_each_pipe_with_valid_output(display, pipe, output) {=0A=
>>> -		igt_plane_t *plane;=0A=
>>> -=0A=
>>> -		igt_output_set_pipe(output, pipe);=0A=
>>> -=0A=
>>> -		plane =3D igt_output_get_plane_type(output,=0A=
>> DRM_PLANE_TYPE_PRIMARY);=0A=
>>> -		igt_require(igt_pipe_has_prop(display, pipe,=0A=
>> IGT_CRTC_BACKGROUND));=0A=
>>> -=0A=
>>> -		prepare_crtc(data, output, pipe, plane, 1, PURPLE, BLACK64);=0A=
>>> -=0A=
>>> -		/* Now set background without using a plane, i.e.,=0A=
>>> -		 * Disable the plane to let hw background color win blend. */=0A=
>>> -		igt_plane_set_fb(plane, NULL);=0A=
>>> -		igt_pipe_set_prop_value(display, pipe,=0A=
>> IGT_CRTC_BACKGROUND, PURPLE64);=0A=
>>> -		igt_display_commit2(display, COMMIT_UNIVERSAL);=0A=
>>> -=0A=
>>> -		/* Try few other background colors */=0A=
>>> -		igt_pipe_set_prop_value(display, pipe,=0A=
>> IGT_CRTC_BACKGROUND, CYAN64);=0A=
>>> -		igt_display_commit2(display, COMMIT_UNIVERSAL);=0A=
>>> -=0A=
>>> -		igt_pipe_set_prop_value(display, pipe,=0A=
>> IGT_CRTC_BACKGROUND, YELLOW64);=0A=
>>> -		igt_display_commit2(display, COMMIT_UNIVERSAL);=0A=
>>> -=0A=
>>> -		igt_pipe_set_prop_value(display, pipe,=0A=
>> IGT_CRTC_BACKGROUND, RED64);=0A=
>>> -		igt_display_commit2(display, COMMIT_UNIVERSAL);=0A=
>>> -=0A=
>>> -		igt_pipe_set_prop_value(display, pipe,=0A=
>> IGT_CRTC_BACKGROUND, GREEN64);=0A=
>>> -		igt_display_commit2(display, COMMIT_UNIVERSAL);=0A=
>>> -=0A=
>>> -		igt_pipe_set_prop_value(display, pipe,=0A=
>> IGT_CRTC_BACKGROUND, BLUE64);=0A=
>>> -		igt_display_commit2(display, COMMIT_UNIVERSAL);=0A=
>>> -=0A=
>>> -		igt_pipe_set_prop_value(display, pipe,=0A=
>> IGT_CRTC_BACKGROUND, WHITE64);=0A=
>>> -		igt_display_commit2(display, COMMIT_UNIVERSAL);=0A=
>>> -=0A=
>>> -		valid_tests++;=0A=
>>> -		cleanup_crtc(data, output, plane);=0A=
>>> -	}=0A=
>>> -	igt_require_f(valid_tests, "no valid crtc/connector combinations=0A=
>> found\n");=0A=
>>> -}=0A=
>>> -=0A=
>>> -igt_simple_main=0A=
>>> -{=0A=
>>> -	data_t data =3D {};=0A=
>>> -=0A=
>>> -	data.gfx_fd =3D drm_open_driver(DRIVER_INTEL);=0A=
>>> -	igt_require_pipe_crc(data.gfx_fd);=0A=
>>> -	igt_display_require(&data.display, data.gfx_fd);=0A=
>>> -=0A=
>>> -	test_crtc_background(&data);=0A=
>>> -=0A=
>>> -	igt_display_fini(&data.display);=0A=
>>> -}=0A=
>>> diff --git a/tests/meson.build b/tests/meson.build index=0A=
>>> ca792ed86..a6e1b7fae 100644=0A=
>>> --- a/tests/meson.build=0A=
>>> +++ b/tests/meson.build=0A=
>>> @@ -24,7 +24,6 @@ test_progs =3D [=0A=
>>>   	'kms_ccs',=0A=
>>>   	'kms_concurrent',=0A=
>>>   	'kms_content_protection',=0A=
>>> -	'kms_crtc_background_color',=0A=
>>>   	'kms_cursor_crc',=0A=
>>>   	'kms_cursor_edge_walk',=0A=
>>>   	'kms_cursor_legacy',=0A=
>>>=0A=
>>=0A=
>> --=0A=
>> ~Swati Sharma=0A=
=0A=

--_002_ce3ea5ef2a9c4356a67288cf6d8adbfaintelcom_
Content-Type: application/pgp-keys; name="pEpkey.asc"
Content-Description: pEpkey.asc
Content-Disposition: attachment; filename="pEpkey.asc"; size=2233;
	creation-date="Wed, 02 Sep 2020 11:58:34 GMT";
	modification-date="Wed, 02 Sep 2020 11:58:34 GMT"
Content-Transfer-Encoding: base64

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCgptUUVOQkYwc2tFc0JDQURjUTVS
cG1SeWQreU5EbkJIcmpPeURLanpsVlJVSGNiRnU4TFRVWG0rdE1OaHZxeGdMCmRCWHI5c1I2S09N
U0UxZGp2czhBZXNNdXpqa293aVcwS3I2dVFuRlRxNVZWdGFGMmwyRVdPb1ZIYlJVejV6bGYKVFBV
ajlKbU1CWjVCVGFDekRGbjA1dUU3UklKamhpcUhyd0pnUlkzZjZGazZVUjdJUVJaUWZzQXRKZXBH
NUR5ZQpkcThjcHYrM0pFMUV1eDhMR0FOTzZxd25tOEU5ZkV6VDNNVjB4QTlZVGJmeE9Hcm5jV3lp
ZkhPNzBzWnUzZm5DCngyZXI5U29KVDhZM0VzSis1L0puSUMvWHFLV3VITTNaSEc2bXhFWFM2cC9E
R3hMQzg1OWhxN28xZ1Qvem1IYjcKRERVcXRWeWNqSDkzMFRuOVRJTnYrdFVXN2hseG9oaDlZQ2Zk
QUJFQkFBRzBKbEJsY21WekxDQk5ZWEowYVc0ZwpQRzFoY25ScGJpNXdaWEpsYzBCcGJuUmxiQzVq
YjIwK2lRRlVCQk1CQ0FBK0Foc0RCUXNKQ0FjQ0JoVUtDUWdMCkFnUVdBZ01CQWg0QkFoZUFGaUVF
eUxleW1laUdJZXBhOVQ4b281SHZsSnZUK05nRkFsOEZkcWdGQ1FPNkxrVUEKQ2drUW81SHZsSnZU
K05pTG1RZ0EyZ1FzZCtUQ09KYlcrRjB3T3YyU2FObU1QYU5YNW13aTdhR1ZXb3VKZm8zVgpqdnky
RlQ5MmIwNnVqdVhYY2NOMVdnVncxcCtjL3plaE1tTEhPYUV4Rml2UEVlZTJ3Vk4zWXRtSG81R2x3
dWpZCnlRc0lLcjF1M21oblZxM3ZDMU95aUdJMEFCRjhFMWZsVmFiUXdOV0VreWpERGdvVW1yYTRr
dEs3UWFkUGRyamYKODdlNU9vZVFiQjFyRmtVZG82SjhCeFhJamFWbmk3YzNTbjlXd3Z1RlpkQ3lQ
QjR5QTZLS0cvR095V1hFSVcrbgo4R01EcEJzTVF3UkduRVBtNHl0TmpjeTNtazJqUjFDcXZmZ3Zp
aXRkSFMwb1ZQNG81RC9Icnhlc0w1WFl1c3NPCkF2elAra2ROOXl5eXA1RXkxVFpkWFN4dkhtSGwy
NTNIMm96ZUNPV0hMSWtCVkFRVEFRZ0FQaFloQk1pM3Nwbm8KaGlIcVd2VS9LS09SNzVTYjAvallC
UUpkTEpCTEFoc0RCUWtCNFRPQUJRc0pDQWNDQmhVS0NRZ0xBZ1FXQWdNQgpBaDRCQWhlQUFBb0pF
S09SNzVTYjAvall6SUlJQUtVb0c4QVFrRDdla2ZPRlErZDBHMEJacWxkZ01XanQxOUEzCnU5QS9w
THJkNHRhemtpZUVJMk83OTAzRjFVcnA4bldSbmNqZHRJNHJDQnphaENPZkhXRnZaRVZiZXUvRk9R
UkUKd05JazRPSzFBdWdubTF6dCtyMVRQbWpZU29WZ3RWODJtOHEzTXhZWUNCb3d3azlicXM0aGQx
VXZMTCtTV044YQpvejR6K2E0ZlBkVHk4TG1SaDFhL3pFMkVBTHp5TXRCaW5UT1N5MEhiK0Jodmxw
NnZBaFdVcTB2UUxWSm9SVm1sCmg1dVg3SU1qREZRQkQzTnZhcHZNMmxuMnkycUZpRDFVUVc5TDRi
cFlYdUFPWkJUTk51cjlBbXk3YTBHZWVtMDcKRW9QRUI5V3pnUUk3d09ZQjM2WE91SGJ6bmZoTjN0
dXFhbnFSZCt1VlAzOUh1NXY1SEsrNUFRMEVYU3lRU3dFSQpBTVozUkJJVm9ScUpKRkdPOGJtNk5i
SzgydnVNeTFNMElUYVMveU9BbmhTM3RCSE1BMkZHbVcwV0RjQjV4ZGtqCkgxamVjeXNNbEZDdThU
N0JXbHlpMWdjUzd1WEJneGVEK2VxRmdHY08wbjZvb21qdThMSkdaMFZQWnlQOWF0OUQKUTU0dGph
dDRNTG93Z1o0OEM0cFN6T0RsaUJlR2xRSmhYY29JUnh4eFRKczhmRjF4T25VNGZCby9YamtZN3Ns
cgpBUHRhVGZqejBZbjRhMmIxdFZMbFVEWDRoQVg5WXR1ZUoxRjFnY1NqUEJsU1lPazJRQ3BtZDhC
dFJ6Tjh1dEZ6CjZ0MDBaUHZhNG5NamRqRlA1S0JYTGtYMEcvSGY2cEVvNmVSZ3dnQlN3ZHk4aFNi
S2hYNTQ0UURvV09MczlhSkIKSTU3aXdIN0FxdlhUenQ1TXF4RmplRVVBRVFFQUFZa0JQQVFZQVFn
QUpnSWJEQlloQk1pM3Nwbm9oaUhxV3ZVLwpLS09SNzVTYjAvallCUUpmQlhhb0JRa0R1aTVGQUFv
SkVLT1I3NVNiMC9qWUx2Z0gvMnQ5L2tSbHJ5SkZlUWNBCkFFRzJZSFJoTGh2MENjamh6TlhxV2JV
L1V0WEN2dlI4VFhDaGVlbzVHRUdoK0NDTWNiRG03b3owakpxWkprMUcKRGNHMzdzWEx5b0czSlho
UmlKNWF5QWpyVUR0V2xLWkNjbWpGM29KN0VjeUVjOGJRbk9UYWk1NVhtUmt6Sm1FeQptdngvbHdP
NmprOHBjQm40ZmVRbTdGS2RQK1JOaTcwQUdKc1lBaDhRZDF5VjZWcm9ZUjdNK3pUZEx6WEpJRlAy
ClJ4NnlOU2FnMng0Y0trMFl1OUJ0UHZtM3hQM0hoR0hiQ3dyVVVOU0d6anB4R2FkM2J2MHdyOXNU
ZmUwSTNyeFMKbUkvZWZsaUc2ZzFhOHlJbVpETXAzOVdNSnFaejNiUlFBV0pIamRJRHZ2QkRlcUJn
NG5uL0QrbVB0SUE4WjU1WgpIYTYvV09nPQo9aGFkdQotLS0tLUVORCBQR1AgUFVCTElDIEtFWSBC
TE9DSy0tLS0tCg==

--_002_ce3ea5ef2a9c4356a67288cf6d8adbfaintelcom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--_002_ce3ea5ef2a9c4356a67288cf6d8adbfaintelcom_--
