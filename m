Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39636ECD7
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jun 2021 14:47:46 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id p17so3052598lfc.6
 for <igt-dev@lists.freedesktop.org>; Wed, 02 Jun 2021 07:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210601172936.3785449-1-markyacoub@chromium.org>
 <162259978317.11228.17778262680179536922@emeril.freedesktop.org>
In-Reply-To: <162259978317.11228.17778262680179536922@emeril.freedesktop.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Wed, 2 Jun 2021 10:47:33 -0400
Message-ID: <CAJUqKUpvAEFUUVn1LpZYHvtV298SxZoCfUkS_EsUYK7sHEpY9Q@mail.gmail.com>
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
	=?utf-8?q?kms=5Fvblank=3A_Turn_on_hardware_before_testing_invalid_?=
	=?utf-8?q?vblank=2E_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2093152501=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2093152501==
Content-Type: multipart/alternative; boundary="00000000000096b52a05c3c98aff"

--00000000000096b52a05c3c98aff
Content-Type: text/plain; charset="UTF-8"

looks like a false positive to me.

On Tue, Jun 1, 2021 at 10:09 PM Patchwork <patchwork@emeril.freedesktop.org>
wrote:

> *Patch Details*
> *Series:* tests/kms_vblank: Turn on hardware before testing invalid
> vblank. (rev2)
> *URL:* https://patchwork.freedesktop.org/series/90382/
> *State:* failure
> *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/index.html CI
> Bug Log - changes from CI_DRM_10156_full -> IGTPW_5874_full Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_5874_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_5874_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/index.html
> Possible new issues
>
> Here are the unknown changes that may have been introduced in
> IGTPW_5874_full:
> IGT changes Possible regressions
>
>    - igt@kms_big_fb@y-tiled-16bpp-rotate-180:
>       - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10156/shard-glk1/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk4/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html>
>
> Known issues
>
> Here are the changes found in IGTPW_5874_full that come from known issues:
> IGT changes Issues hit
>
>    -
>
>    igt@feature_discovery@display-3x:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb8/igt@feature_discovery@display-3x.html>
>       ([i915#1839]) +1 similar issue
>    -
>
>    igt@gem_create@create-clear:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10156/shard-glk5/igt@gem_create@create-clear.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk9/igt@gem_create@create-clear.html>
>       ([i915#3160])
>    -
>
>    igt@gem_ctx_persistence@legacy-engines-mixed:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-snb6/igt@gem_ctx_persistence@legacy-engines-mixed.html>
>       ([fdo#109271] / [i915#1099]) +5 similar issues
>    -
>
>    igt@gem_ctx_sseu@invalid-sseu:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb8/igt@gem_ctx_sseu@invalid-sseu.html>
>       ([i915#280])
>    -
>
>    igt@gem_exec_fair@basic-flow@rcs0:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10156/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb8/igt@gem_exec_fair@basic-flow@rcs0.html>
>       ([i915#2842])
>    -
>
>    igt@gem_exec_fair@basic-none-vip@rcs0:
>    - shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb2/igt@gem_exec_fair@basic-none-vip@rcs0.html>
>       ([i915#2842]) +1 similar issue
>    -
>
>    igt@gem_exec_fair@basic-pace-solo@rcs0:
>    -
>
>       shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb5/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>       ([i915#2842]) +2 similar issues
>       -
>
>       shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk4/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>       ([i915#2842]) +1 similar issue
>       -
>
>    igt@gem_exec_fair@basic-pace@vecs0:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10156/shard-glk2/igt@gem_exec_fair@basic-pace@vecs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk1/igt@gem_exec_fair@basic-pace@vecs0.html>
>       ([i915#2842]) +1 similar issue
>    -
>
>    igt@gem_exec_flush@basic-batch-kernel-default-cmd:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb7/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html>
>       ([fdo#109313])
>    -
>
>    igt@gem_exec_params@rsvd2-dirt:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb3/igt@gem_exec_params@rsvd2-dirt.html>
>       ([fdo#109283])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb5/igt@gem_exec_params@rsvd2-dirt.html>
>       ([fdo#109283])
>       -
>
>    igt@gem_exec_reloc@basic-wide-active@bcs0:
>    -
>
>       shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl6/igt@gem_exec_reloc@basic-wide-active@bcs0.html>
>       ([i915#2389]) +3 similar issues
>       -
>
>       shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk4/igt@gem_exec_reloc@basic-wide-active@bcs0.html>
>       ([i915#2389]) +3 similar issues
>       -
>
>       shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb6/igt@gem_exec_reloc@basic-wide-active@bcs0.html>
>       ([i915#2389]) +4 similar issues
>       -
>
>    igt@gem_exec_reloc@basic-wide-active@rcs0:
>    -
>
>       shard-snb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-snb7/igt@gem_exec_reloc@basic-wide-active@rcs0.html>
>       ([i915#2389]) +2 similar issues
>       -
>
>       shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb7/igt@gem_exec_reloc@basic-wide-active@rcs0.html>
>       ([i915#2389]) +3 similar issues
>       -
>
>       shard-kbl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-kbl1/igt@gem_exec_reloc@basic-wide-active@rcs0.html>
>       ([i915#2389]) +4 similar issues
>       -
>
>    igt@gem_huc_copy@huc-copy:
>    -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl3/igt@gem_huc_copy@huc-copy.html>
>       ([fdo#109271] / [i915#2190])
>       -
>
>       shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-kbl7/igt@gem_huc_copy@huc-copy.html>
>       ([fdo#109271] / [i915#2190])
>       -
>
>    igt@gem_mmap_gtt@big-copy:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10156/shard-glk8/igt@gem_mmap_gtt@big-copy.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk1/igt@gem_mmap_gtt@big-copy.html>
>       ([i915#307]) +2 similar issues
>    -
>
>    igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
>    - shard-snb: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-snb5/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html>
>       ([i915#2055])
>    -
>
>    igt@gem_mmap_gtt@fault-concurrent-x:
>    - shard-snb: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-snb2/igt@gem_mmap_gtt@fault-concurrent-x.html>
>       ([i915#3468] / [i915#3485])
>    -
>
>    igt@gem_mmap_gtt@fault-concurrent-y:
>    - shard-kbl: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-kbl3/igt@gem_mmap_gtt@fault-concurrent-y.html>
>       ([i915#3468])
>    -
>
>    igt@gem_render_copy@y-tiled-to-vebox-linear:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb1/igt@gem_render_copy@y-tiled-to-vebox-linear.html>
>       ([i915#768]) +2 similar issues
>    -
>
>    igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk2/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html>
>       ([fdo#109271]) +153 similar issues
>    -
>
>    igt@gem_userptr_blits@coherency-sync:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb8/igt@gem_userptr_blits@coherency-sync.html>
>       ([fdo#110542])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb5/igt@gem_userptr_blits@coherency-sync.html>
>       ([fdo#109290])
>       -
>
>    igt@gem_userptr_blits@unsync-overlap:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb6/igt@gem_userptr_blits@unsync-overlap.html>
>       ([i915#3297])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb6/igt@gem_userptr_blits@unsync-overlap.html>
>       ([i915#3297])
>       -
>
>    igt@gen7_exec_parse@bitmasks:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb7/igt@gen7_exec_parse@bitmasks.html>
>       ([fdo#109289]) +3 similar issues
>    -
>
>    igt@gen7_exec_parse@cmd-crossing-page:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb5/igt@gen7_exec_parse@cmd-crossing-page.html>
>       ([fdo#109289]) +1 similar issue
>    -
>
>    igt@gen9_exec_parse@batch-without-end:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb5/igt@gen9_exec_parse@batch-without-end.html>
>       ([fdo#112306]) +1 similar issue
>    -
>
>    igt@gen9_exec_parse@cmd-crossing-page:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb3/igt@gen9_exec_parse@cmd-crossing-page.html>
>       ([fdo#112306]) +2 similar issues
>    -
>
>    igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
>    -
>
>       shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-kbl1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html>
>       ([fdo#109271] / [i915#1937])
>       -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html>
>       ([fdo#109271] / [i915#1937])
>       -
>
>    igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html>
>       ([fdo#111644] / [i915#1397] / [i915#2411]) +1 similar issue
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html>
>       ([fdo#110892]) +1 similar issue
>       -
>
>    igt@i915_selftest@live@execlists:
>    - shard-kbl: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-kbl2/igt@i915_selftest@live@execlists.html>
>       ([i915#2782] / [i915#3462] / [i915#794])
>    -
>
>    igt@i915_selftest@live@hangcheck:
>    - shard-snb: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-snb7/igt@i915_selftest@live@hangcheck.html>
>       ([i915#2782])
>    -
>
>    igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
>       ([i915#1769])
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
>       ([i915#1769])
>       -
>
>    igt@kms_big_fb@linear-8bpp-rotate-270:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb8/igt@kms_big_fb@linear-8bpp-rotate-270.html>
>       ([fdo#111614]) +2 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb5/igt@kms_big_fb@linear-8bpp-rotate-270.html>
>       ([fdo#110725] / [fdo#111614]) +1 similar issue
>       -
>
>    igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb5/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html>
>       ([fdo#111615]) +4 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb8/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html>
>       ([fdo#110723])
>       -
>
>    igt@kms_big_joiner@invalid-modeset:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb1/igt@kms_big_joiner@invalid-modeset.html>
>       ([i915#2705])
>       -
>
>       shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-kbl1/igt@kms_big_joiner@invalid-modeset.html>
>       ([fdo#109271] / [i915#2705])
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk5/igt@kms_big_joiner@invalid-modeset.html>
>       ([fdo#109271] / [i915#2705])
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb7/igt@kms_big_joiner@invalid-modeset.html>
>       ([i915#2705])
>       -
>
>    igt@kms_chamelium@dp-crc-multiple:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb8/igt@kms_chamelium@dp-crc-multiple.html>
>       ([fdo#109284] / [fdo#111827]) +8 similar issues
>    -
>
>    igt@kms_chamelium@hdmi-crc-fast:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb1/igt@kms_chamelium@hdmi-crc-fast.html>
>       ([fdo#109284] / [fdo#111827]) +5 similar issues
>    -
>
>    igt@kms_chamelium@hdmi-hpd:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk2/igt@kms_chamelium@hdmi-hpd.html>
>       ([fdo#109271] / [fdo#111827]) +10 similar issues
>    -
>
>    igt@kms_chamelium@vga-edid-read:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl3/igt@kms_chamelium@vga-edid-read.html>
>       ([fdo#109271] / [fdo#111827]) +27 similar issues
>    -
>
>    igt@kms_color@pipe-a-degamma:
>    -
>
>       shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb5/igt@kms_color@pipe-a-degamma.html>
>       ([i915#1149])
>       -
>
>       shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb6/igt@kms_color@pipe-a-degamma.html>
>       ([i915#1149])
>       -
>
>    igt@kms_color@pipe-d-ctm-0-5:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb8/igt@kms_color@pipe-d-ctm-0-5.html>
>       ([fdo#109278] / [i915#1149])
>    -
>
>    igt@kms_color_chamelium@pipe-a-ctm-0-25:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-snb7/igt@kms_color_chamelium@pipe-a-ctm-0-25.html>
>       ([fdo#109271] / [fdo#111827]) +17 similar issues
>    -
>
>    igt@kms_color_chamelium@pipe-a-ctm-0-75:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-kbl1/igt@kms_color_chamelium@pipe-a-ctm-0-75.html>
>       ([fdo#109271] / [fdo#111827]) +18 similar issues
>    -
>
>    igt@kms_content_protection@dp-mst-type-0:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb3/igt@kms_content_protection@dp-mst-type-0.html>
>       ([i915#3116])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb5/igt@kms_content_protection@dp-mst-type-0.html>
>       ([i915#3116])
>       -
>
>    igt@kms_content_protection@legacy:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb7/igt@kms_content_protection@legacy.html>
>       ([fdo#109300] / [fdo#111066]) +1 similar issue
>       -
>
>       shard-kbl: NOTRUN -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-kbl3/igt@kms_content_protection@legacy.html>
>       ([i915#1319]) +1 similar issue
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb2/igt@kms_content_protection@legacy.html>
>       ([fdo#111828]) +1 similar issue
>       -
>
>    igt@kms_content_protection@lic:
>    - shard-apl: NOTRUN -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl3/igt@kms_content_protection@lic.html>
>       ([i915#1319])
>    -
>
>    igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb6/igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen.html>
>       ([fdo#109278]) +16 similar issues
>    -
>
>    igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen.html>
>       ([fdo#109279] / [i915#3359]) +1 similar issue
>    -
>
>    igt@kms_cursor_crc@pipe-b-cursor-512x170-random:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-512x170-random.html>
>       ([fdo#109278] / [fdo#109279]) +1 similar issue
>    -
>
>    igt@kms_cursor_crc@pipe-c-cursor-suspend:
>    - shard-kbl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10156/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html>
>       ([i915#180]) +5 similar issues
>    -
>
>    igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html>
>       ([i915#3359]) +7 similar issues
>    -
>
>    igt@kms_cursor_crc@pipe-d-cursor-suspend:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-kbl1/igt@kms_cursor_crc@pipe-d-cursor-suspend.html>
>       ([fdo#109271]) +212 similar issues
>    -
>
>    igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-snb2/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html>
>       ([fdo#109271]) +314 similar issues
>    -
>
>    igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html>
>       ([fdo#109274] / [fdo#109278]) +1 similar issue
>    -
>
>    igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb3/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html>
>       ([i915#3528])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb1/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html>
>       ([i915#3528])
>       -
>
>    igt@kms_flip@2x-flip-vs-rmfb-interruptible:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb1/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html>
>       ([fdo#109274]) +2 similar issues
>    -
>
>    igt@kms_flip@flip-vs-suspend@b-dp1:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10156/shard-apl1/igt@kms_flip@flip-vs-suspend@b-dp1.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl6/igt@kms_flip@flip-vs-suspend@b-dp1.html>
>       ([i915#180])
>    -
>
>    igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html>
>       ([i915#2587])
>    -
>
>    igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
>    -
>
>       shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-kbl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html>
>       ([fdo#109271] / [i915#2672]) +1 similar issue
>       -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html>
>       ([fdo#109271] / [i915#2672])
>       -
>
>    igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html>
>       ([fdo#109271] / [i915#2642])
>    -
>
>    igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html>
>       ([fdo#109271] / [i915#2642])
>    -
>
>    igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10156/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html>
>       ([i915#49])
>    -
>
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html>
>       ([fdo#109280]) +34 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html>
>       ([fdo#111825]) +53 similar issues
>    -
>
>    igt@kms_hdr@bpc-switch-suspend:
>    - shard-kbl: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-kbl3/igt@kms_hdr@bpc-switch-suspend.html>
>       ([i915#180]) +3 similar issues
>    -
>
>    igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>       ([i915#1839]) +1 similar issue
>    -
>
>    igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
>    -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html>
>       ([fdo#109271] / [i915#533])
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html>
>       ([fdo#109271] / [i915#533])
>       -
>
>    igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html>
>       ([fdo#108145] / [i915#265]) +4 similar issues
>    -
>
>    igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
>    - shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk5/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html>
>       ([fdo#108145] / [i915#265]) +1 similar issue
>    -
>
>    igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:
>    - shard-kbl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html>
>       ([fdo#108145] / [i915#265]) +2 similar issues
>    -
>
>    igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
>    -
>
>       shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk4/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html>
>       ([i915#265])
>       -
>
>       shard-kbl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html>
>       ([i915#265])
>       -
>
>    igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html>
>       ([i915#265])
>    -
>
>    igt@kms_plane_lowres@pipe-b-tiling-y:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb7/igt@kms_plane_lowres@pipe-b-tiling-y.html>
>       ([i915#3536])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb1/igt@kms_plane_lowres@pipe-b-tiling-y.html>
>       ([i915#3536])
>       -
>
>    igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-kbl1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html>
>       ([fdo#109271] / [i915#658]) +4 similar issues
>    -
>
>    igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html>
>       ([i915#2920]) +3 similar issues
>    -
>
>    igt@kms_psr2_sf@plane-move-sf-dmg-area-2:
>    -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk1/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html>
>       ([fdo#109271] / [i915#658]) +4 similar issues
>       -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl2/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html>
>       ([fdo#109271] / [i915#658]) +3 similar issues
>       -
>
>    igt@kms_psr2_sf@plane-move-sf-dmg-area-3:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb1/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html>
>       ([i915#658]) +1 similar issue
>    -
>
>    igt@kms_psr2_su@page_flip:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb1/igt@kms_psr2_su@page_flip.html>
>       ([i915#1911])
>    -
>
>    igt@kms_psr@psr2_cursor_render:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10156/shard-iclb2/igt@kms_psr@psr2_cursor_render.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb8/igt@kms_psr@psr2_cursor_render.html>
>       ([fdo#109441]) +1 similar issue
>    -
>
>    igt@kms_psr@psr2_primary_mmap_cpu:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html>
>       ([fdo#109441])
>       -
>
>       shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb3/igt@kms_psr@psr2_primary_mmap_cpu.html>
>       ([i915#132] / [i915#3467]) +2 similar issues
>       -
>
>    igt@kms_sysfs_edid_timing:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl6/igt@kms_sysfs_edid_timing.html>
>       ([IGT#2])
>    -
>
>    igt@kms_vblank@pipe-a-ts-continuation-suspend:
>    - shard-glk: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html>
>       ([i915#118] / [i915#295] / [i915#95])
>    -
>
>    igt@kms_vblank@pipe-d-wait-forked-hang:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl3/igt@kms_vblank@pipe-d-wait-forked-hang.html>
>       ([fdo#109271]) +256 similar issues
>    -
>
>    igt@kms_vrr@flip-suspend:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb5/igt@kms_vrr@flip-suspend.html>
>       ([fdo#109502])
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb3/igt@kms_vrr@flip-suspend.html>
>       ([fdo#109502])
>       -
>
>    igt@kms_writeback@writeback-pixel-formats:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl7/igt@kms_writeback@writeback-pixel-formats.html>
>       ([fdo#109271] / [i915#2437])
>    -
>
>    igt@nouveau_crc@pipe-a-source-outp-complete:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb8/igt@nouveau_crc@pipe-a-source-outp-complete.html>
>       ([i915#2530]) +3 similar issues
>    -
>
>    igt@nouveau_crc@pipe-b-source-outp-inactive:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb6/igt@nouveau_crc@pipe-b-source-outp-inactive.html>
>       ([i915#2530])
>    -
>
>    igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb5/igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame.html>
>       ([fdo#109278] / [i915#2530])
>    -
>
>    igt@prime_nv_api@nv_self_import_to_different_fd:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb7/igt@prime_nv_api@nv_self_import_to_different_fd.html>
>       ([fdo#109291]) +3 similar issues
>    -
>
>    igt@prime_nv_test@i915_nv_sharing:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb2/igt@prime_nv_test@i915_nv_sharing.html>
>       ([fdo#109291]) +3 similar issues
>    -
>
>    igt@sysfs_clients@recycle:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-iclb1/igt@sysfs_clients@recycle.html>
>       ([i915#2994])
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk2/igt@sysfs_clients@recycle.html>
>       ([fdo#109271] / [i915#2994])
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-tglb3/igt@sysfs_clients@recycle.html>
>       ([i915#2994])
>       -
>
>    igt@sysfs_clients@sema-10:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-apl7/igt@sysfs_clients@sema-10.html>
>       ([fdo#109271] / [i915#2994]) +1 similar issue
>    -
>
>    igt@s
>
>

--00000000000096b52a05c3c98aff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">looks like a false positive to me.</div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 1, 2021 at 1=
0:09 PM Patchwork &lt;<a href=3D"mailto:patchwork@emeril.freedesktop.org">p=
atchwork@emeril.freedesktop.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<u></u>

=20
 =20
 =20
 =20

<div>


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>tests/kms_vblank: Turn on hardware be=
fore testing invalid vblank. (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/90382/" target=3D"_blank">https://patchwork.freedesktop.org/series/903=
82/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/index.html" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5874/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from CI_DRM_10156_full -&gt; IGTPW_5874_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5874_full absolutely need to b=
e<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in IGTPW_5874_full, please notify your bug team to allow them<=
br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5874/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5874/index.html</a></p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5874=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_big_fb@y-tiled-16bpp-rotate-180:<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10156/shard-glk1/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html" targ=
et=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5874/shard-glk4/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html" t=
arget=3D"_blank">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5874_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-3x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-iclb8/igt@feature_discovery@display-3x.html"=
 target=3D"_blank">SKIP</a> ([i915#1839]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-clear:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10156/shard-glk5/igt@gem_create@create-clear.html" target=3D"_blank=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5874/shard-glk9/igt@gem_create@create-clear.html" target=3D"_blank">FAIL</a=
> ([i915#3160])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-snb6/igt@gem_ctx_persistence@legacy-engines-=
mixed.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#1099]) +5 simi=
lar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-tglb8/igt@gem_ctx_sseu@invalid-sseu.html" ta=
rget=3D"_blank">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10156/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html" target=3D=
"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5874/shard-tglb8/igt@gem_exec_fair@basic-flow@rcs0.html" target=3D"_=
blank">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-tglb2/igt@gem_exec_fair@basic-none-vip@rcs0.=
html" target=3D"_blank">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-iclb5/igt@gem_exec_fair@basic-pace-solo@rcs0.=
html" target=3D"_blank">FAIL</a> ([i915#2842]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-glk4/igt@gem_exec_fair@basic-pace-solo@rcs0.h=
tml" target=3D"_blank">FAIL</a> ([i915#2842]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10156/shard-glk2/igt@gem_exec_fair@basic-pace@vecs0.html" target=3D=
"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5874/shard-glk1/igt@gem_exec_fair@basic-pace@vecs0.html" target=3D"_=
blank">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-tglb7/igt@gem_exec_flush@basic-batch-kernel-=
default-cmd.html" target=3D"_blank">SKIP</a> ([fdo#109313])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-tglb3/igt@gem_exec_params@rsvd2-dirt.html" ta=
rget=3D"_blank">SKIP</a> ([fdo#109283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-iclb5/igt@gem_exec_params@rsvd2-dirt.html" ta=
rget=3D"_blank">SKIP</a> ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-apl6/igt@gem_exec_reloc@basic-wide-active@bcs=
0.html" target=3D"_blank">FAIL</a> ([i915#2389]) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-glk4/igt@gem_exec_reloc@basic-wide-active@bcs=
0.html" target=3D"_blank">FAIL</a> ([i915#2389]) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-tglb6/igt@gem_exec_reloc@basic-wide-active@bc=
s0.html" target=3D"_blank">FAIL</a> ([i915#2389]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@rcs0:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-snb7/igt@gem_exec_reloc@basic-wide-active@rcs=
0.html" target=3D"_blank">FAIL</a> ([i915#2389]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-iclb7/igt@gem_exec_reloc@basic-wide-active@rc=
s0.html" target=3D"_blank">FAIL</a> ([i915#2389]) +3 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-kbl1/igt@gem_exec_reloc@basic-wide-active@rcs=
0.html" target=3D"_blank">FAIL</a> ([i915#2389]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-apl3/igt@gem_huc_copy@huc-copy.html" target=
=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2190])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-kbl7/igt@gem_huc_copy@huc-copy.html" target=
=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2190])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-copy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10156/shard-glk8/igt@gem_mmap_gtt@big-copy.html" target=3D"_blank">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_58=
74/shard-glk1/igt@gem_mmap_gtt@big-copy.html" target=3D"_blank">FAIL</a> ([=
i915#307]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-snb5/igt@gem_mmap_gtt@cpuset-basic-small-cop=
y-odd.html" target=3D"_blank">INCOMPLETE</a> ([i915#2055])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-x:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-snb2/igt@gem_mmap_gtt@fault-concurrent-x.htm=
l" target=3D"_blank">INCOMPLETE</a> ([i915#3468] / [i915#3485])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-y:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-kbl3/igt@gem_mmap_gtt@fault-concurrent-y.htm=
l" target=3D"_blank">INCOMPLETE</a> ([i915#3468])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-iclb1/igt@gem_render_copy@y-tiled-to-vebox-l=
inear.html" target=3D"_blank">SKIP</a> ([i915#768]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-glk2/igt@gem_render_copy@yf-tiled-mc-ccs-to-=
vebox-y-tiled.html" target=3D"_blank">SKIP</a> ([fdo#109271]) +153 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-tglb8/igt@gem_userptr_blits@coherency-sync.ht=
ml" target=3D"_blank">SKIP</a> ([fdo#110542])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-iclb5/igt@gem_userptr_blits@coherency-sync.ht=
ml" target=3D"_blank">SKIP</a> ([fdo#109290])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-tglb6/igt@gem_userptr_blits@unsync-overlap.ht=
ml" target=3D"_blank">SKIP</a> ([i915#3297])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-iclb6/igt@gem_userptr_blits@unsync-overlap.ht=
ml" target=3D"_blank">SKIP</a> ([i915#3297])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-iclb7/igt@gen7_exec_parse@bitmasks.html" tar=
get=3D"_blank">SKIP</a> ([fdo#109289]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-tglb5/igt@gen7_exec_parse@cmd-crossing-page.=
html" target=3D"_blank">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-iclb5/igt@gen9_exec_parse@batch-without-end.=
html" target=3D"_blank">SKIP</a> ([fdo#112306]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-tglb3/igt@gen9_exec_parse@cmd-crossing-page.=
html" target=3D"_blank">SKIP</a> ([fdo#112306]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-kbl1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.ht=
ml" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#1937])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-apl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.ht=
ml" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#1937])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-tglb2/igt@i915_pm_rpm@dpms-mode-unset-non-lps=
p.html" target=3D"_blank">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411=
]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-iclb2/igt@i915_pm_rpm@dpms-mode-unset-non-lps=
p.html" target=3D"_blank">SKIP</a> ([fdo#110892]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-kbl2/igt@i915_selftest@live@execlists.html" =
target=3D"_blank">INCOMPLETE</a> ([i915#2782] / [i915#3462] / [i915#794])</=
li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-snb7/igt@i915_selftest@live@hangcheck.html" =
target=3D"_blank">INCOMPLETE</a> ([i915#2782])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-iclb2/igt@kms_atomic_transition@plane-all-mod=
eset-transition-fencing.html" target=3D"_blank">SKIP</a> ([i915#1769])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-tglb8/igt@kms_atomic_transition@plane-all-mod=
eset-transition-fencing.html" target=3D"_blank">SKIP</a> ([i915#1769])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-tglb8/igt@kms_big_fb@linear-8bpp-rotate-270.h=
tml" target=3D"_blank">SKIP</a> ([fdo#111614]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-iclb5/igt@kms_big_fb@linear-8bpp-rotate-270.h=
tml" target=3D"_blank">SKIP</a> ([fdo#110725] / [fdo#111614]) +1 similar is=
sue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-tglb5/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.=
html" target=3D"_blank">SKIP</a> ([fdo#111615]) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-iclb8/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.=
html" target=3D"_blank">SKIP</a> ([fdo#110723])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-iclb1/igt@kms_big_joiner@invalid-modeset.html=
" target=3D"_blank">SKIP</a> ([i915#2705])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-kbl1/igt@kms_big_joiner@invalid-modeset.html"=
 target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-glk5/igt@kms_big_joiner@invalid-modeset.html"=
 target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-tglb7/igt@kms_big_joiner@invalid-modeset.html=
" target=3D"_blank">SKIP</a> ([i915#2705])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-multiple:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-tglb8/igt@kms_chamelium@dp-crc-multiple.html=
" target=3D"_blank">SKIP</a> ([fdo#109284] / [fdo#111827]) +8 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-iclb1/igt@kms_chamelium@hdmi-crc-fast.html" =
target=3D"_blank">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-glk2/igt@kms_chamelium@hdmi-hpd.html" target=
=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-apl3/igt@kms_chamelium@vga-edid-read.html" t=
arget=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +27 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-degamma:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-tglb5/igt@kms_color@pipe-a-degamma.html" targ=
et=3D"_blank">FAIL</a> ([i915#1149])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-iclb6/igt@kms_color@pipe-a-degamma.html" targ=
et=3D"_blank">FAIL</a> ([i915#1149])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-5:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-iclb8/igt@kms_color@pipe-d-ctm-0-5.html" tar=
get=3D"_blank">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-25:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-snb7/igt@kms_color_chamelium@pipe-a-ctm-0-25=
.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +17 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-75:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-kbl1/igt@kms_color_chamelium@pipe-a-ctm-0-75=
.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +18 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-tglb3/igt@kms_content_protection@dp-mst-type-=
0.html" target=3D"_blank">SKIP</a> ([i915#3116])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-iclb5/igt@kms_content_protection@dp-mst-type-=
0.html" target=3D"_blank">SKIP</a> ([i915#3116])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-iclb7/igt@kms_content_protection@legacy.html"=
 target=3D"_blank">SKIP</a> ([fdo#109300] / [fdo#111066]) +1 similar issue<=
/p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-kbl3/igt@kms_content_protection@legacy.html" =
target=3D"_blank">TIMEOUT</a> ([i915#1319]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-tglb2/igt@kms_content_protection@legacy.html"=
 target=3D"_blank">SKIP</a> ([fdo#111828]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-apl3/igt@kms_content_protection@lic.html" ta=
rget=3D"_blank">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-iclb6/igt@kms_cursor_crc@pipe-b-cursor-32x10=
-onscreen.html" target=3D"_blank">SKIP</a> ([fdo#109278]) +16 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-512x1=
70-onscreen.html" target=3D"_blank">SKIP</a> ([fdo#109279] / [i915#3359]) +=
1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-random:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-512x1=
70-random.html" target=3D"_blank">SKIP</a> ([fdo#109278] / [fdo#109279]) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10156/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html" tar=
get=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5874/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html"=
 target=3D"_blank">DMESG-WARN</a> ([i915#180]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-512x1=
70-rapid-movement.html" target=3D"_blank">SKIP</a> ([i915#3359]) +7 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-kbl1/igt@kms_cursor_crc@pipe-d-cursor-suspen=
d.html" target=3D"_blank">SKIP</a> ([fdo#109271]) +212 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-snb2/igt@kms_cursor_edge_walk@pipe-d-128x128=
-right-edge.html" target=3D"_blank">SKIP</a> ([fdo#109271]) +314 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-iclb1/igt@kms_cursor_legacy@2x-long-cursor-v=
s-flip-atomic.html" target=3D"_blank">SKIP</a> ([fdo#109274] / [fdo#109278]=
) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-tglb3/igt@kms_dp_tiled_display@basic-test-pat=
tern-with-chamelium.html" target=3D"_blank">SKIP</a> ([i915#3528])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-iclb1/igt@kms_dp_tiled_display@basic-test-pat=
tern-with-chamelium.html" target=3D"_blank">SKIP</a> ([i915#3528])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-iclb1/igt@kms_flip@2x-flip-vs-rmfb-interrupt=
ible.html" target=3D"_blank">SKIP</a> ([fdo#109274]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10156/shard-apl1/igt@kms_flip@flip-vs-suspend@b-dp1.html" target=3D=
"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5874/shard-apl6/igt@kms_flip@flip-vs-suspend@b-dp1.html" target=3D"_=
blank">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-tglb5/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytileccs.html" target=3D"_blank">SKIP</a> ([i915#2587])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-kbl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile=
-to-32bpp-ytilegen12rcccs.html" target=3D"_blank">SKIP</a> ([fdo#109271] / =
[i915#2672]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-apl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile=
-to-32bpp-ytilegen12rcccs.html" target=3D"_blank">SKIP</a> ([fdo#109271] / =
[i915#2672])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-apl7/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
e-to-64bpp-ytile.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#264=
2])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-glk4/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
eccs-to-64bpp-ytile.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#=
2642])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10156/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-s=
hrfb-draw-blt.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_5874/shard-glk5/igt@kms_frontbuffer_tra=
cking@fbc-2p-primscrn-pri-shrfb-draw-blt.html" target=3D"_blank">FAIL</a> (=
[i915#49])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-shrfb-pgflip-blt.html" target=3D"_blank">SKIP</a> ([fdo#109280]) =
+34 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-tglb7/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-indfb-pgflip-blt.html" target=3D"_blank">SKIP</a> ([fdo#111825]) +53=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-kbl3/igt@kms_hdr@bpc-switch-suspend.html" ta=
rget=3D"_blank">DMESG-WARN</a> ([i915#180]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-tglb7/igt@kms_multipipe_modeset@basic-max-pi=
pe-crc-check.html" target=3D"_blank">SKIP</a> ([i915#1839]) +1 similar issu=
e</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-=
pipe-d.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-glk1/igt@kms_pipe_crc_basic@suspend-read-crc-=
pipe-d.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-=
basic.html" target=3D"_blank">FAIL</a> ([fdo#108145] / [i915#265]) +4 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-glk5/igt@kms_plane_alpha_blend@pipe-a-consta=
nt-alpha-max.html" target=3D"_blank">FAIL</a> ([fdo#108145] / [i915#265]) +=
1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-=
7efc.html" target=3D"_blank">FAIL</a> ([fdo#108145] / [i915#265]) +2 simila=
r issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-glk4/igt@kms_plane_alpha_blend@pipe-b-alpha-t=
ransparent-fb.html" target=3D"_blank">FAIL</a> ([i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-t=
ransparent-fb.html" target=3D"_blank">FAIL</a> ([i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-=
transparent-fb.html" target=3D"_blank">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-y:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-tglb7/igt@kms_plane_lowres@pipe-b-tiling-y.ht=
ml" target=3D"_blank">SKIP</a> ([i915#3536])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-iclb1/igt@kms_plane_lowres@pipe-b-tiling-y.ht=
ml" target=3D"_blank">SKIP</a> ([i915#3536])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-kbl1/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-2.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#658]) +4=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-tglb2/igt@kms_psr2_sf@overlay-primary-update=
-sf-dmg-area-4.html" target=3D"_blank">SKIP</a> ([i915#2920]) +3 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-2:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-glk1/igt@kms_psr2_sf@plane-move-sf-dmg-area-2=
.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#658]) +4 similar is=
sues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-apl2/igt@kms_psr2_sf@plane-move-sf-dmg-area-2=
.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar is=
sues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-3:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-iclb1/igt@kms_psr2_sf@plane-move-sf-dmg-area=
-3.html" target=3D"_blank">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-tglb1/igt@kms_psr2_su@page_flip.html" target=
=3D"_blank">SKIP</a> ([i915#1911])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10156/shard-iclb2/igt@kms_psr@psr2_cursor_render.html" target=3D"_b=
lank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5874/shard-iclb8/igt@kms_psr@psr2_cursor_render.html" target=3D"_blank"=
>SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html"=
 target=3D"_blank">SKIP</a> ([fdo#109441])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-tglb3/igt@kms_psr@psr2_primary_mmap_cpu.html"=
 target=3D"_blank">FAIL</a> ([i915#132] / [i915#3467]) +2 similar issues</p=
>
</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-apl6/igt@kms_sysfs_edid_timing.html" target=
=3D"_blank">FAIL</a> ([IGT#2])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-glk1/igt@kms_vblank@pipe-a-ts-continuation-s=
uspend.html" target=3D"_blank">DMESG-WARN</a> ([i915#118] / [i915#295] / [i=
915#95])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-forked-hang:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-apl3/igt@kms_vblank@pipe-d-wait-forked-hang.=
html" target=3D"_blank">SKIP</a> ([fdo#109271]) +256 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-iclb5/igt@kms_vrr@flip-suspend.html" target=
=3D"_blank">SKIP</a> ([fdo#109502])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-tglb3/igt@kms_vrr@flip-suspend.html" target=
=3D"_blank">SKIP</a> ([fdo#109502])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-apl7/igt@kms_writeback@writeback-pixel-forma=
ts.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-outp-complete:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-tglb8/igt@nouveau_crc@pipe-a-source-outp-com=
plete.html" target=3D"_blank">SKIP</a> ([i915#2530]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-outp-inactive:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-iclb6/igt@nouveau_crc@pipe-b-source-outp-ina=
ctive.html" target=3D"_blank">SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-iclb5/igt@nouveau_crc@pipe-d-ctx-flip-skip-c=
urrent-frame.html" target=3D"_blank">SKIP</a> ([fdo#109278] / [i915#2530])<=
/li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_self_import_to_different_fd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-tglb7/igt@prime_nv_api@nv_self_import_to_dif=
ferent_fd.html" target=3D"_blank">SKIP</a> ([fdo#109291]) +3 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_nv_sharing:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-iclb2/igt@prime_nv_test@i915_nv_sharing.html=
" target=3D"_blank">SKIP</a> ([fdo#109291]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-iclb1/igt@sysfs_clients@recycle.html" target=
=3D"_blank">SKIP</a> ([i915#2994])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-glk2/igt@sysfs_clients@recycle.html" target=
=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2994])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5874/shard-tglb3/igt@sysfs_clients@recycle.html" target=
=3D"_blank">SKIP</a> ([i915#2994])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-10:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5874/shard-apl7/igt@sysfs_clients@sema-10.html" target=
=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2994]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@s</p>
</li>
</ul>

</div>

</blockquote></div>

--00000000000096b52a05c3c98aff--

--===============2093152501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============2093152501==--
