Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E3D610E4E0
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Nov 2022 17:50:48 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-36a4b86a0abso140647407b3.7
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Nov 2022 09:50:48 -0800 (PST)
MIME-Version: 1.0
References: <20221103160840.1661858-1-markyacoub@chromium.org>
 <166785597214.17761.4865803086399243714@emeril.freedesktop.org>
In-Reply-To: <166785597214.17761.4865803086399243714@emeril.freedesktop.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Tue, 8 Nov 2022 12:50:36 -0500
Message-ID: <CAJUqKUrH-pAKo+sE9sWLCRUaf7kJBGGJ9h6LHGrKjJBM03t7xg@mail.gmail.com>
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Content-Type: multipart/alternative; boundary="0000000000000bdaa005ecf92e96"
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQ2hhbWVs?=
	=?utf-8?q?ium=3A_Add_more_real_monitor_EDIDs_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--0000000000000bdaa005ecf92e96
Content-Type: text/plain; charset="UTF-8"

Hi Lakshminarayana, the failure looks irrelevant. Can I get a rerun?

On Mon, Nov 7, 2022 at 4:19 PM Patchwork <patchwork@emeril.freedesktop.org>
wrote:

> *Patch Details*
> *Series:* Chamelium: Add more real monitor EDIDs (rev2)
> *URL:* https://patchwork.freedesktop.org/series/110496/
> *State:* failure
> *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/index.html CI
> Bug Log - changes from CI_DRM_12351_full -> IGTPW_8058_full Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_8058_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_8058_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/index.html
> Participating hosts (9 -> 6)
>
> Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005
> Possible new issues
>
> Here are the unknown changes that may have been introduced in
> IGTPW_8058_full:
> IGT changes Possible regressions
>
>    - igt@i915_pm_dc@dc9-dpms:
>       - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-iclb7/igt@i915_pm_dc@dc9-dpms.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb7/igt@i915_pm_dc@dc9-dpms.html>
>
> New tests
>
> New tests have been introduced between CI_DRM_12351_full and
> IGTPW_8058_full:
> New IGT tests (4)
>
>    -
>
>    igt@kms_chamelium@dp-edid-stress-resolution-4k:
>    - Statuses : 5 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_chamelium@dp-edid-stress-resolution-non-4k:
>    - Statuses : 5 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_chamelium@hdmi-edid-stress-resolution-4k:
>    - Statuses : 5 skip(s)
>       - Exec time: [0.0] s
>    -
>
>    igt@kms_chamelium@hdmi-edid-stress-resolution-non-4k:
>    - Statuses : 5 skip(s)
>       - Exec time: [0.0] s
>
> Known issues
>
> Here are the changes found in IGTPW_8058_full that come from known issues:
> IGT changes Issues hit
>
>    -
>
>    igt@gem_ctx_persistence@engines-mixed-process:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-snb5/igt@gem_ctx_persistence@engines-mixed-process.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#1099 <https://gitlab.freedesktop.org/drm/intel/issues/1099>)
>       +1 similar issue
>    -
>
>    igt@gem_eio@in-flight-contexts-10ms:
>    - shard-snb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-snb7/igt@gem_eio@in-flight-contexts-10ms.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-snb7/igt@gem_eio@in-flight-contexts-10ms.html>
>       (i915#4409 <https://gitlab.freedesktop.org/drm/intel/issues/4409>)
>    -
>
>    igt@gem_exec_balancer@parallel-balancer:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-iclb2/igt@gem_exec_balancer@parallel-balancer.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb8/igt@gem_exec_balancer@parallel-balancer.html>
>       (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>       +1 similar issue
>    -
>
>    igt@gem_exec_fair@basic-none-share@rcs0:
>    -
>
>       shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb3/igt@gem_exec_fair@basic-none-share@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -
>
>       shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -
>
>    igt@gem_exec_fair@basic-pace-share@rcs0:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       +1 similar issue
>    -
>
>    igt@gem_exec_params@secure-non-root:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb7/igt@gem_exec_params@secure-non-root.html>
>       (fdo#112283 <https://bugs.freedesktop.org/show_bug.cgi?id=112283>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb7/igt@gem_exec_params@secure-non-root.html>
>       (fdo#112283 <https://bugs.freedesktop.org/show_bug.cgi?id=112283>)
>       -
>
>    igt@gem_huc_copy@huc-copy:
>    -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-glk7/igt@gem_huc_copy@huc-copy.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb2/igt@gem_huc_copy@huc-copy.html>
>       (i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
>       -
>
>    igt@gem_mmap_gtt@coherency:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb8/igt@gem_mmap_gtt@coherency.html>
>       (fdo#111656 <https://bugs.freedesktop.org/show_bug.cgi?id=111656>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb3/igt@gem_mmap_gtt@coherency.html>
>       (fdo#109292 <https://bugs.freedesktop.org/show_bug.cgi?id=109292>)
>       -
>
>    igt@gem_pread@exhaustion:
>    - shard-apl: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-apl8/igt@gem_pread@exhaustion.html>
>       (i915#7248 <https://gitlab.freedesktop.org/drm/intel/issues/7248>)
>    -
>
>    igt@gem_pxp@verify-pxp-stale-ctx-execution:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb7/igt@gem_pxp@verify-pxp-stale-ctx-execution.html>
>       (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>       +1 similar issue
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb7/igt@gem_pxp@verify-pxp-stale-ctx-execution.html>
>       (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>       +1 similar issue
>       -
>
>    igt@gem_userptr_blits@readonly-pwrite-unsync:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb5/igt@gem_userptr_blits@readonly-pwrite-unsync.html>
>       (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb2/igt@gem_userptr_blits@readonly-pwrite-unsync.html>
>       (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
>       -
>
>    igt@gen7_exec_parse@oacontrol-tracking:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-apl8/igt@gen7_exec_parse@oacontrol-tracking.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +205 similar issues
>    -
>
>    igt@i915_pipe_stress@stress-xrgb8888-untiled:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-apl2/igt@i915_pipe_stress@stress-xrgb8888-untiled.html>
>       (i915#7036 <https://gitlab.freedesktop.org/drm/intel/issues/7036>)
>    -
>
>    igt@i915_pm_dc@dc6-psr:
>    -
>
>       shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb7/igt@i915_pm_dc@dc6-psr.html>
>       (i915#3989 <https://gitlab.freedesktop.org/drm/intel/issues/3989> /
>       i915#454 <https://gitlab.freedesktop.org/drm/intel/issues/454>)
>       -
>
>       shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb6/igt@i915_pm_dc@dc6-psr.html>
>       (i915#3989 <https://gitlab.freedesktop.org/drm/intel/issues/3989> /
>       i915#454 <https://gitlab.freedesktop.org/drm/intel/issues/454>)
>       -
>
>    igt@i915_pm_freq_mult@media-freq@gt0:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb7/igt@i915_pm_freq_mult@media-freq@gt0.html>
>       (i915#6590 <https://gitlab.freedesktop.org/drm/intel/issues/6590>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb7/igt@i915_pm_freq_mult@media-freq@gt0.html>
>       (i915#6590 <https://gitlab.freedesktop.org/drm/intel/issues/6590>)
>       -
>
>    igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html>
>       (i915#3826 <https://gitlab.freedesktop.org/drm/intel/issues/3826>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html>
>       (i915#3826 <https://gitlab.freedesktop.org/drm/intel/issues/3826>)
>       -
>
>    igt@kms_atomic@atomic_plane_damage:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb6/igt@kms_atomic@atomic_plane_damage.html>
>       (i915#4765 <https://gitlab.freedesktop.org/drm/intel/issues/4765>)
>    -
>
>    igt@kms_big_fb@4-tiled-16bpp-rotate-90:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb8/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html>
>       (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>       +1 similar issue
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb3/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html>
>       (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>       +1 similar issue
>       -
>
>    igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-glk6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +53 similar issues
>    -
>
>    igt@kms_big_fb@linear-16bpp-rotate-90:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb3/igt@kms_big_fb@linear-16bpp-rotate-90.html>
>       (fdo#110725 <https://bugs.freedesktop.org/show_bug.cgi?id=110725> /
>       fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb6/igt@kms_big_fb@linear-16bpp-rotate-90.html>
>       (fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>)
>       -
>
>    igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html>
>       (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>)
>    -
>
>    igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_mc_ccs:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb1/igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_mc_ccs.html>
>       (i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>       +1 similar issue
>    -
>
>    igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-apl2/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +6 similar issues
>    -
>
>    igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_mc_ccs:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb2/igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_mc_ccs.html>
>       (fdo#109278 <https://bugs.freedesktop.org/show_bug.cgi?id=109278>)
>       +8 similar issues
>    -
>
>    igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf_tiled_ccs:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb3/igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf_tiled_ccs.html>
>       (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615> /
>       i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689>)
>       +1 similar issue
>    -
>
>    igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb6/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs.html>
>       (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>       i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>       +3 similar issues
>    -
>
>    igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb7/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html>
>       (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689>)
>       +1 similar issue
>    -
>
>    {igt@kms_chamelium@hdmi-edid-stress-resolution-4k} (NEW):
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb1/igt@kms_chamelium@hdmi-edid-stress-resolution-4k.html>
>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284>)
>       +3 similar issues
>    -
>
>    {igt@kms_chamelium@hdmi-edid-stress-resolution-non-4k} (NEW):
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb3/igt@kms_chamelium@hdmi-edid-stress-resolution-non-4k.html>
>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284>)
>       +3 similar issues
>    -
>
>    igt@kms_chamelium@hdmi-hpd-for-each-pipe:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-snb2/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +2 similar issues
>    -
>
>    igt@kms_chamelium@hdmi-hpd-storm:
>    -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-apl8/igt@kms_chamelium@hdmi-hpd-storm.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +8 similar issues
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb6/igt@kms_chamelium@hdmi-hpd-storm.html>
>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +1 similar issue
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-glk1/igt@kms_chamelium@hdmi-hpd-storm.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +1 similar issue
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb3/igt@kms_chamelium@hdmi-hpd-storm.html>
>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +1 similar issue
>       -
>
>    igt@kms_content_protection@uevent:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb3/igt@kms_content_protection@uevent.html>
>       (i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb8/igt@kms_content_protection@uevent.html>
>       (i915#6944 <https://gitlab.freedesktop.org/drm/intel/issues/6944> /
>       i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>)
>       -
>
>    igt@kms_content_protection@uevent@pipe-a-dp-1:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-apl8/igt@kms_content_protection@uevent@pipe-a-dp-1.html>
>       (i915#1339 <https://gitlab.freedesktop.org/drm/intel/issues/1339>)
>    -
>
>    igt@kms_cursor_crc@cursor-onscreen-32x32:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb3/igt@kms_cursor_crc@cursor-onscreen-32x32.html>
>       (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>       +1 similar issue
>    -
>
>    igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-apl3/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-apl2/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html>
>       (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>    -
>
>    igt@kms_cursor_legacy@cursorb-vs-flipa@atomic-transitions-varying-size:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb6/igt@kms_cursor_legacy@cursorb-vs-flipa@atomic-transitions-varying-size.html>
>       (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>       fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
>       +7 similar issues
>    -
>
>    igt@kms_cursor_legacy@cursorb-vs-flipa@legacy:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb3/igt@kms_cursor_legacy@cursorb-vs-flipa@legacy.html>
>       (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>)
>       +10 similar issues
>    -
>
>    igt@kms_dsc@dsc-with-bpc-formats:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-apl8/igt@kms_dsc@dsc-with-bpc-formats.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#7205 <https://gitlab.freedesktop.org/drm/intel/issues/7205>)
>    -
>
>    igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html>
>       (i915#2122 <https://gitlab.freedesktop.org/drm/intel/issues/2122>)
>    -
>
>    igt@kms_flip@2x-nonexisting-fb:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb8/igt@kms_flip@2x-nonexisting-fb.html>
>       (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>       fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825> /
>       i915#3637 <https://gitlab.freedesktop.org/drm/intel/issues/3637>)
>       +2 similar issues
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html>
>       (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>       +2 similar issues
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html>
>       (i915#2587 <https://gitlab.freedesktop.org/drm/intel/issues/2587> /
>       i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>       +4 similar issues
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode.html>
>       (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>       +4 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html>
>       (i915#6497 <https://gitlab.freedesktop.org/drm/intel/issues/6497>)
>       +4 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html>
>       (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280> /
>       fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
>       +7 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite.html>
>       (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280>)
>       +8 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-snb6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +138 similar issues
>    -
>
>    igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb7/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html>
>       (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb7/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html>
>       (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>       -
>
>    igt@kms_plane_lowres@tiling-none@pipe-a-edp-1:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb7/igt@kms_plane_lowres@tiling-none@pipe-a-edp-1.html>
>       (i915#3536 <https://gitlab.freedesktop.org/drm/intel/issues/3536>)
>       +2 similar issues
>    -
>
>    igt@kms_plane_lowres@tiling-none@pipe-c-edp-1:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb7/igt@kms_plane_lowres@tiling-none@pipe-c-edp-1.html>
>       (i915#3536 <https://gitlab.freedesktop.org/drm/intel/issues/3536>)
>       +3 similar issues
>    -
>
>    igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-iclb1/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html>
>       (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>)
>       +2 similar issues
>    -
>
>    igt@kms_psr2_sf@plane-move-sf-dmg-area:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-apl1/igt@kms_psr2_sf@plane-move-sf-dmg-area.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) +2
>       similar issues
>    -
>
>    igt@kms_psr2_su@page_flip-p010@pipe-b-edp-1:
>    - shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb2/igt@kms_psr2_su@page_flip-p010@pipe-b-edp-1.html>
>       (i915#5939 <https://gitlab.freedesktop.org/drm/intel/issues/5939>)
>       +2 similar issues
>    -
>
>    igt@kms_psr@psr2_primary_mmap_cpu:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html>
>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>       -
>
>       shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb2/igt@kms_psr@psr2_primary_mmap_cpu.html>
>       (i915#132 <https://gitlab.freedesktop.org/drm/intel/issues/132> /
>       i915#3467 <https://gitlab.freedesktop.org/drm/intel/issues/3467>)
>       -
>
>    igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-iclb5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>       (i915#5519 <https://gitlab.freedesktop.org/drm/intel/issues/5519>)
>    -
>
>    igt@kms_selftest@all:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb2/igt@kms_selftest@all.html>
>       (i915#6433 <https://gitlab.freedesktop.org/drm/intel/issues/6433>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb6/igt@kms_selftest@all.html>
>       (i915#6433 <https://gitlab.freedesktop.org/drm/intel/issues/6433>)
>       -
>
>    igt@kms_vblank@pipe-d-wait-idle:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-apl2/igt@kms_vblank@pipe-d-wait-idle.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#533 <https://gitlab.freedesktop.org/drm/intel/issues/533>)
>    -
>
>    igt@kms_writeback@writeback-check-output:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-apl8/igt@kms_writeback@writeback-check-output.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>    -
>
>    igt@prime_vgem@fence-flip-hang:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb2/igt@prime_vgem@fence-flip-hang.html>
>       (fdo#109295 <https://bugs.freedesktop.org/show_bug.cgi?id=109295>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb7/igt@prime_vgem@fence-flip-hang.html>
>       (fdo#109295 <https://bugs.freedesktop.org/show_bug.cgi?id=109295>)
>       -
>
>    igt@sysfs_clients@fair-1:
>    -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-apl3/igt@sysfs_clients@fair-1.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb7/igt@sysfs_clients@fair-1.html>
>       (i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-glk6/igt@sysfs_clients@fair-1.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb6/igt@sysfs_clients@fair-1.html>
>       (i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>
> Possible fixes
>
>    -
>
>    igt@gem_ctx_exec@basic-nohangcheck:
>    - shard-tglb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-tglb6/igt@gem_ctx_exec@basic-nohangcheck.html>
>       (i915#6268 <https://gitlab.freedesktop.org/drm/intel/issues/6268>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb7/igt@gem_ctx_exec@basic-nohangcheck.html>
>    -
>
>    igt@gem_exec_fair@basic-flow@rcs0:
>    - shard-tglb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html>
>    -
>
>    igt@gem_workarounds@suspend-resume-context:
>    - shard-apl: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-apl2/igt@gem_workarounds@suspend-resume-context.html>
>       (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>) ->
>       PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-apl7/igt@gem_workarounds@suspend-resume-context.html>
>       +3 similar issues
>    -
>
>    igt@i915_selftest@mock@sanitycheck:
>    - shard-snb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-snb6/igt@i915_selftest@mock@sanitycheck.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-snb2/igt@i915_selftest@mock@sanitycheck.html>
>       +1 similar issue
>    -
>
>    igt@kms_atomic_transition
>    @plane-primary-toggle-with-vblank-wait@pipe-a-hdmi-a-1:
>    - shard-glk: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-glk2/igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-hdmi-a-1.html>
>       (i915#118 <https://gitlab.freedesktop.org/drm/intel/issues/118>) ->
>       PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-glk6/igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-hdmi-a-1.html>
>       +1 similar issue
>    -
>
>    igt@kms_big_fb@y-tiled-64bpp-rotate-180:
>    - shard-glk: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-glk3/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html>
>       (i915#5138 <https://gitlab.freedesktop.org/drm/intel/issues/5138>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-glk2/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html>
>    -
>
>    igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:
>    - shard-glk: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html>
>       (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>) ->
>       PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html>
>       +1 similar issue
>    -
>
>    igt@kms_plane_scaling
>    @planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html>
>       (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html>
>       +2 similar issues
>    -
>
>    igt@kms_psr@psr2_sprite_plane_move:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html>
>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html>
>       +1 similar issue
>    -
>
>    igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>    - shard-tglb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-tglb6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>       (i915#5519 <https://gitlab.freedesktop.org/drm/intel/issues/5519>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>
> Warnings
>
>    -
>
>    igt@gem_pread@exhaustion:
>    -
>
>       shard-tglb: WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-tglb8/igt@gem_pread@exhaustion.html>
>       (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb6/igt@gem_pread@exhaustion.html>
>       (i915#7248 <https://gitlab.freedesktop.org/drm/intel/issues/7248>)
>       -
>
>       shard-glk: WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-glk1/igt@gem_pread@exhaustion.html>
>       (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-glk1/igt@gem_pread@exhaustion.html>
>       (i915#7248 <https://gitlab.freedesktop.org/drm/intel/issues/7248>)
>       -
>
>    igt@gem_pwrite@basic-exhaustion:
>    -
>
>       shard-tglb: INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-tglb6/igt@gem_pwrite@basic-exhaustion.html>
>       (i915#7248 <https://gitlab.freedesktop.org/drm/intel/issues/7248>)
>       -> WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb7/igt@gem_pwrite@basic-exhaustion.html>
>       (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
>       -
>
>       shard-glk: INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-glk9/igt@gem_pwrite@basic-exhaustion.html>
>       (i915#7248 <https://gitlab.freedesktop.org/drm/intel/issues/7248>)
>       -> WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-glk2/igt@gem_pwrite@basic-exhaustion.html>
>       (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
>       -
>
>    igt@i915_pm_rc6_residency@rc6-idle@rcs0:
>    - shard-iclb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html>
>       (i915#2684 <https://gitlab.freedesktop.org/drm/intel/issues/2684>)
>       -> WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html>
>       (i915#2684 <https://gitlab.freedesktop.org/drm/intel/issues/2684>)
>    -
>
>    igt@i915_pm_rc6_residency@rc6-idle@vecs0:
>    - shard-iclb: WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html>
>       (i915#2684 <https://gitlab.freedesktop.org/drm/intel/issues/2684>)
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html>
>       (i915#2684 <https://gitlab.freedesktop.org/drm/intel/issues/2684>)
>    -
>
>    igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html>
>       (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb3/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html>
>       (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>    -
>
>    igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html>
>       (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb5/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html>
>       (fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) +2
>       similar issues
>    -
>
>    igt@runner@aborted:
>    - shard-apl: (FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-apl8/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-apl8/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-apl2/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-apl3/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-apl8/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-apl3/igt@runner@aborted.html>)
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180> /
>       i915#3002 <https://gitlab.freedesktop.org/drm/intel/issues/3002> /
>       i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>)
>       -> (FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-apl8/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-apl2/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-apl7/igt@runner@aborted.html>)
>       (i915#3002 <https://gitlab.freedesktop.org/drm/intel/issues/3002> /
>       i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>)
>
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> Build changes
>
>    - CI: CI-20190529 -> None
>    - IGT: IGT_7046 -> IGTPW_8058
>    - Piglit: piglit_4509 -> None
>
> CI-20190529: 20190529
> CI_DRM_12351: 74d8166a994863d1f83e842c1822506a8f6aa806 @ git://
> anongit.freedesktop.org/gfx-ci/linux
> IGTPW_8058: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/index.html
> IGT_7046: c58d96d0fe237474b074e3472ce09c57c830d5de @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://
> anongit.freedesktop.org/piglit
>

--0000000000000bdaa005ecf92e96
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Lakshminarayana, the failure looks irrelevant. Can I ge=
t a rerun?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Mon, Nov 7, 2022 at 4:19 PM Patchwork &lt;<a href=3D"mailto:pa=
tchwork@emeril.freedesktop.org">patchwork@emeril.freedesktop.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=
=3D"msg-218968428258401281">
<u></u>

=20
 =20
 =20
 =20

<div>


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>Chamelium: Add more real monitor EDID=
s (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/110496/" target=3D"_blank">https://patchwork.freedesktop.org/series/11=
0496/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/index.html" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_8058/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from CI_DRM_12351_full -&gt; IGTPW_8058_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8058_full absolutely need to b=
e<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in IGTPW_8058_full, please notify your bug team to allow them<=
br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
8058/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_8058/index.html</a></p>
<h2>Participating hosts (9 -&gt; 6)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8058=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_pm_dc@dc9-dpms:<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12351/shard-iclb7/igt@i915_pm_dc@dc9-dpms.html" target=3D"_blank">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_805=
8/shard-iclb7/igt@i915_pm_dc@dc9-dpms.html" target=3D"_blank">INCOMPLETE</a=
></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12351_full and IGTPW_8058_=
full:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_chamelium@dp-edid-stress-resolution-4k:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8058_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-mixed-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-snb5/igt@gem_ctx_persistence@engines-mixed-p=
rocess.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1099" target=3D"_blank"=
>i915#1099</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12351/shard-snb7/igt@gem_eio@in-flight-contexts-10ms.html" target=
=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_8058/shard-snb7/igt@gem_eio@in-flight-contexts-10ms.html" target=
=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4409" target=3D"_blank">i915#4409</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12351/shard-iclb2/igt@gem_exec_balancer@parallel-balancer.html" tar=
get=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_8058/shard-iclb8/igt@gem_exec_balancer@parallel-balancer.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4525" target=3D"_blank">i915#4525</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-tglb3/igt@gem_exec_fair@basic-none-share@rcs0=
.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2842" target=3D"_blank">i915#2842</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0=
.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2842" target=3D"_blank">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12351/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html" targ=
et=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_8058/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html" t=
arget=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2842" target=3D"_blank">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-iclb7/igt@gem_exec_params@secure-non-root.htm=
l" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D112283" target=3D"_blank">fdo#112283</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-tglb7/igt@gem_exec_params@secure-non-root.htm=
l" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D112283" target=3D"_blank">fdo#112283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-glk7/igt@gem_huc_copy@huc-copy.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2190" target=3D"_blank">i915#2190</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-iclb2/igt@gem_huc_copy@huc-copy.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2190" target=3D"_blank">i915#2190</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-tglb8/igt@gem_mmap_gtt@coherency.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111656" target=3D"_blank">fdo#111656</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-iclb3/igt@gem_mmap_gtt@coherency.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109292" target=3D"_blank">fdo#109292</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-apl8/igt@gem_pread@exhaustion.html" target=
=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/7248" target=3D"_blank">i915#7248</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-tglb7/igt@gem_pxp@verify-pxp-stale-ctx-execut=
ion.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/4270" target=3D"_blank">i915#4270</a>) +1 similar iss=
ue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-iclb7/igt@gem_pxp@verify-pxp-stale-ctx-execut=
ion.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/4270" target=3D"_blank">i915#4270</a>) +1 similar iss=
ue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-tglb5/igt@gem_userptr_blits@readonly-pwrite-u=
nsync.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3297" target=3D"_blank">i915#3297</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-iclb2/igt@gem_userptr_blits@readonly-pwrite-u=
nsync.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3297" target=3D"_blank">i915#3297</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@oacontrol-tracking:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-apl8/igt@gen7_exec_parse@oacontrol-tracking.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +205 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-apl2/igt@i915_pipe_stress@stress-xrgb8888-un=
tiled.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/7036" target=3D"_blank">i915#7036</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-tglb7/igt@i915_pm_dc@dc6-psr.html" target=3D"=
_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3989" target=3D"_blank">i915#3989</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/454" target=3D"_blank">i915#454</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-iclb6/igt@i915_pm_dc@dc6-psr.html" target=3D"=
_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3989" target=3D"_blank">i915#3989</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/454" target=3D"_blank">i915#454</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-iclb7/igt@i915_pm_freq_mult@media-freq@gt0.ht=
ml" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/6590" target=3D"_blank">i915#6590</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-tglb7/igt@i915_pm_freq_mult@media-freq@gt0.ht=
ml" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/6590" target=3D"_blank">i915#6590</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-tglb6/igt@kms_addfb_basic@invalid-smem-bo-on-=
discrete.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3826" target=3D"_blank">i915#3826</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-iclb1/igt@kms_addfb_basic@invalid-smem-bo-on-=
discrete.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3826" target=3D"_blank">i915#3826</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic_plane_damage:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-iclb6/igt@kms_atomic@atomic_plane_damage.htm=
l" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4765" target=3D"_blank">i915#4765</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-iclb8/igt@kms_big_fb@4-tiled-16bpp-rotate-90.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/5286" target=3D"_blank">i915#5286</a>) +1 similar issue</=
p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-tglb3/igt@kms_big_fb@4-tiled-16bpp-rotate-90.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/5286" target=3D"_blank">i915#5286</a>) +1 similar issue</=
p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p=
>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-glk6/igt@kms_big_fb@4-tiled-max-hw-stride-32=
bpp-rotate-0-hflip-async-flip.html" target=3D"_blank">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fd=
o#109271</a>) +53 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-iclb3/igt@kms_big_fb@linear-16bpp-rotate-90.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D110725" target=3D"_blank">fdo#110725</a> / <a href=3D"https=
://bugs.freedesktop.org/show_bug.cgi?id=3D111614" target=3D"_blank">fdo#111=
614</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-tglb6/igt@kms_big_fb@linear-16bpp-rotate-90.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111614" target=3D"_blank">fdo#111614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-tglb6/igt@kms_big_fb@yf-tiled-16bpp-rotate-1=
80.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D111615" target=3D"_blank">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-tglb1/igt@kms_ccs@pipe-a-bad-rotation-90-4_t=
iled_dg2_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/6095" target=3D"_blank">i915#6095</a>) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-apl2/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_=
tiled_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" target=
=3D"_blank">i915#3886</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-iclb2/igt@kms_ccs@pipe-a-crc-primary-basic-4=
_tiled_dg2_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D109278" target=3D"_blank">fdo#109278</a>=
) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-tglb3/igt@kms_ccs@pipe-a-crc-primary-rotatio=
n-180-yf_tiled_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D111615" target=3D"_blank">fdo#111615</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3689" target=
=3D"_blank">i915#3689</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-tglb6/igt@kms_ccs@pipe-b-bad-pixel-format-4_=
tiled_dg2_rc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/3689" target=3D"_blank">i915#3689</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6095" target=3D"=
_blank">i915#6095</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-tglb7/igt@kms_ccs@pipe-d-crc-sprite-planes-b=
asic-y_tiled_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/3689" target=3D"_blank">i915#36=
89</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium@hdmi-edid-stress-resolution-4k} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-tglb1/igt@kms_chamelium@hdmi-edid-stress-res=
olution-4k.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109284" target=3D"_blank">fdo#109284</a>) +3 si=
milar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium@hdmi-edid-stress-resolution-non-4k} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-iclb3/igt@kms_chamelium@hdmi-edid-stress-res=
olution-non-4k.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109284" target=3D"_blank">fdo#109284</a>) +=
3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-snb2/igt@kms_chamelium@hdmi-hpd-for-each-pip=
e.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#=
111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-apl8/igt@kms_chamelium@hdmi-hpd-storm.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111827</a=
>) +8 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-tglb6/igt@kms_chamelium@hdmi-hpd-storm.html" =
target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109284" target=3D"_blank">fdo#109284</a> / <a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111827</=
a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-glk1/igt@kms_chamelium@hdmi-hpd-storm.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111827</a=
>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-iclb3/igt@kms_chamelium@hdmi-hpd-storm.html" =
target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109284" target=3D"_blank">fdo#109284</a> / <a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111827</=
a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-iclb3/igt@kms_content_protection@uevent.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/7118" target=3D"_blank">i915#7118</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-tglb8/igt@kms_content_protection@uevent.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/6944" target=3D"_blank">i915#6944</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/7118" target=3D"_blank">i915#7118</a>)=
</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-apl8/igt@kms_content_protection@uevent@pipe-=
a-dp-1.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/1339" target=3D"_blank">i915#1339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-tglb3/igt@kms_cursor_crc@cursor-onscreen-32x=
32.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3555" target=3D"_blank">i915#3555</a>) +1 similar issu=
e</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12351/shard-apl3/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html=
" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_8058/shard-apl2/igt@kms_cursor_crc@cursor-suspend@pipe-a-=
dp-1.html" target=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/180" target=3D"_blank">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa@atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-tglb6/igt@kms_cursor_legacy@cursorb-vs-flipa=
@atomic-transitions-varying-size.html" target=3D"_blank">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274" target=3D"_blank=
">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111825" target=3D"_blank">fdo#111825</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa@legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-iclb3/igt@kms_cursor_legacy@cursorb-vs-flipa=
@legacy.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109274" target=3D"_blank">fdo#109274</a>) +10 simi=
lar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-apl8/igt@kms_dsc@dsc-with-bpc-formats.html" =
target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/7205" target=3D"_blank">i915#7205</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12351/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-=
hdmi-a2.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_8058/shard-glk3/igt@kms_flip@2x-flip-vs-expir=
ed-vblank@ab-hdmi-a1-hdmi-a2.html" target=3D"_blank">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/2122" target=3D"_blank">i915=
#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-tglb8/igt@kms_flip@2x-nonexisting-fb.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109274" target=3D"_blank">fdo#109274</a> / <a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D111825" target=3D"_blank">fdo#111825</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3637" target=
=3D"_blank">i915#3637</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html" target=3D"_blank=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555=
" target=3D"_blank">i915#3555</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-4ti=
le-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html" target=3D"_bl=
ank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
587" target=3D"_blank">i915#2587</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2672" target=3D"_blank">i915#2672</a>) +4 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-yft=
ile-to-32bpp-yftile-upscaling@pipe-a-default-mode.html" target=3D"_blank">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672" t=
arget=3D"_blank">i915#2672</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p=
-primscrn-cur-indfb-onoff.html" target=3D"_blank">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/6497" target=3D"_blank">i915#64=
97</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-spr-indfb-draw-mmap-wc.html" target=3D"_blank">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109280" target=3D"_blank=
">fdo#109280</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111825" target=3D"_blank">fdo#111825</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-iclb1/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-pri-indfb-draw-pwrite.html" target=3D"_blank">SKIP</a> (<a href=3D"h=
ttps://bugs.freedesktop.org/show_bug.cgi?id=3D109280" target=3D"_blank">fdo=
#109280</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p=
>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-snb6/igt@kms_frontbuffer_tracking@psr-2p-scn=
dscrn-pri-indfb-draw-mmap-cpu.html" target=3D"_blank">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fd=
o#109271</a>) +138 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-tglb7/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-w=
ith-3-lanes.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109289" target=3D"_blank">fdo#109289</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-iclb7/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-w=
ith-3-lanes.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109289" target=3D"_blank">fdo#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-a-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-iclb7/igt@kms_plane_lowres@tiling-none@pipe-=
a-edp-1.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3536" target=3D"_blank">i915#3536</a>) +2 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-c-edp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-tglb7/igt@kms_plane_lowres@tiling-none@pipe-=
c-edp-1.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3536" target=3D"_blank">i915#3536</a>) +3 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12351/shard-iclb1/igt@kms_plane_scaling@planes-downscale-factor-0-5=
@pipe-a-edp-1.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb2/igt@kms_plane_scaling@=
planes-downscale-factor-0-5@pipe-a-edp-1.html" target=3D"_blank">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5235" target=3D"=
_blank">i915#5235</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-apl1/igt@kms_psr2_sf@plane-move-sf-dmg-area.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/658" target=3D"_blank">i915#658=
</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010@pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-iclb2/igt@kms_psr2_su@page_flip-p010@pipe-b-=
edp-1.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/5939" target=3D"_blank">i915#5939</a>) +2 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109441" target=3D"_blank">fdo#109441</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-tglb2/igt@kms_psr@psr2_primary_mmap_cpu.html"=
 target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/132" target=3D"_blank">i915#132</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/3467" target=3D"_blank">i915#3467</a>)</=
p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12351/shard-iclb5/igt@kms_psr_stress_test@invalidate-primary-flip-o=
verlay.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb5/igt@kms_psr_stress_test@inval=
idate-primary-flip-overlay.html" target=3D"_blank">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/5519" target=3D"_blank">i915#5=
519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@all:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-tglb2/igt@kms_selftest@all.html" target=3D"_b=
lank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
6433" target=3D"_blank">i915#6433</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-iclb6/igt@kms_selftest@all.html" target=3D"_b=
lank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
6433" target=3D"_blank">i915#6433</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-apl2/igt@kms_vblank@pipe-d-wait-idle.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/533" target=3D"_blank">i915#533</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-apl8/igt@kms_writeback@writeback-check-outpu=
t.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2437" target=3D"_blank">i915#=
2437</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-tglb2/igt@prime_vgem@fence-flip-hang.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109295" target=3D"_blank">fdo#109295</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-iclb7/igt@prime_vgem@fence-flip-hang.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109295" target=3D"_blank">fdo#109295</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-1:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-apl3/igt@sysfs_clients@fair-1.html" target=3D=
"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2994" target=3D"_blank">i915#2994</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-tglb7/igt@sysfs_clients@fair-1.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2994" target=3D"_blank">i915#2994</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-glk6/igt@sysfs_clients@fair-1.html" target=3D=
"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2994" target=3D"_blank">i915#2994</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8058/shard-iclb6/igt@sysfs_clients@fair-1.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2994" target=3D"_blank">i915#2994</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12351/shard-tglb6/igt@gem_ctx_exec@basic-nohangcheck.html" target=
=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/6268" target=3D"_blank">i915#6268</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb7/igt@gem_ctx_exec@basic-n=
ohangcheck.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12351/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html" target=3D=
"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2842" target=3D"_blank">i915#2842</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb6/igt@gem_exec_fair@basic-flo=
w@rcs0.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12351/shard-apl2/igt@gem_workarounds@suspend-resume-context.html" t=
arget=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/180" target=3D"_blank">i915#180</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-apl7/igt@gem_workarou=
nds@suspend-resume-context.html" target=3D"_blank">PASS</a> +3 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@sanitycheck:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12351/shard-snb6/igt@i915_selftest@mock@sanitycheck.html" target=3D=
"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271" target=3D"_blank">fdo#109271</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-snb2/igt@i915_selftest@mock@sa=
nitycheck.html" target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-h=
dmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12351/shard-glk2/igt@kms_atomic_transition@plane-primary-toggle-wit=
h-vblank-wait@pipe-a-hdmi-a-1.html" target=3D"_blank">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/118" target=3D"_blank=
">i915#118</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_8058/shard-glk6/igt@kms_atomic_transition@plane-primary-toggle-with-vb=
lank-wait@pipe-a-hdmi-a-1.html" target=3D"_blank">PASS</a> +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12351/shard-glk3/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html" targ=
et=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/5138" target=3D"_blank">i915#5138</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-glk2/igt@kms_big_fb@y-tiled-=
64bpp-rotate-180.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12351/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-=
hdmi-a2.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/79" target=3D"_blank">i915#79</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-glk3/igt@kms_=
flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html" target=3D"_blank">P=
ASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12351/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-=
downscale-factor-0-5@pipe-a-edp-1.html" target=3D"_blank">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/5235" target=3D"_blank"=
>i915#5235</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_8058/shard-iclb1/igt@kms_plane_scaling@planes-upscale-factor-0-25-down=
scale-factor-0-5@pipe-a-edp-1.html" target=3D"_blank">PASS</a> +2 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12351/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109441" target=3D"_blank">fdo#109441</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb2/igt@kms_psr@psr2_sprit=
e_plane_move.html" target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12351/shard-tglb6/igt@kms_psr_stress_test@invalidate-primary-flip-o=
verlay.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/5519" target=3D"_blank">i915#5519</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb1/igt@k=
ms_psr_stress_test@invalidate-primary-flip-overlay.html" target=3D"_blank">=
PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12351/shard-tglb8/igt@gem_pread@exhaustion.html" target=3D"_blank">W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658" t=
arget=3D"_blank">i915#2658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_8058/shard-tglb6/igt@gem_pread@exhaustion.html" target=
=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/7248" target=3D"_blank">i915#7248</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12351/shard-glk1/igt@gem_pread@exhaustion.html" target=3D"_blank">WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658" ta=
rget=3D"_blank">i915#2658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8058/shard-glk1/igt@gem_pread@exhaustion.html" target=
=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/7248" target=3D"_blank">i915#7248</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12351/shard-tglb6/igt@gem_pwrite@basic-exhaustion.html" target=3D"_b=
lank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/7248" target=3D"_blank">i915#7248</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-tglb7/igt@gem_pwrite@basic-exh=
austion.html" target=3D"_blank">WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/2658" target=3D"_blank">i915#2658</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12351/shard-glk9/igt@gem_pwrite@basic-exhaustion.html" target=3D"_bl=
ank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/7248" target=3D"_blank">i915#7248</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-glk2/igt@gem_pwrite@basic-exhau=
stion.html" target=3D"_blank">WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2658" target=3D"_blank">i915#2658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12351/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html" tar=
get=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2684" target=3D"_blank">i915#2684</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb8/igt@i915_pm_rc6_resid=
ency@rc6-idle@rcs0.html" target=3D"_blank">WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2684" target=3D"_blank">i915#2684</a>)=
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vecs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12351/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html" ta=
rget=3D"_blank">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2684" target=3D"_blank">i915#2684</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb8/igt@i915_pm_rc6_resi=
dency@rc6-idle@vecs0.html" target=3D"_blank">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2684" target=3D"_blank">i915#2684</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12351/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exce=
ed-fully-sf.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2920" target=3D"_blank">i915#2920</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb3/=
igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/658" target=3D"_blank">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12351/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2920" target=3D"_blank">i915#2920</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-iclb5/igt@kms_psr2=
_sf@overlay-plane-update-sf-dmg-area.html" target=3D"_blank">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068" target=3D"_bl=
ank">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/658" target=3D"_blank">i915#658</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_12351/shard-apl8/igt@runner@aborted.html" target=3D"_blank">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-=
apl8/igt@runner@aborted.html" target=3D"_blank">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-apl2/igt@runner@abort=
ed.html" target=3D"_blank">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_12351/shard-apl3/igt@runner@aborted.html" target=3D"_b=
lank">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
12351/shard-apl8/igt@runner@aborted.html" target=3D"_blank">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12351/shard-apl3/igt@=
runner@aborted.html" target=3D"_blank">FAIL</a>) (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180" target=3D"=
_blank">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/3002" target=3D"_blank">i915#3002</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/4312" target=3D"_blank">i915#4312</a>) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-apl8=
/igt@runner@aborted.html" target=3D"_blank">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_8058/shard-apl2/igt@runner@aborted.htm=
l" target=3D"_blank">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_8058/shard-apl7/igt@runner@aborted.html" target=3D"_blank">FA=
IL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002" t=
arget=3D"_blank">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/4312" target=3D"_blank">i915#4312</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br>
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7046 -&gt; IGTPW_8058</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br>
  CI_DRM_12351: 74d8166a994863d1f83e842c1822506a8f6aa806 @ git://<a href=3D=
"http://anongit.freedesktop.org/gfx-ci/linux" target=3D"_blank">anongit.fre=
edesktop.org/gfx-ci/linux</a><br>
  IGTPW_8058: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_805=
8/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_8058/index.html</a><br>
  IGT_7046: c58d96d0fe237474b074e3472ce09c57c830d5de @ <a href=3D"https://g=
itlab.freedesktop.org/drm/igt-gpu-tools.git" target=3D"_blank">https://gitl=
ab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://<a href=3D"=
http://anongit.freedesktop.org/piglit" target=3D"_blank">anongit.freedeskto=
p.org/piglit</a></p>

</div>

</div></blockquote></div>

--0000000000000bdaa005ecf92e96--
