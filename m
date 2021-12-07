Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A26E6E8B4
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Dec 2021 18:21:16 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id j18so28940278ljc.12
 for <igt-dev@lists.freedesktop.org>; Tue, 07 Dec 2021 10:21:16 -0800 (PST)
MIME-Version: 1.0
References: <20211101163730.2769897-1-markyacoub@chromium.org>
 <163596238164.11279.8563549015286101469@emeril.freedesktop.org>
In-Reply-To: <163596238164.11279.8563549015286101469@emeril.freedesktop.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Tue, 7 Dec 2021 13:21:03 -0500
Message-ID: <CAJUqKUqCztorKdVuCgSNG83HodGvPjbmxSTiJQdepHpHn2QUmA@mail.gmail.com>
Content-Type: multipart/alternative; boundary="0000000000004dd8ea05d292702e"
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
	=?utf-8?q?kms=5Fcursor=5Flegacy=3A_igt=5Frequire=5Fpipe=5Fcrc_for_?=
	=?utf-8?q?flip=5Fvs=5Fcursor=5Fcrc_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--0000000000004dd8ea05d292702e
Content-Type: text/plain; charset="UTF-8"

Hi Lakshminarayana, this seems to be an irrelevant failure, can you run it
again? Thanks!

On Wed, Nov 3, 2021 at 1:59 PM Patchwork <patchwork@emeril.freedesktop.org>
wrote:

> *Patch Details*
> *Series:* tests/kms_cursor_legacy: igt_require_pipe_crc for
> flip_vs_cursor_crc (rev2)
> *URL:* https://patchwork.freedesktop.org/series/96463/
> *State:* failure
> *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/index.html CI
> Bug Log - changes from IGT_6269_full -> IGTPW_6372_full Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_6372_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_6372_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/index.html
> Participating hosts (7 -> 7)
>
> No changes in participating hosts
> Possible new issues
>
> Here are the unknown changes that may have been introduced in
> IGTPW_6372_full:
> IGT changes Possible regressions
>
>    - igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled:
>       - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6269/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled.html>
>
> Known issues
>
> Here are the changes found in IGTPW_6372_full that come from known issues:
> IGT changes Issues hit
>
>    -
>
>    igt@gem_ctx_param@set-priority-not-supported:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-iclb4/igt@gem_ctx_param@set-priority-not-supported.html>
>       ([fdo#109314])
>    -
>
>    igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-snb6/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html>
>       ([fdo#109271] / [i915#1099]) +3 similar issues
>    -
>
>    igt@gem_ctx_sseu@engines:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb1/igt@gem_ctx_sseu@engines.html>
>       ([i915#280])
>    -
>
>    igt@gem_eio@unwedge-stress:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6269/shard-tglb1/igt@gem_eio@unwedge-stress.html>
>       -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb7/igt@gem_eio@unwedge-stress.html>
>       ([i915#2369] / [i915#3063] / [i915#3648])
>    -
>
>    igt@gem_exec_capture@pi@bcs0:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-snb5/igt@gem_exec_capture@pi@bcs0.html>
>       ([fdo#109271]) +112 similar issues
>    -
>
>    igt@gem_exec_fair@basic-none-share@rcs0:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6269/shard-apl2/igt@gem_exec_fair@basic-none-share@rcs0.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-apl1/igt@gem_exec_fair@basic-none-share@rcs0.html>
>       ([fdo#109271])
>    -
>
>    igt@gem_exec_fair@basic-pace-share@rcs0:
>    -
>
>       shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6269/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>       ([i915#2842]) +1 similar issue
>       -
>
>       shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6269/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>       ([i915#2842])
>       -
>
>    igt@gem_exec_fair@basic-pace@vcs0:
>    - shard-kbl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6269/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs0.html>
>       ([i915#2842])
>    -
>
>    igt@gem_exec_params@secure-non-root:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb5/igt@gem_exec_params@secure-non-root.html>
>       ([fdo#112283])
>    -
>
>    igt@gem_exec_whisper@basic-forked:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6269/shard-glk9/igt@gem_exec_whisper@basic-forked.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-glk4/igt@gem_exec_whisper@basic-forked.html>
>       ([i915#118]) +2 similar issues
>    -
>
>    igt@gem_userptr_blits@huge-split:
>    - shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-glk1/igt@gem_userptr_blits@huge-split.html>
>       ([i915#3376])
>    -
>
>    igt@gem_userptr_blits@readonly-unsync:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb3/igt@gem_userptr_blits@readonly-unsync.html>
>       ([i915#3297])
>    -
>
>    igt@gen7_exec_parse@basic-allowed:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb6/igt@gen7_exec_parse@basic-allowed.html>
>       ([fdo#109289]) +4 similar issues
>    -
>
>    igt@gen9_exec_parse@batch-zero-length:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb2/igt@gen9_exec_parse@batch-zero-length.html>
>       ([i915#2856])
>    -
>
>    igt@i915_pm_dc@dc3co-vpb-simulation:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb2/igt@i915_pm_dc@dc3co-vpb-simulation.html>
>       ([i915#1904])
>    -
>
>    igt@i915_pm_dc@dc6-psr:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6269/shard-iclb7/igt@i915_pm_dc@dc6-psr.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-iclb6/igt@i915_pm_dc@dc6-psr.html>
>       ([i915#454])
>    -
>
>    igt@i915_pm_rc6_residency@rc6-fence:
>    - shard-tglb: NOTRUN -> WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb1/igt@i915_pm_rc6_residency@rc6-fence.html>
>       ([i915#2681])
>    -
>
>    igt@i915_pm_rc6_residency@rc6-idle:
>    -
>
>       shard-tglb: NOTRUN -> WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb8/igt@i915_pm_rc6_residency@rc6-idle.html>
>       ([i915#2681] / [i915#2684])
>       -
>
>       shard-iclb: NOTRUN -> WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html>
>       ([i915#2684])
>       -
>
>    igt@i915_pm_rpm@dpms-non-lpsp:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb7/igt@i915_pm_rpm@dpms-non-lpsp.html>
>       ([fdo#111644] / [i915#1397] / [i915#2411])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-iclb4/igt@i915_pm_rpm@dpms-non-lpsp.html>
>       ([fdo#110892])
>       -
>
>    igt@i915_pm_rpm@system-suspend-modeset:
>    - shard-tglb: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb7/igt@i915_pm_rpm@system-suspend-modeset.html>
>       ([i915#2411] / [i915#456])
>    -
>
>    igt@i915_suspend@debugfs-reader:
>    - shard-kbl: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-kbl3/igt@i915_suspend@debugfs-reader.html>
>       ([i915#3614] / [i915#4352])
>    -
>
>    igt@kms_big_fb@linear-64bpp-rotate-90:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-iclb2/igt@kms_big_fb@linear-64bpp-rotate-90.html>
>       ([fdo#110725] / [fdo#111614])
>    -
>
>    igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb2/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html>
>       ([fdo#111614]) +2 similar issues
>    -
>
>    igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>    -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-glk4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>       ([fdo#109271] / [i915#3777])
>       -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-apl7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>       ([fdo#109271] / [i915#3777])
>       -
>
>    igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb8/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html>
>       ([fdo#111615]) +2 similar issues
>    -
>
>    igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-iclb6/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html>
>       ([fdo#109278] / [i915#3886]) +2 similar issues
>    -
>
>    igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-apl8/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html>
>       ([fdo#109271] / [i915#3886]) +5 similar issues
>    -
>
>    igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-kbl7/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html>
>       ([fdo#109271] / [i915#3886]) +9 similar issues
>    -
>
>    igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf_tiled_ccs:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6269/shard-iclb8/igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf_tiled_ccs.html>
>       -> DMESG-FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-iclb1/igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf_tiled_ccs.html>
>       ([i915#1226])
>    -
>
>    igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb5/igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs.html>
>       ([i915#3689]) +4 similar issues
>    -
>
>    igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb5/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html>
>       ([i915#3689] / [i915#3886]) +2 similar issues
>    -
>
>    igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-glk6/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html>
>       ([fdo#109271] / [i915#3886]) +2 similar issues
>    -
>
>    igt@kms_cdclk@plane-scaling:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb7/igt@kms_cdclk@plane-scaling.html>
>       ([i915#3742])
>    -
>
>    igt@kms_chamelium@vga-hpd-after-suspend:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-glk8/igt@kms_chamelium@vga-hpd-after-suspend.html>
>       ([fdo#109271] / [fdo#111827]) +5 similar issues
>    -
>
>    igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
>    -
>
>       shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-snb7/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html>
>       ([fdo#109271] / [fdo#111827]) +3 similar issues
>       -
>
>       shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-kbl2/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html>
>       ([fdo#109271] / [fdo#111827]) +13 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-iclb7/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html>
>       ([fdo#109284] / [fdo#111827]) +2 similar issues
>       -
>
>    igt@kms_color_chamelium@pipe-a-ctm-limited-range:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-apl3/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html>
>       ([fdo#109271] / [fdo#111827]) +10 similar issues
>    -
>
>    igt@kms_color_chamelium@pipe-d-ctm-max:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb8/igt@kms_color_chamelium@pipe-d-ctm-max.html>
>       ([fdo#109284] / [fdo#111827]) +15 similar issues
>    -
>
>    igt@kms_content_protection@lic:
>    - shard-kbl: NOTRUN -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-kbl1/igt@kms_content_protection@lic.html>
>       ([i915#1319])
>    -
>
>    igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen.html>
>       ([i915#3359]) +5 similar issues
>    -
>
>    igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html>
>       ([fdo#109278] / [fdo#109279]) +1 similar issue
>    -
>
>    igt@kms_cursor_crc@pipe-a-cursor-512x170-random:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html>
>       ([fdo#109279] / [i915#3359]) +3 similar issues
>    -
>
>    igt@kms_cursor_crc@pipe-a-cursor-suspend:
>    -
>
>       shard-kbl: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html>
>       ([i915#180]) +1 similar issue
>       -
>
>       shard-apl: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html>
>       ([i915#180])
>       -
>
>    igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen.html>
>       ([i915#3319]) +2 similar issues
>    -
>
>    igt@kms_cursor_crc@pipe-d-cursor-256x256-random:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-glk1/igt@kms_cursor_crc@pipe-d-cursor-256x256-random.html>
>       ([fdo#109271]) +63 similar issues
>    -
>
>    igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-iclb8/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html>
>       ([fdo#109274] / [fdo#109278])
>    -
>
>    igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb1/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html>
>       ([i915#3528])
>    -
>
>    igt@kms_flip@2x-flip-vs-fences-interruptible:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-iclb7/igt@kms_flip@2x-flip-vs-fences-interruptible.html>
>       ([fdo#109274])
>    -
>
>    igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
>    -
>
>       shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-kbl4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html>
>       ([fdo#109271] / [i915#2672])
>       -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-apl4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html>
>       ([fdo#109271] / [i915#2672])
>       -
>
>    igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile:
>    -
>
>       shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6269/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html>
>       ([i915#3701]) +1 similar issue
>       -
>
>       shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6269/shard-glk4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html>
>       -> DMESG-FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-glk3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html>
>       ([i915#118] / [i915#1888])
>       -
>
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html>
>       ([fdo#111825]) +35 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-iclb2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html>
>       ([fdo#109280]) +9 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-kbl4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html>
>       ([fdo#109271]) +155 similar issues
>    -
>
>    igt@kms_hdr@bpc-switch-suspend:
>    - shard-kbl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6269/shard-kbl2/igt@kms_hdr@bpc-switch-suspend.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html>
>       ([i915#180]) +5 similar issues
>    -
>
>    igt@kms_invalid_mode@clock-too-high:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb5/igt@kms_invalid_mode@clock-too-high.html>
>       ([i915#4278])
>    -
>
>    igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-iclb2/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html>
>       ([fdo#109289]) +2 similar issues
>    -
>
>    igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-kbl7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html>
>       ([fdo#109271] / [i915#533])
>    -
>
>    igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html>
>       ([fdo#109271] / [i915#533])
>    -
>
>    igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
>    -
>
>       shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html>
>       ([fdo#108145] / [i915#265]) +1 similar issue
>       -
>
>       shard-kbl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html>
>       ([fdo#108145] / [i915#265])
>       -
>
>    igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
>    - shard-kbl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html>
>       ([i915#265])
>    -
>
>    igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
>    - shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-glk5/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html>
>       ([fdo#108145] / [i915#265])
>    -
>
>    igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-iclb3/igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb.html>
>       ([fdo#109278]) +9 similar issues
>    -
>
>    igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-apl3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html>
>       ([fdo#109271] / [i915#658]) +3 similar issues
>    -
>
>    igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:
>    -
>
>       shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-kbl2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html>
>       ([fdo#109271] / [i915#658]) +2 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html>
>       ([i915#2920])
>       -
>
>    igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-glk8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html>
>       ([fdo#109271] / [i915#658]) +2 similar issues
>    -
>
>    igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html>
>       ([i915#2920]) +4 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-iclb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html>
>       ([i915#658])
>       -
>
>    igt@kms_psr@psr2_cursor_render:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-iclb4/igt@kms_psr@psr2_cursor_render.html>
>       ([fdo#109441])
>    -
>
>    igt@kms_psr@psr2_primary_mmap_cpu:
>    - shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb3/igt@kms_psr@psr2_primary_mmap_cpu.html>
>       ([i915#132] / [i915#3467]) +1 similar issue
>    -
>
>    igt@kms_psr@psr2_sprite_plane_move:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6269/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html>
>       ([fdo#109441]) +2 similar issues
>    -
>
>    igt@kms_psr@suspend:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6269/shard-tglb3/igt@kms_psr@suspend.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb7/igt@kms_psr@suspend.html>
>       ([i915#456]) +1 similar issue
>    -
>
>    igt@kms_setmode@basic:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6269/shard-apl8/igt@kms_setmode@basic.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-apl1/igt@kms_setmode@basic.html>
>       ([i915#31])
>    -
>
>    igt@kms_vblank@pipe-d-wait-forked-hang:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-apl6/igt@kms_vblank@pipe-d-wait-forked-hang.html>
>       ([fdo#109271]) +111 similar issues
>    -
>
>    igt@kms_vrr@flip-suspend:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb3/igt@kms_vrr@flip-suspend.html>
>       ([fdo#109502])
>    -
>
>    igt@kms_writeback@writeback-fb-id:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb2/igt@kms_writeback@writeback-fb-id.html>
>       ([i915#2437])
>    -
>
>    igt@kms_writeback@writeback-invalid-parameters:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-glk7/igt@kms_writeback@writeback-invalid-parameters.html>
>       ([fdo#109271] / [i915#2437])
>    -
>
>    igt@nouveau_crc@pipe-b-ctx-flip-detection:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb6/igt@nouveau_crc@pipe-b-ctx-flip-detection.html>
>       ([i915#2530]) +1 similar issue
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-iclb5/igt@nouveau_crc@pipe-b-ctx-flip-detection.html>
>       ([i915#2530])
>       -
>
>    igt@prime_nv_pcopy@test3_2:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb1/igt@prime_nv_pcopy@test3_2.html>
>       ([fdo#109291]) +3 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-iclb6/igt@prime_nv_pcopy@test3_2.html>
>       ([fdo#109291])
>       -
>
>    igt@sysfs_clients@fair-0:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-kbl1/igt@sysfs_clients@fair-0.html>
>       ([fdo#109271] / [i915#2994]) +1 similar issue
>    -
>
>    igt@sysfs_clients@sema-25:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-glk9/igt@sysfs_clients@sema-25.html>
>       ([fdo#109271] / [i915#2994])
>
> Possible fixes
>
>    -
>
>    igt@gem_eio@unwedge-stress:
>    - shard-iclb: TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6269/shard-iclb5/igt@gem_eio@unwedge-stress.html>
>       ([i915#2369] / [i915#2481] / [i915#3070]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-iclb8/igt@gem_eio@unwedge-stress.html>
>    -
>
>    igt@gem_exec_fair@basic-deadline:
>    - shard-glk: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6269/shard-glk6/igt@gem_exec_fair@basic-deadline.html>
>       ([i915#2846]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-glk3/igt@gem_exec_fair@basic-deadline.html>
>    -
>
>    igt@gem_exec_fair@basic-pace-solo@rcs0:
>    - shard-glk: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6269/shard-glk8/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>       ([i915#2842]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-glk2/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>    -
>
>    igt@gem_exec_fair@basic-pace@vcs1:
>    - shard-kbl: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6269/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html>
>       ([i915#2842]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs1.html>
>    -
>
>    igt@gem_exec_fair@basic-pace@vecs0:
>    - shard-iclb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6269/shard-iclb8/igt@gem_exec_fair@basic-pace@vecs0.html>
>       ([i915#2842]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-iclb3/igt@gem_exec_fair@basic-pace@vecs0.html>
>    -
>
>    igt@gem_exec_fair@basic-throttle@rcs0:
>    - shard-iclb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6269/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html>
>       ([i915#2849]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html>
>    -
>
>    igt@i915_selftest@live@hangcheck:
>    - shard-snb: INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6269/shard-snb6/igt@i915_selftest@live@hangcheck.html>
>       ([i915#3921]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-snb5/igt@i915_selftest@live@hangcheck.html>
>    -
>
>    igt@kms_big_fb@x-tiled-32bpp-rotate-0:
>    - shard-glk: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6269/shard-glk6/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html>
>       ([i915#118]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-glk9/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html>
>    -
>
>    igt@kms_cursor_legacy@flip-vs-cursor-toggle:
>    - shard-iclb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6269/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html>
>       ([i915#2346]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-iclb8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html>
>    -
>
>    igt@kms_fbcon_fbt@fbc-suspend:
>    -
>
>       shard-tglb: INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6269/shard-tglb7/igt@kms_fbcon_fbt@fbc-suspend.html>
>       ([i915#2411] / [i915#456]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb3/igt@kms_fbcon_fbt@fbc-suspend.html>
>       -
>
>       shard-kbl: INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6269/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html>
>       ([i915#180] / [i915#636]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html>
>       -
>
>    igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
>    -
>
>       shard-kbl: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6269/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html>
>       ([i915#180]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html>
>       +1 similar issue
>       -
>
>       shard-apl: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6269/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html>
>       ([i915#180]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html>
>       +2 similar issues
>       -
>
>    igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6269/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html>
>       ([i915#3701]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-iclb5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html>
>       +1 similar issue
>    -
>
>    igt@kms_frontbuffer_tracking@fbc-suspend:
>    - shard-tglb: INCOMPLETE <https://intel-gfx-ci.01.org/tree/dr>
>       ([i915#2411] / [i915#2828] / [i915#456]) -> [PASS][138]
>
>

--0000000000004dd8ea05d292702e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Lakshminarayana, this seems to be an irrelevant failure=
, can you run it again? Thanks!</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Wed, Nov 3, 2021 at 1:59 PM Patchwork &lt=
;<a href=3D"mailto:patchwork@emeril.freedesktop.org">patchwork@emeril.freed=
esktop.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<u></u>

=20
 =20
 =20
 =20

<div>


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>tests/kms_cursor_legacy: igt_require_=
pipe_crc for flip_vs_cursor_crc (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/96463/" target=3D"_blank">https://patchwork.freedesktop.org/series/964=
63/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6372/index.html" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_6372/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from IGT_6269_full -&gt; IGTPW_6372_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6372_full absolutely need to b=
e<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in IGTPW_6372_full, please notify your bug team to allow them<=
br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
6372/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_6372/index.html</a></p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6372=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled:<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6269/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled.html=
" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_6372/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-pwrit=
e-xtiled.html" target=3D"_blank">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6372_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-iclb4/igt@gem_ctx_param@set-priority-not-sup=
ported.html" target=3D"_blank">SKIP</a> ([fdo#109314])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile-preempt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-snb6/igt@gem_ctx_persistence@legacy-engines-=
hostile-preempt.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#1099=
]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-tglb1/igt@gem_ctx_sseu@engines.html" target=
=3D"_blank">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6269/shard-tglb1/igt@gem_eio@unwedge-stress.html" target=3D"_blank">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372=
/shard-tglb7/igt@gem_eio@unwedge-stress.html" target=3D"_blank">TIMEOUT</a>=
 ([i915#2369] / [i915#3063] / [i915#3648])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@pi@bcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-snb5/igt@gem_exec_capture@pi@bcs0.html" targ=
et=3D"_blank">SKIP</a> ([fdo#109271]) +112 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6269/shard-apl2/igt@gem_exec_fair@basic-none-share@rcs0.html" target=
=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_6372/shard-apl1/igt@gem_exec_fair@basic-none-share@rcs0.html" tar=
get=3D"_blank">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6269/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html" target=
=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_6372/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html" ta=
rget=3D"_blank">FAIL</a> ([i915#2842]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6269/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html" target=3D=
"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_6372/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html" target=
=3D"_blank">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6269/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs0.html" target=3D"_bla=
nk">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_6372/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs0.html" target=3D"_blank"=
>FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-tglb5/igt@gem_exec_params@secure-non-root.ht=
ml" target=3D"_blank">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6269/shard-glk9/igt@gem_exec_whisper@basic-forked.html" target=3D"_bla=
nk">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_6372/shard-glk4/igt@gem_exec_whisper@basic-forked.html" target=3D"_blank"=
>DMESG-WARN</a> ([i915#118]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@huge-split:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-glk1/igt@gem_userptr_blits@huge-split.html" =
target=3D"_blank">FAIL</a> ([i915#3376])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-tglb3/igt@gem_userptr_blits@readonly-unsync.=
html" target=3D"_blank">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allowed:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-tglb6/igt@gen7_exec_parse@basic-allowed.html=
" target=3D"_blank">SKIP</a> ([fdo#109289]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-tglb2/igt@gen9_exec_parse@batch-zero-length.=
html" target=3D"_blank">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-tglb2/igt@i915_pm_dc@dc3co-vpb-simulation.ht=
ml" target=3D"_blank">SKIP</a> ([i915#1904])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6269/shard-iclb7/igt@i915_pm_dc@dc6-psr.html" target=3D"_blank">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/sha=
rd-iclb6/igt@i915_pm_dc@dc6-psr.html" target=3D"_blank">FAIL</a> ([i915#454=
])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-tglb1/igt@i915_pm_rc6_residency@rc6-fence.ht=
ml" target=3D"_blank">WARN</a> ([i915#2681])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6372/shard-tglb8/igt@i915_pm_rc6_residency@rc6-idle.html=
" target=3D"_blank">WARN</a> ([i915#2681] / [i915#2684])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6372/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html=
" target=3D"_blank">WARN</a> ([i915#2684])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6372/shard-tglb7/igt@i915_pm_rpm@dpms-non-lpsp.html" tar=
get=3D"_blank">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6372/shard-iclb4/igt@i915_pm_rpm@dpms-non-lpsp.html" tar=
get=3D"_blank">SKIP</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-tglb7/igt@i915_pm_rpm@system-suspend-modeset=
.html" target=3D"_blank">INCOMPLETE</a> ([i915#2411] / [i915#456])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-kbl3/igt@i915_suspend@debugfs-reader.html" t=
arget=3D"_blank">INCOMPLETE</a> ([i915#3614] / [i915#4352])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-iclb2/igt@kms_big_fb@linear-64bpp-rotate-90.=
html" target=3D"_blank">SKIP</a> ([fdo#110725] / [fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-tglb2/igt@kms_big_fb@x-tiled-32bpp-rotate-90=
.html" target=3D"_blank">SKIP</a> ([fdo#111614]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6372/shard-glk4/igt@kms_big_fb@y-tiled-max-hw-stride-64b=
pp-rotate-180-hflip.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#=
3777])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6372/shard-apl7/igt@kms_big_fb@y-tiled-max-hw-stride-64b=
pp-rotate-180-hflip.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#=
3777])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-tglb8/igt@kms_big_fb@yf-tiled-32bpp-rotate-2=
70.html" target=3D"_blank">SKIP</a> ([fdo#111615]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-iclb6/igt@kms_ccs@pipe-a-bad-aux-stride-y_ti=
led_gen12_rc_ccs_cc.html" target=3D"_blank">SKIP</a> ([fdo#109278] / [i915#=
3886]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-apl8/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_=
tiled_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#3=
886]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-kbl7/igt@kms_ccs@pipe-a-crc-primary-rotation=
-180-y_tiled_gen12_rc_ccs_cc.html" target=3D"_blank">SKIP</a> ([fdo#109271]=
 / [i915#3886]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf_tiled_ccs:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6269/shard-iclb8/igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf_tiled_=
ccs.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_6372/shard-iclb1/igt@kms_ccs@pipe-a-crc-primary-r=
otation-180-yf_tiled_ccs.html" target=3D"_blank">DMESG-FAIL</a> ([i915#1226=
])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-tglb5/igt@kms_ccs@pipe-a-random-ccs-data-yf_=
tiled_ccs.html" target=3D"_blank">SKIP</a> ([i915#3689]) +4 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-tglb5/igt@kms_ccs@pipe-b-bad-pixel-format-y_=
tiled_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> ([i915#3689] / [i915#38=
86]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-glk6/igt@kms_ccs@pipe-b-crc-sprite-planes-ba=
sic-y_tiled_gen12_rc_ccs_cc.html" target=3D"_blank">SKIP</a> ([fdo#109271] =
/ [i915#3886]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-tglb7/igt@kms_cdclk@plane-scaling.html" targ=
et=3D"_blank">SKIP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-after-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-glk8/igt@kms_chamelium@vga-hpd-after-suspend=
.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +5 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6372/shard-snb7/igt@kms_color_chamelium@pipe-a-ctm-blue-=
to-red.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +3 si=
milar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6372/shard-kbl2/igt@kms_color_chamelium@pipe-a-ctm-blue-=
to-red.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +13 s=
imilar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6372/shard-iclb7/igt@kms_color_chamelium@pipe-a-ctm-blue=
-to-red.html" target=3D"_blank">SKIP</a> ([fdo#109284] / [fdo#111827]) +2 s=
imilar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-limited-range:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-apl3/igt@kms_color_chamelium@pipe-a-ctm-limi=
ted-range.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +1=
0 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-max:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-tglb8/igt@kms_color_chamelium@pipe-d-ctm-max=
.html" target=3D"_blank">SKIP</a> ([fdo#109284] / [fdo#111827]) +15 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-kbl1/igt@kms_content_protection@lic.html" ta=
rget=3D"_blank">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-32x10=
-offscreen.html" target=3D"_blank">SKIP</a> ([i915#3359]) +5 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-512x1=
70-offscreen.html" target=3D"_blank">SKIP</a> ([fdo#109278] / [fdo#109279])=
 +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-512x1=
70-random.html" target=3D"_blank">SKIP</a> ([fdo#109279] / [i915#3359]) +3 =
similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6372/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend=
.html" target=3D"_blank">DMESG-WARN</a> ([i915#180]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6372/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-suspend=
.html" target=3D"_blank">DMESG-WARN</a> ([i915#180])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-32x32=
-offscreen.html" target=3D"_blank">SKIP</a> ([i915#3319]) +2 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-256x256-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-glk1/igt@kms_cursor_crc@pipe-d-cursor-256x25=
6-random.html" target=3D"_blank">SKIP</a> ([fdo#109271]) +63 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-iclb8/igt@kms_cursor_legacy@cursora-vs-flipb=
-legacy.html" target=3D"_blank">SKIP</a> ([fdo#109274] / [fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-tglb1/igt@kms_dp_tiled_display@basic-test-pa=
ttern-with-chamelium.html" target=3D"_blank">SKIP</a> ([i915#3528])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-iclb7/igt@kms_flip@2x-flip-vs-fences-interru=
ptible.html" target=3D"_blank">SKIP</a> ([fdo#109274])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6372/shard-kbl4/igt@kms_flip_scaled_crc@flip-32bpp-ytile=
-to-32bpp-ytilegen12rcccs.html" target=3D"_blank">SKIP</a> ([fdo#109271] / =
[i915#2672])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6372/shard-apl4/igt@kms_flip_scaled_crc@flip-32bpp-ytile=
-to-32bpp-ytilegen12rcccs.html" target=3D"_blank">SKIP</a> ([fdo#109271] / =
[i915#2672])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6269/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytil=
e.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_6372/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp=
-ytile-to-16bpp-ytile.html" target=3D"_blank">SKIP</a> ([i915#3701]) +1 sim=
ilar issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6269/shard-glk4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile=
.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_6372/shard-glk3/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-16bpp-ytile.html" target=3D"_blank">DMESG-FAIL</a> ([i915#118] / [i=
915#1888])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-shrfb-plflip-blt.html" target=3D"_blank">SKIP</a> ([fdo#111825]) =
+35 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-iclb2/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-pri-shrfb-draw-blt.html" target=3D"_blank">SKIP</a> ([fdo#109280]) +=
9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-kbl4/igt@kms_frontbuffer_tracking@psr-rgb101=
010-draw-mmap-wc.html" target=3D"_blank">SKIP</a> ([fdo#109271]) +155 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6269/shard-kbl2/igt@kms_hdr@bpc-switch-suspend.html" target=3D"_blank"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6=
372/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html" target=3D"_blank">DMESG=
-WARN</a> ([i915#180]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-tglb5/igt@kms_invalid_mode@clock-too-high.ht=
ml" target=3D"_blank">SKIP</a> ([i915#4278])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-iclb2/igt@kms_pipe_b_c_ivb@disable-pipe-b-en=
able-pipe-c.html" target=3D"_blank">SKIP</a> ([fdo#109289]) +2 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-kbl7/igt@kms_pipe_crc_basic@hang-read-crc-pi=
pe-d.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc=
-pipe-d.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6372/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-7=
efc.html" target=3D"_blank">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar=
 issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6372/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-alpha-7=
efc.html" target=3D"_blank">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-=
transparent-fb.html" target=3D"_blank">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-glk5/igt@kms_plane_alpha_blend@pipe-c-consta=
nt-alpha-max.html" target=3D"_blank">FAIL</a> ([fdo#108145] / [i915#265])</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-iclb3/igt@kms_plane_alpha_blend@pipe-d-alpha=
-transparent-fb.html" target=3D"_blank">SKIP</a> ([fdo#109278]) +9 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-apl3/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-2.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#658]) +3=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6372/shard-kbl2/igt@kms_psr2_sf@overlay-plane-update-sf-=
dmg-area-3.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#658]) +2 =
similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6372/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-3.html" target=3D"_blank">SKIP</a> ([i915#2920])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-glk8/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-4.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#658]) +2=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6372/shard-tglb6/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-1.html" target=3D"_blank">SKIP</a> ([i915#2920]) +4 similar iss=
ues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6372/shard-iclb5/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-1.html" target=3D"_blank">SKIP</a> ([i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-iclb4/igt@kms_psr@psr2_cursor_render.html" t=
arget=3D"_blank">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-tglb3/igt@kms_psr@psr2_primary_mmap_cpu.html=
" target=3D"_blank">FAIL</a> ([i915#132] / [i915#3467]) +1 similar issue</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6269/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html" target=3D"_b=
lank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_6372/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html" target=3D"_bl=
ank">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6269/shard-tglb3/igt@kms_psr@suspend.html" target=3D"_blank">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-=
tglb7/igt@kms_psr@suspend.html" target=3D"_blank">INCOMPLETE</a> ([i915#456=
]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6269/shard-apl8/igt@kms_setmode@basic.html" target=3D"_blank">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard=
-apl1/igt@kms_setmode@basic.html" target=3D"_blank">FAIL</a> ([i915#31])</l=
i>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-forked-hang:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-apl6/igt@kms_vblank@pipe-d-wait-forked-hang.=
html" target=3D"_blank">SKIP</a> ([fdo#109271]) +111 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-tglb3/igt@kms_vrr@flip-suspend.html" target=
=3D"_blank">SKIP</a> ([fdo#109502])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-tglb2/igt@kms_writeback@writeback-fb-id.html=
" target=3D"_blank">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-glk7/igt@kms_writeback@writeback-invalid-par=
ameters.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-detection:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6372/shard-tglb6/igt@nouveau_crc@pipe-b-ctx-flip-detecti=
on.html" target=3D"_blank">SKIP</a> ([i915#2530]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6372/shard-iclb5/igt@nouveau_crc@pipe-b-ctx-flip-detecti=
on.html" target=3D"_blank">SKIP</a> ([i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_2:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6372/shard-tglb1/igt@prime_nv_pcopy@test3_2.html" target=
=3D"_blank">SKIP</a> ([fdo#109291]) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6372/shard-iclb6/igt@prime_nv_pcopy@test3_2.html" target=
=3D"_blank">SKIP</a> ([fdo#109291])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-kbl1/igt@sysfs_clients@fair-0.html" target=
=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2994]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-25:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6372/shard-glk9/igt@sysfs_clients@sema-25.html" target=
=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2994])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6269/shard-iclb5/igt@gem_eio@unwedge-stress.html" target=3D"_blank">TI=
MEOUT</a> ([i915#2369] / [i915#2481] / [i915#3070]) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-iclb8/igt@gem_eio@unwed=
ge-stress.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6269/shard-glk6/igt@gem_exec_fair@basic-deadline.html" target=3D"_blan=
k">FAIL</a> ([i915#2846]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_6372/shard-glk3/igt@gem_exec_fair@basic-deadline.html" targe=
t=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6269/shard-glk8/igt@gem_exec_fair@basic-pace-solo@rcs0.html" target=3D=
"_blank">FAIL</a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_6372/shard-glk2/igt@gem_exec_fair@basic-pace-solo@rcs0=
.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6269/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html" target=3D"_bla=
nk">FAIL</a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_6372/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs1.html" tar=
get=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6269/shard-iclb8/igt@gem_exec_fair@basic-pace@vecs0.html" target=3D"_b=
lank">FAIL</a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_6372/shard-iclb3/igt@gem_exec_fair@basic-pace@vecs0.html"=
 target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6269/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html" target=3D=
"_blank">FAIL</a> ([i915#2849]) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_6372/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0=
.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6269/shard-snb6/igt@i915_selftest@live@hangcheck.html" target=3D"_blan=
k">INCOMPLETE</a> ([i915#3921]) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_6372/shard-snb5/igt@i915_selftest@live@hangcheck.html"=
 target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6269/shard-glk6/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html" target=3D"=
_blank">DMESG-WARN</a> ([i915#118]) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_6372/shard-glk9/igt@kms_big_fb@x-tiled-32bpp-rotat=
e-0.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6269/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html" tar=
get=3D"_blank">FAIL</a> ([i915#2346]) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_6372/shard-iclb8/igt@kms_cursor_legacy@flip-vs-c=
ursor-toggle.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6269/shard-tglb7/igt@kms_fbcon_fbt@fbc-suspend.html" target=3D"_blank">=
INCOMPLETE</a> ([i915#2411] / [i915#456]) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_6372/shard-tglb3/igt@kms_fbcon_fbt@fbc-suspe=
nd.html" target=3D"_blank">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6269/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html" target=3D"_blank">I=
NCOMPLETE</a> ([i915#180] / [i915#636]) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_6372/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.=
html" target=3D"_blank">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6269/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html" =
target=3D"_blank">DMESG-WARN</a> ([i915#180]) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-kbl1/igt@kms_flip@flip-vs-sus=
pend-interruptible@a-dp1.html" target=3D"_blank">PASS</a> +1 similar issue<=
/p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6269/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html" =
target=3D"_blank">DMESG-WARN</a> ([i915#180]) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-apl1/igt@kms_flip@flip-vs-sus=
pend-interruptible@a-dp1.html" target=3D"_blank">PASS</a> +2 similar issues=
</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6269/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-yti=
le.html" target=3D"_blank">SKIP</a> ([i915#3701]) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6372/shard-iclb5/igt@kms_flip_scaled=
_crc@flip-32bpp-ytile-to-64bpp-ytile.html" target=3D"_blank">PASS</a> +1 si=
milar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/dr" tar=
get=3D"_blank">INCOMPLETE</a> ([i915#2411] / [i915#2828] / [i915#456]) -&gt=
; [PASS][138]</li>
</ul>
</li>
</ul>

</div>

</blockquote></div>

--0000000000004dd8ea05d292702e--
