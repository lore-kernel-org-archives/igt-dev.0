Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F8D8D458
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Jul 2022 14:43:11 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id y11so19705032lfs.6
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Jul 2022 07:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220715192200.1782193-1-markyacoub@chromium.org>
 <165799172818.13611.9912618285302133993@emeril.freedesktop.org>
In-Reply-To: <165799172818.13611.9912618285302133993@emeril.freedesktop.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Mon, 18 Jul 2022 10:42:58 -0400
Message-ID: <CAJUqKUobTcyMYk=HCnveVoNoxTqoQcdVkvj9TTXqZAvrLgar8A@mail.gmail.com>
To: igt-dev@lists.freedesktop.org,
 "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Content-Type: multipart/alternative; boundary="000000000000fd60d505e4156289"
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
	=?utf-8?q?t=5Fchamelium=3A_Extend_check_of_valid_ports_to_port=3D0?=
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

--000000000000fd60d505e4156289
Content-Type: text/plain; charset="UTF-8"

Hey Lakhmi, the change is for chameleon lib but the failed test seems
unrelated. Can we rerun?
Thanks!

On Sat, Jul 16, 2022 at 1:15 PM Patchwork <patchwork@emeril.freedesktop.org>
wrote:

> *Patch Details*
> *Series:* lib/igt_chamelium: Extend check of valid ports to port=0
> *URL:* https://patchwork.freedesktop.org/series/106397/
> *State:* failure
> *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/index.html CI
> Bug Log - changes from IGT_6586_full -> IGTPW_7526_full Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_7526_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7526_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/index.html
> Participating hosts (10 -> 10)
>
> No changes in participating hosts
> Possible new issues
>
> Here are the unknown changes that may have been introduced in
> IGTPW_7526_full:
> IGT changes Possible regressions
>
>    -
>
>    {igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-4-512x512} (NEW):
>    - {shard-dg1}: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-dg1-15/igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-4-512x512.html>
>       +15 similar issues
>    -
>
>    igt@kms_panel_fitting@atomic-fastset@pipe-b-edp-1:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-iclb2/igt@kms_panel_fitting@atomic-fastset@pipe-b-edp-1.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb2/igt@kms_panel_fitting@atomic-fastset@pipe-b-edp-1.html>
>
> Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>    - igt@prime_self_import@reimport-vs-gem_close-race:
>       - {shard-tglu}: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglu-4/igt@prime_self_import@reimport-vs-gem_close-race.html>
>
> New tests
>
> New tests have been introduced between IGT_6586_full and IGTPW_7526_full:
> New IGT tests (89)
>
>    -
>
>    igt@kms_atomic_interruptible@legacy-setmode@hdmi-a-4-pipe-a:
>    - Statuses : 1 pass(s)
>       - Exec time: [6.13] s
>    -
>
>    igt@kms_atomic_transition
>    @plane-all-transition-nonblocking-fencing@hdmi-a-4-pipe-a:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.82] s
>    -
>
>    igt@kms_atomic_transition
>    @plane-all-transition-nonblocking-fencing@hdmi-a-4-pipe-b:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.88] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-4-128x128:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.42] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-4-128x42:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.42] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-4-256x256:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.42] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-4-256x85:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.42] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-4-32x10:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.01] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-4-32x32:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.01] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-4-512x170:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-4-512x512:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-4-64x21:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.44] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-4-64x64:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.43] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-4-128x128:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.40] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-4-128x42:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.41] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-4-256x256:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.41] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-4-256x85:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.39] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-4-32x10:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.01] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-4-32x32:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.02] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-4-512x170:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-4-512x512:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-4-64x21:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.41] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-4-64x64:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.39] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-4-128x128:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.42] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-4-128x42:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.41] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-4-256x256:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.40] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-4-256x85:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.41] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-4-32x10:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.01] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-4-32x32:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.01] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-4-512x170:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-4-512x512:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-4-64x21:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.41] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-4-64x64:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.40] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-4-128x128:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.42] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-4-128x42:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.42] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-4-256x256:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.42] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-4-256x85:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.42] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-4-32x10:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.01] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-4-32x32:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.01] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-4-512x170:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-4-512x512:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-4-64x21:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.42] s
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-4-64x64:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.42] s
>    -
>
>    igt@kms_cursor_edge_walk@right-edge@pipe-a-hdmi-a-4-128x128:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.22] s
>    -
>
>    igt@kms_cursor_edge_walk@right-edge@pipe-a-hdmi-a-4-256x256:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.22] s
>    -
>
>    igt@kms_cursor_edge_walk@right-edge@pipe-a-hdmi-a-4-64x64:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.29] s
>    -
>
>    igt@kms_cursor_edge_walk@right-edge@pipe-b-hdmi-a-4-128x128:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.21] s
>    -
>
>    igt@kms_cursor_edge_walk@right-edge@pipe-b-hdmi-a-4-256x256:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.21] s
>    -
>
>    igt@kms_cursor_edge_walk@right-edge@pipe-b-hdmi-a-4-64x64:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.20] s
>    -
>
>    igt@kms_cursor_edge_walk@right-edge@pipe-c-hdmi-a-4-128x128:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.20] s
>    -
>
>    igt@kms_cursor_edge_walk@right-edge@pipe-c-hdmi-a-4-256x256:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.20] s
>    -
>
>    igt@kms_cursor_edge_walk@right-edge@pipe-c-hdmi-a-4-64x64:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.21] s
>    -
>
>    igt@kms_cursor_edge_walk@right-edge@pipe-d-hdmi-a-4-128x128:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.20] s
>    -
>
>    igt@kms_cursor_edge_walk@right-edge@pipe-d-hdmi-a-4-256x256:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.19] s
>    -
>
>    igt@kms_cursor_edge_walk@right-edge@pipe-d-hdmi-a-4-64x64:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.21] s
>    -
>
>    igt@kms_cursor_edge_walk@top-edge@pipe-a-hdmi-a-4-128x128:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.22] s
>    -
>
>    igt@kms_cursor_edge_walk@top-edge@pipe-a-hdmi-a-4-256x256:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.21] s
>    -
>
>    igt@kms_cursor_edge_walk@top-edge@pipe-a-hdmi-a-4-64x64:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.29] s
>    -
>
>    igt@kms_cursor_edge_walk@top-edge@pipe-b-hdmi-a-4-128x128:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.20] s
>    -
>
>    igt@kms_cursor_edge_walk@top-edge@pipe-b-hdmi-a-4-256x256:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.20] s
>    -
>
>    igt@kms_cursor_edge_walk@top-edge@pipe-b-hdmi-a-4-64x64:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.20] s
>    -
>
>    igt@kms_cursor_edge_walk@top-edge@pipe-c-hdmi-a-4-128x128:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.20] s
>    -
>
>    igt@kms_cursor_edge_walk@top-edge@pipe-c-hdmi-a-4-256x256:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.21] s
>    -
>
>    igt@kms_cursor_edge_walk@top-edge@pipe-c-hdmi-a-4-64x64:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.19] s
>    -
>
>    igt@kms_cursor_edge_walk@top-edge@pipe-d-hdmi-a-4-128x128:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.19] s
>    -
>
>    igt@kms_cursor_edge_walk@top-edge@pipe-d-hdmi-a-4-256x256:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.20] s
>    -
>
>    igt@kms_cursor_edge_walk@top-edge@pipe-d-hdmi-a-4-64x64:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.20] s
>    -
>
>    igt@kms_flip@flip-vs-panning-vs-hang@a-hdmi-a4:
>    - Statuses : 1 pass(s)
>       - Exec time: [29.67] s
>    -
>
>    igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a4:
>    - Statuses : 1 pass(s)
>       - Exec time: [30.0] s
>    -
>
>    igt@kms_flip@modeset-vs-vblank-race@a-hdmi-a4:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.03] s
>    -
>
>    igt@kms_flip@modeset-vs-vblank-race@b-hdmi-a4:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.97] s
>    -
>
>    igt@kms_flip@modeset-vs-vblank-race@c-hdmi-a4:
>    - Statuses : 1 pass(s)
>       - Exec time: [3.00] s
>    -
>
>    igt@kms_flip@modeset-vs-vblank-race@d-hdmi-a4:
>    - Statuses : 1 pass(s)
>       - Exec time: [2.92] s
>    -
>
>    igt@kms_flip@plain-flip-ts-check@a-hdmi-a4:
>    - Statuses : 1 pass(s)
>       - Exec time: [8.00] s
>    -
>
>    igt@kms_flip@plain-flip-ts-check@b-hdmi-a4:
>    - Statuses : 1 pass(s)
>       - Exec time: [7.93] s
>    -
>
>    igt@kms_flip@plain-flip-ts-check@c-hdmi-a4:
>    - Statuses : 1 pass(s)
>       - Exec time: [7.93] s
>    -
>
>    igt@kms_flip@plain-flip-ts-check@d-hdmi-a4:
>    - Statuses : 1 pass(s)
>       - Exec time: [7.93] s
>    -
>
>    igt@kms_plane_scaling
>    @plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.03] s
>    -
>
>    igt@kms_plane_scaling
>    @plane-downscale-with-pixel-format-factor-0-25@pipe-b-hdmi-a-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.03] s
>    -
>
>    igt@kms_plane_scaling
>    @plane-downscale-with-pixel-format-factor-0-25@pipe-c-hdmi-a-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.03] s
>    -
>
>    igt@kms_plane_scaling
>    @plane-downscale-with-pixel-format-factor-0-25@pipe-d-hdmi-a-4:
>    - Statuses : 1 skip(s)
>       - Exec time: [0.03] s
>    -
>
>    igt@kms_plane_scaling
>    @planes-unity-scaling-downscale-factor-0-75@pipe-a-hdmi-a-4:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.22] s
>    -
>
>    igt@kms_plane_scaling
>    @planes-unity-scaling-downscale-factor-0-75@pipe-b-hdmi-a-4:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.20] s
>    -
>
>    igt@kms_plane_scaling
>    @planes-unity-scaling-downscale-factor-0-75@pipe-c-hdmi-a-4:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.20] s
>    -
>
>    igt@kms_plane_scaling
>    @planes-unity-scaling-downscale-factor-0-75@pipe-d-hdmi-a-4:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.20] s
>    -
>
>    igt@kms_plane_scaling
>    @planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-hdmi-a-4:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.23] s
>    -
>
>    igt@kms_plane_scaling
>    @planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-hdmi-a-4:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.20] s
>    -
>
>    igt@kms_plane_scaling
>    @planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-4:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.20] s
>    -
>
>    igt@kms_plane_scaling
>    @planes-upscale-factor-0-25-downscale-factor-0-5@pipe-d-hdmi-a-4:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.20] s
>
> Known issues
>
> Here are the changes found in IGTPW_7526_full that come from known issues:
> IGT changes Issues hit
>
>    -
>
>    igt@gem_ctx_persistence@engines-mixed:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-snb7/igt@gem_ctx_persistence@engines-mixed.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#1099 <https://gitlab.freedesktop.org/drm/intel/issues/1099>)
>    -
>
>    igt@gem_exec_fair@basic-deadline:
>    - shard-kbl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl6/igt@gem_exec_fair@basic-deadline.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl1/igt@gem_exec_fair@basic-deadline.html>
>       (i915#2846 <https://gitlab.freedesktop.org/drm/intel/issues/2846>)
>    -
>
>    igt@gem_exec_fair@basic-none-solo@rcs0:
>    -
>
>       shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb3/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -
>
>       shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-glk5/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -
>
>       shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb5/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -
>
>    igt@gem_exec_fair@basic-none@vcs1:
>    - shard-kbl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl6/igt@gem_exec_fair@basic-none@vcs1.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl1/igt@gem_exec_fair@basic-none@vcs1.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       +3 similar issues
>    -
>
>    igt@gem_exec_fair@basic-pace-solo@rcs0:
>    - shard-kbl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       +1 similar issue
>    -
>
>    igt@gem_exec_fair@basic-pace@vecs0:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-iclb4/igt@gem_exec_fair@basic-pace@vecs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb5/igt@gem_exec_fair@basic-pace@vecs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       +1 similar issue
>    -
>
>    igt@gem_huc_copy@huc-copy:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-tglb1/igt@gem_huc_copy@huc-copy.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb7/igt@gem_huc_copy@huc-copy.html>
>       (i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
>    -
>
>    igt@gem_lmem_swapping@heavy-verify-multi:
>    -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-apl1/igt@gem_lmem_swapping@heavy-verify-multi.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>       +1 similar issue
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb3/igt@gem_lmem_swapping@heavy-verify-multi.html>
>       (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-glk8/igt@gem_lmem_swapping@heavy-verify-multi.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb5/igt@gem_lmem_swapping@heavy-verify-multi.html>
>       (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>       -
>
>       shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl1/igt@gem_lmem_swapping@heavy-verify-multi.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>       +1 similar issue
>       -
>
>    igt@gem_pxp@fail-invalid-protected-context:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb8/igt@gem_pxp@fail-invalid-protected-context.html>
>       (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb2/igt@gem_pxp@fail-invalid-protected-context.html>
>       (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>       -
>
>    igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb3/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html>
>       (i915#768 <https://gitlab.freedesktop.org/drm/intel/issues/768>)
>    -
>
>    igt@gem_softpin@evict-single-offset:
>    -
>
>       shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-apl1/igt@gem_softpin@evict-single-offset.html>
>       (i915#4171 <https://gitlab.freedesktop.org/drm/intel/issues/4171>)
>       -
>
>       shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-glk8/igt@gem_softpin@evict-single-offset.html>
>       (i915#4171 <https://gitlab.freedesktop.org/drm/intel/issues/4171>)
>       -
>
>       shard-kbl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl1/igt@gem_softpin@evict-single-offset.html>
>       (i915#4171 <https://gitlab.freedesktop.org/drm/intel/issues/4171>)
>       -
>
>    igt@gem_workarounds@suspend-resume-context:
>    - shard-kbl: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl7/igt@gem_workarounds@suspend-resume-context.html>
>       (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>    -
>
>    igt@gem_workarounds@suspend-resume-fd:
>    - shard-kbl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html>
>       (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>) +2
>       similar issues
>    -
>
>    igt@i915_pm_dc@dc9-dpms:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-apl7/igt@i915_pm_dc@dc9-dpms.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-apl6/igt@i915_pm_dc@dc9-dpms.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>    -
>
>    igt@i915_query@query-topology-unsupported:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb2/igt@i915_query@query-topology-unsupported.html>
>       (fdo#109302 <https://bugs.freedesktop.org/show_bug.cgi?id=109302>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb3/igt@i915_query@query-topology-unsupported.html>
>       (fdo#109302 <https://bugs.freedesktop.org/show_bug.cgi?id=109302>)
>       -
>
>    igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>    -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-apl2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +107 similar issues
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html>
>       (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>       +1 similar issue
>       -
>
>    igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb2/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html>
>       (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>       +1 similar issue
>    -
>
>    igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb1/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html>
>       (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>)
>    -
>
>    igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb8/igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_rc_ccs_cc.html>
>       (i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>       +1 similar issue
>    -
>
>    igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
>    -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-glk2/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb2/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html>
>       (fdo#109278 <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       -
>
>    igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
>    -
>
>       shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl6/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +3 similar issues
>       -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-apl3/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +2 similar issues
>       -
>
>    igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_mc_ccs:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb8/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_mc_ccs.html>
>       (fdo#109278 <https://bugs.freedesktop.org/show_bug.cgi?id=109278>)
>       +7 similar issues
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb7/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_mc_ccs.html>
>       (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>       i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>       -
>
>    igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb7/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs.html>
>       (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689>)
>       +1 similar issue
>    -
>
>    igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb3/igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs.html>
>       (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615> /
>       i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689>)
>    -
>
>    igt@kms_chamelium@vga-hpd:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-apl1/igt@kms_chamelium@vga-hpd.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +4 similar issues
>    -
>
>    igt@kms_color_chamelium@pipe-a-ctm-max:
>    -
>
>       shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl6/igt@kms_color_chamelium@pipe-a-ctm-max.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +6 similar issues
>       -
>
>       shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-snb5/igt@kms_color_chamelium@pipe-a-ctm-max.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +1 similar issue
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb3/igt@kms_color_chamelium@pipe-a-ctm-max.html>
>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +1 similar issue
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-glk5/igt@kms_color_chamelium@pipe-a-ctm-max.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +1 similar issue
>       -
>
>    igt@kms_color_chamelium@pipe-c-ctm-limited-range:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb7/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html>
>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +1 similar issue
>    -
>
>    igt@kms_content_protection@legacy:
>    -
>
>       shard-apl: NOTRUN -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-apl4/igt@kms_content_protection@legacy.html>
>       (i915#1319 <https://gitlab.freedesktop.org/drm/intel/issues/1319>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb7/igt@kms_content_protection@legacy.html>
>       (i915#1063 <https://gitlab.freedesktop.org/drm/intel/issues/1063>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb4/igt@kms_content_protection@legacy.html>
>       (fdo#109300 <https://bugs.freedesktop.org/show_bug.cgi?id=109300> /
>       fdo#111066 <https://bugs.freedesktop.org/show_bug.cgi?id=111066>)
>       -
>
>       shard-kbl: NOTRUN -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl1/igt@kms_content_protection@legacy.html>
>       (i915#1319 <https://gitlab.freedesktop.org/drm/intel/issues/1319>)
>       -
>
>    igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled.html>
>       (i915#5287 <https://gitlab.freedesktop.org/drm/intel/issues/5287>)
>       +1 similar issue
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb5/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled.html>
>       (i915#5287 <https://gitlab.freedesktop.org/drm/intel/issues/5287>)
>       +1 similar issue
>       -
>
>    igt@kms_flip@2x-flip-vs-fences-interruptible:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb8/igt@kms_flip@2x-flip-vs-fences-interruptible.html>
>       (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>       fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825> /
>       i915#3637 <https://gitlab.freedesktop.org/drm/intel/issues/3637>)
>       +1 similar issue
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb1/igt@kms_flip@2x-flip-vs-fences-interruptible.html>
>       (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>)
>       +1 similar issue
>       -
>
>    igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html>
>       (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html>
>       (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>       +6 similar issues
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html>
>       (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html>
>       (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>       +2 similar issues
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html>
>       (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672> /
>       i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>    -
>
>    igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-pwrite:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-pwrite.html>
>       (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280> /
>       fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
>       +10 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
>    - shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html>
>       (i915#160 <https://gitlab.freedesktop.org/drm/intel/issues/160>) +2
>       similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-glk9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +43 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html>
>       (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280>)
>       +10 similar issues
>    -
>
>    {igt@kms_plane_scaling
>    @plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-4} (NEW):
>    - {shard-dg1}: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-dg1-15/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-4.html>
>       (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>)
>       +3 similar issues
>    -
>
>    igt@kms_plane_scaling
>    @plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-iclb5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html>
>       (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>)
>       +1 similar issue
>    -
>
>    igt@kms_plane_scaling
>    @plane-scaler-with-clipping-clamping-rotation@pipe-a-vga-1:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-snb2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-vga-1.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +75 similar issues
>    -
>
>    igt@kms_plane_scaling
>    @plane-scaler-with-clipping-clamping-rotation@pipe-b-edp-1:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-edp-1.html>
>       (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>)
>       +2 similar issues
>    -
>
>    igt@kms_plane_scaling
>    @plane-scaler-with-clipping-clamping-rotation@pipe-d-edp-1:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-edp-1.html>
>       (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>)
>       +3 similar issues
>    -
>
>    igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
>    -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-apl1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>       -
>
>       shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>       -
>
>    igt@kms_psr@psr2_primary_mmap_gtt:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb4/igt@kms_psr@psr2_primary_mmap_gtt.html>
>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>       +3 similar issues
>    -
>
>    igt@kms_psr@psr2_sprite_mmap_gtt:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb5/igt@kms_psr@psr2_sprite_mmap_gtt.html>
>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>       -
>
>       shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb7/igt@kms_psr@psr2_sprite_mmap_gtt.html>
>       (i915#132 <https://gitlab.freedesktop.org/drm/intel/issues/132> /
>       i915#3467 <https://gitlab.freedesktop.org/drm/intel/issues/3467>)
>       -
>
>    igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>       (i915#5519 <https://gitlab.freedesktop.org/drm/intel/issues/5519>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>       (i915#5519 <https://gitlab.freedesktop.org/drm/intel/issues/5519>)
>       -
>
>    igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>       (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615> /
>       i915#5289 <https://gitlab.freedesktop.org/drm/intel/issues/5289>)
>    -
>
>    igt@kms_vblank@pipe-b-ts-continuation-suspend:
>    -
>
>       shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-iclb1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html>
>       (fdo#111764 <https://bugs.freedesktop.org/show_bug.cgi?id=111764>)
>       -
>
>       shard-kbl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html>
>       (i915#3614 <https://gitlab.freedesktop.org/drm/intel/issues/3614> /
>       i915#4939 <https://gitlab.freedesktop.org/drm/intel/issues/4939>)
>       -
>
>    igt@kms_writeback@writeback-check-output:
>    -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-apl3/igt@kms_writeback@writeback-check-output.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb3/igt@kms_writeback@writeback-check-output.html>
>       (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-glk1/igt@kms_writeback@writeback-check-output.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb4/igt@kms_writeback@writeback-check-output.html>
>       (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>       -
>
>       shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl6/igt@kms_writeback@writeback-check-output.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>       -
>
>    igt@perf@gen12-mi-rpc:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb1/igt@perf@gen12-mi-rpc.html>
>       (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>    -
>
>    igt@prime_nv_pcopy@test2:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl1/igt@prime_nv_pcopy@test2.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +120 similar issues
>    -
>
>    igt@prime_nv_test@nv_write_i915_cpu_mmap_read:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb7/igt@prime_nv_test@nv_write_i915_cpu_mmap_read.html>
>       (fdo#109291 <https://bugs.freedesktop.org/show_bug.cgi?id=109291>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb4/igt@prime_nv_test@nv_write_i915_cpu_mmap_read.html>
>       (fdo#109291 <https://bugs.freedesktop.org/show_bug.cgi?id=109291>)
>       -
>
>    igt@sysfs_clients@split-10:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb5/igt@sysfs_clients@split-10.html>
>       (i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>       -
>
>       shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl6/igt@sysfs_clients@split-10.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>       -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-apl8/igt@sysfs_clients@split-10.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb3/igt@sysfs_clients@split-10.html>
>       (i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-glk5/igt@sysfs_clients@split-10.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>       -
>
>    igt@tools_test@sysfs_l3_parity:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb1/igt@tools_test@sysfs_l3_parity.html>
>       (fdo#109307 <https://bugs.freedesktop.org/show_bug.cgi?id=109307>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb6/igt@tools_test@sysfs_l3_parity.html>
>       (fdo#109307 <https://bugs.freedesktop.org/show_bug.cgi?id=109307>)
>
> Possible fixes
>
>    -
>
>    igt@drm_read@short-buffer-nonblock:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-rkl-2/igt@drm_read@short-buffer-nonblock.html>
>       (i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-6/igt@drm_read@short-buffer-nonblock.html>
>    -
>
>    igt@fbdev@nullptr:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-rkl-1/igt@fbdev@nullptr.html>
>       (i915#2582 <https://gitlab.freedesktop.org/drm/intel/issues/2582>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-6/igt@fbdev@nullptr.html>
>    -
>
>    igt@gem_ctx_exec@basic-nohangcheck:
>    - shard-tglb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-tglb5/igt@gem_ctx_exec@basic-nohangcheck.html>
>       (i915#6268 <https://gitlab.freedesktop.org/drm/intel/issues/6268>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb5/igt@gem_ctx_exec@basic-nohangcheck.html>
>    -
>
>    igt@gem_ctx_persistence@hostile:
>    - {shard-tglu}: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-tglu-6/igt@gem_ctx_persistence@hostile.html>
>       (i915#2410 <https://gitlab.freedesktop.org/drm/intel/issues/2410>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglu-6/igt@gem_ctx_persistence@hostile.html>
>    -
>
>    igt@gem_eio@in-flight-immediate:
>    - shard-tglb: TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-tglb8/igt@gem_eio@in-flight-immediate.html>
>       (i915#3063 <https://gitlab.freedesktop.org/drm/intel/issues/3063>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb6/igt@gem_eio@in-flight-immediate.html>
>    -
>
>    igt@gem_eio@kms:
>    - shard-tglb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-tglb2/igt@gem_eio@kms.html>
>       (i915#5784 <https://gitlab.freedesktop.org/drm/intel/issues/5784>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb7/igt@gem_eio@kms.html>
>    -
>
>    igt@gem_eio@unwedge-stress:
>    - {shard-rkl}: TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-rkl-1/igt@gem_eio@unwedge-stress.html>
>       (i915#3063 <https://gitlab.freedesktop.org/drm/intel/issues/3063>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-5/igt@gem_eio@unwedge-stress.html>
>    -
>
>    igt@gem_exec_balancer@parallel-keep-submit-fence:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-iclb3/igt@gem_exec_balancer@parallel-keep-submit-fence.html>
>       (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fence.html>
>    -
>
>    igt@gem_exec_fair@basic-none-share@rcs0:
>    - shard-tglb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-tglb3/igt@gem_exec_fair@basic-none-share@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html>
>    -
>
>    igt@gem_exec_fair@basic-pace@vecs0:
>    - shard-kbl: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html>
>    -
>
>    igt@gem_exec_nop@basic-sequential:
>    - shard-glk: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-glk2/igt@gem_exec_nop@basic-sequential.html>
>       (i915#118 <https://gitlab.freedesktop.org/drm/intel/issues/118>) ->
>       PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-glk1/igt@gem_exec_nop@basic-sequential.html>
>    -
>
>    igt@gem_exec_reloc@basic-write-read-noreloc:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-rkl-2/igt@gem_exec_reloc@basic-write-read-noreloc.html>
>       (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-noreloc.html>
>       +8 similar issues
>    -
>
>    igt@gem_pread@uncached:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-rkl-1/igt@gem_pread@uncached.html>
>       (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-5/igt@gem_pread@uncached.html>
>       +1 similar issue
>    -
>
>    igt@gem_softpin@noreloc-s3:
>    - shard-kbl: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl4/igt@gem_softpin@noreloc-s3.html>
>       (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>) ->
>       PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl1/igt@gem_softpin@noreloc-s3.html>
>    -
>
>    igt@gen9_exec_parse@unaligned-access:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-rkl-6/igt@gen9_exec_parse@unaligned-access.html>
>       (i915#2527 <https://gitlab.freedesktop.org/drm/intel/issues/2527>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-5/igt@gen9_exec_parse@unaligned-access.html>
>       +1 similar issue
>    -
>
>    igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
>    - {shard-dg1}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-dg1-13/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html>
>       (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-dg1-15/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html>
>       +1 similar issue
>    -
>
>    igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
>    - shard-glk: DMESG-FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-glk3/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html>
>       (i915#118 <https://gitlab.freedesktop.org/drm/intel/issues/118> /
>       i915#1888 <https://gitlab.freedesktop.org/drm/intel/issues/1888>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-glk2/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html>
>    -
>
>    igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-rkl-2/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled.html>
>       (fdo#111314 <https://bugs.freedesktop.org/show_bug.cgi?id=111314> /
>       i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098> /
>       i915#4369 <https://gitlab.freedesktop.org/drm/intel/issues/4369>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled.html>
>       +3 similar issues
>    -
>
>    igt@kms_fbcon_fbt@fbc-suspend:
>    - shard-apl: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html>
>       (i915#4767 <https://gitlab.freedesktop.org/drm/intel/issues/4767>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html>
>    -
>
>    igt@kms_flip@flip-vs-suspend@a-dp1:
>    - shard-apl: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html>
>       (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>) ->
>       PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-apl8/igt@kms_flip@flip-vs-suspend@a-dp1.html>
>    -
>
>    igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html>
>       (i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>       i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html>
>       +10 similar issues
>    -
>
>    igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:
>    - shard-kbl: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl7/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html>
>       (i915#1188 <https://gitlab.freedesktop.org/drm/intel/issues/1188>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl1/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html>
>       +1 similar issue
>    -
>
>    igt@kms_lease@page_flip_implicit_plane:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-rkl-2/igt@kms_lease@page_flip_implicit_plane.html>
>       (i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>       i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-6/igt@kms_lease@page_flip_implicit_plane.html>
>       +18 similar issues
>    -
>
>    igt@kms_plane_multiple@atomic-pipe-b-tiling-x:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-rkl-1/igt@kms_plane_multiple@atomic-pipe-b-tiling-x.html>
>       (i915#3558 <https://gitlab.freedesktop.org/drm/intel/issues/3558> /
>       i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-6/igt@kms_plane_multiple@atomic-pipe-b-tiling-x.html>
>    -
>
>    igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-iclb2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html>
>       (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb4/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html>
>       +5 similar issues
>    -
>
>    igt@kms_psr@primary_blt:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-rkl-1/igt@kms_psr@primary_blt.html>
>       (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-6/igt@kms_psr@primary_blt.html>
>       +1 similar issue
>    -
>
>    igt@kms_psr@psr2_primary_blt:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-iclb6/igt@kms_psr@psr2_primary_blt.html>
>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb2/igt@kms_psr@psr2_primary_blt.html>
>       +2 similar issues
>    -
>
>    igt@kms_rotation_crc@multiplane-rotation-cropping-top:
>    - shard-glk: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-glk3/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html>
>       (i915#1888 <https://gitlab.freedesktop.org/drm/intel/issues/1888>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-glk7/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html>
>       +1 similar issue
>    -
>
>    igt@kms_universal_plane@disable-primary-vs-flip-pipe-b:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-rkl-1/igt@kms_universal_plane@disable-primary-vs-flip-pipe-b.html>
>       (i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>       i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070> /
>       i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-6/igt@kms_universal_plane@disable-primary-vs-flip-pipe-b.html>
>    -
>
>    igt@perf@mi-rpc:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-rkl-2/igt@perf@mi-rpc.html>
>       (i915#2434 <https://gitlab.freedesktop.org/drm/intel/issues/2434>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-5/igt@perf@mi-rpc.html>
>    -
>
>    igt@perf@polling-parameterized:
>    - shard-iclb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-iclb1/igt@perf@polling-parameterized.html>
>       (i915#5639 <https://gitlab.freedesktop.org/drm/intel/issues/5639>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb6/igt@perf@polling-parameterized.html>
>
> Warnings
>
>    -
>
>    igt@gem_exec_balancer@parallel-ordering:
>    - shard-iclb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html>
>       (i915#6117 <https://gitlab.freedesktop.org/drm/intel/issues/6117>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb6/igt@gem_exec_balancer@parallel-ordering.html>
>       (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>    -
>
>    igt@i915_pm_dc@dc3co-vpb-simulation:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-iclb3/igt@i915_pm_dc@dc3co-vpb-simulation.html>
>       (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) ->
>       SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html>
>       (i915#588 <https://gitlab.freedesktop.org/drm/intel/issues/588>)
>    -
>
>    igt@i915_pm_rpm@modeset-lpsp:
>    - shard-glk: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-glk3/igt@i915_pm_rpm@modeset-lpsp.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-glk7/igt@i915_pm_rpm@modeset-lpsp.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#1888 <https://gitlab.freedesktop.org/drm/intel/issues/1888>)
>    -
>
>    igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html>
>       (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb1/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html>
>       (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) +1
>       similar issue
>    -
>
>    igt@kms_psr2_sf@cursor-plane-update-sf:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html>
>       (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb6/igt@kms_psr2_sf@cursor-plane-update-sf.html>
>       (fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>    -
>
>    igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html>
>       (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) ->
>       SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html>
>       (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>       +1 similar issue
>    -
>
>    igt@runner@aborted:
>    - shard-kbl: (FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl7/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl4/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl4/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl7/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl7/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl1/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl4/igt@runner@aborted.html>)
>       (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180> /
>       i915#3002 <https://gitlab.freedesktop.org/drm/intel/issues/3002> /
>       i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312> /
>       i915#5257 <https://gitlab.freedesktop.org/drm/intel/issues/5257>)
>       -> (FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl4/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl4/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl4/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl7/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl6/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl4/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl7/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl4/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl7/igt@runner@aborted.html>)
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180> /
>       i915#3002 <https://gitlab.freedesktop.org/drm/intel/issues/3002> /
>       i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312> /
>       i915#5257 <https://gitlab.freedesktop.org/drm/intel/issues/5257>)
>
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> Build changes
>
>    - CI: CI-20190529 -> None
>    - IGT: IGT_6586 -> IGTPW_7526
>
> CI-20190529: 20190529
> CI_DRM_11900: 5218ea24682b8edb1d629323dce5c88a44e225b0 @ git://
> anongit.freedesktop.org/gfx-ci/linux
> IGTPW_7526: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/index.html
> IGT_6586: 0e5931f66eb283ba404b07394840b8e0b0c5e621 @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>

--000000000000fd60d505e4156289
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey Lakhmi, the change is for chameleon lib but the failed=
 test seems unrelated. Can we rerun?<div>Thanks!</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 16, 2022=
 at 1:15 PM Patchwork &lt;<a href=3D"mailto:patchwork@emeril.freedesktop.or=
g">patchwork@emeril.freedesktop.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<u></u>

=20
 =20
 =20
 =20

<div>


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>lib/igt_chamelium: Extend check of va=
lid ports to port=3D0</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/106397/" target=3D"_blank">https://patchwork.freedesktop.org/series/10=
6397/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/index.html" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7526/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from IGT_6586_full -&gt; IGTPW_7526_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7526_full absolutely need to b=
e<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in IGTPW_7526_full, please notify your bug team to allow them<=
br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7526/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7526/index.html</a></p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7526=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-4-512x512} (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-dg1-15/igt@kms_cursor_crc@cursor-offscreen@p=
ipe-a-hdmi-a-4-512x512.html" target=3D"_blank">SKIP</a> +15 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset@pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-iclb2/igt@kms_panel_fitting@atomic-fastset@pipe-b-edp-1.htm=
l" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-iclb2/igt@kms_panel_fitting@atomic-fastset@pi=
pe-b-edp-1.html" target=3D"_blank">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br>
  They do not affect the overall result.</p>
<ul>
<li>igt@prime_self_import@reimport-vs-gem_close-race:<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-tglu-4/igt@prime_self_import@reimport-vs-gem=
_close-race.html" target=3D"_blank">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6586_full and IGTPW_7526_full=
:</p>
<h3>New IGT tests (89)</h3>
<ul>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode@hdmi-a-4-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@hdmi-=
a-4-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@hdmi-=
a-4-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-4-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-4-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-4-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-4-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-4-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-4-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-4-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-4-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-4-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-4-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-4-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-4-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-4-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-4-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-4-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-4-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-4-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-4-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-4-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-4-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-4-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-4-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-4-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-4-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-4-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-4-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-4-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-4-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-b-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-b-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-b-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-c-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-c-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-c-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-d-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-d-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-d-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-b-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-b-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-b-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-c-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-c-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-c-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-d-hdmi-a-4-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-d-hdmi-a-4-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-d-hdmi-a-4-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang@a-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [29.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [30.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@a-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@b-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@c-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@d-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@d-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe=
-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe=
-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe=
-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe=
-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a-=
hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b-=
hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c-=
hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d-=
hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7526_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-snb7/igt@gem_ctx_persistence@engines-mixed.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/1099" target=3D"_blank">i915#109=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-kbl6/igt@gem_exec_fair@basic-deadline.html" target=3D"_blan=
k">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7526/shard-kbl1/igt@gem_exec_fair@basic-deadline.html" target=3D"_blank">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2846" t=
arget=3D"_blank">i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb3/igt@gem_exec_fair@basic-none-solo@rcs0.=
html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2842" target=3D"_blank">i915#2842</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-glk5/igt@gem_exec_fair@basic-none-solo@rcs0.h=
tml" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2842" target=3D"_blank">i915#2842</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-iclb5/igt@gem_exec_fair@basic-none-solo@rcs0.=
html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2842" target=3D"_blank">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-kbl6/igt@gem_exec_fair@basic-none@vcs1.html" target=3D"_bla=
nk">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7526/shard-kbl1/igt@gem_exec_fair@basic-none@vcs1.html" target=3D"_blank"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842"=
 target=3D"_blank">i915#2842</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-kbl4/igt@gem_exec_fair@basic-pace-solo@rcs0.=
html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2842" target=3D"_blank">i915#2842</a>) +1 similar issue</=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-iclb4/igt@gem_exec_fair@basic-pace@vecs0.html" target=3D"_b=
lank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7526/shard-iclb5/igt@gem_exec_fair@basic-pace@vecs0.html" target=3D"_bl=
ank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842" target=3D"_blank">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-tglb1/igt@gem_huc_copy@huc-copy.html" target=3D"_blank">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/=
shard-tglb7/igt@gem_huc_copy@huc-copy.html" target=3D"_blank">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190" target=3D"_bl=
ank">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-apl1/igt@gem_lmem_swapping@heavy-verify-multi=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/4613" target=3D"_blank">i915#4=
613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb3/igt@gem_lmem_swapping@heavy-verify-mult=
i.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/4613" target=3D"_blank">i915#4613</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-glk8/igt@gem_lmem_swapping@heavy-verify-multi=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/4613" target=3D"_blank">i915#4=
613</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-iclb5/igt@gem_lmem_swapping@heavy-verify-mult=
i.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/4613" target=3D"_blank">i915#4613</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-kbl1/igt@gem_lmem_swapping@heavy-verify-multi=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/4613" target=3D"_blank">i915#4=
613</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb8/igt@gem_pxp@fail-invalid-protected-cont=
ext.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/4270" target=3D"_blank">i915#4270</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-iclb2/igt@gem_pxp@fail-invalid-protected-cont=
ext.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/4270" target=3D"_blank">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-iclb3/igt@gem_render_copy@yf-tiled-mc-ccs-to=
-vebox-y-tiled.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/768" target=3D"_blank">i915#768</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-apl1/igt@gem_softpin@evict-single-offset.html=
" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4171" target=3D"_blank">i915#4171</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-glk8/igt@gem_softpin@evict-single-offset.html=
" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4171" target=3D"_blank">i915#4171</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-kbl1/igt@gem_softpin@evict-single-offset.html=
" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4171" target=3D"_blank">i915#4171</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-kbl7/igt@gem_workarounds@suspend-resume-cont=
ext.html" target=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/180" target=3D"_blank">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html" target=3D"=
_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7526/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html" target=3D=
"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/180" target=3D"_blank">i915#180</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-apl7/igt@i915_pm_dc@dc9-dpms.html" target=3D"_blank">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/sha=
rd-apl6/igt@i915_pm_dc@dc9-dpms.html" target=3D"_blank">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank=
">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb2/igt@i915_query@query-topology-unsupport=
ed.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109302" target=3D"_blank">fdo#109302</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-iclb3/igt@i915_query@query-topology-unsupport=
ed.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109302" target=3D"_blank">fdo#109302</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-apl2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +107 similar issu=
es</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/5286" target=3D"_blank">i915#5286</a>) +1 similar issue</=
p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-iclb2/igt@kms_big_fb@4-tiled-64bpp-rotate-18=
0.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/5286" target=3D"_blank">i915#5286</a>) +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-tglb1/igt@kms_big_fb@yf-tiled-32bpp-rotate-2=
70.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D111615" target=3D"_blank">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-tglb8/igt@kms_ccs@pipe-a-crc-primary-basic-4=
_tiled_dg2_rc_ccs_cc.html" target=3D"_blank">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/6095" target=3D"_blank">i915#6095</a=
>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-glk2/igt@kms_ccs@pipe-b-bad-rotation-90-y_til=
ed_gen12_rc_ccs_cc.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" target=
=3D"_blank">i915#3886</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-iclb2/igt@kms_ccs@pipe-b-bad-rotation-90-y_ti=
led_gen12_rc_ccs_cc.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109278" target=3D"_blank">fdo#109278</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" targe=
t=3D"_blank">i915#3886</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-kbl6/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_t=
iled_gen12_rc_ccs_cc.html" target=3D"_blank">SKIP</a> (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" targ=
et=3D"_blank">i915#3886</a>) +3 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-apl3/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_t=
iled_gen12_rc_ccs_cc.html" target=3D"_blank">SKIP</a> (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" targ=
et=3D"_blank">i915#3886</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-iclb8/igt@kms_ccs@pipe-c-crc-primary-basic-4_=
tiled_dg2_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D109278" target=3D"_blank">fdo#109278</a>)=
 +7 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb7/igt@kms_ccs@pipe-c-crc-primary-basic-4_=
tiled_dg2_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/3689" target=3D"_blank">i915#3689</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6095" target=3D"=
_blank">i915#6095</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-tglb7/igt@kms_ccs@pipe-c-crc-sprite-planes-b=
asic-y_tiled_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/3689" target=3D"_blank">i915#3689</a>) +=
1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-tglb3/igt@kms_ccs@pipe-d-crc-primary-basic-y=
f_tiled_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D111615" target=3D"_blank">fdo#111615</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3689" target=3D"_bl=
ank">i915#3689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-apl1/igt@kms_chamelium@vga-hpd.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111827</a>) +4=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-max:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-kbl6/igt@kms_color_chamelium@pipe-a-ctm-max.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https=
://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111=
827</a>) +6 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-snb5/igt@kms_color_chamelium@pipe-a-ctm-max.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https=
://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111=
827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb3/igt@kms_color_chamelium@pipe-a-ctm-max.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109284" target=3D"_blank">fdo#109284</a> / <a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#11=
1827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-glk5/igt@kms_color_chamelium@pipe-a-ctm-max.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https=
://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111=
827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-limited-range:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-iclb7/igt@kms_color_chamelium@pipe-c-ctm-lim=
ited-range.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109284" target=3D"_blank">fdo#109284</a> / <a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_bl=
ank">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-apl4/igt@kms_content_protection@legacy.html" =
target=3D"_blank">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1319" target=3D"_blank">i915#1319</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb7/igt@kms_content_protection@legacy.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1063" target=3D"_blank">i915#1063</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-iclb4/igt@kms_content_protection@legacy.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109300" target=3D"_blank">fdo#109300</a> / <a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D111066" target=3D"_blank">fdo#111066<=
/a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-kbl1/igt@kms_content_protection@legacy.html" =
target=3D"_blank">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1319" target=3D"_blank">i915#1319</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb3/igt@kms_draw_crc@draw-method-xrgb8888-m=
map-wc-4tiled.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/5287" target=3D"_blank">i915#5287</a>) +1 s=
imilar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-iclb5/igt@kms_draw_crc@draw-method-xrgb8888-m=
map-wc-4tiled.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/5287" target=3D"_blank">i915#5287</a>) +1 s=
imilar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb8/igt@kms_flip@2x-flip-vs-fences-interrup=
tible.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109274" target=3D"_blank">fdo#109274</a> / <a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111825" target=3D"_blank=
">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3637" target=3D"_blank">i915#3637</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-iclb1/igt@kms_flip@2x-flip-vs-fences-interrup=
tible.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109274" target=3D"_blank">fdo#109274</a>) +1 similar=
 issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html"=
 target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7526/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible=
@b-dp1.html" target=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/180" target=3D"_blank">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-iclb4/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html" target=3D"_blank">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672" =
target=3D"_blank">i915#2672</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-tglb5/igt@kms_flip_scaled_crc@flip-64bpp-4ti=
le-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html" target=3D"_bl=
ank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
672" target=3D"_blank">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-lin=
ear-to-16bpp-linear-downscaling@pipe-a-default-mode.html" target=3D"_blank"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555"=
 target=3D"_blank">i915#3555</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html" target=3D"_bl=
ank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
672" target=3D"_blank">i915#2672</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/3555" target=3D"_blank">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-cur-indfb-draw-pwrite.html" target=3D"_blank">SKIP</a> (<a href=3D"h=
ttps://bugs.freedesktop.org/show_bug.cgi?id=3D109280" target=3D"_blank">fdo=
#109280</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
825" target=3D"_blank">fdo#111825</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-ti=
ling-linear.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/160" target=3D"_blank">i915#160</a>) +2 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu:</p=
>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-glk9/igt@kms_frontbuffer_tracking@psr-1p-pri=
mscrn-pri-indfb-draw-mmap-cpu.html" target=3D"_blank">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fd=
o#109271</a>) +43 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-iclb6/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-cur-indfb-move.html" target=3D"_blank">SKIP</a> (<a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D109280" target=3D"_blank">fdo#109280=
</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pip=
e-a-hdmi-a-4} (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-dg1-15/igt@kms_plane_scaling@plane-downscale=
-with-pixel-format-factor-0-25@pipe-a-hdmi-a-4.html" target=3D"_blank">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176" targ=
et=3D"_blank">i915#5176</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-iclb5/igt@kms_plane_scaling@plane-scaler-with-clipping-clam=
ping-pixel-formats@pipe-b-edp-1.html" target=3D"_blank">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb3/igt@=
kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-=
edp-1.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/5176" target=3D"_blank">i915#5176</a>) +1 similar i=
ssue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
a-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-snb2/igt@kms_plane_scaling@plane-scaler-with=
-clipping-clamping-rotation@pipe-a-vga-1.html" target=3D"_blank">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D=
"_blank">fdo#109271</a>) +75 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
b-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-iclb4/igt@kms_plane_scaling@plane-scaler-wit=
h-clipping-clamping-rotation@pipe-b-edp-1.html" target=3D"_blank">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176" target=3D=
"_blank">i915#5176</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
d-edp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-tglb7/igt@kms_plane_scaling@plane-scaler-wit=
h-clipping-clamping-rotation@pipe-d-edp-1.html" target=3D"_blank">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176" target=3D=
"_blank">i915#5176</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-apl1/igt@kms_psr2_sf@overlay-plane-update-sf-=
dmg-area.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" target=3D"_blank"=
>i915#658</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-kbl1/igt@kms_psr2_sf@overlay-plane-update-sf-=
dmg-area.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" target=3D"_blank"=
>i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html" target=3D"_bl=
ank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7526/shard-iclb4/igt@kms_psr@psr2_primary_mmap_gtt.html" target=3D"_blan=
k">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1094=
41" target=3D"_blank">fdo#109441</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-iclb5/igt@kms_psr@psr2_sprite_mmap_gtt.html" =
target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109441" target=3D"_blank">fdo#109441</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb7/igt@kms_psr@psr2_sprite_mmap_gtt.html" =
target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/132" target=3D"_blank">i915#132</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/3467" target=3D"_blank">i915#3467</a>)</p=
>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb7/igt@kms_psr_stress_test@invalidate-prim=
ary-flip-overlay.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/5519" target=3D"_blank">i915#5519</a>)</=
p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-iclb8/igt@kms_psr_stress_test@invalidate-prim=
ary-flip-overlay.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/5519" target=3D"_blank">i915#5519</a>)</=
p>
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-tglb3/igt@kms_rotation_crc@primary-yf-tiled-=
reflect-x-180.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D111615" target=3D"_blank">fdo#111615</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5289" target=3D"_=
blank">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6586/shard-iclb1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html" ta=
rget=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7526/shard-iclb4/igt@kms_vblank@pipe-b-ts-continuation-suspen=
d.html" target=3D"_blank">INCOMPLETE</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D111764" target=3D"_blank">fdo#111764</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6586/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html" tar=
get=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7526/shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.=
html" target=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3614" target=3D"_blank">i915#3614</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/4939" target=3D"_blank">i91=
5#4939</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-apl3/igt@kms_writeback@writeback-check-output=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2437" target=3D"_blank">i915#2=
437</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb3/igt@kms_writeback@writeback-check-outpu=
t.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/2437" target=3D"_blank">i915#2437</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-glk1/igt@kms_writeback@writeback-check-output=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2437" target=3D"_blank">i915#2=
437</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-iclb4/igt@kms_writeback@writeback-check-outpu=
t.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/2437" target=3D"_blank">i915#2437</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-kbl6/igt@kms_writeback@writeback-check-output=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2437" target=3D"_blank">i915#2=
437</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-mi-rpc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-iclb1/igt@perf@gen12-mi-rpc.html" target=3D"=
_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109289" target=3D"_blank">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test2:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7526/shard-kbl1/igt@prime_nv_pcopy@test2.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271" target=3D"_blank">fdo#109271</a>) +120 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@nv_write_i915_cpu_mmap_read:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb7/igt@prime_nv_test@nv_write_i915_cpu_mma=
p_read.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109291" target=3D"_blank">fdo#109291</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-iclb4/igt@prime_nv_test@nv_write_i915_cpu_mma=
p_read.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109291" target=3D"_blank">fdo#109291</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-10:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-iclb5/igt@sysfs_clients@split-10.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2994" target=3D"_blank">i915#2994</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-kbl6/igt@sysfs_clients@split-10.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2994" target=3D"_blank">i915#2994</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-apl8/igt@sysfs_clients@split-10.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2994" target=3D"_blank">i915#2994</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb3/igt@sysfs_clients@split-10.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2994" target=3D"_blank">i915#2994</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-glk5/igt@sysfs_clients@split-10.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2994" target=3D"_blank">i915#2994</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-tglb1/igt@tools_test@sysfs_l3_parity.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109307" target=3D"_blank">fdo#109307</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7526/shard-iclb6/igt@tools_test@sysfs_l3_parity.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109307" target=3D"_blank">fdo#109307</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_read@short-buffer-nonblock:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-rkl-2/igt@drm_read@short-buffer-nonblock.html" target=3D"_b=
lank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4098" target=3D"_blank">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-6/igt@drm_read@short-buffer-nonb=
lock.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-rkl-1/igt@fbdev@nullptr.html" target=3D"_blank">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2582" target=3D"_=
blank">i915#2582</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7526/shard-rkl-6/igt@fbdev@nullptr.html" target=3D"_blank">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-tglb5/igt@gem_ctx_exec@basic-nohangcheck.html" target=3D"_b=
lank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
6268" target=3D"_blank">i915#6268</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7526/shard-tglb5/igt@gem_ctx_exec@basic-nohangc=
heck.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-tglu-6/igt@gem_ctx_persistence@hostile.html" target=3D"_bla=
nk">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/24=
10" target=3D"_blank">i915#2410</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7526/shard-tglu-6/igt@gem_ctx_persistence@hostile=
.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-immediate:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-tglb8/igt@gem_eio@in-flight-immediate.html" target=3D"_blan=
k">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
3063" target=3D"_blank">i915#3063</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7526/shard-tglb6/igt@gem_eio@in-flight-immediat=
e.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-tglb2/igt@gem_eio@kms.html" target=3D"_blank">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5784" target=3D"_bl=
ank">i915#5784</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7526/shard-tglb7/igt@gem_eio@kms.html" target=3D"_blank">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-rkl-1/igt@gem_eio@unwedge-stress.html" target=3D"_blank">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063"=
 target=3D"_blank">i915#3063</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7526/shard-rkl-5/igt@gem_eio@unwedge-stress.html" ta=
rget=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-iclb3/igt@gem_exec_balancer@parallel-keep-submit-fence.html=
" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4525" target=3D"_blank">i915#4525</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb1/igt@gem_exec_bal=
ancer@parallel-keep-submit-fence.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-tglb3/igt@gem_exec_fair@basic-none-share@rcs0.html" target=
=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2842" target=3D"_blank">i915#2842</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-tglb2/igt@gem_exec_fair@basic-=
none-share@rcs0.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html" target=3D"_bl=
ank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842" target=3D"_blank">i915#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7526/shard-kbl1/igt@gem_exec_fair@basic-pace@vec=
s0.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_nop@basic-sequential:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-glk2/igt@gem_exec_nop@basic-sequential.html" target=3D"_bla=
nk">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/118" target=3D"_blank">i915#118</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7526/shard-glk1/igt@gem_exec_nop@basic-sequen=
tial.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-rkl-2/igt@gem_exec_reloc@basic-write-read-noreloc.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3281" target=3D"_blank">i915#3281</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-5/igt@gem_exec_reloc@ba=
sic-write-read-noreloc.html" target=3D"_blank">PASS</a> +8 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@gem_pread@uncached:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-rkl-1/igt@gem_pread@uncached.html" target=3D"_blank">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3282" target=
=3D"_blank">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7526/shard-rkl-5/igt@gem_pread@uncached.html" target=3D"_bl=
ank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-kbl4/igt@gem_softpin@noreloc-s3.html" target=3D"_blank">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180=
" target=3D"_blank">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7526/shard-kbl1/igt@gem_softpin@noreloc-s3.html" tar=
get=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-rkl-6/igt@gen9_exec_parse@unaligned-access.html" target=3D"=
_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2527" target=3D"_blank">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-5/igt@gen9_exec_parse@unaligne=
d-access.html" target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-dg1-13/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html" targe=
t=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1397" target=3D"_blank">i915#1397</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-dg1-15/igt@i915_pm_rpm@dpms-m=
ode-unset-non-lpsp.html" target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-glk3/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html" target=
=3D"_blank">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/118" target=3D"_blank">i915#118</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/1888" target=3D"_blank">i915#1888</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-gl=
k2/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html" target=3D"_blank">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-rkl-2/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-yti=
led.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D111314" target=3D"_blank">fdo#111314</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/4098" target=3D"_blank">i91=
5#4098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/436=
9" target=3D"_blank">i915#4369</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7526/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb=
2101010-mmap-gtt-ytiled.html" target=3D"_blank">PASS</a> +3 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html" target=3D"_blank">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4767" =
target=3D"_blank">i915#4767</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7526/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html" t=
arget=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html" target=3D"_bl=
ank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/180" target=3D"_blank">i915#180</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7526/shard-apl8/igt@kms_flip@flip-vs-suspend=
@a-dp1.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrf=
b-draw-mmap-wc.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/1849" target=3D"_blank">i915#1849</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098" target=3D"_b=
lank">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7526/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri=
-shrfb-draw-mmap-wc.html" target=3D"_blank">PASS</a> +10 similar issues</li=
>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-kbl7/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html" target=
=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1188" target=3D"_blank">i915#1188</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl1/igt@kms_hdr@bpc-switch-dp=
ms@pipe-a-dp-1.html" target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_lease@page_flip_implicit_plane:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-rkl-2/igt@kms_lease@page_flip_implicit_plane.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1845" target=3D"_blank">i915#1845</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/4098" target=3D"_blank">i915#4098</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-rkl-6/=
igt@kms_lease@page_flip_implicit_plane.html" target=3D"_blank">PASS</a> +18=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-x:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-rkl-1/igt@kms_plane_multiple@atomic-pipe-b-tiling-x.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3558" target=3D"_blank">i915#3558</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/4070" target=3D"_blank">i915#4070</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-r=
kl-6/igt@kms_plane_multiple@atomic-pipe-b-tiling-x.html" target=3D"_blank">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-iclb2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pip=
e-a-edp-1.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/5235" target=3D"_blank">i915#5235</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb4/ig=
t@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html" target=
=3D"_blank">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_blt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-rkl-1/igt@kms_psr@primary_blt.html" target=3D"_blank">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1072" targe=
t=3D"_blank">i915#1072</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7526/shard-rkl-6/igt@kms_psr@primary_blt.html" target=3D"_=
blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-iclb6/igt@kms_psr@psr2_primary_blt.html" target=3D"_blank">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441"=
 target=3D"_blank">fdo#109441</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7526/shard-iclb2/igt@kms_psr@psr2_primary_blt.html"=
 target=3D"_blank">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-glk3/igt@kms_rotation_crc@multiplane-rotation-cropping-top.=
html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1888" target=3D"_blank">i915#1888</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-glk7/igt@kms_rotat=
ion_crc@multiplane-rotation-cropping-top.html" target=3D"_blank">PASS</a> +=
1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-b:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-rkl-1/igt@kms_universal_plane@disable-primary-vs-flip-pipe-=
b.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1845" target=3D"_blank">i915#1845</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/4070" target=3D"_blank">i915#40=
70</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098" t=
arget=3D"_blank">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7526/shard-rkl-6/igt@kms_universal_plane@disable-prima=
ry-vs-flip-pipe-b.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-rkl-2/igt@perf@mi-rpc.html" target=3D"_blank">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2434" target=3D"_bl=
ank">i915#2434</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7526/shard-rkl-5/igt@perf@mi-rpc.html" target=3D"_blank">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-iclb1/igt@perf@polling-parameterized.html" target=3D"_blank=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5639=
" target=3D"_blank">i915#5639</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7526/shard-iclb6/igt@perf@polling-parameterized.htm=
l" target=3D"_blank">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html" target=
=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/6117" target=3D"_blank">i915#6117</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb6/igt@gem_exec_balancer@pa=
rallel-ordering.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/4525" target=3D"_blank">i915#4525</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-iclb3/igt@i915_pm_dc@dc3co-vpb-simulation.html" target=3D"_=
blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/658" target=3D"_blank">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7526/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simula=
tion.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/588" target=3D"_blank">i915#588</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-glk3/igt@i915_pm_rpm@modeset-lpsp.html" target=3D"_blank">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271" =
target=3D"_blank">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7526/shard-glk7/igt@i915_pm_rpm@modeset-lpsp.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/1888" target=3D"_blank">i915#1888</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-s=
f.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/2920" target=3D"_blank">i915#2920</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb1/igt@kms_ps=
r2_sf@cursor-plane-move-continuous-exceed-sf.html" target=3D"_blank">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" target=
=3D"_blank">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2920" target=3D"_blank">i915#2920</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb6/igt@kms_psr2_sf@cursor-p=
lane-update-sf.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D111068" target=3D"_blank">fdo#111068</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" target=3D"_=
blank">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6586/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-=
fb.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/658" target=3D"_blank">i915#658</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-iclb2/igt@kms_psr=
2_sf@primary-plane-update-sf-dmg-area-big-fb.html" target=3D"_blank">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920" target=
=3D"_blank">i915#2920</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6586/shard-kbl7/igt@runner@aborted.html" target=3D"_blank">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl4/igt=
@runner@aborted.html" target=3D"_blank">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl4/igt@runner@aborted.html" tar=
get=3D"_blank">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6586/shard-kbl7/igt@runner@aborted.html" target=3D"_blank">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl7/igt=
@runner@aborted.html" target=3D"_blank">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGT_6586/shard-kbl1/igt@runner@aborted.html" tar=
get=3D"_blank">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6586/shard-kbl4/igt@runner@aborted.html" target=3D"_blank">FAIL</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180" target=3D"=
_blank">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/3002" target=3D"_blank">i915#3002</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/4312" target=3D"_blank">i915#4312</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257" target=3D"_bla=
nk">i915#5257</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7526/shard-kbl4/igt@runner@aborted.html" target=3D"_blank">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl=
4/igt@runner@aborted.html" target=3D"_blank">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl4/igt@runner@aborted.ht=
ml" target=3D"_blank">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7526/shard-kbl7/igt@runner@aborted.html" target=3D"_blank">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/sha=
rd-kbl6/igt@runner@aborted.html" target=3D"_blank">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl4/igt@runner@abor=
ted.html" target=3D"_blank">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7526/shard-kbl7/igt@runner@aborted.html" target=3D"_bl=
ank">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_75=
26/shard-kbl4/igt@runner@aborted.html" target=3D"_blank">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7526/shard-kbl7/igt@runn=
er@aborted.html" target=3D"_blank">FAIL</a>) (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180" target=3D"_bla=
nk">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3002" target=3D"_blank">i915#3002</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/4312" target=3D"_blank">i915#4312</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257" target=3D"_blank"=
>i915#5257</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br>
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6586 -&gt; IGTPW_7526</li>
</ul>
<p>CI-20190529: 20190529<br>
  CI_DRM_11900: 5218ea24682b8edb1d629323dce5c88a44e225b0 @ git://<a href=3D=
"http://anongit.freedesktop.org/gfx-ci/linux" target=3D"_blank">anongit.fre=
edesktop.org/gfx-ci/linux</a><br>
  IGTPW_7526: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_752=
6/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7526/index.html</a><br>
  IGT_6586: 0e5931f66eb283ba404b07394840b8e0b0c5e621 @ <a href=3D"https://g=
itlab.freedesktop.org/drm/igt-gpu-tools.git" target=3D"_blank">https://gitl=
ab.freedesktop.org/drm/igt-gpu-tools.git</a></p>

</div>

</blockquote></div>

--000000000000fd60d505e4156289--
