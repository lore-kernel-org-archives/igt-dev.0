Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E706E58B
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2020 07:45:13 +0000 (UTC)
From: "Peres, Martin" <martin.peres@intel.com>
Date: Wed, 25 Mar 2020 07:45:10 +0000
Message-ID: <d3e6151fe36b4871a87c08eef2850cca@intel.com>
References: <20200317071906.28879-1-swati2.sharma@intel.com>
Content-Language: en-US
Content-Type: multipart/mixed;
 boundary="_002_d3e6151fe36b4871a87c08eef2850ccaintelcom_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v4] tests/kms_atomic: add test to
 validate immutable zpos
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Sharma, Swati2" <swati2.sharma@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Latvala, Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--_002_d3e6151fe36b4871a87c08eef2850ccaintelcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On 2020-03-17 09:19, Swati Sharma wrote:=0A=
> i915 implements immutable zpos property whereas the existing test=0A=
> case is written to validate mutable zpos.=0A=
> =0A=
> Added a new sub-test to validate immutable zpos. Test validates=0A=
> the reported zpos property of plane by making sure only higher=0A=
> zpos plane covers the lower zpos one (lower plane covers full screen,=0A=
> upper plane covers half screen).=0A=
> =0A=
> Only two planes at a time are tested in increasing fashion to avoid=0A=
> combinatorial explosion. By transitive property,=0A=
> if (p1, z1) < (p2, z2) and (p2, z2) < (p3, z3) then (p1, z1) < (p3, z3)=
=0A=
> =0A=
> where p and z denotes planes and zpos=0A=
> =0A=
> v2: -Removed intel only checks [Martin]=0A=
>     -Used XRGB8888 pixel format as used in other IGTs=0A=
>     -Added documentation [Martin]=0A=
>     -Removed skip, instead continue if plane doesn't support zpos [Martin=
]=0A=
>     -Sorted planes in increasing order of zpos [Martin]=0A=
> v3: -Fix description [Martin]=0A=
>     -Avoid sorting [Ankit]=0A=
> v4: -Change in commit message [Ankit]=0A=
>     -Few minor changes [Ankit]=0A=
> =0A=
> Issue: https://gitlab.freedesktop.org/drm/intel/issues/404=0A=
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>=0A=
> Reviewed-by: Martin Peres <martin.peres@linux.intel.com>=0A=
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>=0A=
> ---=0A=
>  tests/kms_atomic.c | 160 ++++++++++++++++++++++++++++++++++++++++++---=
=0A=
>  1 file changed, 150 insertions(+), 10 deletions(-)=0A=
> =0A=
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c=0A=
> index 8462d128..4cb34d6d 100644=0A=
> --- a/tests/kms_atomic.c=0A=
> +++ b/tests/kms_atomic.c=0A=
> @@ -121,7 +121,7 @@ static void plane_check_current_state(igt_plane_t *pl=
ane, const uint64_t *values=0A=
>  }=0A=
>  =0A=
>  static void plane_commit(igt_plane_t *plane, enum igt_commit_style s,=0A=
> -                                enum kms_atomic_check_relax relax)=0A=
> +                         enum kms_atomic_check_relax relax)=0A=
>  {=0A=
>  	igt_display_commit2(plane->pipe->display, s);=0A=
>  	plane_check_current_state(plane, plane->values, relax);=0A=
> @@ -277,9 +277,9 @@ static uint32_t plane_get_igt_format(igt_plane_t *pla=
ne)=0A=
>  }=0A=
>  =0A=
>  static void=0A=
> -plane_primary_overlay_zpos(igt_pipe_t *pipe, igt_output_t *output,=0A=
> -			   igt_plane_t *primary, igt_plane_t *overlay,=0A=
> -			   uint32_t format_primary, uint32_t format_overlay)=0A=
> +plane_primary_overlay_mutable_zpos(igt_pipe_t *pipe, igt_output_t *outpu=
t,=0A=
> +			           igt_plane_t *primary, igt_plane_t *overlay,=0A=
> +			           uint32_t format_primary, uint32_t format_overlay)=0A=
>  {=0A=
>  	struct igt_fb fb_primary, fb_overlay;=0A=
>  	drmModeModeInfo *mode =3D igt_output_get_mode(output);=0A=
> @@ -320,7 +320,7 @@ plane_primary_overlay_zpos(igt_pipe_t *pipe, igt_outp=
ut_t *output,=0A=
>  	igt_plane_set_prop_value(overlay, IGT_PLANE_ZPOS, 1);=0A=
>  =0A=
>  	igt_info("Committing with overlay on top, it has a hole "\=0A=
> -		  "through which the primary should be seen\n");=0A=
> +		 "through which the primary should be seen\n");=0A=
>  	plane_commit(primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);=0A=
>  =0A=
>  	igt_assert_eq_u64(igt_plane_get_prop(primary, IGT_PLANE_ZPOS), 0);=0A=
> @@ -346,7 +346,7 @@ plane_primary_overlay_zpos(igt_pipe_t *pipe, igt_outp=
ut_t *output,=0A=
>  	igt_put_cairo_ctx(pipe->display->drm_fd, &fb_primary, cr);=0A=
>  =0A=
>  	igt_info("Committing with a hole in the primary through "\=0A=
> -		  "which the underlay should be seen\n");=0A=
> +		 "which the underlay should be seen\n");=0A=
>  	plane_commit(primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);=0A=
>  =0A=
>  	/* reset it back to initial state */=0A=
> @@ -358,6 +358,136 @@ plane_primary_overlay_zpos(igt_pipe_t *pipe, igt_ou=
tput_t *output,=0A=
>  	igt_assert_eq_u64(igt_plane_get_prop(overlay, IGT_PLANE_ZPOS), 1);=0A=
>  }=0A=
>  =0A=
> +static void=0A=
> +plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,=0A=
> +		     igt_output_t *output)=0A=
> +{=0A=
> +	cairo_t *cr;=0A=
> +	struct igt_fb fb_ref;=0A=
> +	igt_plane_t *primary;=0A=
> +	drmModeModeInfo *mode;=0A=
> +	igt_pipe_crc_t *pipe_crc;=0A=
> +	igt_crc_t ref_crc, new_crc;=0A=
> +	int n_planes =3D pipe->n_planes;=0A=
> +	igt_plane_t *plane_ptr[n_planes];=0A=
> +	uint32_t w_lower, h_lower, w_upper, h_upper;=0A=
> +=0A=
> +	igt_require(n_planes >=3D 2);=0A=
> +=0A=
> +	mode =3D igt_output_get_mode(output);=0A=
> +	primary =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);=0A=
> +=0A=
> +	/* for lower plane */=0A=
> +	w_lower =3D mode->hdisplay;=0A=
> +	h_lower =3D mode->vdisplay;=0A=
> +=0A=
> +	/* for upper plane */=0A=
> +	w_upper =3D mode->hdisplay / 2;=0A=
> +	h_upper =3D mode->vdisplay / 2;=0A=
> +=0A=
> +	igt_create_color_fb(display->drm_fd,=0A=
> +			    w_lower, h_lower,=0A=
> +			    DRM_FORMAT_XRGB8888,=0A=
> +			    I915_TILING_NONE,=0A=
> +			    0.0, 0.0, 0.0, &fb_ref);=0A=
> +=0A=
> +	/* create reference image */=0A=
> +	cr =3D igt_get_cairo_ctx(display->drm_fd, &fb_ref);=0A=
> +	igt_assert(cairo_status(cr) =3D=3D 0);=0A=
> +	igt_paint_color(cr, 0, 0, w_lower, h_lower, 0.0, 0.0, 1.0);=0A=
> +	igt_paint_color(cr, w_upper / 2, h_upper / 2, w_upper, h_upper, 1.0, 1.=
0, 0.0);=0A=
> +	igt_put_cairo_ctx(display->drm_fd, &fb_ref, cr);=0A=
> +	igt_plane_set_fb(primary, &fb_ref);=0A=
> +	igt_display_commit2(display, COMMIT_ATOMIC);=0A=
> +=0A=
> +	/* create the pipe_crc object for this pipe */=0A=
> +	pipe_crc =3D igt_pipe_crc_new(pipe->display->drm_fd, pipe->pipe,=0A=
> +				    INTEL_PIPE_CRC_SOURCE_AUTO);=0A=
> +=0A=
> +	/* get reference crc */=0A=
> +	igt_pipe_crc_start(pipe_crc);=0A=
> +	igt_pipe_crc_get_current(display->drm_fd, pipe_crc, &ref_crc);=0A=
> +=0A=
> +	igt_plane_set_fb(primary, NULL);=0A=
> +=0A=
> +	for (int k =3D 0; k < n_planes; k++) {=0A=
> +		int zpos;=0A=
> +		igt_plane_t *temp;=0A=
> +=0A=
> +		temp =3D &display->pipes[pipe->pipe].planes[k];=0A=
> +=0A=
> +		if (!igt_plane_has_prop(temp, IGT_PLANE_ZPOS))=0A=
> +			continue;=0A=
> +=0A=
> +		assert(zpos < n_planes);=0A=
=0A=
I'll assume you get this fixed, as suggested by Petri (unspecified zpos=0A=
and igt_assert_lt).=0A=
=0A=
> +=0A=
> +		zpos =3D igt_plane_get_prop(temp, IGT_PLANE_ZPOS);=0A=
> +		plane_ptr[zpos] =3D temp;=0A=
> +	}=0A=
> +=0A=
> +	/*=0A=
> +	 * checking only pairs of plane in increasing fashion=0A=
> +	 * to avoid combinatorial explosion=0A=
> +	 */=0A=
> +	for (int i =3D 0; i < n_planes - 1; i++) {=0A=
> +		int fb_id_lower, fb_id_upper;=0A=
> +		struct igt_fb fb_lower, fb_upper;=0A=
> +		igt_plane_t *plane_lower, *plane_upper;=0A=
> +=0A=
> +		if (plane_ptr[i] !=3D NULL)=0A=
> +			plane_lower =3D plane_ptr[i];=0A=
> +		else=0A=
> +			continue;=0A=
> +=0A=
> +		while (i  < (n_planes - 1)) {=0A=
> +			if (plane_ptr[i + 1] !=3D NULL) {=0A=
> +				plane_upper =3D plane_ptr[i + 1];=0A=
> +				break;=0A=
> +			} else {=0A=
> +				i++;=0A=
> +				continue;=0A=
> +			}=0A=
> +		}=0A=
> +=0A=
> +		if (i =3D=3D (n_planes - 1))=0A=
> +			break;=0A=
=0A=
This should be impossible to reach given that the for loop is i <=0A=
n_planes - 1=0A=
=0A=
You can drop this.=0A=
> +=0A=
> +		if ((plane_lower->type =3D=3D DRM_PLANE_TYPE_CURSOR) ||=0A=
> +				(plane_upper->type =3D=3D DRM_PLANE_TYPE_CURSOR))=0A=
> +			continue;=0A=
> +=0A=
> +		fb_id_lower =3D igt_create_color_fb(display->drm_fd,=0A=
> +						  w_lower, h_lower,=0A=
> +						  DRM_FORMAT_XRGB8888,=0A=
> +						  I915_TILING_NONE,=0A=
> +						  0.0, 0.0, 1.0, &fb_lower);=0A=
> +		igt_assert(fb_id_lower);=0A=
> +=0A=
> +		fb_id_upper =3D igt_create_color_fb(display->drm_fd,=0A=
> +						  w_upper, h_upper,=0A=
> +						  DRM_FORMAT_XRGB8888,=0A=
> +						  I915_TILING_NONE,=0A=
> +						  1.0, 1.0, 0.0, &fb_upper);=0A=
> +		igt_assert(fb_id_upper);=0A=
> +=0A=
> +		igt_plane_set_position(plane_lower, 0, 0);=0A=
> +		igt_plane_set_fb(plane_lower, &fb_lower);=0A=
> +=0A=
> +		igt_plane_set_position(plane_upper, w_upper / 2, h_upper / 2);=0A=
> +		igt_plane_set_fb(plane_upper, &fb_upper);=0A=
> +=0A=
> +		igt_info("Committing with the plane[%d] underneath "\=0A=
> +			 "plane[%d]\n", i, (i + 1));=0A=
> +		igt_display_commit2(display, COMMIT_ATOMIC);=0A=
> +		igt_pipe_crc_get_current(pipe->display->drm_fd, pipe_crc, &new_crc);=
=0A=
> +=0A=
> +		igt_assert_crc_equal(&ref_crc, &new_crc);=0A=
> +=0A=
> +		igt_plane_set_fb(plane_lower, NULL);=0A=
> +		igt_plane_set_fb(plane_upper, NULL);=0A=
> +	}=0A=
> +}=0A=
> +=0A=
>  static void plane_overlay(igt_pipe_t *pipe, igt_output_t *output, igt_pl=
ane_t *plane)=0A=
>  {=0A=
>  	drmModeModeInfo *mode =3D igt_output_get_mode(output);=0A=
> @@ -987,14 +1117,16 @@ igt_main=0A=
>  		plane_primary(pipe_obj, primary, &fb);=0A=
>  	}=0A=
>  =0A=
> -	igt_subtest("plane_primary_overlay_zpos") {=0A=
> +	igt_describe("Verify that the overlay plane can cover the primary one (=
and "\=0A=
> +		     "vice versa) by changing their zpos property.");=0A=
> +	igt_subtest("plane_primary_overlay_mutable_zpos") {=0A=
>  		uint32_t format_primary =3D DRM_FORMAT_ARGB8888;=0A=
>  		uint32_t format_overlay =3D DRM_FORMAT_ARGB1555;=0A=
>  =0A=
>  		igt_plane_t *overlay =3D=0A=
>  			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_OVERLAY);=0A=
> -=0A=
>  		igt_require(overlay);=0A=
> +=0A=
>  		igt_require(igt_plane_has_prop(primary, IGT_PLANE_ZPOS));=0A=
>  		igt_require(igt_plane_has_prop(overlay, IGT_PLANE_ZPOS));=0A=
>  =0A=
> @@ -1002,8 +1134,15 @@ igt_main=0A=
>  		igt_require(igt_plane_has_format_mod(overlay, format_overlay, 0x0));=
=0A=
>  =0A=
>  		igt_output_set_pipe(output, pipe);=0A=
> -		plane_primary_overlay_zpos(pipe_obj, output, primary, overlay,=0A=
> -					   format_primary, format_overlay);=0A=
> +		plane_primary_overlay_mutable_zpos(pipe_obj, output, primary, overlay,=
=0A=
> +					           format_primary, format_overlay);=0A=
> +	}=0A=
> +=0A=
> +	igt_describe("Verify the reported zpos property of planes by making sur=
e "\=0A=
> +		     "only higher zpos planes cover the lower zpos ones.");=0A=
=0A=
With what you have right now, you are checking planes only 2 by 2, as=0A=
opposed to keeping the planes under the "main" plane active, but with a=0A=
different color, in order to check for non-linearity between planes'=0A=
reported zpos. This would require really broken HW, but this is what the=0A=
test is about :s=0A=
=0A=
To save memory bandwidth, we could have a 2x2 red fb that would be used=0A=
by all planes ;)=0A=
=0A=
I am however OK with merging this now, as it is already a pretty good=0A=
test! With the changes suggested by Petri, this patch is:=0A=
=0A=
Reviewed-by: Martin Peres <martin.peres@linux.intel.com>=0A=
=0A=
> +	igt_subtest("plane_immutable_zpos") {=0A=
> +		igt_output_set_pipe(output, pipe);=0A=
> +		plane_immutable_zpos(&display, pipe_obj, output);=0A=
>  	}=0A=
>  =0A=
>  	igt_subtest("test_only") {=0A=
> @@ -1011,6 +1150,7 @@ igt_main=0A=
>  =0A=
>  		test_only(pipe_obj, primary, output);=0A=
>  	}=0A=
> +=0A=
>  	igt_subtest("plane_cursor_legacy") {=0A=
>  		igt_plane_t *cursor =3D=0A=
>  			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_CURSOR);=0A=
> =0A=
=0A=

--_002_d3e6151fe36b4871a87c08eef2850ccaintelcom_
Content-Type: application/pgp-keys; name="pEpkey.asc"
Content-Description: pEpkey.asc
Content-Disposition: attachment; filename="pEpkey.asc"; size=1774;
	creation-date="Wed, 25 Mar 2020 07:45:10 GMT";
	modification-date="Wed, 25 Mar 2020 07:45:10 GMT"
Content-Transfer-Encoding: base64

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCgptUUVOQkYzazA1Z0JDQUN5WmhP
WGExNGJUY3lUUWtjMVV5R2ZjNGx4ckhQREw1YXVPbkM3cUVIWkw1b3ZWd3NDCmF1ZlFaOVFKVWwx
NHh1OCt4dUl6UGoyWXhEbjFBeVJFN0RzSXNxNjVIaDlRa2YxQytFNmtHeHBDS2VXeFpEalIKS0xE
a2pQWmdRTTdOeHNFWkRkemNaTlFLUEt3OXBXUUovRCtrSUlyNDJYaERhbktyQ1pHV3Vxc3VwVGI4
YmM2agp3ZnBxVzV2eUp2WnVMSHcrTURhRVhoZ1Z0SlVWYVdSWENXbXFZQU1YWFlMMGh5NHVjRDZz
UWl3U2psK3JUU2NIClhqSHdhWURWWTI5bVFlR3lWMDMyeXBFWFQzWG1DVTJVT0hhNENNaktLR3ZK
MjRBU2Q5SFkyWHo4cmNyR1pTbGsKRkhMTGRwNUNET2wrRFU2Vjc5SWs5a3pPMFVxK0hXWDRtc2Z4
QUJFQkFBRzBLMDFoY25ScGJpQlFaWEpsY3lBOApiV0Z5ZEdsdUxuQmxjbVZ6UUd4cGJuVjRMbWx1
ZEdWc0xtTnZiVDZKQVZRRUV3RUlBRDRXSVFSTjlzUS9iN0dPClhRdkh5WUVDditaL002VXplUVVD
WGVUVG1RSWJBd1VKQWVFemdBVUxDUWdIQWdZVkNna0lDd0lFRmdJREFRSWUKQVFJWGdBQUtDUkFD
ditaL002VXplUmJ3Qi85ZHhZaG01WU14eGlSa2tZRVBrOE9DUGZjOGJwazF6RFc5Nkc0MgpLYVoz
RlRPRGNSMktjelg1ZVRMRFYwdklNRndqMmw0UXAvRFpzbVlsNzlKNDNhbHg1RHRIQUZJMlJHSis2
dXJhClFZMkovVXUvUWt5eEdrMTRpQUFzYytaalJSdWllQ1h0Wkc2THRMYmdsTUZCWUd4dzlWVEow
L0xhNHJjUVk3UksKOW1KM1QwWUxKMkJNNlVha3lUWEdzbnN0aWtOa2wzU0JKVDBJc1B1bVdGL240
a25penZQcG5BTGNQWGwwS3VtUwpuZDZ1b2dPT3VrQ0t4Z0RUWm1qRG9meDVvN1pveDI5blNkdjR3
aVJMOHVBeDRrY0pPOUxPOFhBN0lITzd6SXRTCmpXbWRXRmN4QTVicFRkRWR0TThIQWlCQkFaNU44
WXVraENuejltT0FFOXZLOXZydHVRRU5CRjNrMDVrQkNBREwKR3JGN1NBblB5NVo2R2ZlelZDclFm
dUlHSmhPemxuY0c2aFdHYU05YzlDVEtxSGZDNHROV1VFeHJmam5YNjBtRgpJbUx2aHhlRlZDOWJv
QS9jNGFVTmhEYy9NOUtqc08ycWRyd2d4QXl3bnIraVJqbzNORUJWQkF3T2NldWRRM0xPClZmZW5k
b296d3lqd3ZZRFV2QzNUcWtjajBsNmE2R3JqZTZWMVVTQ3RIL0ZlR2NONG9EMnZPOW1yWFlQb2hr
V2cKU3B2QUpPSEs5bk5nMUtaTjcvcDlXNUZMMlZZN2pIbHErd1gxZDBTRytRNlhjVHNEQUEyOStO
YmM1Qk0vcTJJTAphV1Fva0I0bzBaRjNsakZiN2RYZDNRZEpNWDdvNXRURzFMUi9TalZmbkZGckMw
K1IrZGhlRUVldGxVckRMRmF0CnhnRTdvREVPLzA4c2g5eHJPdzdMQUJFQkFBR0pBVHdFR0FFSUFD
WVdJUVJOOXNRL2I3R09YUXZIeVlFQ3YrWi8KTTZVemVRVUNYZVRUbVFJYkRBVUpBZUV6Z0FBS0NS
QUN2K1ovTTZVemVTMVRCLzlNbTFYTUhpbWtFbW15ZXNiMQpxdHFUY2htV2Q1NWhiRkIxMDRSbUx5
c0VrSU43Q3IweVNEZjBZRWxxd2QvSDlGWWVLUTVEWWJWWS9CclhjeGYzCmNKVDJBZ01Zdk54bHZ5
NHluR1F4Yy9YbXRzMGZVSno5cmRVVmZxZlFKbDlHZkR1U3dpQnhmb3BlN21aR2NIZWcKNzBaQTg3
Q0xJQ0FVbi9uRFpSekZuUHNhdUxJSU9sMGhxVWtJUml3WVp0WW9WZnNoVGhTNzNEcXNGS2U0Y25r
eApZcGVCRXNsYUduZnRMUC9uWDl6dkZ4SXJYUXBPdHJ2eWdkWklhMVMrZXhYM2NXMHNPYm02Zjk0
T3Q1Mjl3V3pTCnhJRjBvRnZPY3NlZ2ErL3FPK1hSNHNjbUJ1K3NUVU5FQnA1NWYyc0ptOWllVlU5
SXUwM2JYVnBMZGV3dTNtMEIKTTVtaAo9YzJPTwotLS0tLUVORCBQR1AgUFVCTElDIEtFWSBCTE9D
Sy0tLS0tCg==

--_002_d3e6151fe36b4871a87c08eef2850ccaintelcom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--_002_d3e6151fe36b4871a87c08eef2850ccaintelcom_--
