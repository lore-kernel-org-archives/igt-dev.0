Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67B26ECFB
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jun 2021 16:27:24 +0000 (UTC)
Date: Wed, 2 Jun 2021 19:28:14 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YLexnone6s+E5gdi@platvala-desk.ger.corp.intel.com>
References: <20210601172936.3785449-1-markyacoub@chromium.org>
 <162259978317.11228.17778262680179536922@emeril.freedesktop.org>
 <CAJUqKUpvAEFUUVn1LpZYHvtV298SxZoCfUkS_EsUYK7sHEpY9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJUqKUpvAEFUUVn1LpZYHvtV298SxZoCfUkS_EsUYK7sHEpY9Q@mail.gmail.com>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fvblank=3A_Turn_on_hardware_before_testing_invalid_vblank?=
 =?utf-8?b?LiAocmV2Mik=?=
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

On Wed, Jun 02, 2021 at 10:47:33AM -0400, Mark Yacoub wrote:
> looks like a false positive to me.

Indeed. Lakshmi, see below.


> 
> On Tue, Jun 1, 2021 at 10:09 PM Patchwork <patchwork@emeril.freedesktop.org>
> wrote:
> 
> > *Patch Details*
> > *Series:* tests/kms_vblank: Turn on hardware before testing invalid
> > vblank. (rev2)
> > *URL:* https://patchwork.freedesktop.org/series/90382/
> > *State:* failure
> > *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/index.html CI
> > Bug Log - changes from CI_DRM_10156_full -> IGTPW_5874_full Summary
> >
> > *FAILURE*
> >
> > Serious unknown changes coming with IGTPW_5874_full absolutely need to be
> > verified manually.
> >
> > If you think the reported changes have nothing to do with the changes
> > introduced in IGTPW_5874_full, please notify your bug team to allow them
> > to document this new failure mode, which will reduce false positives in CI.
> >
> > External URL:
> > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/index.html
> > Possible new issues
> >
> > Here are the unknown changes that may have been introduced in
> > IGTPW_5874_full:
> > IGT changes Possible regressions
> >
> >    - igt@kms_big_fb@y-tiled-16bpp-rotate-180:
> >       - shard-glk: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10156/shard-glk1/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk4/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html>
> >
> > Known issues
> >
> > Here are the changes found in IGTPW_5874_full that come from known issues:
> > IGT changes Issues hit
> >
> >    -
> >
> >    igt@feature_discovery@display-3x:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb8/igt@feature_discovery@display-3x.html>
> >       ([i915#1839]) +1 similar issue
> >    -
> >
> >    igt@gem_create@create-clear:
> >    - shard-glk: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10156/shard-glk5/igt@gem_create@create-clear.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk9/igt@gem_create@create-clear.html>
> >       ([i915#3160])
> >    -
> >
> >    igt@gem_ctx_persistence@legacy-engines-mixed:
> >    - shard-snb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-snb6/igt@gem_ctx_persistence@legacy-engines-mixed.html>
> >       ([fdo#109271] / [i915#1099]) +5 similar issues
> >    -
> >
> >    igt@gem_ctx_sseu@invalid-sseu:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb8/igt@gem_ctx_sseu@invalid-sseu.html>
> >       ([i915#280])
> >    -
> >
> >    igt@gem_exec_fair@basic-flow@rcs0:
> >    - shard-tglb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10156/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb8/igt@gem_exec_fair@basic-flow@rcs0.html>
> >       ([i915#2842])
> >    -
> >
> >    igt@gem_exec_fair@basic-none-vip@rcs0:
> >    - shard-tglb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb2/igt@gem_exec_fair@basic-none-vip@rcs0.html>
> >       ([i915#2842]) +1 similar issue
> >    -
> >
> >    igt@gem_exec_fair@basic-pace-solo@rcs0:
> >    -
> >
> >       shard-iclb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb5/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
> >       ([i915#2842]) +2 similar issues
> >       -
> >
> >       shard-glk: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk4/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
> >       ([i915#2842]) +1 similar issue
> >       -
> >
> >    igt@gem_exec_fair@basic-pace@vecs0:
> >    - shard-glk: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10156/shard-glk2/igt@gem_exec_fair@basic-pace@vecs0.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk1/igt@gem_exec_fair@basic-pace@vecs0.html>
> >       ([i915#2842]) +1 similar issue
> >    -
> >
> >    igt@gem_exec_flush@basic-batch-kernel-default-cmd:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb7/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html>
> >       ([fdo#109313])
> >    -
> >
> >    igt@gem_exec_params@rsvd2-dirt:
> >    -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb3/igt@gem_exec_params@rsvd2-dirt.html>
> >       ([fdo#109283])
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb5/igt@gem_exec_params@rsvd2-dirt.html>
> >       ([fdo#109283])
> >       -
> >
> >    igt@gem_exec_reloc@basic-wide-active@bcs0:
> >    -
> >
> >       shard-apl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl6/igt@gem_exec_reloc@basic-wide-active@bcs0.html>
> >       ([i915#2389]) +3 similar issues
> >       -
> >
> >       shard-glk: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk4/igt@gem_exec_reloc@basic-wide-active@bcs0.html>
> >       ([i915#2389]) +3 similar issues
> >       -
> >
> >       shard-tglb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb6/igt@gem_exec_reloc@basic-wide-active@bcs0.html>
> >       ([i915#2389]) +4 similar issues
> >       -
> >
> >    igt@gem_exec_reloc@basic-wide-active@rcs0:
> >    -
> >
> >       shard-snb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-snb7/igt@gem_exec_reloc@basic-wide-active@rcs0.html>
> >       ([i915#2389]) +2 similar issues
> >       -
> >
> >       shard-iclb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb7/igt@gem_exec_reloc@basic-wide-active@rcs0.html>
> >       ([i915#2389]) +3 similar issues
> >       -
> >
> >       shard-kbl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-kbl1/igt@gem_exec_reloc@basic-wide-active@rcs0.html>
> >       ([i915#2389]) +4 similar issues
> >       -
> >
> >    igt@gem_huc_copy@huc-copy:
> >    -
> >
> >       shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl3/igt@gem_huc_copy@huc-copy.html>
> >       ([fdo#109271] / [i915#2190])
> >       -
> >
> >       shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-kbl7/igt@gem_huc_copy@huc-copy.html>
> >       ([fdo#109271] / [i915#2190])
> >       -
> >
> >    igt@gem_mmap_gtt@big-copy:
> >    - shard-glk: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10156/shard-glk8/igt@gem_mmap_gtt@big-copy.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk1/igt@gem_mmap_gtt@big-copy.html>
> >       ([i915#307]) +2 similar issues
> >    -
> >
> >    igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
> >    - shard-snb: NOTRUN -> INCOMPLETE
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-snb5/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html>
> >       ([i915#2055])
> >    -
> >
> >    igt@gem_mmap_gtt@fault-concurrent-x:
> >    - shard-snb: NOTRUN -> INCOMPLETE
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-snb2/igt@gem_mmap_gtt@fault-concurrent-x.html>
> >       ([i915#3468] / [i915#3485])
> >    -
> >
> >    igt@gem_mmap_gtt@fault-concurrent-y:
> >    - shard-kbl: NOTRUN -> INCOMPLETE
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-kbl3/igt@gem_mmap_gtt@fault-concurrent-y.html>
> >       ([i915#3468])
> >    -
> >
> >    igt@gem_render_copy@y-tiled-to-vebox-linear:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb1/igt@gem_render_copy@y-tiled-to-vebox-linear.html>
> >       ([i915#768]) +2 similar issues
> >    -
> >
> >    igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
> >    - shard-glk: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk2/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html>
> >       ([fdo#109271]) +153 similar issues
> >    -
> >
> >    igt@gem_userptr_blits@coherency-sync:
> >    -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb8/igt@gem_userptr_blits@coherency-sync.html>
> >       ([fdo#110542])
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb5/igt@gem_userptr_blits@coherency-sync.html>
> >       ([fdo#109290])
> >       -
> >
> >    igt@gem_userptr_blits@unsync-overlap:
> >    -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb6/igt@gem_userptr_blits@unsync-overlap.html>
> >       ([i915#3297])
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb6/igt@gem_userptr_blits@unsync-overlap.html>
> >       ([i915#3297])
> >       -
> >
> >    igt@gen7_exec_parse@bitmasks:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb7/igt@gen7_exec_parse@bitmasks.html>
> >       ([fdo#109289]) +3 similar issues
> >    -
> >
> >    igt@gen7_exec_parse@cmd-crossing-page:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb5/igt@gen7_exec_parse@cmd-crossing-page.html>
> >       ([fdo#109289]) +1 similar issue
> >    -
> >
> >    igt@gen9_exec_parse@batch-without-end:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb5/igt@gen9_exec_parse@batch-without-end.html>
> >       ([fdo#112306]) +1 similar issue
> >    -
> >
> >    igt@gen9_exec_parse@cmd-crossing-page:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb3/igt@gen9_exec_parse@cmd-crossing-page.html>
> >       ([fdo#112306]) +2 similar issues
> >    -
> >
> >    igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
> >    -
> >
> >       shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-kbl1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html>
> >       ([fdo#109271] / [i915#1937])
> >       -
> >
> >       shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html>
> >       ([fdo#109271] / [i915#1937])
> >       -
> >
> >    igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
> >    -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html>
> >       ([fdo#111644] / [i915#1397] / [i915#2411]) +1 similar issue
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html>
> >       ([fdo#110892]) +1 similar issue
> >       -
> >
> >    igt@i915_selftest@live@execlists:
> >    - shard-kbl: NOTRUN -> INCOMPLETE
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-kbl2/igt@i915_selftest@live@execlists.html>
> >       ([i915#2782] / [i915#3462] / [i915#794])
> >    -
> >
> >    igt@i915_selftest@live@hangcheck:
> >    - shard-snb: NOTRUN -> INCOMPLETE
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-snb7/igt@i915_selftest@live@hangcheck.html>
> >       ([i915#2782])
> >    -
> >
> >    igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
> >    -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
> >       ([i915#1769])
> >       -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
> >       ([i915#1769])
> >       -
> >
> >    igt@kms_big_fb@linear-8bpp-rotate-270:
> >    -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb8/igt@kms_big_fb@linear-8bpp-rotate-270.html>
> >       ([fdo#111614]) +2 similar issues
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb5/igt@kms_big_fb@linear-8bpp-rotate-270.html>
> >       ([fdo#110725] / [fdo#111614]) +1 similar issue
> >       -
> >
> >    igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
> >    -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb5/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html>
> >       ([fdo#111615]) +4 similar issues
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb8/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html>
> >       ([fdo#110723])
> >       -
> >
> >    igt@kms_big_joiner@invalid-modeset:
> >    -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb1/igt@kms_big_joiner@invalid-modeset.html>
> >       ([i915#2705])
> >       -
> >
> >       shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-kbl1/igt@kms_big_joiner@invalid-modeset.html>
> >       ([fdo#109271] / [i915#2705])
> >       -
> >
> >       shard-glk: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk5/igt@kms_big_joiner@invalid-modeset.html>
> >       ([fdo#109271] / [i915#2705])
> >       -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb7/igt@kms_big_joiner@invalid-modeset.html>
> >       ([i915#2705])
> >       -
> >
> >    igt@kms_chamelium@dp-crc-multiple:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb8/igt@kms_chamelium@dp-crc-multiple.html>
> >       ([fdo#109284] / [fdo#111827]) +8 similar issues
> >    -
> >
> >    igt@kms_chamelium@hdmi-crc-fast:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb1/igt@kms_chamelium@hdmi-crc-fast.html>
> >       ([fdo#109284] / [fdo#111827]) +5 similar issues
> >    -
> >
> >    igt@kms_chamelium@hdmi-hpd:
> >    - shard-glk: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk2/igt@kms_chamelium@hdmi-hpd.html>
> >       ([fdo#109271] / [fdo#111827]) +10 similar issues
> >    -
> >
> >    igt@kms_chamelium@vga-edid-read:
> >    - shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl3/igt@kms_chamelium@vga-edid-read.html>
> >       ([fdo#109271] / [fdo#111827]) +27 similar issues
> >    -
> >
> >    igt@kms_color@pipe-a-degamma:
> >    -
> >
> >       shard-tglb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb5/igt@kms_color@pipe-a-degamma.html>
> >       ([i915#1149])
> >       -
> >
> >       shard-iclb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb6/igt@kms_color@pipe-a-degamma.html>
> >       ([i915#1149])
> >       -
> >
> >    igt@kms_color@pipe-d-ctm-0-5:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb8/igt@kms_color@pipe-d-ctm-0-5.html>
> >       ([fdo#109278] / [i915#1149])
> >    -
> >
> >    igt@kms_color_chamelium@pipe-a-ctm-0-25:
> >    - shard-snb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-snb7/igt@kms_color_chamelium@pipe-a-ctm-0-25.html>
> >       ([fdo#109271] / [fdo#111827]) +17 similar issues
> >    -
> >
> >    igt@kms_color_chamelium@pipe-a-ctm-0-75:
> >    - shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-kbl1/igt@kms_color_chamelium@pipe-a-ctm-0-75.html>
> >       ([fdo#109271] / [fdo#111827]) +18 similar issues
> >    -
> >
> >    igt@kms_content_protection@dp-mst-type-0:
> >    -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb3/igt@kms_content_protection@dp-mst-type-0.html>
> >       ([i915#3116])
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb5/igt@kms_content_protection@dp-mst-type-0.html>
> >       ([i915#3116])
> >       -
> >
> >    igt@kms_content_protection@legacy:
> >    -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb7/igt@kms_content_protection@legacy.html>
> >       ([fdo#109300] / [fdo#111066]) +1 similar issue
> >       -
> >
> >       shard-kbl: NOTRUN -> TIMEOUT
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-kbl3/igt@kms_content_protection@legacy.html>
> >       ([i915#1319]) +1 similar issue
> >       -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb2/igt@kms_content_protection@legacy.html>
> >       ([fdo#111828]) +1 similar issue
> >       -
> >
> >    igt@kms_content_protection@lic:
> >    - shard-apl: NOTRUN -> TIMEOUT
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl3/igt@kms_content_protection@lic.html>
> >       ([i915#1319])
> >    -
> >
> >    igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb6/igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen.html>
> >       ([fdo#109278]) +16 similar issues
> >    -
> >
> >    igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen.html>
> >       ([fdo#109279] / [i915#3359]) +1 similar issue
> >    -
> >
> >    igt@kms_cursor_crc@pipe-b-cursor-512x170-random:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-512x170-random.html>
> >       ([fdo#109278] / [fdo#109279]) +1 similar issue
> >    -
> >
> >    igt@kms_cursor_crc@pipe-c-cursor-suspend:
> >    - shard-kbl: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10156/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html>
> >       -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html>
> >       ([i915#180]) +5 similar issues
> >    -
> >
> >    igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html>
> >       ([i915#3359]) +7 similar issues
> >    -
> >
> >    igt@kms_cursor_crc@pipe-d-cursor-suspend:
> >    - shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-kbl1/igt@kms_cursor_crc@pipe-d-cursor-suspend.html>
> >       ([fdo#109271]) +212 similar issues
> >    -
> >
> >    igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
> >    - shard-snb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-snb2/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html>
> >       ([fdo#109271]) +314 similar issues
> >    -
> >
> >    igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html>
> >       ([fdo#109274] / [fdo#109278]) +1 similar issue
> >    -
> >
> >    igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
> >    -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb3/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html>
> >       ([i915#3528])
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb1/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html>
> >       ([i915#3528])
> >       -
> >
> >    igt@kms_flip@2x-flip-vs-rmfb-interruptible:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb1/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html>
> >       ([fdo#109274]) +2 similar issues
> >    -
> >
> >    igt@kms_flip@flip-vs-suspend@b-dp1:
> >    - shard-apl: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10156/shard-apl1/igt@kms_flip@flip-vs-suspend@b-dp1.html>
> >       -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl6/igt@kms_flip@flip-vs-suspend@b-dp1.html>
> >       ([i915#180])
> >    -
> >
> >    igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html>
> >       ([i915#2587])
> >    -
> >
> >    igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
> >    -
> >
> >       shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-kbl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html>
> >       ([fdo#109271] / [i915#2672]) +1 similar issue
> >       -
> >
> >       shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html>
> >       ([fdo#109271] / [i915#2672])
> >       -
> >
> >    igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
> >    - shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html>
> >       ([fdo#109271] / [i915#2642])
> >    -
> >
> >    igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
> >    - shard-glk: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html>
> >       ([fdo#109271] / [i915#2642])
> >    -
> >
> >    igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
> >    - shard-glk: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10156/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html>
> >       -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html>
> >       ([i915#49])
> >    -
> >
> >    igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html>
> >       ([fdo#109280]) +34 similar issues
> >    -
> >
> >    igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html>
> >       ([fdo#111825]) +53 similar issues
> >    -
> >
> >    igt@kms_hdr@bpc-switch-suspend:
> >    - shard-kbl: NOTRUN -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-kbl3/igt@kms_hdr@bpc-switch-suspend.html>
> >       ([i915#180]) +3 similar issues
> >    -
> >
> >    igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
> >       ([i915#1839]) +1 similar issue
> >    -
> >
> >    igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
> >    -
> >
> >       shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html>
> >       ([fdo#109271] / [i915#533])
> >       -
> >
> >       shard-glk: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html>
> >       ([fdo#109271] / [i915#533])
> >       -
> >
> >    igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
> >    - shard-apl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html>
> >       ([fdo#108145] / [i915#265]) +4 similar issues
> >    -
> >
> >    igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
> >    - shard-glk: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk5/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html>
> >       ([fdo#108145] / [i915#265]) +1 similar issue
> >    -
> >
> >    igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:
> >    - shard-kbl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html>
> >       ([fdo#108145] / [i915#265]) +2 similar issues
> >    -
> >
> >    igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
> >    -
> >
> >       shard-glk: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk4/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html>
> >       ([i915#265])
> >       -
> >
> >       shard-kbl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html>
> >       ([i915#265])
> >       -
> >
> >    igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
> >    - shard-apl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html>
> >       ([i915#265])
> >    -
> >
> >    igt@kms_plane_lowres@pipe-b-tiling-y:
> >    -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb7/igt@kms_plane_lowres@pipe-b-tiling-y.html>
> >       ([i915#3536])
> >       -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb1/igt@kms_plane_lowres@pipe-b-tiling-y.html>
> >       ([i915#3536])
> >       -
> >
> >    igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
> >    - shard-kbl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-kbl1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html>
> >       ([fdo#109271] / [i915#658]) +4 similar issues
> >    -
> >
> >    igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html>
> >       ([i915#2920]) +3 similar issues
> >    -
> >
> >    igt@kms_psr2_sf@plane-move-sf-dmg-area-2:
> >    -
> >
> >       shard-glk: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk1/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html>
> >       ([fdo#109271] / [i915#658]) +4 similar issues
> >       -
> >
> >       shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl2/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html>
> >       ([fdo#109271] / [i915#658]) +3 similar issues
> >       -
> >
> >    igt@kms_psr2_sf@plane-move-sf-dmg-area-3:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb1/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html>
> >       ([i915#658]) +1 similar issue
> >    -
> >
> >    igt@kms_psr2_su@page_flip:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb1/igt@kms_psr2_su@page_flip.html>
> >       ([i915#1911])
> >    -
> >
> >    igt@kms_psr@psr2_cursor_render:
> >    - shard-iclb: PASS
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10156/shard-iclb2/igt@kms_psr@psr2_cursor_render.html>
> >       -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb8/igt@kms_psr@psr2_cursor_render.html>
> >       ([fdo#109441]) +1 similar issue
> >    -
> >
> >    igt@kms_psr@psr2_primary_mmap_cpu:
> >    -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html>
> >       ([fdo#109441])
> >       -
> >
> >       shard-tglb: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb3/igt@kms_psr@psr2_primary_mmap_cpu.html>
> >       ([i915#132] / [i915#3467]) +2 similar issues
> >       -
> >
> >    igt@kms_sysfs_edid_timing:
> >    - shard-apl: NOTRUN -> FAIL
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl6/igt@kms_sysfs_edid_timing.html>
> >       ([IGT#2])
> >    -
> >
> >    igt@kms_vblank@pipe-a-ts-continuation-suspend:
> >    - shard-glk: NOTRUN -> DMESG-WARN
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html>
> >       ([i915#118] / [i915#295] / [i915#95])
> >    -
> >
> >    igt@kms_vblank@pipe-d-wait-forked-hang:
> >    - shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl3/igt@kms_vblank@pipe-d-wait-forked-hang.html>
> >       ([fdo#109271]) +256 similar issues
> >    -
> >
> >    igt@kms_vrr@flip-suspend:
> >    -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb5/igt@kms_vrr@flip-suspend.html>
> >       ([fdo#109502])
> >       -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb3/igt@kms_vrr@flip-suspend.html>
> >       ([fdo#109502])
> >       -
> >
> >    igt@kms_writeback@writeback-pixel-formats:
> >    - shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl7/igt@kms_writeback@writeback-pixel-formats.html>
> >       ([fdo#109271] / [i915#2437])
> >    -
> >
> >    igt@nouveau_crc@pipe-a-source-outp-complete:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb8/igt@nouveau_crc@pipe-a-source-outp-complete.html>
> >       ([i915#2530]) +3 similar issues
> >    -
> >
> >    igt@nouveau_crc@pipe-b-source-outp-inactive:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb6/igt@nouveau_crc@pipe-b-source-outp-inactive.html>
> >       ([i915#2530])
> >    -
> >
> >    igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb5/igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame.html>
> >       ([fdo#109278] / [i915#2530])
> >    -
> >
> >    igt@prime_nv_api@nv_self_import_to_different_fd:
> >    - shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb7/igt@prime_nv_api@nv_self_import_to_different_fd.html>
> >       ([fdo#109291]) +3 similar issues
> >    -
> >
> >    igt@prime_nv_test@i915_nv_sharing:
> >    - shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb2/igt@prime_nv_test@i915_nv_sharing.html>
> >       ([fdo#109291]) +3 similar issues
> >    -
> >
> >    igt@sysfs_clients@recycle:
> >    -
> >
> >       shard-iclb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb1/igt@sysfs_clients@recycle.html>
> >       ([i915#2994])
> >       -
> >
> >       shard-glk: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk2/igt@sysfs_clients@recycle.html>
> >       ([fdo#109271] / [i915#2994])
> >       -
> >
> >       shard-tglb: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb3/igt@sysfs_clients@recycle.html>
> >       ([i915#2994])
> >       -
> >
> >    igt@sysfs_clients@sema-10:
> >    - shard-apl: NOTRUN -> SKIP
> >       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl7/igt@sysfs_clients@sema-10.html>
> >       ([fdo#109271] / [i915#2994]) +1 similar issue
> >    -
> >
> >    igt@s
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
