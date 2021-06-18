Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E0A6E402
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jun 2021 08:23:47 +0000 (UTC)
Date: Fri, 18 Jun 2021 11:25:43 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YMxYh+bQCfydntNp@platvala-desk.ger.corp.intel.com>
References: <20210617152032.431594-1-markyacoub@chromium.org>
 <162395314565.3752.9409090648606931698@emeril.freedesktop.org>
 <CAJUqKUrBBvLK=P4SfBf8ic8s92y2cz1wHCFPhGVXys_esYGDUA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJUqKUrBBvLK=P4SfBf8ic8s92y2cz1wHCFPhGVXys_esYGDUA@mail.gmail.com>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fvblank=3A_Turn_on_hardware_before_testing_invalid_vblank?=
 =?utf-8?b?LiAocmV2Myk=?=
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

On Thu, Jun 17, 2021 at 03:27:05PM -0400, Mark Yacoub wrote:
> this has passed previously so im gonna guess it's false negative?


Yeah and your patch cannot affect that one.

Lakshmi, false positive below.





> 
> On Thu, Jun 17, 2021 at 2:05 PM Patchwork <patchwork@emeril.freedesktop.org>
> wrote:
> 
> > *Patch Details*
> > *Series:* tests/kms_vblank: Turn on hardware before testing invalid
> > vblank. (rev3)
> > *URL:* https://patchwork.freedesktop.org/series/90382/
> > *State:* failure
> > *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/index.html CI
> > Bug Log - changes from CI_DRM_10237_full -> IGTPW_5935_full Summary
> >
> > *FAILURE*
> >
> > Serious unknown changes coming with IGTPW_5935_full absolutely need to be
> > verified manually.
> >
> > If you think the reported changes have nothing to do with the changes
> > introduced in IGTPW_5935_full, please notify your bug team to allow them
> > to document this new failure mode, which will reduce false positives in CI.
> >
> > External URL:
> > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/index.html
> > Possible new issues
> >
> > Here are the unknown changes that may have been introduced in
> > IGTPW_5935_full:
> > IGT changes Possible regressions
> >
> >    - igt@gem_exec_reloc@basic-wide-active@vcs1:
> >       - shard-iclb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@vcs1.html>
> >
> > Warnings
> >
> >    -
> >
> >    igt@gem_exec_reloc@basic-wide-active@bcs0:
> >    -
> >
> >       shard-apl: FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-apl2/igt@gem_exec_reloc@basic-wide-active@bcs0.html>
> >       ([i915#2389]) -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-apl7/igt@gem_exec_reloc@basic-wide-active@bcs0.html>
> >       +3 similar issues
> >       -
> >
> >       shard-glk: FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-glk6/igt@gem_exec_reloc@basic-wide-active@bcs0.html>
> >       ([i915#2389]) -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk9/igt@gem_exec_reloc@basic-wide-active@bcs0.html>
> >       +3 similar issues
> >       -
> >
> >       shard-tglb: FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-tglb1/igt@gem_exec_reloc@basic-wide-active@bcs0.html>
> >       ([i915#2389]) -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb2/igt@gem_exec_reloc@basic-wide-active@bcs0.html>
> >       +4 similar issues
> >       -
> >
> >    igt@gem_exec_reloc@basic-wide-active@rcs0:
> >    -
> >
> >       shard-snb: FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-snb5/igt@gem_exec_reloc@basic-wide-active@rcs0.html>
> >       ([i915#2389]) -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-snb2/igt@gem_exec_reloc@basic-wide-active@rcs0.html>
> >       +2 similar issues
> >       -
> >
> >       shard-iclb: FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-iclb7/igt@gem_exec_reloc@basic-wide-active@rcs0.html>
> >       ([i915#2389]) -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@rcs0.html>
> >       +3 similar issues
> >       -
> >
> >       shard-kbl: FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-kbl7/igt@gem_exec_reloc@basic-wide-active@rcs0.html>
> >       ([i915#2389]) -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl2/igt@gem_exec_reloc@basic-wide-active@rcs0.html>
> >       +4 similar issues
> >
> > Known issues
> >
> > Here are the changes found in IGTPW_5935_full that come from known issues:
> > IGT changes Issues hit
> >
> >    -
> >
> >    igt@feature_discovery@display-3x:
> >    -
> >
> >       shard-glk: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk6/igt@feature_discovery@display-3x.html>
> >       ([fdo#109271]) +84 similar issues
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb1/igt@feature_discovery@display-3x.html>
> >       ([i915#1839])
> >       -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb3/igt@feature_discovery@display-3x.html>
> >       ([i915#1839])
> >       -
> >
> >    igt@gem_ctx_persistence@legacy-engines-mixed:
> >    - shard-snb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-snb2/igt@gem_ctx_persistence@legacy-engines-mixed.html>
> >       ([fdo#109271] / [i915#1099]) +4 similar issues
> >    -
> >
> >    igt@gem_eio@unwedge-stress:
> >    -
> >
> >       shard-tglb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-tglb6/igt@gem_eio@unwedge-stress.html>
> >       -> TIMEOUT
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb2/igt@gem_eio@unwedge-stress.html>
> >       ([i915#2369] / [i915#3063])
> >       -
> >
> >       shard-snb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-snb2/igt@gem_eio@unwedge-stress.html>
> >       ([i915#3354])
> >       -
> >
> >    igt@gem_exec_fair@basic-deadline:
> >    - shard-apl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-apl7/igt@gem_exec_fair@basic-deadline.html>
> >       ([i915#2846])
> >    -
> >
> >    igt@gem_exec_fair@basic-none-rrul@rcs0:
> >    - shard-glk: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk3/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
> >       ([i915#2842]) +1 similar issue
> >    -
> >
> >    igt@gem_exec_fair@basic-pace@vcs1:
> >    -
> >
> >       shard-iclb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html>
> >       ([i915#2842])
> >       -
> >
> >       shard-kbl: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html>
> >       -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs1.html>
> >       ([fdo#109271])
> >       -
> >
> >    igt@gem_exec_fair@basic-pace@vecs0:
> >    - shard-iclb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-iclb3/igt@gem_exec_fair@basic-pace@vecs0.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb2/igt@gem_exec_fair@basic-pace@vecs0.html>
> >       ([i915#2842])
> >    -
> >
> >    igt@gem_exec_fair@basic-throttle@rcs0:
> >    -
> >
> >       shard-kbl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl2/igt@gem_exec_fair@basic-throttle@rcs0.html>
> >       ([i915#2842])
> >       -
> >
> >       shard-iclb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html>
> >       ([i915#2849])
> >       -
> >
> >    igt@gem_exec_flush@basic-batch-kernel-default-cmd:
> >    - shard-snb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-snb5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html>
> >       ([fdo#109271]) +288 similar issues
> >    -
> >
> >    igt@gem_exec_params@no-vebox:
> >    -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb2/igt@gem_exec_params@no-vebox.html>
> >       ([fdo#109283])
> >       -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb5/igt@gem_exec_params@no-vebox.html>
> >       ([fdo#109283])
> >       -
> >
> >    igt@gem_huc_copy@huc-copy:
> >    - shard-tglb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-tglb5/igt@gem_huc_copy@huc-copy.html>
> >       -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb6/igt@gem_huc_copy@huc-copy.html>
> >       ([i915#2190])
> >    -
> >
> >    igt@gem_pread@exhaustion:
> >    - shard-snb: NOTRUN -> WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-snb2/igt@gem_pread@exhaustion.html>
> >       ([i915#2658])
> >    -
> >
> >    igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb3/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html>
> >       ([i915#768]) +2 similar issues
> >    -
> >
> >    igt@gem_userptr_blits@input-checking:
> >    - shard-snb: NOTRUN -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-snb6/igt@gem_userptr_blits@input-checking.html>
> >       ([i915#3002])
> >    -
> >
> >    igt@gem_userptr_blits@unsync-overlap:
> >    -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb6/igt@gem_userptr_blits@unsync-overlap.html>
> >       ([i915#3297])
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb5/igt@gem_userptr_blits@unsync-overlap.html>
> >       ([i915#3297])
> >       -
> >
> >    igt@gem_userptr_blits@vma-merge:
> >    -
> >
> >       shard-snb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-snb5/igt@gem_userptr_blits@vma-merge.html>
> >       ([i915#2724])
> >       -
> >
> >       shard-apl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-apl1/igt@gem_userptr_blits@vma-merge.html>
> >       ([i915#3318])
> >       -
> >
> >       shard-iclb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb1/igt@gem_userptr_blits@vma-merge.html>
> >       ([i915#3318])
> >       -
> >
> >       shard-glk: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk7/igt@gem_userptr_blits@vma-merge.html>
> >       ([i915#3318])
> >       -
> >
> >       shard-kbl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl1/igt@gem_userptr_blits@vma-merge.html>
> >       ([i915#3318])
> >       -
> >
> >       shard-tglb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb6/igt@gem_userptr_blits@vma-merge.html>
> >       ([i915#3318])
> >       -
> >
> >    igt@gen9_exec_parse@bb-start-param:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb5/igt@gen9_exec_parse@bb-start-param.html>
> >       ([fdo#112306]) +2 similar issues
> >    -
> >
> >    igt@gen9_exec_parse@unaligned-jump:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb2/igt@gen9_exec_parse@unaligned-jump.html>
> >       ([fdo#112306]) +1 similar issue
> >    -
> >
> >    igt@i915_pm_dc@dc6-dpms:
> >    -
> >
> >       shard-kbl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html>
> >       ([i915#454])
> >       -
> >
> >       shard-tglb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb3/igt@i915_pm_dc@dc6-dpms.html>
> >       ([i915#454])
> >       -
> >
> >    igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
> >    -
> >
> >       shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html>
> >       ([fdo#109271] / [i915#1937])
> >       -
> >
> >       shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-apl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html>
> >       ([fdo#109271] / [i915#1937])
> >       -
> >
> >    igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
> >    - shard-glk: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk4/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html>
> >       ([fdo#109271] / [i915#1937])
> >    -
> >
> >    igt@i915_pm_rc6_residency@media-rc6-accuracy:
> >    -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb3/igt@i915_pm_rc6_residency@media-rc6-accuracy.html>
> >       ([fdo#109289] / [fdo#111719])
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb4/igt@i915_pm_rc6_residency@media-rc6-accuracy.html>
> >       ([fdo#109289])
> >       -
> >
> >    igt@i915_selftest@live@hangcheck:
> >    - shard-snb: NOTRUN -> INCOMPLETE
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-snb2/igt@i915_selftest@live@hangcheck.html>
> >       ([i915#2782])
> >    -
> >
> >    igt@i915_suspend@fence-restore-tiled2untiled:
> >    - shard-kbl: NOTRUN -> INCOMPLETE
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html>
> >       ([i915#155] / [i915#794])
> >    -
> >
> >    igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
> >    -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
> >       ([i915#1769])
> >       -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
> >       ([i915#1769])
> >       -
> >
> >    igt@kms_big_fb@linear-32bpp-rotate-270:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb2/igt@kms_big_fb@linear-32bpp-rotate-270.html>
> >       ([fdo#110725] / [fdo#111614])
> >    -
> >
> >    igt@kms_big_fb@linear-64bpp-rotate-90:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb7/igt@kms_big_fb@linear-64bpp-rotate-90.html>
> >       ([fdo#111614]) +1 similar issue
> >    -
> >
> >    igt@kms_big_fb@x-tiled-32bpp-rotate-180:
> >    - shard-glk: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-glk1/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html>
> >       -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk4/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html>
> >       ([i915#118] / [i915#95])
> >    -
> >
> >    igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
> >    -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb5/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html>
> >       ([fdo#111615]) +2 similar issues
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html>
> >       ([fdo#110723])
> >       -
> >
> >    igt@kms_big_joiner@invalid-modeset:
> >    -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb7/igt@kms_big_joiner@invalid-modeset.html>
> >       ([i915#2705])
> >       -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb6/igt@kms_big_joiner@invalid-modeset.html>
> >       ([i915#2705])
> >       -
> >
> >    igt@kms_color@pipe-d-ctm-max:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb6/igt@kms_color@pipe-d-ctm-max.html>
> >       ([fdo#109278] / [i915#1149])
> >    -
> >
> >    igt@kms_color_chamelium@pipe-a-ctm-limited-range:
> >    -
> >
> >       shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-apl1/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html>
> >       ([fdo#109271] / [fdo#111827]) +22 similar issues
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb1/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html>
> >       ([fdo#109284] / [fdo#111827]) +2 similar issues
> >       -
> >
> >    igt@kms_color_chamelium@pipe-b-ctm-0-5:
> >    -
> >
> >       shard-glk: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk8/igt@kms_color_chamelium@pipe-b-ctm-0-5.html>
> >       ([fdo#109271] / [fdo#111827]) +7 similar issues
> >       -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb1/igt@kms_color_chamelium@pipe-b-ctm-0-5.html>
> >       ([fdo#109284] / [fdo#111827]) +7 similar issues
> >       -
> >
> >    igt@kms_color_chamelium@pipe-c-ctm-limited-range:
> >    - shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl4/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html>
> >       ([fdo#109271] / [fdo#111827]) +13 similar issues
> >    -
> >
> >    igt@kms_color_chamelium@pipe-d-ctm-limited-range:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html>
> >       ([fdo#109278] / [fdo#109284] / [fdo#111827])
> >    -
> >
> >    igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:
> >    - shard-snb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-snb6/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html>
> >       ([fdo#109271] / [fdo#111827]) +13 similar issues
> >    -
> >
> >    igt@kms_content_protection@legacy:
> >    - shard-kbl: NOTRUN -> TIMEOUT
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl6/igt@kms_content_protection@legacy.html>
> >       ([i915#1319])
> >    -
> >
> >    igt@kms_content_protection@srm:
> >    - shard-apl: NOTRUN -> TIMEOUT
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-apl3/igt@kms_content_protection@srm.html>
> >       ([i915#1319])
> >    -
> >
> >    igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen.html>
> >       ([i915#3359]) +2 similar issues
> >    -
> >
> >    igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen:
> >    - shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl2/igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen.html>
> >       ([fdo#109271]) +168 similar issues
> >    -
> >
> >    igt@kms_cursor_crc@pipe-d-cursor-32x32-random:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-32x32-random.html>
> >       ([i915#3319])
> >    -
> >
> >    igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb3/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html>
> >       ([fdo#109274] / [fdo#109278]) +1 similar issue
> >    -
> >
> >    igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html>
> >       ([fdo#111825]) +28 similar issues
> >    -
> >
> >    igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> >    - shard-glk: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html>
> >       ([i915#2346])
> >    -
> >
> >    igt@kms_flip@2x-nonexisting-fb:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb6/igt@kms_flip@2x-nonexisting-fb.html>
> >       ([fdo#109274]) +4 similar issues
> >    -
> >
> >    igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
> >    - shard-kbl: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html>
> >       -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html>
> >       ([i915#180]) +3 similar issues
> >    -
> >
> >    igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
> >    - shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-apl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html>
> >       ([fdo#109271] / [i915#2672])
> >    -
> >
> >    igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
> >    -
> >
> >       shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-apl3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html>
> >       ([fdo#109271] / [i915#2642])
> >       -
> >
> >       shard-glk: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html>
> >       ([fdo#109271] / [i915#2642])
> >       -
> >
> >       shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html>
> >       ([fdo#109271] / [i915#2642])
> >       -
> >
> >    igt@kms_force_connector_basic@force-load-detect:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb7/igt@kms_force_connector_basic@force-load-detect.html>
> >       ([fdo#109285])
> >    -
> >
> >    igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
> >    - shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-apl8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html>
> >       ([fdo#109271]) +258 similar issues
> >    -
> >
> >    igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html>
> >       ([fdo#109280]) +15 similar issues
> >    -
> >
> >    igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
> >    - shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-apl8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html>
> >       ([fdo#109271] / [i915#533]) +4 similar issues
> >    -
> >
> >    igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
> >    -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb1/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html>
> >       ([fdo#109278]) +14 similar issues
> >       -
> >
> >       shard-glk: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk6/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html>
> >       ([fdo#109271] / [i915#533])
> >       -
> >
> >       shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl3/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html>
> >       ([fdo#109271] / [i915#533])
> >       -
> >
> >    igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
> >    - shard-glk: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk9/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html>
> >       ([fdo#108145] / [i915#265])
> >    -
> >
> >    igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
> >    - shard-apl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html>
> >       ([fdo#108145] / [i915#265]) +3 similar issues
> >    -
> >
> >    igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
> >    - shard-kbl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl2/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html>
> >       ([fdo#108145] / [i915#265])
> >    -
> >
> >    igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
> >    -
> >
> >       shard-apl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html>
> >       ([i915#265])
> >       -
> >
> >       shard-kbl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html>
> >       ([i915#265])
> >       -
> >
> >    igt@kms_plane_lowres@pipe-c-tiling-yf:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb4/igt@kms_plane_lowres@pipe-c-tiling-yf.html>
> >       ([i915#3536]) +1 similar issue
> >    -
> >
> >    igt@kms_plane_scaling
> >    @scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:
> >    -
> >
> >       shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl7/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html>
> >       ([fdo#109271] / [i915#2733])
> >       -
> >
> >       shard-glk: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk6/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html>
> >       ([fdo#109271] / [i915#2733])
> >       -
> >
> >    igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
> >    - shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-apl3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html>
> >       ([fdo#109271] / [i915#658]) +6 similar issues
> >    -
> >
> >    igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:
> >    - shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl4/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html>
> >       ([fdo#109271] / [i915#658]) +4 similar issues
> >    -
> >
> >    igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:
> >    -
> >
> >       shard-glk: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html>
> >       ([fdo#109271] / [i915#658]) +1 similar issue
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html>
> >       ([i915#2920])
> >       -
> >
> >    igt@kms_psr@psr2_dpms:
> >    - shard-tglb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb3/igt@kms_psr@psr2_dpms.html>
> >       ([i915#132] / [i915#3467]) +2 similar issues
> >    -
> >
> >    igt@kms_psr@psr2_primary_mmap_cpu:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html>
> >       ([fdo#109441]) +1 similar issue
> >    -
> >
> >    igt@kms_psr@psr2_primary_mmap_gtt:
> >    - shard-iclb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html>
> >       -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb6/igt@kms_psr@psr2_primary_mmap_gtt.html>
> >       ([fdo#109441]) +1 similar issue
> >    -
> >
> >    igt@kms_writeback@writeback-check-output:
> >    - shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-apl7/igt@kms_writeback@writeback-check-output.html>
> >       ([fdo#109271] / [i915#2437])
> >    -
> >
> >    igt@kms_writeback@writeback-pixel-formats:
> >    -
> >
> >       shard-glk: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk4/igt@kms_writeback@writeback-pixel-formats.html>
> >       ([fdo#109271] / [i915#2437])
> >       -
> >
> >       shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl7/igt@kms_writeback@writeback-pixel-formats.html>
> >       ([fdo#109271] / [i915#2437]) +1 similar issue
> >       -
> >
> >    igt@nouveau_crc@pipe-a-ctx-flip-detection:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb7/igt@nouveau_crc@pipe-a-ctx-flip-detection.html>
> >       ([i915#2530])
> >    -
> >
> >    igt@nouveau_crc@pipe-d-source-rg:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb6/igt@nouveau_crc@pipe-d-source-rg.html>
> >       ([i915#2530]) +1 similar issue
> >    -
> >
> >    igt@perf_pmu@enable-race@rcs0:
> >    - shard-tglb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-tglb7/igt@perf_pmu@enable-race@rcs0.html>
> >       -> INCOMPLETE
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb8/igt@perf_pmu@enable-race@rcs0.html>
> >       ([i915#750])
> >    -
> >
> >    igt@prime_nv_pcopy@test3_2:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb7/igt@prime_nv_pcopy@test3_2.html>
> >       ([fdo#109291]) +1 similar issue
> >    -
> >
> >    igt@prime_nv_pcopy@test3_4:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb6/igt@prime_nv_pcopy@test3_4.html>
> >       ([fdo#109291]) +1 similar issue
> >    -
> >
> >    igt@prime_vgem@basic-userptr:
> >    -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb7/igt@prime_vgem@basic-userptr.html>
> >       ([i915#3301])
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb8/igt@prime_vgem@basic-userptr.html>
> >       ([i915#3301])
> >       -
> >
> >    igt@runner@aborted:
> >    - shard-snb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-snb6/igt@runner@aborted.html>
> >       ([i915#3002])
> >    -
> >
> >    igt@sysfs_clients@fair-1:
> >    -
> >
> >       shard-glk: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk5/igt@sysfs_clients@fair-1.html>
> >       ([fdo#109271] / [i915#2994])
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-iclb3/igt@sysfs_clients@fair-1.html>
> >       ([i915#2994])
> >       -
> >
> >       shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-apl6/igt@sysfs_clients@fair-1.html>
> >       ([fdo#109271] / [i915#2994]) +3 similar issues
> >       -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb5/igt@sysfs_clients@fair-1.html>
> >       ([i915#2994])
> >       -
> >
> >    igt@sysfs_clients@split-50:
> >    - shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-kbl6/igt@sysfs_clients@split-50.html>
> >       ([fdo#109271] / [i915#2994]) +2 similar issues
> >
> > Possible fixes
> >
> >    -
> >
> >    igt@gem_exec_fair@basic-none@vcs0:
> >    - shard-glk: FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-glk1/igt@gem_exec_fair@basic-none@vcs0.html>
> >       ([i915#2842]) -> PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-glk5/igt@gem_exec_fair@basic-none@vcs0.html>
> >       +1 similar issue
> >    -
> >
> >    igt@gem_exec_fair@basic-pace@vecs0:
> >    - shard-tglb: FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-tglb7/igt@gem_exec_fair@basic-pace@vecs0.html>
> >       ([i915#2842]) -> PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb1/igt@gem_exec_fair@basic-pace@vecs0.html>
> >    -
> >
> >    igt@gem_vm_create@destroy-race:
> >    - shard-tglb: TIMEOUT
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10237/shard-tglb3/igt@gem_vm_create@destroy-race.html>
> >       ([i915#2795]) -> PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5935/shard-tglb1/igt@gem_vm_create@destroy-race.html>
> >    -
> >
> >    igt
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
