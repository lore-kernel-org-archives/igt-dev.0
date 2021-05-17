Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3CF6E91E
 for <igt-dev@lists.freedesktop.org>; Mon, 17 May 2021 09:23:55 +0000 (UTC)
Date: Mon, 17 May 2021 12:25:24 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YKI2hPMap5FuuG4q@platvala-desk.ger.corp.intel.com>
References: <20210513145352.2790280-1-markyacoub@chromium.org>
 <162094179845.26534.7207461629414016096@emeril.freedesktop.org>
 <CAJUqKUr_RLLaMf5XgVpUX1skNNr+vD3=Gk4bV=5HNBut0RF49Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJUqKUr_RLLaMf5XgVpUX1skNNr+vD3=Gk4bV=5HNBut0RF49Q@mail.gmail.com>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fpanel=5Ffitting=3A__Move_Intel_GEN_check_under_a_is=5Fi91?=
 =?utf-8?q?5=5Fdevice?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mark Yacoub <markyacoub@chromium.org>, Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, May 14, 2021 at 10:47:14AM -0400, Mark Yacoub wrote:
> I have a feeling this is a false positive for this patch.
> Can someone verify. Thanks!


Yep. Lakshmi, see below, false positive.



> 
> On Thu, May 13, 2021 at 5:36 PM Patchwork <patchwork@emeril.freedesktop.org>
> wrote:
> 
> > *Patch Details*
> > *Series:* tests/kms_panel_fitting: Move Intel GEN check under a
> > is_i915_device
> > *URL:* https://patchwork.freedesktop.org/series/90136/
> > *State:* failure
> > *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/index.html CI
> > Bug Log - changes from CI_DRM_10074_full -> IGTPW_5811_full Summary
> >
> > *FAILURE*
> >
> > Serious unknown changes coming with IGTPW_5811_full absolutely need to be
> > verified manually.
> >
> > If you think the reported changes have nothing to do with the changes
> > introduced in IGTPW_5811_full, please notify your bug team to allow them
> > to document this new failure mode, which will reduce false positives in CI.
> >
> > External URL:
> > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/index.html
> > Possible new issues
> >
> > Here are the unknown changes that may have been introduced in
> > IGTPW_5811_full:
> > IGT changes Possible regressions
> >
> >    -
> >
> >    igt@gem_mmap_gtt@cpuset-medium-copy-xy:
> >    - shard-snb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-snb5/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html>
> >       -> INCOMPLETE
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb7/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html>
> >    -
> >
> >    igt@gem_mmap_gtt@fault-concurrent-x:
> >    -
> >
> >       shard-iclb: NOTRUN -> INCOMPLETE
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb5/igt@gem_mmap_gtt@fault-concurrent-x.html>
> >       -
> >
> >       shard-snb: NOTRUN -> INCOMPLETE
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb5/igt@gem_mmap_gtt@fault-concurrent-x.html>
> >       -
> >
> >    igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
> >    - shard-tglb: NOTRUN -> INCOMPLETE
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html>
> >    -
> >
> >    igt@kms_plane_cursor@pipe-b-overlay-size-64:
> >    - shard-tglb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb7/igt@kms_plane_cursor@pipe-b-overlay-size-64.html>
> >       +2 similar issues
> >    -
> >
> >    igt@kms_plane_cursor@pipe-b-primary-size-256:
> >    - shard-snb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb7/igt@kms_plane_cursor@pipe-b-primary-size-256.html>
> >
> > Warnings
> >
> >    -
> >
> >    igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
> >    - shard-glk: FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html>
> >       ([i915#3457]) -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html>
> >    -
> >
> >    igt@kms_plane_cursor@pipe-b-viewport-size-128:
> >    - shard-tglb: FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-tglb6/igt@kms_plane_cursor@pipe-b-viewport-size-128.html>
> >       ([i915#3457]) -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb6/igt@kms_plane_cursor@pipe-b-viewport-size-128.html>
> >
> > Suppressed
> >
> > The following results come from untrusted machines, tests, or statuses.
> > They do not affect the overall result.
> >
> >    - {igt@kms_plane@plane-position-hole-dpms@pipe-a-planes}:
> >       - shard-glk: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk9/igt@kms_plane@plane-position-hole-dpms@pipe-a-planes.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk8/igt@kms_plane@plane-position-hole-dpms@pipe-a-planes.html>
> >
> > New tests
> >
> > New tests have been introduced between CI_DRM_10074_full and
> > IGTPW_5811_full:
> > New IGT tests (2)
> >
> >    -
> >
> >    igt@kms_plane@plane-panning-top-left@pipe-a-planes:
> >    - Statuses : 1 pass(s)
> >       - Exec time: [0.33] s
> >    -
> >
> >    igt@kms_plane@plane-panning-top-left@pipe-b-planes:
> >    - Statuses : 1 pass(s)
> >       - Exec time: [0.39] s
> >
> > Known issues
> >
> > Here are the changes found in IGTPW_5811_full that come from known issues:
> > IGT changes Issues hit
> >
> >    -
> >
> >    igt@api_intel_bb@delta-check:
> >    - shard-apl: NOTRUN -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl7/igt@api_intel_bb@delta-check.html>
> >       ([i915#3457])
> >    -
> >
> >    igt@api_intel_bb@offset-control:
> >    - shard-snb: NOTRUN -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb7/igt@api_intel_bb@offset-control.html>
> >       ([i915#3457]) +3 similar issues
> >    -
> >
> >    igt@feature_discovery@chamelium:
> >    -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@feature_discovery@chamelium.html>
> >       ([fdo#111827])
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb6/igt@feature_discovery@chamelium.html>
> >       ([fdo#111827])
> >       -
> >
> >    igt@gem_create@create-massive:
> >    -
> >
> >       shard-iclb: NOTRUN -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb8/igt@gem_create@create-massive.html>
> >       ([i915#3002])
> >       -
> >
> >       shard-tglb: NOTRUN -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb5/igt@gem_create@create-massive.html>
> >       ([i915#3002])
> >       -
> >
> >       shard-glk: NOTRUN -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk3/igt@gem_create@create-massive.html>
> >       ([i915#3002])
> >       -
> >
> >    igt@gem_ctx_persistence@legacy-engines-mixed-process:
> >    - shard-snb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb7/igt@gem_ctx_persistence@legacy-engines-mixed-process.html>
> >       ([fdo#109271] / [i915#1099]) +5 similar issues
> >    -
> >
> >    igt@gem_ctx_sseu@invalid-sseu:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb1/igt@gem_ctx_sseu@invalid-sseu.html>
> >       ([i915#280])
> >    -
> >
> >    igt@gem_eio@suspend:
> >    - shard-iclb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-iclb4/igt@gem_eio@suspend.html>
> >       -> INCOMPLETE
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb3/igt@gem_eio@suspend.html>
> >       ([i915#1185])
> >    -
> >
> >    igt@gem_eio@unwedge-stress:
> >    -
> >
> >       shard-iclb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-iclb2/igt@gem_eio@unwedge-stress.html>
> >       -> TIMEOUT
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@gem_eio@unwedge-stress.html>
> >       ([i915#2369] / [i915#2481] / [i915#3070] / [i915#3457])
> >       -
> >
> >       shard-snb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb5/igt@gem_eio@unwedge-stress.html>
> >       ([i915#3354] / [i915#3457])
> >       -
> >
> >    igt@gem_exec_fair@basic-deadline:
> >    - shard-apl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl2/igt@gem_exec_fair@basic-deadline.html>
> >       ([i915#2846] / [i915#3457])
> >    -
> >
> >    igt@gem_exec_fair@basic-none-share@rcs0:
> >    - shard-iclb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-iclb4/igt@gem_exec_fair@basic-none-share@rcs0.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html>
> >       ([i915#2842] / [i915#3457])
> >    -
> >
> >    igt@gem_exec_fair@basic-none-vip@rcs0:
> >    - shard-tglb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb7/igt@gem_exec_fair@basic-none-vip@rcs0.html>
> >       ([i915#2842] / [i915#3457])
> >    -
> >
> >    igt@gem_exec_fair@basic-none@vcs1:
> >    - shard-iclb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@gem_exec_fair@basic-none@vcs1.html>
> >       ([i915#2842] / [i915#3457]) +1 similar issue
> >    -
> >
> >    igt@gem_exec_fair@basic-none@vecs0:
> >    - shard-kbl: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-kbl1/igt@gem_exec_fair@basic-none@vecs0.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl7/igt@gem_exec_fair@basic-none@vecs0.html>
> >       ([i915#2842] / [i915#3457])
> >    -
> >
> >    igt@gem_exec_params@no-vebox:
> >    -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb3/igt@gem_exec_params@no-vebox.html>
> >       ([fdo#109283])
> >       -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@gem_exec_params@no-vebox.html>
> >       ([fdo#109283])
> >       -
> >
> >    igt@gem_exec_params@secure-non-root:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb1/igt@gem_exec_params@secure-non-root.html>
> >       ([fdo#112283]) +1 similar issue
> >    -
> >
> >    igt@gem_exec_reloc@basic-wide-active@bcs0:
> >    - shard-tglb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@gem_exec_reloc@basic-wide-active@bcs0.html>
> >       ([i915#2389] / [i915#3457]) +4 similar issues
> >    -
> >
> >    igt@gem_exec_reloc@basic-wide-active@rcs0:
> >    -
> >
> >       shard-snb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb2/igt@gem_exec_reloc@basic-wide-active@rcs0.html>
> >       ([i915#2389] / [i915#3457]) +2 similar issues
> >       -
> >
> >       shard-kbl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl4/igt@gem_exec_reloc@basic-wide-active@rcs0.html>
> >       ([i915#2389] / [i915#3457]) +4 similar issues
> >       -
> >
> >    igt@gem_exec_reloc@basic-wide-active@vcs1:
> >    - shard-iclb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb2/igt@gem_exec_reloc@basic-wide-active@vcs1.html>
> >       ([i915#2389] / [i915#3457])
> >    -
> >
> >    igt@gem_exec_schedule@preempt@vcs0:
> >    - shard-glk: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk6/igt@gem_exec_schedule@preempt@vcs0.html>
> >       ([i915#3457]) +45 similar issues
> >    -
> >
> >    igt@gem_exec_schedule@submit-golden-slice@rcs0:
> >    - shard-glk: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk2/igt@gem_exec_schedule@submit-golden-slice@rcs0.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk6/igt@gem_exec_schedule@submit-golden-slice@rcs0.html>
> >       ([i915#3457]) +44 similar issues
> >    -
> >
> >    igt@gem_exec_whisper@basic-contexts-priority:
> >    - shard-glk: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk2/igt@gem_exec_whisper@basic-contexts-priority.html>
> >       -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk3/igt@gem_exec_whisper@basic-contexts-priority.html>
> >       ([i915#118] / [i915#95])
> >    -
> >
> >    igt@gem_media_vme:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb3/igt@gem_media_vme.html>
> >       ([i915#284])
> >    -
> >
> >    igt@gem_mmap_gtt@big-copy:
> >    - shard-glk: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk2/igt@gem_mmap_gtt@big-copy.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk6/igt@gem_mmap_gtt@big-copy.html>
> >       ([i915#307])
> >    -
> >
> >    igt@gem_mmap_gtt@big-copy-odd:
> >    - shard-glk: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk2/igt@gem_mmap_gtt@big-copy-odd.html>
> >       ([i915#307])
> >    -
> >
> >    igt@gem_mmap_gtt@cpuset-basic-small-copy:
> >    - shard-glk: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk4/igt@gem_mmap_gtt@cpuset-basic-small-copy.html>
> >       -> INCOMPLETE
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk3/igt@gem_mmap_gtt@cpuset-basic-small-copy.html>
> >       ([i915#3468]) +1 similar issue
> >    -
> >
> >    igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
> >    - shard-snb: NOTRUN -> INCOMPLETE
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb6/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html>
> >       ([i915#3468]) +2 similar issues
> >    -
> >
> >    igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
> >    - shard-tglb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-tglb6/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html>
> >       -> INCOMPLETE
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb6/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html>
> >       ([i915#3468])
> >    -
> >
> >    igt@gem_mmap_gtt@cpuset-big-copy-odd:
> >    - shard-iclb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-iclb6/igt@gem_mmap_gtt@cpuset-big-copy-odd.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@gem_mmap_gtt@cpuset-big-copy-odd.html>
> >       ([i915#307]) +1 similar issue
> >    -
> >
> >    igt@gem_mmap_gtt@fault-concurrent-x:
> >    -
> >
> >       shard-glk: NOTRUN -> INCOMPLETE
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk8/igt@gem_mmap_gtt@fault-concurrent-x.html>
> >       ([i915#3468])
> >       -
> >
> >       shard-tglb: NOTRUN -> INCOMPLETE
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb3/igt@gem_mmap_gtt@fault-concurrent-x.html>
> >       ([i915#3468])
> >       -
> >
> >    igt@gem_ppgtt@blt-vs-render-ctxn:
> >    -
> >
> >       shard-apl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl7/igt@gem_ppgtt@blt-vs-render-ctxn.html>
> >       ([i915#3476])
> >       -
> >
> >       shard-glk: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk2/igt@gem_ppgtt@blt-vs-render-ctxn.html>
> >       ([i915#3476])
> >       -
> >
> >    igt@gem_render_copy@y-tiled-to-vebox-linear:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb2/igt@gem_render_copy@y-tiled-to-vebox-linear.html>
> >       ([i915#768])
> >    -
> >
> >    igt@gem_render_copy@yf-tiled-ccs-to-x-tiled:
> >    - shard-apl: NOTRUN -> INCOMPLETE
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl7/igt@gem_render_copy@yf-tiled-ccs-to-x-tiled.html>
> >       ([i915#3468]) +4 similar issues
> >    -
> >
> >    igt@gem_spin_batch@engines@vcs0:
> >    - shard-apl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl2/igt@gem_spin_batch@engines@vcs0.html>
> >       ([i915#2898] / [i915#3457]) +3 similar issues
> >    -
> >
> >    igt@gem_userptr_blits@dmabuf-sync:
> >    - shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl1/igt@gem_userptr_blits@dmabuf-sync.html>
> >       ([fdo#109271] / [i915#3323])
> >    -
> >
> >    igt@gem_userptr_blits@unsync-unmap-cycles:
> >    -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb7/igt@gem_userptr_blits@unsync-unmap-cycles.html>
> >       ([i915#3297]) +3 similar issues
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@gem_userptr_blits@unsync-unmap-cycles.html>
> >       ([i915#3297]) +2 similar issues
> >       -
> >
> >    igt@gem_userptr_blits@vma-merge:
> >    - shard-apl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl7/igt@gem_userptr_blits@vma-merge.html>
> >       ([i915#3318] / [i915#3457])
> >    -
> >
> >    igt@gem_wait@write-busy@rcs0:
> >    - shard-apl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl2/igt@gem_wait@write-busy@rcs0.html>
> >       ([i915#3457]) +10 similar issues
> >    -
> >
> >    igt@gem_workarounds@suspend-resume:
> >    - shard-snb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-snb5/igt@gem_workarounds@suspend-resume.html>
> >       -> TIMEOUT
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb2/igt@gem_workarounds@suspend-resume.html>
> >       ([i915#2808] / [i915#3457])
> >    -
> >
> >    igt@gem_workarounds@suspend-resume-context:
> >    - shard-kbl: NOTRUN -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl3/igt@gem_workarounds@suspend-resume-context.html>
> >       ([i915#180] / [i915#3457])
> >    -
> >
> >    igt@gen7_exec_parse@load-register-reg:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb8/igt@gen7_exec_parse@load-register-reg.html>
> >       ([fdo#109289]) +3 similar issues
> >    -
> >
> >    igt@gen9_exec_parse@bb-oversize:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb5/igt@gen9_exec_parse@bb-oversize.html>
> >       ([i915#2527])
> >    -
> >
> >    igt@gen9_exec_parse@bb-start-param:
> >    -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb2/igt@gen9_exec_parse@bb-start-param.html>
> >       ([fdo#112306]) +4 similar issues
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb5/igt@gen9_exec_parse@bb-start-param.html>
> >       ([fdo#112306]) +1 similar issue
> >       -
> >
> >    igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
> >    - shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html>
> >       ([fdo#109271] / [i915#1937])
> >    -
> >
> >    igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
> >    - shard-glk: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html>
> >       ([fdo#109271] / [i915#1937])
> >    -
> >
> >    igt@i915_pm_rpm@cursor:
> >    - shard-glk: NOTRUN -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk6/igt@i915_pm_rpm@cursor.html>
> >       ([i915#3457])
> >    -
> >
> >    igt@i915_pm_rpm@dpms-non-lpsp:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb2/igt@i915_pm_rpm@dpms-non-lpsp.html>
> >       ([fdo#111644] / [i915#1397] / [i915#2411]) +1 similar issue
> >    -
> >
> >    igt@i915_pm_rpm@gem-execbuf-stress-pc8:
> >    -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html>
> >       ([fdo#109293] / [fdo#109506])
> >       -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html>
> >       ([fdo#109506] / [i915#2411])
> >       -
> >
> >    igt@i915_pm_rpm@gem-mmap-type@uc:
> >    -
> >
> >       shard-glk: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk5/igt@i915_pm_rpm@gem-mmap-type@uc.html>
> >       -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk3/igt@i915_pm_rpm@gem-mmap-type@uc.html>
> >       ([i915#3475])
> >       -
> >
> >       shard-tglb: NOTRUN -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb2/igt@i915_pm_rpm@gem-mmap-type@uc.html>
> >       ([i915#2411])
> >       -
> >
> >       shard-kbl: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-kbl2/igt@i915_pm_rpm@gem-mmap-type@uc.html>
> >       -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl7/igt@i915_pm_rpm@gem-mmap-type@uc.html>
> >       ([i915#3475])
> >       -
> >
> >    igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb8/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
> >       ([fdo#110892]) +1 similar issue
> >    -
> >
> >    igt@i915_pm_rps@reset:
> >    -
> >
> >       shard-tglb: NOTRUN -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb1/igt@i915_pm_rps@reset.html>
> >       ([i915#3457]) +2 similar issues
> >       -
> >
> >       shard-iclb: NOTRUN -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb6/igt@i915_pm_rps@reset.html>
> >       ([i915#3457])
> >       -
> >
> >       shard-glk: NOTRUN -> DMESG-FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk2/igt@i915_pm_rps@reset.html>
> >       ([i915#3457])
> >       -
> >
> >    igt@i915_pm_sseu@full-enable:
> >    -
> >
> >       shard-kbl: NOTRUN -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl1/igt@i915_pm_sseu@full-enable.html>
> >       ([i915#3457]) +3 similar issues
> >       -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb1/igt@i915_pm_sseu@full-enable.html>
> >       ([fdo#109288])
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb2/igt@i915_pm_sseu@full-enable.html>
> >       ([fdo#109288])
> >       -
> >
> >    igt@i915_query@query-topology-known-pci-ids:
> >    -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb7/igt@i915_query@query-topology-known-pci-ids.html>
> >       ([fdo#109303])
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb8/igt@i915_query@query-topology-known-pci-ids.html>
> >       ([fdo#109303])
> >       -
> >
> >    igt@i915_query@query-topology-unsupported:
> >    -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb8/igt@i915_query@query-topology-unsupported.html>
> >       ([fdo#109302])
> >       -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb5/igt@i915_query@query-topology-unsupported.html>
> >       ([fdo#109302])
> >       -
> >
> >    igt@i915_selftest@live@execlists:
> >    - shard-tglb: NOTRUN -> DMESG-FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@i915_selftest@live@execlists.html>
> >       ([i915#3462])
> >    -
> >
> >    igt@i915_selftest@live@gt_lrc:
> >    - shard-tglb: NOTRUN -> DMESG-FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@i915_selftest@live@gt_lrc.html>
> >       ([i915#2373])
> >    -
> >
> >    igt@i915_selftest@live@gt_pm:
> >    - shard-tglb: NOTRUN -> DMESG-FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@i915_selftest@live@gt_pm.html>
> >       ([i915#1759] / [i915#2291])
> >    -
> >
> >    igt@i915_selftest@live@hangcheck:
> >    - shard-snb: NOTRUN -> INCOMPLETE
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb2/igt@i915_selftest@live@hangcheck.html>
> >       ([i915#2782])
> >    -
> >
> >    igt@kms_big_fb@x-tiled-16bpp-rotate-270:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb8/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html>
> >       ([fdo#110725] / [fdo#111614]) +1 similar issue
> >    -
> >
> >    igt@kms_big_fb@x-tiled-32bpp-rotate-90:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb2/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html>
> >       ([fdo#111614]) +6 similar issues
> >    -
> >
> >    igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
> >    -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html>
> >       ([fdo#111615]) +7 similar issues
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html>
> >       ([fdo#110723]) +1 similar issue
> >       -
> >
> >    igt@kms_big_joiner@invalid-modeset:
> >    -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@kms_big_joiner@invalid-modeset.html>
> >       ([i915#2705])
> >       -
> >
> >       shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl3/igt@kms_big_joiner@invalid-modeset.html>
> >       ([fdo#109271] / [i915#2705])
> >       -
> >
> >       shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl2/igt@kms_big_joiner@invalid-modeset.html>
> >       ([fdo#109271] / [i915#2705])
> >       -
> >
> >       shard-glk: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk6/igt@kms_big_joiner@invalid-modeset.html>
> >       ([fdo#109271] / [i915#2705])
> >       -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb5/igt@kms_big_joiner@invalid-modeset.html>
> >       ([i915#2705])
> >       -
> >
> >    igt@kms_ccs@pipe-d-bad-rotation-90:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@kms_ccs@pipe-d-bad-rotation-90.html>
> >       ([fdo#109278]) +19 similar issues
> >    -
> >
> >    igt@kms_chamelium@hdmi-edid-read:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb1/igt@kms_chamelium@hdmi-edid-read.html>
> >       ([fdo#109284] / [fdo#111827]) +21 similar issues
> >    -
> >
> >    igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb2/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html>
> >       ([fdo#109284] / [fdo#111827]) +15 similar issues
> >    -
> >
> >    igt@kms_chamelium@hdmi-mode-timings:
> >    - shard-snb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-snb5/igt@kms_chamelium@hdmi-mode-timings.html>
> >       ([fdo#109271] / [fdo#111827]) +27 similar issues
> >    -
> >
> >    igt@kms_chamelium@vga-edid-read:
> >    - shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl2/igt@kms_chamelium@vga-edid-read.html>
> >       ([fdo#109271] / [fdo#111827]) +9 similar issues
> >    -
> >
> >    igt@kms_chamelium@vga-hpd-enable-disable-mode:
> >    - shard-glk: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk8/igt@kms_chamelium@vga-hpd-enable-disable-mode.html>
> >       ([fdo#109271] / [fdo#111827]) +13 similar issues
> >    -
> >
> >    igt@kms_color@pipe-a-degamma:
> >    -
> >
> >       shard-glk: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk4/igt@kms_color@pipe-a-degamma.html>
> >       ([fdo#108145] / [i915#71])
> >       -
> >
> >       shard-iclb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb6/igt@kms_color@pipe-a-degamma.html>
> >       ([i915#1149]) +1 similar issue
> >       -
> >
> >    igt@kms_color@pipe-b-degamma:
> >    -
> >
> >       shard-tglb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb5/igt@kms_color@pipe-b-degamma.html>
> >       ([i915#1149]) +1 similar issue
> >       -
> >
> >       shard-glk: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk3/igt@kms_color@pipe-b-degamma.html>
> >       ([i915#71])
> >       -
> >
> >    igt@kms_color@pipe-c-gamma:
> >    - shard-glk: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-glk3/igt@kms_color@pipe-c-gamma.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-glk7/igt@kms_color@pipe-c-gamma.html>
> >       ([i915#71])
> >    -
> >
> >    igt@kms_color@pipe-d-ctm-0-75:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@kms_color@pipe-d-ctm-0-75.html>
> >       ([fdo#109278] / [i915#1149]) +1 similar issue
> >    -
> >
> >    igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
> >    - shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl4/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html>
> >       ([fdo#109271] / [fdo#111827]) +30 similar issues
> >    -
> >
> >    igt@kms_color_chamelium@pipe-d-ctm-max:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb6/igt@kms_color_chamelium@pipe-d-ctm-max.html>
> >       ([fdo#109278] / [fdo#109284] / [fdo#111827])
> >    -
> >
> >    igt@kms_content_protection@atomic:
> >    - shard-kbl: NOTRUN -> TIMEOUT
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-kbl4/igt@kms_content_protection@atomic.html>
> >       ([i915#1319]) +2 similar issues
> >    -
> >
> >    igt@kms_content_protection@dp-mst-lic-type-0:
> >    -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb4/igt@kms_content_protection@dp-mst-lic-type-0.html>
> >       ([i915#3116])
> >       -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb7/igt@kms_content_protection@dp-mst-lic-type-0.html>
> >       ([i915#3116])
> >       -
> >
> >    igt@kms_content_protection@srm:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb2/igt@kms_content_protection@srm.html>
> >       ([fdo#111828]) +2 similar issues
> >    -
> >
> >    igt@kms_content_protection@type1:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-iclb6/igt@kms_content_protection@type1.html>
> >       ([fdo#109300] / [fdo#111066]) +1 similar issue
> >    -
> >
> >    igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:
> >    - shard-apl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html>
> >       ([i915#3444] / [i915#3457]) +7 similar issues
> >    -
> >
> >    igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen:
> >    - shard-tglb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html>
> >       ([i915#2124] / [i915#3457])
> >    -
> >
> >    igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding:
> >    - shard-apl: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10074/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html>
> >       ([i915#3444] / [i915#3457]) +1 similar issue
> >    -
> >
> >    igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding.html>
> >       ([i915#3319] / [i915#3457]) +6 similar issues
> >    -
> >
> >    igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5811/>
> >       ([fdo#109278] / [fdo#109279] / [i915#3457]) +1 similar issue
> >
> >

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
