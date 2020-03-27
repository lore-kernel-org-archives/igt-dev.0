Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115C66EA2F
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2020 13:29:06 +0000 (UTC)
From: "Peres, Martin" <martin.peres@intel.com>
Date: Fri, 27 Mar 2020 13:29:02 +0000
Message-ID: <1cf302c564b940e992b268d234a3c1da@intel.com>
References: <20200327131222.26945-1-swati2.sharma@intel.com>
 <20200327131222.26945-2-swati2.sharma@intel.com>
Content-Language: en-US
Content-Type: multipart/mixed;
 boundary="_002_1cf302c564b940e992b268d234a3c1daintelcom_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms_atomic: Changed test
 names into standard convention
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

--_002_1cf302c564b940e992b268d234a3c1daintelcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On 2020-03-27 15:12, Swati Sharma wrote:=0A=
> All the subtests in kms_atomic have test names in non-standard=0A=
> convention, changing those to standard convention. '-' is the normal=0A=
> delimeter in subtest names.=0A=
> =0A=
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>=0A=
=0A=
Please do not merge this patch until cibuglog learns about these=0A=
renames. I'll do it when the patch gets R-b someone.=0A=
=0A=
Martin=0A=
=0A=
> ---=0A=
>  tests/kms_atomic.c | 22 +++++++++++-----------=0A=
>  1 file changed, 11 insertions(+), 11 deletions(-)=0A=
> =0A=
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c=0A=
> index aacd83c5..f80b5189 100644=0A=
> --- a/tests/kms_atomic.c=0A=
> +++ b/tests/kms_atomic.c=0A=
> @@ -1098,7 +1098,7 @@ igt_main=0A=
>  				      LOCAL_DRM_FORMAT_MOD_NONE, &fb);=0A=
>  	}=0A=
>  =0A=
> -	igt_subtest("plane_overlay_legacy") {=0A=
> +	igt_subtest("plane-overlay-legacy") {=0A=
>  		igt_plane_t *overlay =3D=0A=
>  			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_OVERLAY);=0A=
>  =0A=
> @@ -1108,7 +1108,7 @@ igt_main=0A=
>  		plane_overlay(pipe_obj, output, overlay);=0A=
>  	}=0A=
>  =0A=
> -	igt_subtest("plane_primary_legacy") {=0A=
> +	igt_subtest("plane-primary-legacy") {=0A=
>  		atomic_setup(&display, pipe, output, primary, &fb);=0A=
>  =0A=
>  		plane_primary(pipe_obj, primary, &fb);=0A=
> @@ -1116,7 +1116,7 @@ igt_main=0A=
>  =0A=
>  	igt_describe("Verify that the overlay plane can cover the primary one (=
and "\=0A=
>  		     "vice versa) by changing their zpos property.");=0A=
> -	igt_subtest("plane_primary_overlay_mutable_zpos") {=0A=
> +	igt_subtest("plane-primary-overlay-mutable-zpos") {=0A=
>  		uint32_t format_primary =3D DRM_FORMAT_ARGB8888;=0A=
>  		uint32_t format_overlay =3D DRM_FORMAT_ARGB1555;=0A=
>  =0A=
> @@ -1137,18 +1137,18 @@ igt_main=0A=
>  =0A=
>  	igt_describe("Verify the reported zpos property of planes by making sur=
e "\=0A=
>  		     "only higher zpos planes cover the lower zpos ones.");=0A=
> -	igt_subtest("plane_immutable_zpos") {=0A=
> +	igt_subtest("plane-immutable-zpos") {=0A=
>  		igt_output_set_pipe(output, pipe);=0A=
>  		plane_immutable_zpos(&display, pipe_obj, output);=0A=
>  	}=0A=
>  =0A=
> -	igt_subtest("test_only") {=0A=
> +	igt_subtest("test-only") {=0A=
>  		atomic_clear(&display, pipe, primary, output);=0A=
>  =0A=
>  		test_only(pipe_obj, primary, output);=0A=
>  	}=0A=
>  =0A=
> -	igt_subtest("plane_cursor_legacy") {=0A=
> +	igt_subtest("plane-cursor-legacy") {=0A=
>  		igt_plane_t *cursor =3D=0A=
>  			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_CURSOR);=0A=
>  =0A=
> @@ -1158,31 +1158,31 @@ igt_main=0A=
>  		plane_cursor(pipe_obj, output, cursor);=0A=
>  	}=0A=
>  =0A=
> -	igt_subtest("plane_invalid_params") {=0A=
> +	igt_subtest("plane-invalid-params") {=0A=
>  		atomic_setup(&display, pipe, output, primary, &fb);=0A=
>  =0A=
>  		plane_invalid_params(pipe_obj, output, primary, &fb);=0A=
>  	}=0A=
>  =0A=
> -	igt_subtest("plane_invalid_params_fence") {=0A=
> +	igt_subtest("plane-invalid-params-fence") {=0A=
>  		atomic_setup(&display, pipe, output, primary, &fb);=0A=
>  =0A=
>  		plane_invalid_params_fence(pipe_obj, output, primary);=0A=
>  	}=0A=
>  =0A=
> -	igt_subtest("crtc_invalid_params") {=0A=
> +	igt_subtest("crtc-invalid-params") {=0A=
>  		atomic_setup(&display, pipe, output, primary, &fb);=0A=
>  =0A=
>  		crtc_invalid_params(pipe_obj, output, primary, &fb);=0A=
>  	}=0A=
>  =0A=
> -	igt_subtest("crtc_invalid_params_fence") {=0A=
> +	igt_subtest("crtc-invalid-params-fence") {=0A=
>  		atomic_setup(&display, pipe, output, primary, &fb);=0A=
>  =0A=
>  		crtc_invalid_params_fence(pipe_obj, output, primary, &fb);=0A=
>  	}=0A=
>  =0A=
> -	igt_subtest("atomic_invalid_params") {=0A=
> +	igt_subtest("atomic-invalid-params") {=0A=
>  		atomic_setup(&display, pipe, output, primary, &fb);=0A=
>  =0A=
>  		atomic_invalid_params(pipe_obj, primary, output, &fb);=0A=
> =0A=
=0A=

--_002_1cf302c564b940e992b268d234a3c1daintelcom_
Content-Type: application/pgp-keys; name="pEpkey.asc"
Content-Description: pEpkey.asc
Content-Disposition: attachment; filename="pEpkey.asc"; size=1774;
	creation-date="Fri, 27 Mar 2020 13:29:02 GMT";
	modification-date="Fri, 27 Mar 2020 13:29:02 GMT"
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

--_002_1cf302c564b940e992b268d234a3c1daintelcom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--_002_1cf302c564b940e992b268d234a3c1daintelcom_--
