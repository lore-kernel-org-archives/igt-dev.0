Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8426E5B6
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Aug 2021 17:08:19 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id t25so557065ljc.12
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Aug 2021 10:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210818145614.1093522-1-Rodrigo.Siqueira@amd.com>
 <20210818145614.1093522-3-Rodrigo.Siqueira@amd.com>
In-Reply-To: <20210818145614.1093522-3-Rodrigo.Siqueira@amd.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Wed, 18 Aug 2021 13:08:06 -0400
Message-ID: <CAJUqKUpZJRLG40-T_QqhedJmGgsfdXpNE4u07BxnGZQKwdFt-g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH 2/4] tests/kms_concurrent: Making the test
 more generic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, abhinavk@codeaurora.org
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, Harry Wentland <harry.wentland@amd.com>, Nicholas Choi <Nicholas.Choi@amd.com>, Sean Paul <seanpaul@chromium.org>, Melissa Wen <melissa.srw@gmail.com>, Arkadiusz Hiler <arek@hiler.eu>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

This fails when I run it on freedreno.

This is the IGT output:

Subtest pipe-A: SUCCESS (0.175s)
Starting subtest: pipe-B
Testing resolution with connector eDP-1 using pipe B with seed 1629306399
(kms_concurrent:21753) igt_kms-CRITICAL: Test assertion failure
function do_display_commit, file
../igt-gpu-tools-9999/lib/igt_kms.c:3754:
(kms_concurrent:21753) igt_kms-CRITICAL: Failed assertion: ret == 0
(kms_concurrent:21753) igt_kms-CRITICAL: Last errno: 22, Invalid argument
(kms_concurrent:21753) igt_kms-CRITICAL: error: -22 != 0
Stack trace:
Subtest pipe-B failed.
**** DEBUG ****
(kms_concurrent:21753) INFO: Testing resolution with connector eDP-1
using pipe B with seed 1629306399
(kms_concurrent:21753) igt_kms-DEBUG: display: eDP-1: set_pipe(B)
(kms_concurrent:21753) igt_kms-DEBUG: display: eDP-1: Selecting pipe B
(kms_concurrent:21753) igt_kms-DEBUG: display: eDP-1: set_pipe(None)
(kms_concurrent:21753) igt_kms-DEBUG: display: eDP-1: Selecting pipe None
(kms_concurrent:21753) igt_kms-DEBUG: display: commit {
(kms_concurrent:21753) igt_kms-DEBUG: Pipe B: Setting property
"MODE_ID" to 0x0/0
(kms_concurrent:21753) igt_kms-DEBUG: Pipe B: Setting property "ACTIVE" to 0x0/0
(kms_concurrent:21753) igt_kms-DEBUG: display:     eDP-1: preparing
atomic, pipe: None
(kms_concurrent:21753) igt_kms-DEBUG: eDP-1: Setting property "CRTC_ID" to 0x0/0
(kms_concurrent:21753) igt_kms-DEBUG: display: }
(kms_concurrent:21753) igt_kms-CRITICAL: Test assertion failure
function do_display_commit, file
../igt-gpu-tools-9999/lib/igt_kms.c:3754:
(kms_concurrent:21753) igt_kms-CRITICAL: Failed assertion: ret == 0
(kms_concurrent:21753) igt_kms-CRITICAL: Last errno: 22, Invalid argument
(kms_concurrent:21753) igt_kms-CRITICAL: error: -22 != 0
(kms_concurrent:21753) igt_core-INFO: Stack trace:
****  END  ****
Subtest pipe-B: FAIL (0.008s)

This is the kernel log I see:

[77077.164985] [drm:drm_compat_ioctl] comm="kms_concurrent",
pid=20615, dev=0xe201, auth=1, DRM_IOCTL_VERSION
[77077.164985] [drm:drm_mode_object_put] OBJ ID: 32 (3)
[77077.164990] [drm:drm_ioctl] comm="kms_concurrent" pid=20615,
dev=0xe201, auth=1, DRM_IOCTL_MODE_MAP_DUMB
[77077.165006] [drm:drm_ioctl] comm="kms_concurrent" pid=20611,
dev=0xe201, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[77077.165026] [drm:drm_ioctl] comm="kms_concurrent" pid=20611,
dev=0xe201, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[77077.165048] [drm:drm_ioctl] comm="kms_concurrent" pid=20611,
dev=0xe201, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[77077.165069] [drm:drm_ioctl] comm="kms_concurrent" pid=20611,
dev=0xe201, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[77077.165093] [drm:drm_ioctl] comm="kms_concurrent" pid=20611,
dev=0xe201, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[77077.165137] [drm:drm_ioctl] comm="kms_concurrent" pid=20611,
dev=0xe201, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[77077.165164] [drm:drm_ioctl] comm="kms_concurrent" pid=20611,
dev=0xe201, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[77077.165184] [drm:drm_ioctl] comm="kms_concurrent" pid=20611,
dev=0xe201, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[77077.165206] [drm:drm_ioctl] comm="kms_concurrent" pid=20611,
dev=0xe201, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[77077.165226] [drm:drm_ioctl] comm="kms_concurrent" pid=20611,
dev=0xe201, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[77077.165247] [drm:drm_ioctl] comm="kms_concurrent" pid=20611,
dev=0xe201, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[77077.165266] [drm:drm_ioctl] comm="kms_concurrent" pid=20611,
dev=0xe201, auth=1, DRM_IOCTL_MODE_GETPROPERTY
[77077.165433] [drm:drm_ioctl] comm="kms_concurrent" pid=20611,
dev=0xe201, auth=1, DRM_IOCTL_MODE_ATOMIC
[77077.165459] [drm:drm_atomic_state_init] Allocated atomic state
0000000056410621
[77077.165486] [drm:drm_mode_object_get] OBJ ID: 32 (3)
[77077.165499] [drm:drm_mode_object_get] OBJ ID: 32 (4)
[77077.165511] [drm:drm_atomic_get_connector_state] Added
[CONNECTOR:32:eDP-1] 00000000d4c72b94 state to 0000000056410621
[77077.165536] [drm:drm_mode_object_get] OBJ ID: 58 (2)
[77077.165548] [drm:drm_atomic_get_crtc_state] Added [CRTC:51:crtc-0]
00000000f17155a3 state to 0000000056410621
[77077.165564] [drm:drm_mode_object_put] OBJ ID: 32 (5)
[77077.165579] msm ae00000.mdss:
[drm:drm_atomic_set_crtc_for_connector] Link [CONNECTOR:32:eDP-1]
state 00000000d4c72b94 to [NOCRTC]
[77077.165596] [drm:drm_mode_object_put] OBJ ID: 32 (4)
[77077.165612] [drm:drm_atomic_get_crtc_state] Added [CRTC:52:crtc-1]
00000000d8d16568 state to 0000000056410621
[77077.165635] [drm:drm_atomic_print_new_state] checking 0000000056410621
[77077.165650] msm ae00000.mdss: [drm] crtc[51]: crtc-0
[77077.165672] msm ae00000.mdss: [drm] enable=1
[77077.165685] msm ae00000.mdss: [drm] active=1
[77077.165697] msm ae00000.mdss: [drm] self_refresh_active=0
[77077.165709] msm ae00000.mdss: [drm] planes_changed=0
[77077.165721] msm ae00000.mdss: [drm] mode_changed=0
[77077.165733] msm ae00000.mdss: [drm] active_changed=0
[77077.165744] msm ae00000.mdss: [drm] connectors_changed=0
[77077.165755] msm ae00000.mdss: [drm] color_mgmt_changed=0
[77077.165766] msm ae00000.mdss: [drm] plane_mask=0
[77077.165777] msm ae00000.mdss: [drm] connector_mask=0
[77077.165789] msm ae00000.mdss: [drm] encoder_mask=1
[77077.165801] msm ae00000.mdss: [drm] mode: "1920x1080": 60 147840
1920 1968 2000 2200 1080 1083 1089 1120 0x48 0x9
[77077.165824] msm ae00000.mdss: [drm] crtc[52]: crtc-1
[77077.165837] msm ae00000.mdss: [drm] enable=0
[77077.165849] msm ae00000.mdss: [drm] active=0
[77077.165860] msm ae00000.mdss: [drm] self_refresh_active=0
[77077.165873] msm ae00000.mdss: [drm] planes_changed=0
[77077.165885] msm ae00000.mdss: [drm] mode_changed=0
[77077.165896] msm ae00000.mdss: [drm] active_changed=0
[77077.165909] msm ae00000.mdss: [drm] connectors_changed=0
[77077.165921] msm ae00000.mdss: [drm] color_mgmt_changed=0
[77077.165932] msm ae00000.mdss: [drm] plane_mask=0
[77077.165944] msm ae00000.mdss: [drm] connector_mask=0
[77077.165956] msm ae00000.mdss: [drm] encoder_mask=0
[77077.165968] msm ae00000.mdss: [drm] mode: "": 0 0 0 0 0 0 0 0 0 0 0x0 0x0
[77077.165986] msm ae00000.mdss: [drm] connector[32]: eDP-1
[77077.166000] msm ae00000.mdss: [drm] crtc=(null)
[77077.166012] msm ae00000.mdss: [drm] self_refresh_aware=0
[77077.166025] [drm:drm_atomic_check_only] checking 0000000056410621
[77077.166043] [drm:drm_atomic_helper_check_modeset] [CRTC:51:crtc-0]
enabled/connectors mismatch
[77077.166059] [drm:drm_atomic_check_only] atomic driver check for
0000000056410621 failed: -22
[77077.166075] [drm:drm_atomic_state_default_clear] Clearing atomic
state 0000000056410621
[77077.166089] [drm:drm_mode_object_put] OBJ ID: 32 (3)
[77077.166127] [drm:dpu_crtc_destroy_state] crtc51
[77077.166144] [drm:drm_mode_object_put] OBJ ID: 58 (3)
[77077.166157] [drm:dpu_crtc_destroy_state] crtc52
[77077.166168] [drm:__drm_atomic_state_free] Freeing atomic state
0000000056410621
[77077.166186] [drm:drm_ioctl] comm="kms_concurrent", pid=20611, ret=-22

On Wed, Aug 18, 2021 at 10:56 AM Rodrigo Siqueira
<Rodrigo.Siqueira@amd.com> wrote:
>
> Currently, the "kms_concurrent" does not work in non-intel drivers due
> to using specific modifiers and operations related to i915. This commit
> removes some of these particular codes in order to make them generic for
> other drivers. After applying this change, kms_concurrent passed on AMD
> hardware and VKMS.
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Nicholas Choi <Nicholas.Choi@amd.com>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Mark Yacoub <markyacoub@chromium.org>
> Cc: Melissa Wen <melissa.srw@gmail.com>
> Cc: Arkadiusz Hiler <arek@hiler.eu>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> ---
>  tests/kms_concurrent.c | 27 ++++++++++++++-------------
>  1 file changed, 14 insertions(+), 13 deletions(-)
>
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index 969f07a7..88372d5c 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -104,8 +104,7 @@ create_fb_for_mode_position(data_t *data, drmModeModeInfo *mode,
>
>         primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>
> -       fb_id = igt_create_fb(data->drm_fd,
> -                             mode->hdisplay, mode->vdisplay,
> +       fb_id = igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
>                               DRM_FORMAT_XRGB8888,
>                               tiling,
>                               &data->fb[primary->index]);
> @@ -138,6 +137,7 @@ prepare_planes(data_t *data, enum pipe pipe, int max_planes,
>         int *y;
>         int *size;
>         int i;
> +       int format, modifier;
>
>         igt_output_set_pipe(output, pipe);
>
> @@ -161,24 +161,25 @@ prepare_planes(data_t *data, enum pipe pipe, int max_planes,
>         for (i = 0; i < max_planes; i++) {
>                 igt_plane_t *plane = igt_output_get_plane(output, i);
>
> -               if (plane->type == DRM_PLANE_TYPE_PRIMARY)
> +               if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
>                         continue;
> -               else if (plane->type == DRM_PLANE_TYPE_CURSOR)
> +               } else if (plane->type == DRM_PLANE_TYPE_CURSOR) {
>                         size[i] = SIZE_CURSOR;
> -               else
> +                       format = DRM_FORMAT_ARGB8888;
> +                       modifier = DRM_FORMAT_MOD_NONE;
> +               } else {
>                         size[i] = SIZE_PLANE;
> +                       format = DRM_FORMAT_XRGB8888;
> +                       modifier = DRM_FORMAT_MOD_NONE;
> +               }
>
>                 x[i] = rand() % (mode->hdisplay - size[i]);
>                 y[i] = rand() % (mode->vdisplay - size[i]);
>
>                 data->plane[i] = plane;
>
> -               igt_create_color_fb(data->drm_fd,
> -                                   size[i], size[i],
> -                                   data->plane[i]->type == DRM_PLANE_TYPE_CURSOR ? DRM_FORMAT_ARGB8888 : DRM_FORMAT_XRGB8888,
> -                                   data->plane[i]->type == DRM_PLANE_TYPE_CURSOR ? DRM_FORMAT_MOD_NONE : I915_FORMAT_MOD_X_TILED,
> -                                   0.0f, 0.0f, 1.0f,
> -                                   &data->fb[i]);
> +               igt_create_color_fb(data->drm_fd, size[i], size[i], format, modifier,
> +                                   0.0f, 0.0f, 1.0f, &data->fb[i]);
>
>                 igt_plane_set_position(data->plane[i], x[i], y[i]);
>                 igt_plane_set_fb(data->plane[i], &data->fb[i]);
> @@ -186,8 +187,7 @@ prepare_planes(data_t *data, enum pipe pipe, int max_planes,
>
>         /* primary plane */
>         data->plane[primary->index] = primary;
> -       create_fb_for_mode_position(data, mode, x, y, size, size,
> -                                   I915_FORMAT_MOD_X_TILED,
> +       create_fb_for_mode_position(data, mode, x, y, size, size, DRM_FORMAT_MOD_NONE,
>                                     max_planes, output);
>
>         igt_plane_set_fb(data->plane[primary->index], &data->fb[primary->index]);
> @@ -268,6 +268,7 @@ test_resolution_with_output(data_t *data, enum pipe pipe, int max_planes, igt_ou
>
>                 /* switch to lower resolution */
>                 igt_output_override_mode(output, mode_lo);
> +               igt_output_set_pipe(output, PIPE_NONE);
>                 igt_display_commit2(&data->display, COMMIT_ATOMIC);
>
>                 /* switch back to higher resolution */
> --
> 2.25.1
>
