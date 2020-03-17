Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBFE892AC
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2020 07:20:58 +0000 (UTC)
References: <20200316183422.25831-1-swati2.sharma@intel.com>
 <e5ad9f34-2d9c-c81a-e43e-db98c9382a85@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
Message-ID: <471a5454-2673-cedc-79c3-a086a8a8a950@intel.com>
Date: Tue, 17 Mar 2020 12:50:51 +0530
MIME-Version: 1.0
In-Reply-To: <e5ad9f34-2d9c-c81a-e43e-db98c9382a85@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v3] tests/kms_atomic: add test to
 validate immutable zpos
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, igt-dev@lists.freedesktop.org
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Thanks Martin and Ankit for the review.

On 17-Mar-20 11:13 AM, Nautiyal, Ankit K wrote:
> Hi Swati,
> =

> Have minor comments inline, otherwise the patch looks good to me.
> =

> =

> On 3/17/2020 12:04 AM, Swati Sharma wrote:
>> i915 implements immutable zpos property whereas the existing test
>> case is written to validate mutable zpos.
>>
>> Added new sub-test to validate immutable zpos. In the test, to validate
>> reported zpos of the plane is correct by making sure a full-screen plane
>> covers all other planes with the lower zpos, and the plane with the next
>> available zpos is indeed partially covering the full-screen plane.
> =

> I think this require rephrasing as per the latest changes, as we check 2 =

> planes at a time.
> =

Thanks Ankit for pointing this out :) Done in v4.
>>
>> v2: -Removed intel only checks [Martin]
>> =A0=A0=A0=A0 -Used XRGB8888 pixel format as used in other IGTs
>> =A0=A0=A0=A0 -Added documentation [Martin]
>> =A0=A0=A0=A0 -Removed skip, instead continue if plane doesn't support zp=
os =

>> [Martin]
>> =A0=A0=A0=A0 -Sorted planes in increasing order of zpos [Martin]
>> v3: -Fix description [Martin]
>> =A0=A0=A0=A0 -Avoid sorting [Ankit]
>>
>> Issue: https://gitlab.freedesktop.org/drm/intel/issues/404
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> Reviewed-by: Martin Peres <martin.peres@linux.intel.com>
>> ---
>> =A0 tests/kms_atomic.c | 159 ++++++++++++++++++++++++++++++++++++++++++-=
--
>> =A0 1 file changed, 149 insertions(+), 10 deletions(-)
>>
>> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
>> index 8462d128..c55bc97d 100644
>> --- a/tests/kms_atomic.c
>> +++ b/tests/kms_atomic.c
>> @@ -121,7 +121,7 @@ static void plane_check_current_state(igt_plane_t =

>> *plane, const uint64_t *values
>> =A0 }
>> =A0 static void plane_commit(igt_plane_t *plane, enum igt_commit_style s,
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 enum kms_atomic_check_relax relax)
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 enum kms_atomic_check_relax relax)
>> =A0 {
>> =A0=A0=A0=A0=A0 igt_display_commit2(plane->pipe->display, s);
>> =A0=A0=A0=A0=A0 plane_check_current_state(plane, plane->values, relax);
>> @@ -277,9 +277,9 @@ static uint32_t plane_get_igt_format(igt_plane_t =

>> *plane)
>> =A0 }
>> =A0 static void
>> -plane_primary_overlay_zpos(igt_pipe_t *pipe, igt_output_t *output,
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 igt_plane_t *primary, igt_pl=
ane_t *overlay,
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 uint32_t format_primary, uin=
t32_t format_overlay)
>> +plane_primary_overlay_mutable_zpos(igt_pipe_t *pipe, igt_output_t =

>> *output,
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 igt_=
plane_t *primary, igt_plane_t *overlay,
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 uint=
32_t format_primary, uint32_t format_overlay)
>> =A0 {
>> =A0=A0=A0=A0=A0 struct igt_fb fb_primary, fb_overlay;
>> =A0=A0=A0=A0=A0 drmModeModeInfo *mode =3D igt_output_get_mode(output);
>> @@ -320,7 +320,7 @@ plane_primary_overlay_zpos(igt_pipe_t *pipe, =

>> igt_output_t *output,
>> =A0=A0=A0=A0=A0 igt_plane_set_prop_value(overlay, IGT_PLANE_ZPOS, 1);
>> =A0=A0=A0=A0=A0 igt_info("Committing with overlay on top, it has a hole =
"\
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0 "through which the primary should be seen\n=
");
>> +=A0=A0=A0=A0=A0=A0=A0=A0 "through which the primary should be seen\n");
>> =A0=A0=A0=A0=A0 plane_commit(primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
>> =A0=A0=A0=A0=A0 igt_assert_eq_u64(igt_plane_get_prop(primary, IGT_PLANE_=
ZPOS), 0);
>> @@ -346,7 +346,7 @@ plane_primary_overlay_zpos(igt_pipe_t *pipe, =

>> igt_output_t *output,
>> =A0=A0=A0=A0=A0 igt_put_cairo_ctx(pipe->display->drm_fd, &fb_primary, cr=
);
>> =A0=A0=A0=A0=A0 igt_info("Committing with a hole in the primary through =
"\
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0 "which the underlay should be seen\n");
>> +=A0=A0=A0=A0=A0=A0=A0=A0 "which the underlay should be seen\n");
>> =A0=A0=A0=A0=A0 plane_commit(primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
>> =A0=A0=A0=A0=A0 /* reset it back to initial state */
>> @@ -358,6 +358,135 @@ plane_primary_overlay_zpos(igt_pipe_t *pipe, =

>> igt_output_t *output,
>> =A0=A0=A0=A0=A0 igt_assert_eq_u64(igt_plane_get_prop(overlay, IGT_PLANE_=
ZPOS), 1);
>> =A0 }
>> +static void
>> +plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 igt_output_t *output)
>> +{
>> +=A0=A0=A0 cairo_t *cr;
>> +=A0=A0=A0 struct igt_fb fb_ref;
>> +=A0=A0=A0 igt_plane_t *primary;
>> +=A0=A0=A0 drmModeModeInfo *mode;
>> +=A0=A0=A0 igt_pipe_crc_t *pipe_crc;
>> +=A0=A0=A0 igt_crc_t ref_crc, new_crc;
>> +=A0=A0=A0 int n_planes =3D pipe->n_planes;
>> +=A0=A0=A0 igt_plane_t *plane_ptr[n_planes];
>> +=A0=A0=A0 uint32_t w_lower, h_lower, w_upper, h_upper;
>> +
>> +=A0=A0=A0 igt_require(n_planes >=3D 2);
>> +
>> +=A0=A0=A0 mode =3D igt_output_get_mode(output);
>> +=A0=A0=A0 primary =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIM=
ARY);
>> +
>> +=A0=A0=A0 /* for lower plane */
>> +=A0=A0=A0 w_lower =3D mode->hdisplay;
>> +=A0=A0=A0 h_lower =3D mode->vdisplay;
>> +
>> +=A0=A0=A0 /* for upper plane */
>> +=A0=A0=A0 w_upper =3D mode->hdisplay / 2;
>> +=A0=A0=A0 h_upper =3D mode->vdisplay / 2;
>> +
>> +=A0=A0=A0 igt_create_color_fb(display->drm_fd,
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 w_lower, h_lower,
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 DRM_FORMAT_XRGB8888,
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 I915_TILING_NONE,
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0.0, 0.0, 0.0, &fb_ref);
>> +
>> +=A0=A0=A0 /* create reference image */
>> +=A0=A0=A0 cr =3D igt_get_cairo_ctx(display->drm_fd, &fb_ref);
>> +=A0=A0=A0 igt_assert(cairo_status(cr) =3D=3D 0);
>> +=A0=A0=A0 igt_paint_color(cr, 0, 0, w_lower, h_lower, 0.0, 0.0, 1.0);
>> +=A0=A0=A0 igt_paint_color(cr, w_upper / 2, h_upper / 2, w_upper, h_uppe=
r, =

>> 1.0, 1.0, 0.0);
>> +=A0=A0=A0 igt_put_cairo_ctx(display->drm_fd, &fb_ref, cr);
>> +=A0=A0=A0 igt_plane_set_fb(primary, &fb_ref);
>> +=A0=A0=A0 igt_display_commit2(display, COMMIT_ATOMIC);
>> +
>> +=A0=A0=A0 /* create the pipe_crc object for this pipe */
>> +=A0=A0=A0 pipe_crc =3D igt_pipe_crc_new(pipe->display->drm_fd, pipe->pi=
pe,
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 INTEL_PIPE_CR=
C_SOURCE_AUTO);
>> +
>> +=A0=A0=A0 /* get reference crc */
>> +=A0=A0=A0 igt_pipe_crc_start(pipe_crc);
>> +=A0=A0=A0 igt_pipe_crc_get_current(display->drm_fd, pipe_crc, &ref_crc);
>> +
>> +=A0=A0=A0 igt_plane_set_fb(primary, NULL);
>> +
>> +=A0=A0=A0 for (int k =3D 0; k < n_planes; k++) {
>> +=A0=A0=A0=A0=A0=A0=A0 int zpos;
>> +=A0=A0=A0=A0=A0=A0=A0 igt_plane_t *temp;
>> +
>> +=A0=A0=A0=A0=A0=A0=A0 temp =3D &display->pipes[pipe->pipe].planes[k];
>> +
>> +=A0=A0=A0=A0=A0=A0=A0 if (!igt_plane_has_prop(temp, IGT_PLANE_ZPOS))
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue;
>> +
>> +=A0=A0=A0=A0=A0=A0=A0 zpos =3D igt_plane_get_prop(temp, IGT_PLANE_ZPOS);
> =

> I think, here assert (zpos < n_planes) should be there.
Done in v4.
> =

>> +=A0=A0=A0=A0=A0=A0=A0 plane_ptr[zpos] =3D &display->pipes[pipe->pipe].p=
lanes[k];
> =

> Can use temp here.
Sorry, missed that. Done in v4.
> =

>> +=A0=A0=A0 }
>> +
>> +=A0=A0=A0 /*
>> +=A0=A0=A0=A0 * checking only pairs of plane in increasing fashion
>> +=A0=A0=A0=A0 * to avoid combinatorial explosion
>> +=A0=A0=A0=A0 */
>> +=A0=A0=A0 for (int i =3D 0; i < n_planes - 1; i++) {
>> +=A0=A0=A0=A0=A0=A0=A0 int fb_id_lower, fb_id_upper;
>> +=A0=A0=A0=A0=A0=A0=A0 struct igt_fb fb_lower, fb_upper;
>> +=A0=A0=A0=A0=A0=A0=A0 igt_plane_t *plane_lower, *plane_upper;
>> +
>> +=A0=A0=A0=A0=A0=A0=A0 if (plane_ptr[i] !=3D NULL) {
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 plane_lower =3D plane_ptr[i];
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 igt_assert(plane_lower);
> =

> No need of assert here, plane_ptr[i] is already checked earlier.
> =

Okay.

> With these minor changes:
> =

> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> =

> =

> -Ankit
> =

>> +=A0=A0=A0=A0=A0=A0=A0 } else
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue;
>> +
>> +=A0=A0=A0=A0=A0=A0=A0 while (i=A0 < (n_planes - 1)) {
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (plane_ptr[i + 1] !=3D NULL) {
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 plane_upper =3D plane_ptr=
[i + 1];
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 } else {
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 i++;
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue;
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
>> +=A0=A0=A0=A0=A0=A0=A0 }
>> +
>> +=A0=A0=A0=A0=A0=A0=A0 if (i =3D=3D (n_planes - 1))
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;
>> +
>> +=A0=A0=A0=A0=A0=A0=A0 if ((plane_lower->type =3D=3D DRM_PLANE_TYPE_CURS=
OR) ||
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (plane_upper->type =3D=3D=
 DRM_PLANE_TYPE_CURSOR))
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue;
>> +
>> +=A0=A0=A0=A0=A0=A0=A0 fb_id_lower =3D igt_create_color_fb(display->drm_=
fd,
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 w_lower, h_lower,
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 DRM_FORMAT_XRGB8888,
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 I915_TILING_NONE,
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 0.0, 0.0, 1.0, &fb_lower);
>> +=A0=A0=A0=A0=A0=A0=A0 igt_assert(fb_id_lower);
>> +
>> +=A0=A0=A0=A0=A0=A0=A0 fb_id_upper =3D igt_create_color_fb(display->drm_=
fd,
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 w_upper, h_upper,
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 DRM_FORMAT_XRGB8888,
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 I915_TILING_NONE,
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 1.0, 1.0, 0.0, &fb_upper);
>> +=A0=A0=A0=A0=A0=A0=A0 igt_assert(fb_id_upper);
>> +
>> +=A0=A0=A0=A0=A0=A0=A0 igt_plane_set_position(plane_lower, 0, 0);
>> +=A0=A0=A0=A0=A0=A0=A0 igt_plane_set_fb(plane_lower, &fb_lower);
>> +
>> +=A0=A0=A0=A0=A0=A0=A0 igt_plane_set_position(plane_upper, w_upper / 2, =
h_upper / 2);
>> +=A0=A0=A0=A0=A0=A0=A0 igt_plane_set_fb(plane_upper, &fb_upper);
>> +
>> +=A0=A0=A0=A0=A0=A0=A0 igt_info("Committing with the plane[%d] underneat=
h "\
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "plane[%d]\n", i, (i + 1));
>> +=A0=A0=A0=A0=A0=A0=A0 igt_display_commit2(display, COMMIT_ATOMIC);
>> +=A0=A0=A0=A0=A0=A0=A0 igt_pipe_crc_get_current(pipe->display->drm_fd, p=
ipe_crc, =

>> &new_crc);
>> +
>> +=A0=A0=A0=A0=A0=A0=A0 igt_assert_crc_equal(&ref_crc, &new_crc);
>> +
>> +=A0=A0=A0=A0=A0=A0=A0 igt_plane_set_fb(plane_lower, NULL);
>> +=A0=A0=A0=A0=A0=A0=A0 igt_plane_set_fb(plane_upper, NULL);
>> +=A0=A0=A0 }
>> +}
>> +
>> =A0 static void plane_overlay(igt_pipe_t *pipe, igt_output_t *output, =

>> igt_plane_t *plane)
>> =A0 {
>> =A0=A0=A0=A0=A0 drmModeModeInfo *mode =3D igt_output_get_mode(output);
>> @@ -987,14 +1116,16 @@ igt_main
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 plane_primary(pipe_obj, primary, &fb);
>> =A0=A0=A0=A0=A0 }
>> -=A0=A0=A0 igt_subtest("plane_primary_overlay_zpos") {
>> +=A0=A0=A0 igt_describe("Verify that the overlay plane can cover the pri=
mary =

>> one (and "\
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "vice versa) by changing their zpo=
s property.");
>> +=A0=A0=A0 igt_subtest("plane_primary_overlay_mutable_zpos") {
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 uint32_t format_primary =3D DRM_FORMAT_ARGB8=
888;
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 uint32_t format_overlay =3D DRM_FORMAT_ARGB1=
555;
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 igt_plane_t *overlay =3D
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 igt_pipe_get_plane_type(pipe_obj=
, DRM_PLANE_TYPE_OVERLAY);
>> -
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 igt_require(overlay);
>> +
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 igt_require(igt_plane_has_prop(primary, IGT_=
PLANE_ZPOS));
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 igt_require(igt_plane_has_prop(overlay, IGT_=
PLANE_ZPOS));
>> @@ -1002,8 +1133,15 @@ igt_main
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 igt_require(igt_plane_has_format_mod(overlay=
, =

>> format_overlay, 0x0));
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 igt_output_set_pipe(output, pipe);
>> -=A0=A0=A0=A0=A0=A0=A0 plane_primary_overlay_zpos(pipe_obj, output, prim=
ary, overlay,
>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 form=
at_primary, format_overlay);
>> +=A0=A0=A0=A0=A0=A0=A0 plane_primary_overlay_mutable_zpos(pipe_obj, outp=
ut, primary, =

>> overlay,
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 format_primary, format_overlay);
>> +=A0=A0=A0 }
>> +
>> +=A0=A0=A0 igt_describe("Verify the reported zpos property of planes by =

>> making sure "\
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "only higher zpos planes cover the=
 lower zpos ones.");
>> +=A0=A0=A0 igt_subtest("plane_immutable_zpos") {
>> +=A0=A0=A0=A0=A0=A0=A0 igt_output_set_pipe(output, pipe);
>> +=A0=A0=A0=A0=A0=A0=A0 plane_immutable_zpos(&display, pipe_obj, output);
>> =A0=A0=A0=A0=A0 }
>> =A0=A0=A0=A0=A0 igt_subtest("test_only") {
>> @@ -1011,6 +1149,7 @@ igt_main
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 test_only(pipe_obj, primary, output);
>> =A0=A0=A0=A0=A0 }
>> +
>> =A0=A0=A0=A0=A0 igt_subtest("plane_cursor_legacy") {
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 igt_plane_t *cursor =3D
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 igt_pipe_get_plane_type(pipe_obj=
, DRM_PLANE_TYPE_CURSOR);
> =


-- =

~Swati Sharma
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
