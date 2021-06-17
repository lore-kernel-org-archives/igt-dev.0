Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9646E9A9
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jun 2021 19:27:19 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id f30so12373734lfj.1
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jun 2021 12:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210617152032.431594-1-markyacoub@chromium.org>
 <162395314565.3752.9409090648606931698@emeril.freedesktop.org>
In-Reply-To: <162395314565.3752.9409090648606931698@emeril.freedesktop.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 17 Jun 2021 15:27:05 -0400
Message-ID: <CAJUqKUrBBvLK=P4SfBf8ic8s92y2cz1wHCFPhGVXys_esYGDUA@mail.gmail.com>
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
	=?utf-8?q?kms=5Fvblank=3A_Turn_on_hardware_before_testing_invalid_?=
	=?utf-8?q?vblank=2E_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0758003826=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0758003826==
Content-Type: multipart/alternative; boundary="000000000000fa6d3a05c4fb31c8"

--000000000000fa6d3a05c4fb31c8
Content-Type: text/plain; charset="UTF-8"

this has passed previously so im gonna guess it's false negative?

On Thu, Jun 17, 2021 at 2:05 PM Patchwork <patchwork@emeril.freedesktop.org>
wrote:

> *Patch Details*
> *Series:* tests/kms_vblank: Turn on hardware before testing invalid
> vblank. (rev3)
> *URL:* https://patchwork.freedesktop.org/series/90382/
> *State:* failure
> *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/index.html CI
> Bug Log - changes from CI_DRM_10237_full -> IGTPW_5935_full Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_5935_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_5935_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/index.html
> Possible new issues
>
> Here are the unknown changes that may have been introduced in
> IGTPW_5935_full:
> IGT changes Possible regressions
>
>    - igt@gem_exec_reloc@basic-wide-active@vcs1:
>       - shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@vcs1.html>
>
> Warnings
>
>    -
>
>    igt@gem_exec_reloc@basic-wide-active@bcs0:
>    -
>
>       shard-apl: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-apl2/igt@gem_exec_reloc@basic-wide-active@bcs0.html>
>       ([i915#2389]) -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-apl7/igt@gem_exec_reloc@basic-wide-active@bcs0.html>
>       +3 similar issues
>       -
>
>       shard-glk: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-glk6/igt@gem_exec_reloc@basic-wide-active@bcs0.html>
>       ([i915#2389]) -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk9/igt@gem_exec_reloc@basic-wide-active@bcs0.html>
>       +3 similar issues
>       -
>
>       shard-tglb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-tglb1/igt@gem_exec_reloc@basic-wide-active@bcs0.html>
>       ([i915#2389]) -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb2/igt@gem_exec_reloc@basic-wide-active@bcs0.html>
>       +4 similar issues
>       -
>
>    igt@gem_exec_reloc@basic-wide-active@rcs0:
>    -
>
>       shard-snb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-snb5/igt@gem_exec_reloc@basic-wide-active@rcs0.html>
>       ([i915#2389]) -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-snb2/igt@gem_exec_reloc@basic-wide-active@rcs0.html>
>       +2 similar issues
>       -
>
>       shard-iclb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-iclb7/igt@gem_exec_reloc@basic-wide-active@rcs0.html>
>       ([i915#2389]) -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@rcs0.html>
>       +3 similar issues
>       -
>
>       shard-kbl: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-kbl7/igt@gem_exec_reloc@basic-wide-active@rcs0.html>
>       ([i915#2389]) -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl2/igt@gem_exec_reloc@basic-wide-active@rcs0.html>
>       +4 similar issues
>
> Known issues
>
> Here are the changes found in IGTPW_5935_full that come from known issues:
> IGT changes Issues hit
>
>    -
>
>    igt@feature_discovery@display-3x:
>    -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk6/igt@feature_discovery@display-3x.html>
>       ([fdo#109271]) +84 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb1/igt@feature_discovery@display-3x.html>
>       ([i915#1839])
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb3/igt@feature_discovery@display-3x.html>
>       ([i915#1839])
>       -
>
>    igt@gem_ctx_persistence@legacy-engines-mixed:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-snb2/igt@gem_ctx_persistence@legacy-engines-mixed.html>
>       ([fdo#109271] / [i915#1099]) +4 similar issues
>    -
>
>    igt@gem_eio@unwedge-stress:
>    -
>
>       shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-tglb6/igt@gem_eio@unwedge-stress.html>
>       -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb2/igt@gem_eio@unwedge-stress.html>
>       ([i915#2369] / [i915#3063])
>       -
>
>       shard-snb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-snb2/igt@gem_eio@unwedge-stress.html>
>       ([i915#3354])
>       -
>
>    igt@gem_exec_fair@basic-deadline:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-apl7/igt@gem_exec_fair@basic-deadline.html>
>       ([i915#2846])
>    -
>
>    igt@gem_exec_fair@basic-none-rrul@rcs0:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk3/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
>       ([i915#2842]) +1 similar issue
>    -
>
>    igt@gem_exec_fair@basic-pace@vcs1:
>    -
>
>       shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html>
>       ([i915#2842])
>       -
>
>       shard-kbl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs1.html>
>       ([fdo#109271])
>       -
>
>    igt@gem_exec_fair@basic-pace@vecs0:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-iclb3/igt@gem_exec_fair@basic-pace@vecs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb2/igt@gem_exec_fair@basic-pace@vecs0.html>
>       ([i915#2842])
>    -
>
>    igt@gem_exec_fair@basic-throttle@rcs0:
>    -
>
>       shard-kbl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl2/igt@gem_exec_fair@basic-throttle@rcs0.html>
>       ([i915#2842])
>       -
>
>       shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html>
>       ([i915#2849])
>       -
>
>    igt@gem_exec_flush@basic-batch-kernel-default-cmd:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-snb5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html>
>       ([fdo#109271]) +288 similar issues
>    -
>
>    igt@gem_exec_params@no-vebox:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb2/igt@gem_exec_params@no-vebox.html>
>       ([fdo#109283])
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb5/igt@gem_exec_params@no-vebox.html>
>       ([fdo#109283])
>       -
>
>    igt@gem_huc_copy@huc-copy:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-tglb5/igt@gem_huc_copy@huc-copy.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb6/igt@gem_huc_copy@huc-copy.html>
>       ([i915#2190])
>    -
>
>    igt@gem_pread@exhaustion:
>    - shard-snb: NOTRUN -> WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-snb2/igt@gem_pread@exhaustion.html>
>       ([i915#2658])
>    -
>
>    igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb3/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html>
>       ([i915#768]) +2 similar issues
>    -
>
>    igt@gem_userptr_blits@input-checking:
>    - shard-snb: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-snb6/igt@gem_userptr_blits@input-checking.html>
>       ([i915#3002])
>    -
>
>    igt@gem_userptr_blits@unsync-overlap:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb6/igt@gem_userptr_blits@unsync-overlap.html>
>       ([i915#3297])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb5/igt@gem_userptr_blits@unsync-overlap.html>
>       ([i915#3297])
>       -
>
>    igt@gem_userptr_blits@vma-merge:
>    -
>
>       shard-snb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-snb5/igt@gem_userptr_blits@vma-merge.html>
>       ([i915#2724])
>       -
>
>       shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-apl1/igt@gem_userptr_blits@vma-merge.html>
>       ([i915#3318])
>       -
>
>       shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb1/igt@gem_userptr_blits@vma-merge.html>
>       ([i915#3318])
>       -
>
>       shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk7/igt@gem_userptr_blits@vma-merge.html>
>       ([i915#3318])
>       -
>
>       shard-kbl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl1/igt@gem_userptr_blits@vma-merge.html>
>       ([i915#3318])
>       -
>
>       shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb6/igt@gem_userptr_blits@vma-merge.html>
>       ([i915#3318])
>       -
>
>    igt@gen9_exec_parse@bb-start-param:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb5/igt@gen9_exec_parse@bb-start-param.html>
>       ([fdo#112306]) +2 similar issues
>    -
>
>    igt@gen9_exec_parse@unaligned-jump:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb2/igt@gen9_exec_parse@unaligned-jump.html>
>       ([fdo#112306]) +1 similar issue
>    -
>
>    igt@i915_pm_dc@dc6-dpms:
>    -
>
>       shard-kbl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html>
>       ([i915#454])
>       -
>
>       shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb3/igt@i915_pm_dc@dc6-dpms.html>
>       ([i915#454])
>       -
>
>    igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
>    -
>
>       shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html>
>       ([fdo#109271] / [i915#1937])
>       -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-apl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html>
>       ([fdo#109271] / [i915#1937])
>       -
>
>    igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk4/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html>
>       ([fdo#109271] / [i915#1937])
>    -
>
>    igt@i915_pm_rc6_residency@media-rc6-accuracy:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb3/igt@i915_pm_rc6_residency@media-rc6-accuracy.html>
>       ([fdo#109289] / [fdo#111719])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb4/igt@i915_pm_rc6_residency@media-rc6-accuracy.html>
>       ([fdo#109289])
>       -
>
>    igt@i915_selftest@live@hangcheck:
>    - shard-snb: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-snb2/igt@i915_selftest@live@hangcheck.html>
>       ([i915#2782])
>    -
>
>    igt@i915_suspend@fence-restore-tiled2untiled:
>    - shard-kbl: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html>
>       ([i915#155] / [i915#794])
>    -
>
>    igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
>       ([i915#1769])
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
>       ([i915#1769])
>       -
>
>    igt@kms_big_fb@linear-32bpp-rotate-270:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb2/igt@kms_big_fb@linear-32bpp-rotate-270.html>
>       ([fdo#110725] / [fdo#111614])
>    -
>
>    igt@kms_big_fb@linear-64bpp-rotate-90:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb7/igt@kms_big_fb@linear-64bpp-rotate-90.html>
>       ([fdo#111614]) +1 similar issue
>    -
>
>    igt@kms_big_fb@x-tiled-32bpp-rotate-180:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-glk1/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk4/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html>
>       ([i915#118] / [i915#95])
>    -
>
>    igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb5/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html>
>       ([fdo#111615]) +2 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html>
>       ([fdo#110723])
>       -
>
>    igt@kms_big_joiner@invalid-modeset:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb7/igt@kms_big_joiner@invalid-modeset.html>
>       ([i915#2705])
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb6/igt@kms_big_joiner@invalid-modeset.html>
>       ([i915#2705])
>       -
>
>    igt@kms_color@pipe-d-ctm-max:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb6/igt@kms_color@pipe-d-ctm-max.html>
>       ([fdo#109278] / [i915#1149])
>    -
>
>    igt@kms_color_chamelium@pipe-a-ctm-limited-range:
>    -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-apl1/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html>
>       ([fdo#109271] / [fdo#111827]) +22 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb1/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html>
>       ([fdo#109284] / [fdo#111827]) +2 similar issues
>       -
>
>    igt@kms_color_chamelium@pipe-b-ctm-0-5:
>    -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk8/igt@kms_color_chamelium@pipe-b-ctm-0-5.html>
>       ([fdo#109271] / [fdo#111827]) +7 similar issues
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb1/igt@kms_color_chamelium@pipe-b-ctm-0-5.html>
>       ([fdo#109284] / [fdo#111827]) +7 similar issues
>       -
>
>    igt@kms_color_chamelium@pipe-c-ctm-limited-range:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl4/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html>
>       ([fdo#109271] / [fdo#111827]) +13 similar issues
>    -
>
>    igt@kms_color_chamelium@pipe-d-ctm-limited-range:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html>
>       ([fdo#109278] / [fdo#109284] / [fdo#111827])
>    -
>
>    igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-snb6/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html>
>       ([fdo#109271] / [fdo#111827]) +13 similar issues
>    -
>
>    igt@kms_content_protection@legacy:
>    - shard-kbl: NOTRUN -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl6/igt@kms_content_protection@legacy.html>
>       ([i915#1319])
>    -
>
>    igt@kms_content_protection@srm:
>    - shard-apl: NOTRUN -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-apl3/igt@kms_content_protection@srm.html>
>       ([i915#1319])
>    -
>
>    igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen.html>
>       ([i915#3359]) +2 similar issues
>    -
>
>    igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl2/igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen.html>
>       ([fdo#109271]) +168 similar issues
>    -
>
>    igt@kms_cursor_crc@pipe-d-cursor-32x32-random:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-32x32-random.html>
>       ([i915#3319])
>    -
>
>    igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb3/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html>
>       ([fdo#109274] / [fdo#109278]) +1 similar issue
>    -
>
>    igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html>
>       ([fdo#111825]) +28 similar issues
>    -
>
>    igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html>
>       ([i915#2346])
>    -
>
>    igt@kms_flip@2x-nonexisting-fb:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb6/igt@kms_flip@2x-nonexisting-fb.html>
>       ([fdo#109274]) +4 similar issues
>    -
>
>    igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
>    - shard-kbl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html>
>       ([i915#180]) +3 similar issues
>    -
>
>    igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-apl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html>
>       ([fdo#109271] / [i915#2672])
>    -
>
>    igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
>    -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-apl3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html>
>       ([fdo#109271] / [i915#2642])
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html>
>       ([fdo#109271] / [i915#2642])
>       -
>
>       shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html>
>       ([fdo#109271] / [i915#2642])
>       -
>
>    igt@kms_force_connector_basic@force-load-detect:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb7/igt@kms_force_connector_basic@force-load-detect.html>
>       ([fdo#109285])
>    -
>
>    igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-apl8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html>
>       ([fdo#109271]) +258 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html>
>       ([fdo#109280]) +15 similar issues
>    -
>
>    igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-apl8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html>
>       ([fdo#109271] / [i915#533]) +4 similar issues
>    -
>
>    igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb1/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html>
>       ([fdo#109278]) +14 similar issues
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk6/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html>
>       ([fdo#109271] / [i915#533])
>       -
>
>       shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl3/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html>
>       ([fdo#109271] / [i915#533])
>       -
>
>    igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
>    - shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk9/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html>
>       ([fdo#108145] / [i915#265])
>    -
>
>    igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html>
>       ([fdo#108145] / [i915#265]) +3 similar issues
>    -
>
>    igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
>    - shard-kbl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl2/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html>
>       ([fdo#108145] / [i915#265])
>    -
>
>    igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
>    -
>
>       shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html>
>       ([i915#265])
>       -
>
>       shard-kbl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html>
>       ([i915#265])
>       -
>
>    igt@kms_plane_lowres@pipe-c-tiling-yf:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb4/igt@kms_plane_lowres@pipe-c-tiling-yf.html>
>       ([i915#3536]) +1 similar issue
>    -
>
>    igt@kms_plane_scaling
>    @scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:
>    -
>
>       shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl7/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html>
>       ([fdo#109271] / [i915#2733])
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk6/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html>
>       ([fdo#109271] / [i915#2733])
>       -
>
>    igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-apl3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html>
>       ([fdo#109271] / [i915#658]) +6 similar issues
>    -
>
>    igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl4/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html>
>       ([fdo#109271] / [i915#658]) +4 similar issues
>    -
>
>    igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:
>    -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html>
>       ([fdo#109271] / [i915#658]) +1 similar issue
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html>
>       ([i915#2920])
>       -
>
>    igt@kms_psr@psr2_dpms:
>    - shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb3/igt@kms_psr@psr2_dpms.html>
>       ([i915#132] / [i915#3467]) +2 similar issues
>    -
>
>    igt@kms_psr@psr2_primary_mmap_cpu:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html>
>       ([fdo#109441]) +1 similar issue
>    -
>
>    igt@kms_psr@psr2_primary_mmap_gtt:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb6/igt@kms_psr@psr2_primary_mmap_gtt.html>
>       ([fdo#109441]) +1 similar issue
>    -
>
>    igt@kms_writeback@writeback-check-output:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-apl7/igt@kms_writeback@writeback-check-output.html>
>       ([fdo#109271] / [i915#2437])
>    -
>
>    igt@kms_writeback@writeback-pixel-formats:
>    -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk4/igt@kms_writeback@writeback-pixel-formats.html>
>       ([fdo#109271] / [i915#2437])
>       -
>
>       shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl7/igt@kms_writeback@writeback-pixel-formats.html>
>       ([fdo#109271] / [i915#2437]) +1 similar issue
>       -
>
>    igt@nouveau_crc@pipe-a-ctx-flip-detection:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb7/igt@nouveau_crc@pipe-a-ctx-flip-detection.html>
>       ([i915#2530])
>    -
>
>    igt@nouveau_crc@pipe-d-source-rg:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb6/igt@nouveau_crc@pipe-d-source-rg.html>
>       ([i915#2530]) +1 similar issue
>    -
>
>    igt@perf_pmu@enable-race@rcs0:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-tglb7/igt@perf_pmu@enable-race@rcs0.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb8/igt@perf_pmu@enable-race@rcs0.html>
>       ([i915#750])
>    -
>
>    igt@prime_nv_pcopy@test3_2:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb7/igt@prime_nv_pcopy@test3_2.html>
>       ([fdo#109291]) +1 similar issue
>    -
>
>    igt@prime_nv_pcopy@test3_4:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb6/igt@prime_nv_pcopy@test3_4.html>
>       ([fdo#109291]) +1 similar issue
>    -
>
>    igt@prime_vgem@basic-userptr:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb7/igt@prime_vgem@basic-userptr.html>
>       ([i915#3301])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb8/igt@prime_vgem@basic-userptr.html>
>       ([i915#3301])
>       -
>
>    igt@runner@aborted:
>    - shard-snb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-snb6/igt@runner@aborted.html>
>       ([i915#3002])
>    -
>
>    igt@sysfs_clients@fair-1:
>    -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk5/igt@sysfs_clients@fair-1.html>
>       ([fdo#109271] / [i915#2994])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb3/igt@sysfs_clients@fair-1.html>
>       ([i915#2994])
>       -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-apl6/igt@sysfs_clients@fair-1.html>
>       ([fdo#109271] / [i915#2994]) +3 similar issues
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb5/igt@sysfs_clients@fair-1.html>
>       ([i915#2994])
>       -
>
>    igt@sysfs_clients@split-50:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl6/igt@sysfs_clients@split-50.html>
>       ([fdo#109271] / [i915#2994]) +2 similar issues
>
> Possible fixes
>
>    -
>
>    igt@gem_exec_fair@basic-none@vcs0:
>    - shard-glk: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-glk1/igt@gem_exec_fair@basic-none@vcs0.html>
>       ([i915#2842]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk5/igt@gem_exec_fair@basic-none@vcs0.html>
>       +1 similar issue
>    -
>
>    igt@gem_exec_fair@basic-pace@vecs0:
>    - shard-tglb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-tglb7/igt@gem_exec_fair@basic-pace@vecs0.html>
>       ([i915#2842]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb1/igt@gem_exec_fair@basic-pace@vecs0.html>
>    -
>
>    igt@gem_vm_create@destroy-race:
>    - shard-tglb: TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-tglb3/igt@gem_vm_create@destroy-race.html>
>       ([i915#2795]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb1/igt@gem_vm_create@destroy-race.html>
>    -
>
>    igt
>
>

--000000000000fa6d3a05c4fb31c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">this has passed previously so im gonna guess it&#39;s fals=
e negative?<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Jun 17, 2021 at 2:05 PM Patchwork &lt;<a href=3D"ma=
ilto:patchwork@emeril.freedesktop.org">patchwork@emeril.freedesktop.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<u></u>

=20
 =20
 =20
 =20

<div>


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>tests/kms_vblank: Turn on hardware be=
fore testing invalid vblank. (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/90382/" target=3D"_blank">https://patchwork.freedesktop.org/series/903=
82/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/index.html" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5935/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from CI_DRM_10237_full -&gt; IGTPW_5935_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5935_full absolutely need to b=
e<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in IGTPW_5935_full, please notify your bug team to allow them<=
br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5935/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5935/index.html</a></p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5935=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_exec_reloc@basic-wide-active@vcs1:<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@v=
cs1.html" target=3D"_blank">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10237/shard-apl2/igt@gem_exec_reloc@basic-wide-active@bcs0.html" tar=
get=3D"_blank">FAIL</a> ([i915#2389]) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5935/shard-apl7/igt@gem_exec_reloc@basic-wide-ac=
tive@bcs0.html" target=3D"_blank">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10237/shard-glk6/igt@gem_exec_reloc@basic-wide-active@bcs0.html" tar=
get=3D"_blank">FAIL</a> ([i915#2389]) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5935/shard-glk9/igt@gem_exec_reloc@basic-wide-ac=
tive@bcs0.html" target=3D"_blank">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10237/shard-tglb1/igt@gem_exec_reloc@basic-wide-active@bcs0.html" ta=
rget=3D"_blank">FAIL</a> ([i915#2389]) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5935/shard-tglb2/igt@gem_exec_reloc@basic-wide-=
active@bcs0.html" target=3D"_blank">FAIL</a> +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@rcs0:</p>
<ul>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10237/shard-snb5/igt@gem_exec_reloc@basic-wide-active@rcs0.html" tar=
get=3D"_blank">FAIL</a> ([i915#2389]) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5935/shard-snb2/igt@gem_exec_reloc@basic-wide-ac=
tive@rcs0.html" target=3D"_blank">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10237/shard-iclb7/igt@gem_exec_reloc@basic-wide-active@rcs0.html" ta=
rget=3D"_blank">FAIL</a> ([i915#2389]) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5935/shard-iclb4/igt@gem_exec_reloc@basic-wide-=
active@rcs0.html" target=3D"_blank">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10237/shard-kbl7/igt@gem_exec_reloc@basic-wide-active@rcs0.html" tar=
get=3D"_blank">FAIL</a> ([i915#2389]) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5935/shard-kbl2/igt@gem_exec_reloc@basic-wide-ac=
tive@rcs0.html" target=3D"_blank">FAIL</a> +4 similar issues</p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5935_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-3x:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-glk6/igt@feature_discovery@display-3x.html" t=
arget=3D"_blank">SKIP</a> ([fdo#109271]) +84 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-iclb1/igt@feature_discovery@display-3x.html" =
target=3D"_blank">SKIP</a> ([i915#1839])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-tglb3/igt@feature_discovery@display-3x.html" =
target=3D"_blank">SKIP</a> ([i915#1839])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-snb2/igt@gem_ctx_persistence@legacy-engines-=
mixed.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#1099]) +4 simi=
lar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10237/shard-tglb6/igt@gem_eio@unwedge-stress.html" target=3D"_blank"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
935/shard-tglb2/igt@gem_eio@unwedge-stress.html" target=3D"_blank">TIMEOUT<=
/a> ([i915#2369] / [i915#3063])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-snb2/igt@gem_eio@unwedge-stress.html" target=
=3D"_blank">FAIL</a> ([i915#3354])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-apl7/igt@gem_exec_fair@basic-deadline.html" =
target=3D"_blank">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10237/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html" targe=
t=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5935/shard-glk3/igt@gem_exec_fair@basic-none-rrul@rcs0.html" tar=
get=3D"_blank">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html"=
 target=3D"_blank">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10237/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html" target=3D"_=
blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5935/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs1.html" target=3D"_bla=
nk">SKIP</a> ([fdo#109271])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10237/shard-iclb3/igt@gem_exec_fair@basic-pace@vecs0.html" target=
=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5935/shard-iclb2/igt@gem_exec_fair@basic-pace@vecs0.html" target=
=3D"_blank">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-kbl2/igt@gem_exec_fair@basic-throttle@rcs0.ht=
ml" target=3D"_blank">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10237/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html" target=
=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5935/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html" targ=
et=3D"_blank">FAIL</a> ([i915#2849])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-snb5/igt@gem_exec_flush@basic-batch-kernel-d=
efault-cmd.html" target=3D"_blank">SKIP</a> ([fdo#109271]) +288 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-iclb2/igt@gem_exec_params@no-vebox.html" targ=
et=3D"_blank">SKIP</a> ([fdo#109283])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-tglb5/igt@gem_exec_params@no-vebox.html" targ=
et=3D"_blank">SKIP</a> ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10237/shard-tglb5/igt@gem_huc_copy@huc-copy.html" target=3D"_blank"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
935/shard-tglb6/igt@gem_huc_copy@huc-copy.html" target=3D"_blank">SKIP</a> =
([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-snb2/igt@gem_pread@exhaustion.html" target=
=3D"_blank">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-iclb3/igt@gem_render_copy@yf-tiled-mc-ccs-to=
-vebox-yf-tiled.html" target=3D"_blank">SKIP</a> ([i915#768]) +2 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-snb6/igt@gem_userptr_blits@input-checking.ht=
ml" target=3D"_blank">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-tglb6/igt@gem_userptr_blits@unsync-overlap.ht=
ml" target=3D"_blank">SKIP</a> ([i915#3297])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-iclb5/igt@gem_userptr_blits@unsync-overlap.ht=
ml" target=3D"_blank">SKIP</a> ([i915#3297])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-snb5/igt@gem_userptr_blits@vma-merge.html" ta=
rget=3D"_blank">FAIL</a> ([i915#2724])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-apl1/igt@gem_userptr_blits@vma-merge.html" ta=
rget=3D"_blank">FAIL</a> ([i915#3318])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-iclb1/igt@gem_userptr_blits@vma-merge.html" t=
arget=3D"_blank">FAIL</a> ([i915#3318])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-glk7/igt@gem_userptr_blits@vma-merge.html" ta=
rget=3D"_blank">FAIL</a> ([i915#3318])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-kbl1/igt@gem_userptr_blits@vma-merge.html" ta=
rget=3D"_blank">FAIL</a> ([i915#3318])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-tglb6/igt@gem_userptr_blits@vma-merge.html" t=
arget=3D"_blank">FAIL</a> ([i915#3318])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-tglb5/igt@gen9_exec_parse@bb-start-param.htm=
l" target=3D"_blank">SKIP</a> ([fdo#112306]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-iclb2/igt@gen9_exec_parse@unaligned-jump.htm=
l" target=3D"_blank">SKIP</a> ([fdo#112306]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html" target=3D"=
_blank">FAIL</a> ([i915#454])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-tglb3/igt@i915_pm_dc@dc6-dpms.html" target=3D=
"_blank">FAIL</a> ([i915#454])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-kbl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.ht=
ml" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#1937])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-apl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.ht=
ml" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#1937])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-glk4/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi=
-a.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-tglb3/igt@i915_pm_rc6_residency@media-rc6-acc=
uracy.html" target=3D"_blank">SKIP</a> ([fdo#109289] / [fdo#111719])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-iclb4/igt@i915_pm_rc6_residency@media-rc6-acc=
uracy.html" target=3D"_blank">SKIP</a> ([fdo#109289])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-snb2/igt@i915_selftest@live@hangcheck.html" =
target=3D"_blank">INCOMPLETE</a> ([i915#2782])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-kbl4/igt@i915_suspend@fence-restore-tiled2un=
tiled.html" target=3D"_blank">INCOMPLETE</a> ([i915#155] / [i915#794])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-iclb8/igt@kms_atomic_transition@plane-all-mod=
eset-transition-fencing.html" target=3D"_blank">SKIP</a> ([i915#1769])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-tglb2/igt@kms_atomic_transition@plane-all-mod=
eset-transition-fencing.html" target=3D"_blank">SKIP</a> ([i915#1769])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-iclb2/igt@kms_big_fb@linear-32bpp-rotate-270=
.html" target=3D"_blank">SKIP</a> ([fdo#110725] / [fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-tglb7/igt@kms_big_fb@linear-64bpp-rotate-90.=
html" target=3D"_blank">SKIP</a> ([fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10237/shard-glk1/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html" targ=
et=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5935/shard-glk4/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html" t=
arget=3D"_blank">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-tglb5/igt@kms_big_fb@yf-tiled-8bpp-rotate-180=
.html" target=3D"_blank">SKIP</a> ([fdo#111615]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-iclb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-180=
.html" target=3D"_blank">SKIP</a> ([fdo#110723])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-iclb7/igt@kms_big_joiner@invalid-modeset.html=
" target=3D"_blank">SKIP</a> ([i915#2705])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-tglb6/igt@kms_big_joiner@invalid-modeset.html=
" target=3D"_blank">SKIP</a> ([i915#2705])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-max:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-iclb6/igt@kms_color@pipe-d-ctm-max.html" tar=
get=3D"_blank">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-limited-range:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-apl1/igt@kms_color_chamelium@pipe-a-ctm-limit=
ed-range.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +22=
 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-iclb1/igt@kms_color_chamelium@pipe-a-ctm-limi=
ted-range.html" target=3D"_blank">SKIP</a> ([fdo#109284] / [fdo#111827]) +2=
 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-5:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-glk8/igt@kms_color_chamelium@pipe-b-ctm-0-5.h=
tml" target=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar is=
sues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-tglb1/igt@kms_color_chamelium@pipe-b-ctm-0-5.=
html" target=3D"_blank">SKIP</a> ([fdo#109284] / [fdo#111827]) +7 similar i=
ssues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-limited-range:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-kbl4/igt@kms_color_chamelium@pipe-c-ctm-limi=
ted-range.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +1=
3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-limited-range:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-lim=
ited-range.html" target=3D"_blank">SKIP</a> ([fdo#109278] / [fdo#109284] / =
[fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-snb6/igt@kms_color_chamelium@pipe-invalid-ct=
m-matrix-sizes.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827=
]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-kbl6/igt@kms_content_protection@legacy.html"=
 target=3D"_blank">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-apl3/igt@kms_content_protection@srm.html" ta=
rget=3D"_blank">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-32x10=
-offscreen.html" target=3D"_blank">SKIP</a> ([i915#3359]) +2 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-kbl2/igt@kms_cursor_crc@pipe-d-cursor-256x25=
6-onscreen.html" target=3D"_blank">SKIP</a> ([fdo#109271]) +168 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-32x32=
-random.html" target=3D"_blank">SKIP</a> ([i915#3319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-iclb3/igt@kms_cursor_legacy@2x-long-nonblock=
ing-modeset-vs-cursor-atomic.html" target=3D"_blank">SKIP</a> ([fdo#109274]=
 / [fdo#109278]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-tglb6/igt@kms_cursor_legacy@cursora-vs-flipb=
-atomic.html" target=3D"_blank">SKIP</a> ([fdo#111825]) +28 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10237/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transi=
tions.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5935/shard-glk2/igt@kms_cursor_legacy@flip-vs-c=
ursor-atomic-transitions.html" target=3D"_blank">FAIL</a> ([i915#2346])</li=
>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-iclb6/igt@kms_flip@2x-nonexisting-fb.html" t=
arget=3D"_blank">SKIP</a> ([fdo#109274]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10237/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.h=
tml" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5935/shard-kbl4/igt@kms_flip@flip-vs-suspend-interrupt=
ible@a-dp1.html" target=3D"_blank">DMESG-WARN</a> ([i915#180]) +3 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-apl7/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
e-to-32bpp-ytilegen12rcccs.html" target=3D"_blank">SKIP</a> ([fdo#109271] /=
 [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-apl3/igt@kms_flip_scaled_crc@flip-32bpp-ytile=
-to-64bpp-ytile.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2642=
])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile=
-to-64bpp-ytile.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2642=
])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-kbl3/igt@kms_flip_scaled_crc@flip-32bpp-ytile=
-to-64bpp-ytile.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2642=
])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-tglb7/igt@kms_force_connector_basic@force-lo=
ad-detect.html" target=3D"_blank">SKIP</a> ([fdo#109285])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-apl8/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-spr-indfb-draw-mmap-wc.html" target=3D"_blank">SKIP</a> ([fdo#109271]=
) +258 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-iclb8/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-shrfb-plflip-blt.html" target=3D"_blank">SKIP</a> ([fdo#109280]) +15=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-apl8/igt@kms_pipe_crc_basic@compare-crc-sani=
tycheck-pipe-d.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#533])=
 +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-iclb1/igt@kms_pipe_crc_basic@read-crc-pipe-d-=
frame-sequence.html" target=3D"_blank">SKIP</a> ([fdo#109278]) +14 similar =
issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-glk6/igt@kms_pipe_crc_basic@read-crc-pipe-d-f=
rame-sequence.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#533])<=
/p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-kbl3/igt@kms_pipe_crc_basic@read-crc-pipe-d-f=
rame-sequence.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#533])<=
/p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-glk9/igt@kms_plane_alpha_blend@pipe-a-alpha-=
basic.html" target=3D"_blank">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-=
opaque-fb.html" target=3D"_blank">FAIL</a> ([fdo#108145] / [i915#265]) +3 s=
imilar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-kbl2/igt@kms_plane_alpha_blend@pipe-b-alpha-=
opaque-fb.html" target=3D"_blank">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-t=
ransparent-fb.html" target=3D"_blank">FAIL</a> ([i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-t=
ransparent-fb.html" target=3D"_blank">FAIL</a> ([i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-yf:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-iclb4/igt@kms_plane_lowres@pipe-c-tiling-yf.=
html" target=3D"_blank">SKIP</a> ([i915#3536]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-c=
lipping-clamping:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-kbl7/igt@kms_plane_scaling@scaler-with-clippi=
ng-clamping@pipe-c-scaler-with-clipping-clamping.html" target=3D"_blank">SK=
IP</a> ([fdo#109271] / [i915#2733])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-glk6/igt@kms_plane_scaling@scaler-with-clippi=
ng-clamping@pipe-c-scaler-with-clipping-clamping.html" target=3D"_blank">SK=
IP</a> ([fdo#109271] / [i915#2733])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-apl3/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-2.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#658]) +6=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-kbl4/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-3.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#658]) +4=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-glk3/igt@kms_psr2_sf@overlay-primary-update-s=
f-dmg-area-1.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#658]) +=
1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-1.html" target=3D"_blank">SKIP</a> ([i915#2920])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-tglb3/igt@kms_psr@psr2_dpms.html" target=3D"=
_blank">FAIL</a> ([i915#132] / [i915#3467]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html=
" target=3D"_blank">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10237/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html" target=3D=
"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5935/shard-iclb6/igt@kms_psr@psr2_primary_mmap_gtt.html" target=3D"_=
blank">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-apl7/igt@kms_writeback@writeback-check-outpu=
t.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-glk4/igt@kms_writeback@writeback-pixel-format=
s.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-kbl7/igt@kms_writeback@writeback-pixel-format=
s.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2437]) +1 similar =
issue</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-ctx-flip-detection:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-iclb7/igt@nouveau_crc@pipe-a-ctx-flip-detect=
ion.html" target=3D"_blank">SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-source-rg:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-tglb6/igt@nouveau_crc@pipe-d-source-rg.html"=
 target=3D"_blank">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@enable-race@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10237/shard-tglb7/igt@perf_pmu@enable-race@rcs0.html" target=3D"_bl=
ank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5935/shard-tglb8/igt@perf_pmu@enable-race@rcs0.html" target=3D"_blank">I=
NCOMPLETE</a> ([i915#750])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_2:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-tglb7/igt@prime_nv_pcopy@test3_2.html" targe=
t=3D"_blank">SKIP</a> ([fdo#109291]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_4:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-iclb6/igt@prime_nv_pcopy@test3_4.html" targe=
t=3D"_blank">SKIP</a> ([fdo#109291]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-tglb7/igt@prime_vgem@basic-userptr.html" targ=
et=3D"_blank">SKIP</a> ([i915#3301])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-iclb8/igt@prime_vgem@basic-userptr.html" targ=
et=3D"_blank">SKIP</a> ([i915#3301])</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-snb6/igt@runner@aborted.html" target=3D"_bla=
nk">FAIL</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-1:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-glk5/igt@sysfs_clients@fair-1.html" target=3D=
"_blank">SKIP</a> ([fdo#109271] / [i915#2994])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-iclb3/igt@sysfs_clients@fair-1.html" target=
=3D"_blank">SKIP</a> ([i915#2994])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-apl6/igt@sysfs_clients@fair-1.html" target=3D=
"_blank">SKIP</a> ([fdo#109271] / [i915#2994]) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5935/shard-tglb5/igt@sysfs_clients@fair-1.html" target=
=3D"_blank">SKIP</a> ([i915#2994])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-50:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-kbl6/igt@sysfs_clients@split-50.html" target=
=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2994]) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10237/shard-glk1/igt@gem_exec_fair@basic-none@vcs0.html" target=3D"=
_blank">FAIL</a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5935/shard-glk5/igt@gem_exec_fair@basic-none@vcs0.html"=
 target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10237/shard-tglb7/igt@gem_exec_fair@basic-pace@vecs0.html" target=
=3D"_blank">FAIL</a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5935/shard-tglb1/igt@gem_exec_fair@basic-pace@vecs0=
.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@destroy-race:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10237/shard-tglb3/igt@gem_vm_create@destroy-race.html" target=3D"_b=
lank">TIMEOUT</a> ([i915#2795]) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5935/shard-tglb1/igt@gem_vm_create@destroy-race.html" =
target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt</p>
</li>
</ul>

</div>

</blockquote></div>

--000000000000fa6d3a05c4fb31c8--

--===============0758003826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0758003826==--
