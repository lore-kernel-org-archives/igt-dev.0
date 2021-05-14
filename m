Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2BD6EE92
 for <igt-dev@lists.freedesktop.org>; Fri, 14 May 2021 14:47:27 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id w4so38179215ljw.9
 for <igt-dev@lists.freedesktop.org>; Fri, 14 May 2021 07:47:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210513145352.2790280-1-markyacoub@chromium.org>
 <162094179845.26534.7207461629414016096@emeril.freedesktop.org>
In-Reply-To: <162094179845.26534.7207461629414016096@emeril.freedesktop.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Fri, 14 May 2021 10:47:14 -0400
Message-ID: <CAJUqKUr_RLLaMf5XgVpUX1skNNr+vD3=Gk4bV=5HNBut0RF49Q@mail.gmail.com>
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
	=?utf-8?q?kms=5Fpanel=5Ffitting=3A_Move_Intel_GEN_check_under_a_is?=
	=?utf-8?q?=5Fi915=5Fdevice?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0917015881=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0917015881==
Content-Type: multipart/alternative; boundary="00000000000079fbc005c24b5217"

--00000000000079fbc005c24b5217
Content-Type: text/plain; charset="UTF-8"

I have a feeling this is a false positive for this patch.
Can someone verify. Thanks!

On Thu, May 13, 2021 at 5:36 PM Patchwork <patchwork@emeril.freedesktop.org>
wrote:

> *Patch Details*
> *Series:* tests/kms_panel_fitting: Move Intel GEN check under a
> is_i915_device
> *URL:* https://patchwork.freedesktop.org/series/90136/
> *State:* failure
> *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/index.html CI
> Bug Log - changes from CI_DRM_10074_full -> IGTPW_5811_full Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_5811_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_5811_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/index.html
> Possible new issues
>
> Here are the unknown changes that may have been introduced in
> IGTPW_5811_full:
> IGT changes Possible regressions
>
>    -
>
>    igt@gem_mmap_gtt@cpuset-medium-copy-xy:
>    - shard-snb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-snb5/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb7/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html>
>    -
>
>    igt@gem_mmap_gtt@fault-concurrent-x:
>    -
>
>       shard-iclb: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb5/igt@gem_mmap_gtt@fault-concurrent-x.html>
>       -
>
>       shard-snb: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb5/igt@gem_mmap_gtt@fault-concurrent-x.html>
>       -
>
>    igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
>    - shard-tglb: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html>
>    -
>
>    igt@kms_plane_cursor@pipe-b-overlay-size-64:
>    - shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb7/igt@kms_plane_cursor@pipe-b-overlay-size-64.html>
>       +2 similar issues
>    -
>
>    igt@kms_plane_cursor@pipe-b-primary-size-256:
>    - shard-snb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb7/igt@kms_plane_cursor@pipe-b-primary-size-256.html>
>
> Warnings
>
>    -
>
>    igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
>    - shard-glk: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html>
>       ([i915#3457]) -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html>
>    -
>
>    igt@kms_plane_cursor@pipe-b-viewport-size-128:
>    - shard-tglb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-tglb6/igt@kms_plane_cursor@pipe-b-viewport-size-128.html>
>       ([i915#3457]) -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb6/igt@kms_plane_cursor@pipe-b-viewport-size-128.html>
>
> Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>    - {igt@kms_plane@plane-position-hole-dpms@pipe-a-planes}:
>       - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk9/igt@kms_plane@plane-position-hole-dpms@pipe-a-planes.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk8/igt@kms_plane@plane-position-hole-dpms@pipe-a-planes.html>
>
> New tests
>
> New tests have been introduced between CI_DRM_10074_full and
> IGTPW_5811_full:
> New IGT tests (2)
>
>    -
>
>    igt@kms_plane@plane-panning-top-left@pipe-a-planes:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.33] s
>    -
>
>    igt@kms_plane@plane-panning-top-left@pipe-b-planes:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.39] s
>
> Known issues
>
> Here are the changes found in IGTPW_5811_full that come from known issues:
> IGT changes Issues hit
>
>    -
>
>    igt@api_intel_bb@delta-check:
>    - shard-apl: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl7/igt@api_intel_bb@delta-check.html>
>       ([i915#3457])
>    -
>
>    igt@api_intel_bb@offset-control:
>    - shard-snb: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb7/igt@api_intel_bb@offset-control.html>
>       ([i915#3457]) +3 similar issues
>    -
>
>    igt@feature_discovery@chamelium:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@feature_discovery@chamelium.html>
>       ([fdo#111827])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb6/igt@feature_discovery@chamelium.html>
>       ([fdo#111827])
>       -
>
>    igt@gem_create@create-massive:
>    -
>
>       shard-iclb: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb8/igt@gem_create@create-massive.html>
>       ([i915#3002])
>       -
>
>       shard-tglb: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb5/igt@gem_create@create-massive.html>
>       ([i915#3002])
>       -
>
>       shard-glk: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk3/igt@gem_create@create-massive.html>
>       ([i915#3002])
>       -
>
>    igt@gem_ctx_persistence@legacy-engines-mixed-process:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb7/igt@gem_ctx_persistence@legacy-engines-mixed-process.html>
>       ([fdo#109271] / [i915#1099]) +5 similar issues
>    -
>
>    igt@gem_ctx_sseu@invalid-sseu:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb1/igt@gem_ctx_sseu@invalid-sseu.html>
>       ([i915#280])
>    -
>
>    igt@gem_eio@suspend:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-iclb4/igt@gem_eio@suspend.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb3/igt@gem_eio@suspend.html>
>       ([i915#1185])
>    -
>
>    igt@gem_eio@unwedge-stress:
>    -
>
>       shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-iclb2/igt@gem_eio@unwedge-stress.html>
>       -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@gem_eio@unwedge-stress.html>
>       ([i915#2369] / [i915#2481] / [i915#3070] / [i915#3457])
>       -
>
>       shard-snb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb5/igt@gem_eio@unwedge-stress.html>
>       ([i915#3354] / [i915#3457])
>       -
>
>    igt@gem_exec_fair@basic-deadline:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl2/igt@gem_exec_fair@basic-deadline.html>
>       ([i915#2846] / [i915#3457])
>    -
>
>    igt@gem_exec_fair@basic-none-share@rcs0:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-iclb4/igt@gem_exec_fair@basic-none-share@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html>
>       ([i915#2842] / [i915#3457])
>    -
>
>    igt@gem_exec_fair@basic-none-vip@rcs0:
>    - shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb7/igt@gem_exec_fair@basic-none-vip@rcs0.html>
>       ([i915#2842] / [i915#3457])
>    -
>
>    igt@gem_exec_fair@basic-none@vcs1:
>    - shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@gem_exec_fair@basic-none@vcs1.html>
>       ([i915#2842] / [i915#3457]) +1 similar issue
>    -
>
>    igt@gem_exec_fair@basic-none@vecs0:
>    - shard-kbl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-kbl1/igt@gem_exec_fair@basic-none@vecs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl7/igt@gem_exec_fair@basic-none@vecs0.html>
>       ([i915#2842] / [i915#3457])
>    -
>
>    igt@gem_exec_params@no-vebox:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb3/igt@gem_exec_params@no-vebox.html>
>       ([fdo#109283])
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@gem_exec_params@no-vebox.html>
>       ([fdo#109283])
>       -
>
>    igt@gem_exec_params@secure-non-root:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb1/igt@gem_exec_params@secure-non-root.html>
>       ([fdo#112283]) +1 similar issue
>    -
>
>    igt@gem_exec_reloc@basic-wide-active@bcs0:
>    - shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@gem_exec_reloc@basic-wide-active@bcs0.html>
>       ([i915#2389] / [i915#3457]) +4 similar issues
>    -
>
>    igt@gem_exec_reloc@basic-wide-active@rcs0:
>    -
>
>       shard-snb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb2/igt@gem_exec_reloc@basic-wide-active@rcs0.html>
>       ([i915#2389] / [i915#3457]) +2 similar issues
>       -
>
>       shard-kbl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl4/igt@gem_exec_reloc@basic-wide-active@rcs0.html>
>       ([i915#2389] / [i915#3457]) +4 similar issues
>       -
>
>    igt@gem_exec_reloc@basic-wide-active@vcs1:
>    - shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb2/igt@gem_exec_reloc@basic-wide-active@vcs1.html>
>       ([i915#2389] / [i915#3457])
>    -
>
>    igt@gem_exec_schedule@preempt@vcs0:
>    - shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk6/igt@gem_exec_schedule@preempt@vcs0.html>
>       ([i915#3457]) +45 similar issues
>    -
>
>    igt@gem_exec_schedule@submit-golden-slice@rcs0:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk2/igt@gem_exec_schedule@submit-golden-slice@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk6/igt@gem_exec_schedule@submit-golden-slice@rcs0.html>
>       ([i915#3457]) +44 similar issues
>    -
>
>    igt@gem_exec_whisper@basic-contexts-priority:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk2/igt@gem_exec_whisper@basic-contexts-priority.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk3/igt@gem_exec_whisper@basic-contexts-priority.html>
>       ([i915#118] / [i915#95])
>    -
>
>    igt@gem_media_vme:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb3/igt@gem_media_vme.html>
>       ([i915#284])
>    -
>
>    igt@gem_mmap_gtt@big-copy:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk2/igt@gem_mmap_gtt@big-copy.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk6/igt@gem_mmap_gtt@big-copy.html>
>       ([i915#307])
>    -
>
>    igt@gem_mmap_gtt@big-copy-odd:
>    - shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk2/igt@gem_mmap_gtt@big-copy-odd.html>
>       ([i915#307])
>    -
>
>    igt@gem_mmap_gtt@cpuset-basic-small-copy:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk4/igt@gem_mmap_gtt@cpuset-basic-small-copy.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk3/igt@gem_mmap_gtt@cpuset-basic-small-copy.html>
>       ([i915#3468]) +1 similar issue
>    -
>
>    igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
>    - shard-snb: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb6/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html>
>       ([i915#3468]) +2 similar issues
>    -
>
>    igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-tglb6/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb6/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html>
>       ([i915#3468])
>    -
>
>    igt@gem_mmap_gtt@cpuset-big-copy-odd:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-iclb6/igt@gem_mmap_gtt@cpuset-big-copy-odd.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@gem_mmap_gtt@cpuset-big-copy-odd.html>
>       ([i915#307]) +1 similar issue
>    -
>
>    igt@gem_mmap_gtt@fault-concurrent-x:
>    -
>
>       shard-glk: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk8/igt@gem_mmap_gtt@fault-concurrent-x.html>
>       ([i915#3468])
>       -
>
>       shard-tglb: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb3/igt@gem_mmap_gtt@fault-concurrent-x.html>
>       ([i915#3468])
>       -
>
>    igt@gem_ppgtt@blt-vs-render-ctxn:
>    -
>
>       shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl7/igt@gem_ppgtt@blt-vs-render-ctxn.html>
>       ([i915#3476])
>       -
>
>       shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk2/igt@gem_ppgtt@blt-vs-render-ctxn.html>
>       ([i915#3476])
>       -
>
>    igt@gem_render_copy@y-tiled-to-vebox-linear:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb2/igt@gem_render_copy@y-tiled-to-vebox-linear.html>
>       ([i915#768])
>    -
>
>    igt@gem_render_copy@yf-tiled-ccs-to-x-tiled:
>    - shard-apl: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl7/igt@gem_render_copy@yf-tiled-ccs-to-x-tiled.html>
>       ([i915#3468]) +4 similar issues
>    -
>
>    igt@gem_spin_batch@engines@vcs0:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl2/igt@gem_spin_batch@engines@vcs0.html>
>       ([i915#2898] / [i915#3457]) +3 similar issues
>    -
>
>    igt@gem_userptr_blits@dmabuf-sync:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl1/igt@gem_userptr_blits@dmabuf-sync.html>
>       ([fdo#109271] / [i915#3323])
>    -
>
>    igt@gem_userptr_blits@unsync-unmap-cycles:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb7/igt@gem_userptr_blits@unsync-unmap-cycles.html>
>       ([i915#3297]) +3 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@gem_userptr_blits@unsync-unmap-cycles.html>
>       ([i915#3297]) +2 similar issues
>       -
>
>    igt@gem_userptr_blits@vma-merge:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl7/igt@gem_userptr_blits@vma-merge.html>
>       ([i915#3318] / [i915#3457])
>    -
>
>    igt@gem_wait@write-busy@rcs0:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl2/igt@gem_wait@write-busy@rcs0.html>
>       ([i915#3457]) +10 similar issues
>    -
>
>    igt@gem_workarounds@suspend-resume:
>    - shard-snb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-snb5/igt@gem_workarounds@suspend-resume.html>
>       -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb2/igt@gem_workarounds@suspend-resume.html>
>       ([i915#2808] / [i915#3457])
>    -
>
>    igt@gem_workarounds@suspend-resume-context:
>    - shard-kbl: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl3/igt@gem_workarounds@suspend-resume-context.html>
>       ([i915#180] / [i915#3457])
>    -
>
>    igt@gen7_exec_parse@load-register-reg:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb8/igt@gen7_exec_parse@load-register-reg.html>
>       ([fdo#109289]) +3 similar issues
>    -
>
>    igt@gen9_exec_parse@bb-oversize:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb5/igt@gen9_exec_parse@bb-oversize.html>
>       ([i915#2527])
>    -
>
>    igt@gen9_exec_parse@bb-start-param:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb2/igt@gen9_exec_parse@bb-start-param.html>
>       ([fdo#112306]) +4 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb5/igt@gen9_exec_parse@bb-start-param.html>
>       ([fdo#112306]) +1 similar issue
>       -
>
>    igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html>
>       ([fdo#109271] / [i915#1937])
>    -
>
>    igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html>
>       ([fdo#109271] / [i915#1937])
>    -
>
>    igt@i915_pm_rpm@cursor:
>    - shard-glk: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk6/igt@i915_pm_rpm@cursor.html>
>       ([i915#3457])
>    -
>
>    igt@i915_pm_rpm@dpms-non-lpsp:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb2/igt@i915_pm_rpm@dpms-non-lpsp.html>
>       ([fdo#111644] / [i915#1397] / [i915#2411]) +1 similar issue
>    -
>
>    igt@i915_pm_rpm@gem-execbuf-stress-pc8:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html>
>       ([fdo#109293] / [fdo#109506])
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html>
>       ([fdo#109506] / [i915#2411])
>       -
>
>    igt@i915_pm_rpm@gem-mmap-type@uc:
>    -
>
>       shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk5/igt@i915_pm_rpm@gem-mmap-type@uc.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk3/igt@i915_pm_rpm@gem-mmap-type@uc.html>
>       ([i915#3475])
>       -
>
>       shard-tglb: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb2/igt@i915_pm_rpm@gem-mmap-type@uc.html>
>       ([i915#2411])
>       -
>
>       shard-kbl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-kbl2/igt@i915_pm_rpm@gem-mmap-type@uc.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl7/igt@i915_pm_rpm@gem-mmap-type@uc.html>
>       ([i915#3475])
>       -
>
>    igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb8/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>       ([fdo#110892]) +1 similar issue
>    -
>
>    igt@i915_pm_rps@reset:
>    -
>
>       shard-tglb: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb1/igt@i915_pm_rps@reset.html>
>       ([i915#3457]) +2 similar issues
>       -
>
>       shard-iclb: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb6/igt@i915_pm_rps@reset.html>
>       ([i915#3457])
>       -
>
>       shard-glk: NOTRUN -> DMESG-FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk2/igt@i915_pm_rps@reset.html>
>       ([i915#3457])
>       -
>
>    igt@i915_pm_sseu@full-enable:
>    -
>
>       shard-kbl: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl1/igt@i915_pm_sseu@full-enable.html>
>       ([i915#3457]) +3 similar issues
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb1/igt@i915_pm_sseu@full-enable.html>
>       ([fdo#109288])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb2/igt@i915_pm_sseu@full-enable.html>
>       ([fdo#109288])
>       -
>
>    igt@i915_query@query-topology-known-pci-ids:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb7/igt@i915_query@query-topology-known-pci-ids.html>
>       ([fdo#109303])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb8/igt@i915_query@query-topology-known-pci-ids.html>
>       ([fdo#109303])
>       -
>
>    igt@i915_query@query-topology-unsupported:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb8/igt@i915_query@query-topology-unsupported.html>
>       ([fdo#109302])
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb5/igt@i915_query@query-topology-unsupported.html>
>       ([fdo#109302])
>       -
>
>    igt@i915_selftest@live@execlists:
>    - shard-tglb: NOTRUN -> DMESG-FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@i915_selftest@live@execlists.html>
>       ([i915#3462])
>    -
>
>    igt@i915_selftest@live@gt_lrc:
>    - shard-tglb: NOTRUN -> DMESG-FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@i915_selftest@live@gt_lrc.html>
>       ([i915#2373])
>    -
>
>    igt@i915_selftest@live@gt_pm:
>    - shard-tglb: NOTRUN -> DMESG-FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@i915_selftest@live@gt_pm.html>
>       ([i915#1759] / [i915#2291])
>    -
>
>    igt@i915_selftest@live@hangcheck:
>    - shard-snb: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb2/igt@i915_selftest@live@hangcheck.html>
>       ([i915#2782])
>    -
>
>    igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb8/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html>
>       ([fdo#110725] / [fdo#111614]) +1 similar issue
>    -
>
>    igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb2/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html>
>       ([fdo#111614]) +6 similar issues
>    -
>
>    igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html>
>       ([fdo#111615]) +7 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html>
>       ([fdo#110723]) +1 similar issue
>       -
>
>    igt@kms_big_joiner@invalid-modeset:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@kms_big_joiner@invalid-modeset.html>
>       ([i915#2705])
>       -
>
>       shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl3/igt@kms_big_joiner@invalid-modeset.html>
>       ([fdo#109271] / [i915#2705])
>       -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl2/igt@kms_big_joiner@invalid-modeset.html>
>       ([fdo#109271] / [i915#2705])
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk6/igt@kms_big_joiner@invalid-modeset.html>
>       ([fdo#109271] / [i915#2705])
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb5/igt@kms_big_joiner@invalid-modeset.html>
>       ([i915#2705])
>       -
>
>    igt@kms_ccs@pipe-d-bad-rotation-90:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@kms_ccs@pipe-d-bad-rotation-90.html>
>       ([fdo#109278]) +19 similar issues
>    -
>
>    igt@kms_chamelium@hdmi-edid-read:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb1/igt@kms_chamelium@hdmi-edid-read.html>
>       ([fdo#109284] / [fdo#111827]) +21 similar issues
>    -
>
>    igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb2/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html>
>       ([fdo#109284] / [fdo#111827]) +15 similar issues
>    -
>
>    igt@kms_chamelium@hdmi-mode-timings:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb5/igt@kms_chamelium@hdmi-mode-timings.html>
>       ([fdo#109271] / [fdo#111827]) +27 similar issues
>    -
>
>    igt@kms_chamelium@vga-edid-read:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl2/igt@kms_chamelium@vga-edid-read.html>
>       ([fdo#109271] / [fdo#111827]) +9 similar issues
>    -
>
>    igt@kms_chamelium@vga-hpd-enable-disable-mode:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk8/igt@kms_chamelium@vga-hpd-enable-disable-mode.html>
>       ([fdo#109271] / [fdo#111827]) +13 similar issues
>    -
>
>    igt@kms_color@pipe-a-degamma:
>    -
>
>       shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk4/igt@kms_color@pipe-a-degamma.html>
>       ([fdo#108145] / [i915#71])
>       -
>
>       shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb6/igt@kms_color@pipe-a-degamma.html>
>       ([i915#1149]) +1 similar issue
>       -
>
>    igt@kms_color@pipe-b-degamma:
>    -
>
>       shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb5/igt@kms_color@pipe-b-degamma.html>
>       ([i915#1149]) +1 similar issue
>       -
>
>       shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk3/igt@kms_color@pipe-b-degamma.html>
>       ([i915#71])
>       -
>
>    igt@kms_color@pipe-c-gamma:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk3/igt@kms_color@pipe-c-gamma.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk7/igt@kms_color@pipe-c-gamma.html>
>       ([i915#71])
>    -
>
>    igt@kms_color@pipe-d-ctm-0-75:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@kms_color@pipe-d-ctm-0-75.html>
>       ([fdo#109278] / [i915#1149]) +1 similar issue
>    -
>
>    igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl4/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html>
>       ([fdo#109271] / [fdo#111827]) +30 similar issues
>    -
>
>    igt@kms_color_chamelium@pipe-d-ctm-max:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb6/igt@kms_color_chamelium@pipe-d-ctm-max.html>
>       ([fdo#109278] / [fdo#109284] / [fdo#111827])
>    -
>
>    igt@kms_content_protection@atomic:
>    - shard-kbl: NOTRUN -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl4/igt@kms_content_protection@atomic.html>
>       ([i915#1319]) +2 similar issues
>    -
>
>    igt@kms_content_protection@dp-mst-lic-type-0:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@kms_content_protection@dp-mst-lic-type-0.html>
>       ([i915#3116])
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb7/igt@kms_content_protection@dp-mst-lic-type-0.html>
>       ([i915#3116])
>       -
>
>    igt@kms_content_protection@srm:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb2/igt@kms_content_protection@srm.html>
>       ([fdo#111828]) +2 similar issues
>    -
>
>    igt@kms_content_protection@type1:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb6/igt@kms_content_protection@type1.html>
>       ([fdo#109300] / [fdo#111066]) +1 similar issue
>    -
>
>    igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html>
>       ([i915#3444] / [i915#3457]) +7 similar issues
>    -
>
>    igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html>
>       ([i915#2124] / [i915#3457])
>    -
>
>    igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html>
>       ([i915#3444] / [i915#3457]) +1 similar issue
>    -
>
>    igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding.html>
>       ([i915#3319] / [i915#3457]) +6 similar issues
>    -
>
>    igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/>
>       ([fdo#109278] / [fdo#109279] / [i915#3457]) +1 similar issue
>
>

--00000000000079fbc005c24b5217
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have a feeling this is a false positive for this patch.<=
div>Can someone verify. Thanks!</div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 13, 2021 at 5:36 PM Patchw=
ork &lt;<a href=3D"mailto:patchwork@emeril.freedesktop.org">patchwork@emeri=
l.freedesktop.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<u></u>

=20
 =20
 =20
 =20

<div>


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>tests/kms_panel_fitting: Move Intel G=
EN check under a is_i915_device</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/90136/" target=3D"_blank">https://patchwork.freedesktop.org/series/901=
36/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/index.html" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5811/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from CI_DRM_10074_full -&gt; IGTPW_5811_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5811_full absolutely need to b=
e<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in IGTPW_5811_full, please notify your bug team to allow them<=
br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5811/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5811/index.html</a></p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5811=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10074/shard-snb5/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html" targe=
t=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5811/shard-snb7/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html" tar=
get=3D"_blank">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-x:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-iclb5/igt@gem_mmap_gtt@fault-concurrent-x.htm=
l" target=3D"_blank">INCOMPLETE</a></p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-snb5/igt@gem_mmap_gtt@fault-concurrent-x.html=
" target=3D"_blank">INCOMPLETE</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@gem_render_copy@y-tiled-mc-ccs-to-=
yf-tiled-ccs.html" target=3D"_blank">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-b-overlay-size-64:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-tglb7/igt@kms_plane_cursor@pipe-b-overlay-si=
ze-64.html" target=3D"_blank">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-b-primary-size-256:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-snb7/igt@kms_plane_cursor@pipe-b-primary-siz=
e-256.html" target=3D"_blank">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10074/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.ht=
ml" target=3D"_blank">FAIL</a> ([i915#3457]) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk6/igt@kms_cursor_legacy@fli=
p-vs-cursor-crc-legacy.html" target=3D"_blank">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-b-viewport-size-128:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10074/shard-tglb6/igt@kms_plane_cursor@pipe-b-viewport-size-128.htm=
l" target=3D"_blank">FAIL</a> ([i915#3457]) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb6/igt@kms_plane_cursor@pipe=
-b-viewport-size-128.html" target=3D"_blank">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br>
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_plane@plane-position-hole-dpms@pipe-a-planes}:<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10074/shard-glk9/igt@kms_plane@plane-position-hole-dpms@pipe-a-plan=
es.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5811/shard-glk8/igt@kms_plane@plane-position-hole-=
dpms@pipe-a-planes.html" target=3D"_blank">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10074_full and IGTPW_5811_=
full:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_plane@plane-panning-top-left@pipe-a-planes:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left@pipe-b-planes:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5811_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@delta-check:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-apl7/igt@api_intel_bb@delta-check.html" targ=
et=3D"_blank">DMESG-WARN</a> ([i915#3457])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@offset-control:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-snb7/igt@api_intel_bb@offset-control.html" t=
arget=3D"_blank">DMESG-WARN</a> ([i915#3457]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-tglb8/igt@feature_discovery@chamelium.html" t=
arget=3D"_blank">SKIP</a> ([fdo#111827])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-iclb6/igt@feature_discovery@chamelium.html" t=
arget=3D"_blank">SKIP</a> ([fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-iclb8/igt@gem_create@create-massive.html" tar=
get=3D"_blank">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-tglb5/igt@gem_create@create-massive.html" tar=
get=3D"_blank">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-glk3/igt@gem_create@create-massive.html" targ=
et=3D"_blank">DMESG-WARN</a> ([i915#3002])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-snb7/igt@gem_ctx_persistence@legacy-engines-=
mixed-process.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#1099])=
 +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-tglb1/igt@gem_ctx_sseu@invalid-sseu.html" ta=
rget=3D"_blank">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10074/shard-iclb4/igt@gem_eio@suspend.html" target=3D"_blank">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/sh=
ard-iclb3/igt@gem_eio@suspend.html" target=3D"_blank">INCOMPLETE</a> ([i915=
#1185])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10074/shard-iclb2/igt@gem_eio@unwedge-stress.html" target=3D"_blank"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
811/shard-iclb4/igt@gem_eio@unwedge-stress.html" target=3D"_blank">TIMEOUT<=
/a> ([i915#2369] / [i915#2481] / [i915#3070] / [i915#3457])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-snb5/igt@gem_eio@unwedge-stress.html" target=
=3D"_blank">FAIL</a> ([i915#3354] / [i915#3457])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-apl2/igt@gem_exec_fair@basic-deadline.html" =
target=3D"_blank">FAIL</a> ([i915#2846] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10074/shard-iclb4/igt@gem_exec_fair@basic-none-share@rcs0.html" tar=
get=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5811/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html"=
 target=3D"_blank">FAIL</a> ([i915#2842] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-tglb7/igt@gem_exec_fair@basic-none-vip@rcs0.=
html" target=3D"_blank">FAIL</a> ([i915#2842] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@gem_exec_fair@basic-none@vcs1.html=
" target=3D"_blank">FAIL</a> ([i915#2842] / [i915#3457]) +1 similar issue</=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10074/shard-kbl1/igt@gem_exec_fair@basic-none@vecs0.html" target=3D=
"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5811/shard-kbl7/igt@gem_exec_fair@basic-none@vecs0.html" target=3D"_=
blank">FAIL</a> ([i915#2842] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-iclb3/igt@gem_exec_params@no-vebox.html" targ=
et=3D"_blank">SKIP</a> ([fdo#109283])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-tglb8/igt@gem_exec_params@no-vebox.html" targ=
et=3D"_blank">SKIP</a> ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-tglb1/igt@gem_exec_params@secure-non-root.ht=
ml" target=3D"_blank">SKIP</a> ([fdo#112283]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@gem_exec_reloc@basic-wide-active@b=
cs0.html" target=3D"_blank">FAIL</a> ([i915#2389] / [i915#3457]) +4 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@rcs0:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-snb2/igt@gem_exec_reloc@basic-wide-active@rcs=
0.html" target=3D"_blank">FAIL</a> ([i915#2389] / [i915#3457]) +2 similar i=
ssues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-kbl4/igt@gem_exec_reloc@basic-wide-active@rcs=
0.html" target=3D"_blank">FAIL</a> ([i915#2389] / [i915#3457]) +4 similar i=
ssues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-iclb2/igt@gem_exec_reloc@basic-wide-active@v=
cs1.html" target=3D"_blank">FAIL</a> ([i915#2389] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt@vcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-glk6/igt@gem_exec_schedule@preempt@vcs0.html=
" target=3D"_blank">FAIL</a> ([i915#3457]) +45 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-golden-slice@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10074/shard-glk2/igt@gem_exec_schedule@submit-golden-slice@rcs0.htm=
l" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-glk6/igt@gem_exec_schedule@submit-golden-slic=
e@rcs0.html" target=3D"_blank">FAIL</a> ([i915#3457]) +44 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10074/shard-glk2/igt@gem_exec_whisper@basic-contexts-priority.html"=
 target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5811/shard-glk3/igt@gem_exec_whisper@basic-contexts-priori=
ty.html" target=3D"_blank">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-tglb3/igt@gem_media_vme.html" target=3D"_bla=
nk">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-copy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10074/shard-glk2/igt@gem_mmap_gtt@big-copy.html" target=3D"_blank">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_58=
11/shard-glk6/igt@gem_mmap_gtt@big-copy.html" target=3D"_blank">FAIL</a> ([=
i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-copy-odd:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-glk2/igt@gem_mmap_gtt@big-copy-odd.html" tar=
get=3D"_blank">FAIL</a> ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10074/shard-glk4/igt@gem_mmap_gtt@cpuset-basic-small-copy.html" tar=
get=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5811/shard-glk3/igt@gem_mmap_gtt@cpuset-basic-small-copy.html"=
 target=3D"_blank">INCOMPLETE</a> ([i915#3468]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-snb6/igt@gem_mmap_gtt@cpuset-basic-small-cop=
y-odd.html" target=3D"_blank">INCOMPLETE</a> ([i915#3468]) +2 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10074/shard-tglb6/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html"=
 target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5811/shard-tglb6/igt@gem_mmap_gtt@cpuset-basic-small-copy-=
xy.html" target=3D"_blank">INCOMPLETE</a> ([i915#3468])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10074/shard-iclb6/igt@gem_mmap_gtt@cpuset-big-copy-odd.html" target=
=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5811/shard-iclb4/igt@gem_mmap_gtt@cpuset-big-copy-odd.html" targe=
t=3D"_blank">FAIL</a> ([i915#307]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-x:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-glk8/igt@gem_mmap_gtt@fault-concurrent-x.html=
" target=3D"_blank">INCOMPLETE</a> ([i915#3468])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-tglb3/igt@gem_mmap_gtt@fault-concurrent-x.htm=
l" target=3D"_blank">INCOMPLETE</a> ([i915#3468])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@blt-vs-render-ctxn:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-apl7/igt@gem_ppgtt@blt-vs-render-ctxn.html" t=
arget=3D"_blank">FAIL</a> ([i915#3476])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-glk2/igt@gem_ppgtt@blt-vs-render-ctxn.html" t=
arget=3D"_blank">FAIL</a> ([i915#3476])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-iclb2/igt@gem_render_copy@y-tiled-to-vebox-l=
inear.html" target=3D"_blank">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-x-tiled:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-apl7/igt@gem_render_copy@yf-tiled-ccs-to-x-t=
iled.html" target=3D"_blank">INCOMPLETE</a> ([i915#3468]) +4 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@engines@vcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-apl2/igt@gem_spin_batch@engines@vcs0.html" t=
arget=3D"_blank">FAIL</a> ([i915#2898] / [i915#3457]) +3 similar issues</li=
>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-kbl1/igt@gem_userptr_blits@dmabuf-sync.html"=
 target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-tglb7/igt@gem_userptr_blits@unsync-unmap-cycl=
es.html" target=3D"_blank">SKIP</a> ([i915#3297]) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-iclb4/igt@gem_userptr_blits@unsync-unmap-cycl=
es.html" target=3D"_blank">SKIP</a> ([i915#3297]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-apl7/igt@gem_userptr_blits@vma-merge.html" t=
arget=3D"_blank">FAIL</a> ([i915#3318] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_wait@write-busy@rcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-apl2/igt@gem_wait@write-busy@rcs0.html" targ=
et=3D"_blank">FAIL</a> ([i915#3457]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10074/shard-snb5/igt@gem_workarounds@suspend-resume.html" target=3D=
"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5811/shard-snb2/igt@gem_workarounds@suspend-resume.html" target=3D"_=
blank">TIMEOUT</a> ([i915#2808] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-kbl3/igt@gem_workarounds@suspend-resume-cont=
ext.html" target=3D"_blank">DMESG-WARN</a> ([i915#180] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-iclb8/igt@gen7_exec_parse@load-register-reg.=
html" target=3D"_blank">SKIP</a> ([fdo#109289]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-tglb5/igt@gen9_exec_parse@bb-oversize.html" =
target=3D"_blank">SKIP</a> ([i915#2527])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-tglb2/igt@gen9_exec_parse@bb-start-param.html=
" target=3D"_blank">SKIP</a> ([fdo#112306]) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-iclb5/igt@gen9_exec_parse@bb-start-param.html=
" target=3D"_blank">SKIP</a> ([fdo#112306]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-kbl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.h=
tml" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-glk2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi=
-a.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-glk6/igt@i915_pm_rpm@cursor.html" target=3D"=
_blank">DMESG-WARN</a> ([i915#3457])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-tglb2/igt@i915_pm_rpm@dpms-non-lpsp.html" ta=
rget=3D"_blank">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411]) +1 simi=
lar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-iclb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.=
html" target=3D"_blank">SKIP</a> ([fdo#109293] / [fdo#109506])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-tglb6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.=
html" target=3D"_blank">SKIP</a> ([fdo#109506] / [i915#2411])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-mmap-type@uc:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10074/shard-glk5/igt@i915_pm_rpm@gem-mmap-type@uc.html" target=3D"_b=
lank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5811/shard-glk3/igt@i915_pm_rpm@gem-mmap-type@uc.html" target=3D"_blank=
">DMESG-WARN</a> ([i915#3475])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-tglb2/igt@i915_pm_rpm@gem-mmap-type@uc.html" =
target=3D"_blank">DMESG-WARN</a> ([i915#2411])</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10074/shard-kbl2/igt@i915_pm_rpm@gem-mmap-type@uc.html" target=3D"_b=
lank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5811/shard-kbl7/igt@i915_pm_rpm@gem-mmap-type@uc.html" target=3D"_blank=
">DMESG-WARN</a> ([i915#3475])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-iclb8/igt@i915_pm_rpm@modeset-non-lpsp-stres=
s-no-wait.html" target=3D"_blank">SKIP</a> ([fdo#110892]) +1 similar issue<=
/li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-tglb1/igt@i915_pm_rps@reset.html" target=3D"_=
blank">DMESG-WARN</a> ([i915#3457]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-iclb6/igt@i915_pm_rps@reset.html" target=3D"_=
blank">DMESG-WARN</a> ([i915#3457])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-glk2/igt@i915_pm_rps@reset.html" target=3D"_b=
lank">DMESG-FAIL</a> ([i915#3457])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-kbl1/igt@i915_pm_sseu@full-enable.html" targe=
t=3D"_blank">DMESG-WARN</a> ([i915#3457]) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-tglb1/igt@i915_pm_sseu@full-enable.html" targ=
et=3D"_blank">SKIP</a> ([fdo#109288])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-iclb2/igt@i915_pm_sseu@full-enable.html" targ=
et=3D"_blank">SKIP</a> ([fdo#109288])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-tglb7/igt@i915_query@query-topology-known-pci=
-ids.html" target=3D"_blank">SKIP</a> ([fdo#109303])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-iclb8/igt@i915_query@query-topology-known-pci=
-ids.html" target=3D"_blank">SKIP</a> ([fdo#109303])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-iclb8/igt@i915_query@query-topology-unsupport=
ed.html" target=3D"_blank">SKIP</a> ([fdo#109302])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-tglb5/igt@i915_query@query-topology-unsupport=
ed.html" target=3D"_blank">SKIP</a> ([fdo#109302])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@i915_selftest@live@execlists.html"=
 target=3D"_blank">DMESG-FAIL</a> ([i915#3462])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@i915_selftest@live@gt_lrc.html" ta=
rget=3D"_blank">DMESG-FAIL</a> ([i915#2373])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@i915_selftest@live@gt_pm.html" tar=
get=3D"_blank">DMESG-FAIL</a> ([i915#1759] / [i915#2291])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-snb2/igt@i915_selftest@live@hangcheck.html" =
target=3D"_blank">INCOMPLETE</a> ([i915#2782])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-iclb8/igt@kms_big_fb@x-tiled-16bpp-rotate-27=
0.html" target=3D"_blank">SKIP</a> ([fdo#110725] / [fdo#111614]) +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-tglb2/igt@kms_big_fb@x-tiled-32bpp-rotate-90=
.html" target=3D"_blank">SKIP</a> ([fdo#111614]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-tglb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-180=
.html" target=3D"_blank">SKIP</a> ([fdo#111615]) +7 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-iclb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-180=
.html" target=3D"_blank">SKIP</a> ([fdo#110723]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-iclb4/igt@kms_big_joiner@invalid-modeset.html=
" target=3D"_blank">SKIP</a> ([i915#2705])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-kbl3/igt@kms_big_joiner@invalid-modeset.html"=
 target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-apl2/igt@kms_big_joiner@invalid-modeset.html"=
 target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-glk6/igt@kms_big_joiner@invalid-modeset.html"=
 target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-tglb5/igt@kms_big_joiner@invalid-modeset.html=
" target=3D"_blank">SKIP</a> ([i915#2705])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@kms_ccs@pipe-d-bad-rotation-90.htm=
l" target=3D"_blank">SKIP</a> ([fdo#109278]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-tglb1/igt@kms_chamelium@hdmi-edid-read.html"=
 target=3D"_blank">SKIP</a> ([fdo#109284] / [fdo#111827]) +21 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-iclb2/igt@kms_chamelium@hdmi-hpd-enable-disa=
ble-mode.html" target=3D"_blank">SKIP</a> ([fdo#109284] / [fdo#111827]) +15=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-mode-timings:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-snb5/igt@kms_chamelium@hdmi-mode-timings.htm=
l" target=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +27 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-apl2/igt@kms_chamelium@vga-edid-read.html" t=
arget=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +9 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-glk8/igt@kms_chamelium@vga-hpd-enable-disabl=
e-mode.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +13 s=
imilar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-degamma:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-glk4/igt@kms_color@pipe-a-degamma.html" targe=
t=3D"_blank">FAIL</a> ([fdo#108145] / [i915#71])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-iclb6/igt@kms_color@pipe-a-degamma.html" targ=
et=3D"_blank">FAIL</a> ([i915#1149]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-degamma:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-tglb5/igt@kms_color@pipe-b-degamma.html" targ=
et=3D"_blank">FAIL</a> ([i915#1149]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-glk3/igt@kms_color@pipe-b-degamma.html" targe=
t=3D"_blank">FAIL</a> ([i915#71])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-gamma:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10074/shard-glk3/igt@kms_color@pipe-c-gamma.html" target=3D"_blank"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
811/shard-glk7/igt@kms_color@pipe-c-gamma.html" target=3D"_blank">FAIL</a> =
([i915#71])</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-75:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@kms_color@pipe-d-ctm-0-75.html" ta=
rget=3D"_blank">SKIP</a> ([fdo#109278] / [i915#1149]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-kbl4/igt@kms_color_chamelium@pipe-a-ctm-blue=
-to-red.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +30 =
similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-max:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-iclb6/igt@kms_color_chamelium@pipe-d-ctm-max=
.html" target=3D"_blank">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#11182=
7])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-kbl4/igt@kms_content_protection@atomic.html"=
 target=3D"_blank">TIMEOUT</a> ([i915#1319]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-iclb4/igt@kms_content_protection@dp-mst-lic-t=
ype-0.html" target=3D"_blank">SKIP</a> ([i915#3116])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5811/shard-tglb7/igt@kms_content_protection@dp-mst-lic-t=
ype-0.html" target=3D"_blank">SKIP</a> ([i915#3116])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-tglb2/igt@kms_content_protection@srm.html" t=
arget=3D"_blank">SKIP</a> ([fdo#111828]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-iclb6/igt@kms_content_protection@type1.html"=
 target=3D"_blank">SKIP</a> ([fdo#109300] / [fdo#111066]) +1 similar issue<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x42=
-sliding.html" target=3D"_blank">FAIL</a> ([i915#3444] / [i915#3457]) +7 si=
milar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10074/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscree=
n.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-2=
56x256-offscreen.html" target=3D"_blank">FAIL</a> ([i915#2124] / [i915#3457=
])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10074/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.ht=
ml" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-256x85=
-sliding.html" target=3D"_blank">FAIL</a> ([i915#3444] / [i915#3457]) +1 si=
milar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-32x32=
-sliding.html" target=3D"_blank">SKIP</a> ([i915#3319] / [i915#3457]) +6 si=
milar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5811/" target=3D"_blank">SKIP</a> ([fdo#109278] / [fdo#=
109279] / [i915#3457]) +1 similar issue</li>
</ul>
</li>
</ul>

</div>

</blockquote></div>

--00000000000079fbc005c24b5217--

--===============0917015881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0917015881==--
