Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0570410E6E8
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Sep 2022 15:32:34 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-349c4310cf7so72640107b3.3
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Sep 2022 08:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220921193629.244296-1-markyacoub@chromium.org>
 <166396516791.30117.2999835660764953284@emeril.freedesktop.org>
In-Reply-To: <166396516791.30117.2999835660764953284@emeril.freedesktop.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Mon, 26 Sep 2022 11:32:21 -0400
Message-ID: <CAJUqKUrjw6ULqvvAGjJ4JwgMraHYq99cSeyYXk6MhvQgOAnbdw@mail.gmail.com>
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Content-Type: multipart/alternative; boundary="00000000000074c3ee05e9963ca0"
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQ2hhbWVs?=
	=?utf-8?q?ium=3A_Make_autodiscover_discover_connectors_one_at_a_ti?=
	=?utf-8?q?me=2E_=28rev2=29?=
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

--00000000000074c3ee05e9963ca0
Content-Type: text/plain; charset="UTF-8"

Hello Lakshminarayana, this still looks like it's failing but it's a
different failure. Can i get a rerun? Thanks!

On Fri, Sep 23, 2022 at 4:32 PM Patchwork <patchwork@emeril.freedesktop.org>
wrote:

> *Patch Details*
> *Series:* Chamelium: Make autodiscover discover connectors one at a time.
> (rev2)
> *URL:* https://patchwork.freedesktop.org/series/108846/
> *State:* failure
> *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/index.html CI
> Bug Log - changes from CI_DRM_12171_full -> IGTPW_7828_full Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_7828_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7828_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/index.html
> Participating hosts (10 -> 7)
>
> Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005
> Possible new issues
>
> Here are the unknown changes that may have been introduced in
> IGTPW_7828_full:
> IGT changes Possible regressions
>
>    - igt@i915_pm_sseu@full-enable:
>       - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-apl2/igt@i915_pm_sseu@full-enable.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-apl6/igt@i915_pm_sseu@full-enable.html>
>
> Known issues
>
> Here are the changes found in IGTPW_7828_full that come from known issues:
> IGT changes Issues hit
>
>    -
>
>    igt@gem_exec_balancer@parallel-contexts:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-iclb1/igt@gem_exec_balancer@parallel-contexts.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb6/igt@gem_exec_balancer@parallel-contexts.html>
>       (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>       +2 similar issues
>    -
>
>    igt@gem_exec_fair@basic-deadline:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-glk5/igt@gem_exec_fair@basic-deadline.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-glk8/igt@gem_exec_fair@basic-deadline.html>
>       (i915#2846 <https://gitlab.freedesktop.org/drm/intel/issues/2846>)
>    -
>
>    igt@gem_exec_fair@basic-none-vip@rcs0:
>    -
>
>       shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglb1/igt@gem_exec_fair@basic-none-vip@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -
>
>       shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-glk1/igt@gem_exec_fair@basic-none-vip@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -
>
>       shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb1/igt@gem_exec_fair@basic-none-vip@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -
>
>    igt@gem_exec_fair@basic-pace-solo@rcs0:
>    -
>
>       shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-apl8/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -
>
>       shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-glk8/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-glk8/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -
>
>    igt@gem_huc_copy@huc-copy:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-tglb1/igt@gem_huc_copy@huc-copy.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglb7/igt@gem_huc_copy@huc-copy.html>
>       (i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
>    -
>
>    igt@gem_lmem_swapping@parallel-random-verify-ccs:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-apl3/igt@gem_lmem_swapping@parallel-random-verify-ccs.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>       +3 similar issues
>    -
>
>    igt@gem_pxp@reject-modify-context-protection-off-1:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb8/igt@gem_pxp@reject-modify-context-protection-off-1.html>
>       (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>    -
>
>    igt@gen9_exec_parse@allowed-single:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-glk1/igt@gen9_exec_parse@allowed-single.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-glk3/igt@gen9_exec_parse@allowed-single.html>
>       (i915#5566 <https://gitlab.freedesktop.org/drm/intel/issues/5566> /
>       i915#716 <https://gitlab.freedesktop.org/drm/intel/issues/716>)
>    -
>
>    igt@gen9_exec_parse@basic-rejected:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglb8/igt@gen9_exec_parse@basic-rejected.html>
>       (i915#2527 <https://gitlab.freedesktop.org/drm/intel/issues/2527> /
>       i915#2856 <https://gitlab.freedesktop.org/drm/intel/issues/2856>)
>       +1 similar issue
>    -
>
>    igt@gen9_exec_parse@batch-without-end:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb1/igt@gen9_exec_parse@batch-without-end.html>
>       (i915#2856 <https://gitlab.freedesktop.org/drm/intel/issues/2856>)
>       +1 similar issue
>    -
>
>    igt@i915_pm_dc@dc9-dpms:
>    -
>
>       shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-iclb6/igt@i915_pm_dc@dc9-dpms.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html>
>       (i915#4281 <https://gitlab.freedesktop.org/drm/intel/issues/4281>)
>       -
>
>       shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-apl3/igt@i915_pm_dc@dc9-dpms.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-apl6/igt@i915_pm_dc@dc9-dpms.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       -
>
>    igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>       (fdo#110892 <https://bugs.freedesktop.org/show_bug.cgi?id=110892>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglb7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>       (fdo#111644 <https://bugs.freedesktop.org/show_bug.cgi?id=111644> /
>       i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397> /
>       i915#2411 <https://gitlab.freedesktop.org/drm/intel/issues/2411>)
>       -
>
>    igt@i915_suspend@sysfs-reader:
>    - shard-snb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-snb2/igt@i915_suspend@sysfs-reader.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-snb6/igt@i915_suspend@sysfs-reader.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>    -
>
>    igt@kms_3d:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-glk9/igt@kms_3d.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-glk8/igt@kms_3d.html>
>       (i915#118 <https://gitlab.freedesktop.org/drm/intel/issues/118> /
>       i915#1888 <https://gitlab.freedesktop.org/drm/intel/issues/1888>)
>    -
>
>    igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
>       (i915#1769 <https://gitlab.freedesktop.org/drm/intel/issues/1769>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglb7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
>       (i915#1769 <https://gitlab.freedesktop.org/drm/intel/issues/1769>)
>       -
>
>    igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglb8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html>
>       (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html>
>       (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>       -
>
>    igt@kms_big_fb@y-tiled-8bpp-rotate-270:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb5/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html>
>       (fdo#110725 <https://bugs.freedesktop.org/show_bug.cgi?id=110725> /
>       fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>)
>    -
>
>    igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb1/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html>
>       (fdo#110723 <https://bugs.freedesktop.org/show_bug.cgi?id=110723>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglb1/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html>
>       (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>)
>       -
>
>    igt@kms_big_joiner@basic:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb5/igt@kms_big_joiner@basic.html>
>       (i915#2705 <https://gitlab.freedesktop.org/drm/intel/issues/2705>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglb8/igt@kms_big_joiner@basic.html>
>       (i915#2705 <https://gitlab.freedesktop.org/drm/intel/issues/2705>)
>       -
>
>    igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs_cc:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglb6/igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs_cc.html>
>       (i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>    -
>
>    igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglb6/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html>
>       (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>       i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>    -
>
>    igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-apl2/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +9 similar issues
>    -
>
>    igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_ccs:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglb2/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_ccs.html>
>       (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689>)
>    -
>
>    igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb2/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs.html>
>       (fdo#109278 <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +1 similar issue
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglb5/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs.html>
>       (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       -
>
>    igt@kms_ccs@pipe-c-crc-sprite-planes-basic-yf_tiled_ccs:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglb7/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-yf_tiled_ccs.html>
>       (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615> /
>       i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689>)
>       +2 similar issues
>    -
>
>    igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-glk7/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +2 similar issues
>    -
>
>    igt@kms_chamelium@vga-hpd-after-suspend:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-apl2/igt@kms_chamelium@vga-hpd-after-suspend.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +10 similar issues
>    -
>
>    igt@kms_chamelium@vga-hpd-with-enabled-mode:
>    -
>
>       shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-snb4/igt@kms_chamelium@vga-hpd-with-enabled-mode.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +1 similar issue
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglb3/igt@kms_chamelium@vga-hpd-with-enabled-mode.html>
>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +1 similar issue
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-glk8/igt@kms_chamelium@vga-hpd-with-enabled-mode.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +2 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb8/igt@kms_chamelium@vga-hpd-with-enabled-mode.html>
>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +1 similar issue
>       -
>
>    igt@kms_content_protection@mei_interface:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglb1/igt@kms_content_protection@mei_interface.html>
>       (i915#1063 <https://gitlab.freedesktop.org/drm/intel/issues/1063>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb6/igt@kms_content_protection@mei_interface.html>
>       (fdo#109300 <https://bugs.freedesktop.org/show_bug.cgi?id=109300> /
>       fdo#111066 <https://bugs.freedesktop.org/show_bug.cgi?id=111066>)
>       -
>
>    igt@kms_cursor_crc@cursor-random-32x32:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglb1/igt@kms_cursor_crc@cursor-random-32x32.html>
>       (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>    -
>
>    igt@kms_cursor_crc@cursor-sliding-512x512:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglb3/igt@kms_cursor_crc@cursor-sliding-512x512.html>
>       (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb1/igt@kms_cursor_crc@cursor-sliding-512x512.html>
>       (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>       -
>
>    igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-apl8/igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-apl8/igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1.html>
>       (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>) +1
>       similar issue
>    -
>
>    igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html>
>       (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103>)
>    -
>
>    igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html>
>       (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>)
>    -
>
>    igt@kms_flip@2x-nonexisting-fb:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-apl2/igt@kms_flip@2x-nonexisting-fb.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +195 similar issues
>    -
>
>    igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-apl3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-apl6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html>
>       (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>    -
>
>    igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-glk3/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html>
>       (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html>
>       (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>       +1 similar issue
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglb5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html>
>       (i915#2587 <https://gitlab.freedesktop.org/drm/intel/issues/2587> /
>       i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html>
>       (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>       +2 similar issues
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html>
>       (i915#2587 <https://gitlab.freedesktop.org/drm/intel/issues/2587> /
>       i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>       +3 similar issues
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html>
>       (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672> /
>       i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>    -
>
>    igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html>
>       (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280>)
>       +12 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html>
>       (i915#6497 <https://gitlab.freedesktop.org/drm/intel/issues/6497>)
>       +1 similar issue
>    -
>
>    igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-pwrite:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglb3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-pwrite.html>
>       (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280> /
>       fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
>       +10 similar issues
>    -
>
>    igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
>    -
>
>       shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html>
>       (fdo#108145 <https://bugs.freedesktop.org/show_bug.cgi?id=108145> /
>       i915#265 <https://gitlab.freedesktop.org/drm/intel/issues/265>) +1
>       similar issue
>       -
>
>       shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-glk1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html>
>       (fdo#108145 <https://bugs.freedesktop.org/show_bug.cgi?id=108145> /
>       i915#265 <https://gitlab.freedesktop.org/drm/intel/issues/265>)
>       -
>
>    igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
>    -
>
>       shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html>
>       (i915#265 <https://gitlab.freedesktop.org/drm/intel/issues/265>)
>       -
>
>       shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-glk7/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html>
>       (i915#265 <https://gitlab.freedesktop.org/drm/intel/issues/265>)
>       -
>
>    igt@kms_plane_scaling
>    @plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-glk6/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +48 similar issues
>    -
>
>    igt@kms_plane_scaling
>    @plane-upscale-with-rotation-factor-0-25@pipe-a-edp-1:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb5/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-edp-1.html>
>       (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>)
>       +5 similar issues
>    -
>
>    igt@kms_plane_scaling
>    @plane-upscale-with-rotation-factor-0-25@pipe-c-edp-1:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglb6/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-c-edp-1.html>
>       (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>)
>       +7 similar issues
>    -
>
>    igt@kms_plane_scaling
>    @planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglb8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1.html>
>       (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>)
>       +3 similar issues
>    -
>
>    igt@kms_plane_scaling
>    @planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-iclb3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html>
>       (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>)
>       +2 similar issues
>    -
>
>    igt@kms_psr2_su@page_flip-p010:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-apl6/igt@kms_psr2_su@page_flip-p010.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) +1
>       similar issue
>    -
>
>    igt@kms_psr@psr2_basic:
>    - shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglb7/igt@kms_psr@psr2_basic.html>
>       (i915#132 <https://gitlab.freedesktop.org/drm/intel/issues/132> /
>       i915#3467 <https://gitlab.freedesktop.org/drm/intel/issues/3467>)
>       +1 similar issue
>    -
>
>    igt@kms_psr@psr2_primary_mmap_cpu:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html>
>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>    -
>
>    igt@kms_psr@psr2_sprite_render:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb5/igt@kms_psr@psr2_sprite_render.html>
>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>       +1 similar issue
>    -
>
>    igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-snb4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +87 similar issues
>    -
>
>    igt@kms_setmode@basic@pipe-a-vga-1:
>    - shard-snb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-snb6/igt@kms_setmode@basic@pipe-a-vga-1.html>
>       (i915#5465 <https://gitlab.freedesktop.org/drm/intel/issues/5465>)
>       +1 similar issue
>    -
>
>    igt@kms_vblank@pipe-d-query-forked-hang:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb3/igt@kms_vblank@pipe-d-query-forked-hang.html>
>       (fdo#109278 <https://bugs.freedesktop.org/show_bug.cgi?id=109278>)
>       +10 similar issues
>    -
>
>    igt@kms_vblank@pipe-d-wait-idle:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-glk6/igt@kms_vblank@pipe-d-wait-idle.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#533 <https://gitlab.freedesktop.org/drm/intel/issues/533>)
>    -
>
>    igt@kms_writeback@writeback-pixel-formats:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-apl8/igt@kms_writeback@writeback-pixel-formats.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>       +1 similar issue
>    -
>
>    igt@nouveau_crc@pipe-a-source-outp-inactive:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb8/igt@nouveau_crc@pipe-a-source-outp-inactive.html>
>       (i915#2530 <https://gitlab.freedesktop.org/drm/intel/issues/2530>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglb6/igt@nouveau_crc@pipe-a-source-outp-inactive.html>
>       (i915#2530 <https://gitlab.freedesktop.org/drm/intel/issues/2530>)
>       -
>
>    igt@prime_nv_api@i915_nv_import_twice_check_flink_name:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglb5/igt@prime_nv_api@i915_nv_import_twice_check_flink_name.html>
>       (fdo#109291 <https://bugs.freedesktop.org/show_bug.cgi?id=109291>)
>       +1 similar issue
>    -
>
>    igt@prime_nv_test@i915_nv_sharing:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb7/igt@prime_nv_test@i915_nv_sharing.html>
>       (fdo#109291 <https://bugs.freedesktop.org/show_bug.cgi?id=109291>)
>    -
>
>    igt@sysfs_clients@split-10:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb8/igt@sysfs_clients@split-10.html>
>       (i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>
> Possible fixes
>
>    -
>
>    igt@gem_eio@reset-stress:
>    - shard-tglb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-tglb2/igt@gem_eio@reset-stress.html>
>       (i915#5784 <https://gitlab.freedesktop.org/drm/intel/issues/5784>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglb6/igt@gem_eio@reset-stress.html>
>    -
>
>    igt@gem_exec_fair@basic-pace-share@rcs0:
>    -
>
>       shard-apl: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-apl7/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-apl7/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>       -
>
>       shard-tglb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>       -
>
>       {shard-tglu}: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-tglu-3/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglu-5/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>       -
>
>    igt@gen9_exec_parse@allowed-all:
>    - shard-glk: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-glk1/igt@gen9_exec_parse@allowed-all.html>
>       (i915#5566 <https://gitlab.freedesktop.org/drm/intel/issues/5566> /
>       i915#716 <https://gitlab.freedesktop.org/drm/intel/issues/716>) ->
>       PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-glk7/igt@gen9_exec_parse@allowed-all.html>
>    -
>
>    igt@i915_pm_rpm@system-suspend-execbuf:
>    - shard-iclb: INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-iclb7/igt@i915_pm_rpm@system-suspend-execbuf.html>
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb3/igt@i915_pm_rpm@system-suspend-execbuf.html>
>    -
>
>    igt@i915_pm_rps@engine-order:
>    - shard-apl: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-apl7/igt@i915_pm_rps@engine-order.html>
>       (i915#6537 <https://gitlab.freedesktop.org/drm/intel/issues/6537>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-apl6/igt@i915_pm_rps@engine-order.html>
>    -
>
>    igt@i915_selftest@live@hangcheck:
>    - shard-tglb: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-tglb1/igt@i915_selftest@live@hangcheck.html>
>       (i915#5591 <https://gitlab.freedesktop.org/drm/intel/issues/5591>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglb8/igt@i915_selftest@live@hangcheck.html>
>    -
>
>    igt@kms_big_fb@linear-16bpp-rotate-180:
>    - shard-glk: DMESG-FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-glk7/igt@kms_big_fb@linear-16bpp-rotate-180.html>
>       (i915#118 <https://gitlab.freedesktop.org/drm/intel/issues/118> /
>       i915#1888 <https://gitlab.freedesktop.org/drm/intel/issues/1888>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-glk7/igt@kms_big_fb@linear-16bpp-rotate-180.html>
>    -
>
>    igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:
>    - shard-tglb: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-tglb2/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html>
>       (i915#2411 <https://gitlab.freedesktop.org/drm/intel/issues/2411> /
>       i915#2867 <https://gitlab.freedesktop.org/drm/intel/issues/2867>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglb1/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html>
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html>
>       (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html>
>    -
>
>    igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
>    - shard-apl: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-apl8/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html>
>       (i915#62 <https://gitlab.freedesktop.org/drm/intel/issues/62>) ->
>       PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-apl6/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html>
>       +1 similar issue
>    -
>
>    igt@kms_psr2_su@page_flip-xrgb8888:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-iclb7/igt@kms_psr2_su@page_flip-xrgb8888.html>
>       (fdo#109642 <https://bugs.freedesktop.org/show_bug.cgi?id=109642> /
>       fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) ->
>       PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html>
>       +1 similar issue
>    -
>
>    igt@kms_psr@psr2_sprite_blt:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-iclb6/igt@kms_psr@psr2_sprite_blt.html>
>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html>
>    -
>
>    igt@kms_vblank@pipe-b-ts-continuation-suspend:
>    - shard-apl: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-apl8/igt@kms_vblank@pipe-b-ts-continuation-suspend.html>
>       (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>) ->
>       PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html>
>       +4 similar issues
>
> Warnings
>
>    -
>
>    igt@i915_pm_dc@dc3co-vpb-simulation:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-iclb4/igt@i915_pm_dc@dc3co-vpb-simulation.html>
>       (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) ->
>       SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html>
>       (i915#588 <https://gitlab.freedesktop.org/drm/intel/issues/588>)
>    -
>
>    igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html>
>       (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb8/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html>
>       (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>    -
>
>    igt@runner@aborted:
>    - shard-apl: (FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-apl8/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-apl8/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-apl6/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-apl2/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-apl2/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-apl1/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-apl2/igt@runner@aborted.html>)
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180> /
>       i915#3002 <https://gitlab.freedesktop.org/drm/intel/issues/3002> /
>       i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>)
>       -> (FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-apl7/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-apl1/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-apl8/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-apl8/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-apl2/igt@runner@aborted.html>)
>       (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180> /
>       i915#3002 <https://gitlab.freedesktop.org/drm/intel/issues/3002> /
>       i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>)
>
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> Build changes
>
>    - CI: CI-20190529 -> None
>    - IGT: IGT_6662 -> IGTPW_7828
>    - Piglit: piglit_4509 -> None
>
> CI-20190529: 20190529
> CI_DRM_12171: 37f64f22c82d8003c6509dd8e4928ee0348bd27f @ git://
> anongit.freedesktop.org/gfx-ci/linux
> IGTPW_7828: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/index.html
> IGT_6662: dcb1d7a8822e62935f4fe3f2e6a04caaee669369 @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://
> anongit.freedesktop.org/piglit
>

--00000000000074c3ee05e9963ca0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Lakshminarayana, this still looks like it&#39;s fail=
ing but it&#39;s a different failure. Can i get a rerun? Thanks!</div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep=
 23, 2022 at 4:32 PM Patchwork &lt;<a href=3D"mailto:patchwork@emeril.freed=
esktop.org">patchwork@emeril.freedesktop.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg-8849840261987=
872798">
<u></u>

=20
 =20
 =20
 =20

<div>


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>Chamelium: Make autodiscover discover=
 connectors one at a time. (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/108846/" target=3D"_blank">https://patchwork.freedesktop.org/series/10=
8846/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7828/index.html" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7828/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from CI_DRM_12171_full -&gt; IGTPW_7828_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7828_full absolutely need to b=
e<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in IGTPW_7828_full, please notify your bug team to allow them<=
br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7828/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7828/index.html</a></p>
<h2>Participating hosts (10 -&gt; 7)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7828=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_pm_sseu@full-enable:<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12171/shard-apl2/igt@i915_pm_sseu@full-enable.html" target=3D"_blan=
k">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7828/shard-apl6/igt@i915_pm_sseu@full-enable.html" target=3D"_blank">FAIL<=
/a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7828_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12171/shard-iclb1/igt@gem_exec_balancer@parallel-contexts.html" tar=
get=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7828/shard-iclb6/igt@gem_exec_balancer@parallel-contexts.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4525" target=3D"_blank">i915#4525</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12171/shard-glk5/igt@gem_exec_fair@basic-deadline.html" target=3D"_=
blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7828/shard-glk8/igt@gem_exec_fair@basic-deadline.html" target=3D"_blan=
k">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/284=
6" target=3D"_blank">i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7828/shard-tglb1/igt@gem_exec_fair@basic-none-vip@rcs0.h=
tml" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2842" target=3D"_blank">i915#2842</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7828/shard-glk1/igt@gem_exec_fair@basic-none-vip@rcs0.ht=
ml" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2842" target=3D"_blank">i915#2842</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7828/shard-iclb1/igt@gem_exec_fair@basic-none-vip@rcs0.h=
tml" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2842" target=3D"_blank">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12171/shard-apl8/igt@gem_exec_fair@basic-pace-solo@rcs0.html" target=
=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7828/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html" targ=
et=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2842" target=3D"_blank">i915#2842</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12171/shard-glk8/igt@gem_exec_fair@basic-pace-solo@rcs0.html" target=
=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7828/shard-glk8/igt@gem_exec_fair@basic-pace-solo@rcs0.html" targ=
et=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2842" target=3D"_blank">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12171/shard-tglb1/igt@gem_huc_copy@huc-copy.html" target=3D"_blank"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
828/shard-tglb7/igt@gem_huc_copy@huc-copy.html" target=3D"_blank">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190" target=3D=
"_blank">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-apl3/igt@gem_lmem_swapping@parallel-random-v=
erify-ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613" target=3D"_blan=
k">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-iclb8/igt@gem_pxp@reject-modify-context-prot=
ection-off-1.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/4270" target=3D"_blank">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12171/shard-glk1/igt@gen9_exec_parse@allowed-single.html" target=3D=
"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7828/shard-glk3/igt@gen9_exec_parse@allowed-single.html" target=3D"_=
blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5566" target=3D"_blank">i915#5566</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/716" target=3D"_blank">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-tglb8/igt@gen9_exec_parse@basic-rejected.htm=
l" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/2527" target=3D"_blank">i915#2527</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2856" target=3D"_blank">i915#2856</a=
>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-iclb1/igt@gen9_exec_parse@batch-without-end.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2856" target=3D"_blank">i915#2856</a>) +1 similar issue</=
li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12171/shard-iclb6/igt@i915_pm_dc@dc9-dpms.html" target=3D"_blank">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828=
/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html" target=3D"_blank">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/4281" target=3D"_bla=
nk">i915#4281</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12171/shard-apl3/igt@i915_pm_dc@dc9-dpms.html" target=3D"_blank">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/=
shard-apl6/igt@i915_pm_dc@dc9-dpms.html" target=3D"_blank">SKIP</a> (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blan=
k">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7828/shard-iclb7/igt@i915_pm_rpm@modeset-non-lpsp-stress=
-no-wait.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D110892" target=3D"_blank">fdo#110892</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7828/shard-tglb7/igt@i915_pm_rpm@modeset-non-lpsp-stress=
-no-wait.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D111644" target=3D"_blank">fdo#111644</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1397" target=3D"_blank=
">i915#1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2411" target=3D"_blank">i915#2411</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12171/shard-snb2/igt@i915_suspend@sysfs-reader.html" target=3D"_bla=
nk">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7828/shard-snb6/igt@i915_suspend@sysfs-reader.html" target=3D"_blank">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271" ta=
rget=3D"_blank">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12171/shard-glk9/igt@kms_3d.html" target=3D"_blank">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-glk8/i=
gt@kms_3d.html" target=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/118" target=3D"_blank">i915#118</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888" target=3D"_bl=
ank">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7828/shard-iclb5/igt@kms_atomic_transition@plane-all-mod=
eset-transition-fencing.html" target=3D"_blank">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1769" target=3D"_blank">i915#1769=
</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7828/shard-tglb7/igt@kms_atomic_transition@plane-all-mod=
eset-transition-fencing.html" target=3D"_blank">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1769" target=3D"_blank">i915#1769=
</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7828/shard-tglb8/igt@kms_big_fb@4-tiled-max-hw-stride-32=
bpp-rotate-0.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/5286" target=3D"_blank">i915#5286</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7828/shard-iclb5/igt@kms_big_fb@4-tiled-max-hw-stride-32=
bpp-rotate-0.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/5286" target=3D"_blank">i915#5286</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-iclb5/igt@kms_big_fb@y-tiled-8bpp-rotate-270=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D110725" target=3D"_blank">fdo#110725</a> / <a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D111614" target=3D"_blank">fdo#1=
11614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7828/shard-iclb1/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D110723" target=3D"_blank">fdo#110723</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7828/shard-tglb1/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111615" target=3D"_blank">fdo#111615</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7828/shard-iclb5/igt@kms_big_joiner@basic.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2705" target=3D"_blank">i915#2705</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7828/shard-tglb8/igt@kms_big_joiner@basic.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2705" target=3D"_blank">i915#2705</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-tglb6/igt@kms_ccs@pipe-b-bad-rotation-90-4_t=
iled_dg2_rc_ccs_cc.html" target=3D"_blank">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/6095" target=3D"_blank">i915#6095</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-tglb6/igt@kms_ccs@pipe-b-crc-primary-rotatio=
n-180-4_tiled_dg2_rc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/3689" target=3D"_blank">i915#368=
9</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6095" ta=
rget=3D"_blank">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-apl2/igt@kms_ccs@pipe-b-crc-sprite-planes-ba=
sic-y_tiled_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https=
://bugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" =
target=3D"_blank">i915#3886</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-tglb2/igt@kms_ccs@pipe-b-random-ccs-data-y_t=
iled_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3689" target=3D"_blank">i915#3689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7828/shard-iclb2/igt@kms_ccs@pipe-b-random-ccs-data-y_ti=
led_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D109278" target=3D"_blank">fdo#109278</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" target=
=3D"_blank">i915#3886</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7828/shard-tglb5/igt@kms_ccs@pipe-b-random-ccs-data-y_ti=
led_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/3689" target=3D"_blank">i915#3689</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" target=3D"=
_blank">i915#3886</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-tglb7/igt@kms_ccs@pipe-c-crc-sprite-planes-b=
asic-yf_tiled_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D111615" target=3D"_blank">fdo#111615</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3689" target=
=3D"_blank">i915#3689</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-glk7/igt@kms_ccs@pipe-c-missing-ccs-buffer-y=
_tiled_gen12_rc_ccs_cc.html" target=3D"_blank">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#10927=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" ta=
rget=3D"_blank">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-after-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-apl2/igt@kms_chamelium@vga-hpd-after-suspend=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#1=
11827</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-with-enabled-mode:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7828/shard-snb4/igt@kms_chamelium@vga-hpd-with-enabled-m=
ode.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fd=
o#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7828/shard-tglb3/igt@kms_chamelium@vga-hpd-with-enabled-=
mode.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109284" target=3D"_blank">fdo#109284</a> / <a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">f=
do#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7828/shard-glk8/igt@kms_chamelium@vga-hpd-with-enabled-m=
ode.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fd=
o#111827</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7828/shard-iclb8/igt@kms_chamelium@vga-hpd-with-enabled-=
mode.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109284" target=3D"_blank">fdo#109284</a> / <a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">f=
do#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7828/shard-tglb1/igt@kms_content_protection@mei_interfac=
e.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1063" target=3D"_blank">i915#1063</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7828/shard-iclb6/igt@kms_content_protection@mei_interfac=
e.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109300" target=3D"_blank">fdo#109300</a> / <a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D111066" target=3D"_blank">fdo#=
111066</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-tglb1/igt@kms_cursor_crc@cursor-random-32x32=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/3555" target=3D"_blank">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7828/shard-tglb3/igt@kms_cursor_crc@cursor-sliding-512x5=
12.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3359" target=3D"_blank">i915#3359</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7828/shard-iclb1/igt@kms_cursor_crc@cursor-sliding-512x5=
12.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3359" target=3D"_blank">i915#3359</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12171/shard-apl8/igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1.html=
" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7828/shard-apl8/igt@kms_cursor_crc@cursor-suspend@pipe-c-=
dp-1.html" target=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/180" target=3D"_blank">i915#180</a>) +1 simila=
r issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-iclb7/igt@kms_cursor_legacy@basic-busy-flip-=
before-cursor.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/4103" target=3D"_blank">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:</p=
>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12171/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transi=
tions-varying-size.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-glk8/igt@kms_cursor_leg=
acy@flip-vs-cursor@atomic-transitions-varying-size.html" target=3D"_blank">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346" =
target=3D"_blank">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-apl2/igt@kms_flip@2x-nonexisting-fb.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +195 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12171/shard-apl3/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
a-dp1.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7828/shard-apl6/igt@kms_flip@flip-vs-expired-vb=
lank-interruptible@a-dp1.html" target=3D"_blank">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/79" target=3D"_blank">i915#79</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12171/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html=
" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7828/shard-glk3/igt@kms_flip@flip-vs-expired-vblank@b-hdm=
i-a1.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/79" target=3D"_blank">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html" target=3D"_blank=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672=
" target=3D"_blank">i915#2672</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-tglb5/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html" target=3D"_blank">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2587" =
target=3D"_blank">i915#2587</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2672" target=3D"_blank">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html" target=3D"_blank=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555=
" target=3D"_blank">i915#3555</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-yft=
ile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html" target=3D"_blank">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2587" tar=
get=3D"_blank">i915#2587</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/2672" target=3D"_blank">i915#2672</a>) +3 similar issues</li=
>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html" target=3D"_bla=
nk">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/26=
72" target=3D"_blank">i915#2672</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/3555" target=3D"_blank">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-pri-indfb-draw-render.html" target=3D"_blank">SKIP</a> (<a href=3D"h=
ttps://bugs.freedesktop.org/show_bug.cgi?id=3D109280" target=3D"_blank">fdo=
#109280</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p=
-primscrn-cur-indfb-move.html" target=3D"_blank">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/6497" target=3D"_blank">i915#649=
7</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-tglb3/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-pri-indfb-draw-pwrite.html" target=3D"_blank">SKIP</a> (<a href=3D"h=
ttps://bugs.freedesktop.org/show_bug.cgi?id=3D109280" target=3D"_blank">fdo=
#109280</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
825" target=3D"_blank">fdo#111825</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7828/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-constan=
t-alpha-max.html" target=3D"_blank">FAIL</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D108145" target=3D"_blank">fdo#108145</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/265" target=3D"_bla=
nk">i915#265</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7828/shard-glk1/igt@kms_plane_alpha_blend@pipe-b-constan=
t-alpha-max.html" target=3D"_blank">FAIL</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D108145" target=3D"_blank">fdo#108145</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/265" target=3D"_bla=
nk">i915#265</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7828/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-alpha-t=
ransparent-fb.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/265" target=3D"_blank">i915#265</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7828/shard-glk7/igt@kms_plane_alpha_blend@pipe-c-alpha-t=
ransparent-fb.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/265" target=3D"_blank">i915#265</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hd=
mi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-glk6/igt@kms_plane_scaling@plane-downscale-w=
ith-rotation-factor-0-5@pipe-b-hdmi-a-2.html" target=3D"_blank">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"=
_blank">fdo#109271</a>) +48 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-edp=
-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-iclb5/igt@kms_plane_scaling@plane-upscale-wi=
th-rotation-factor-0-25@pipe-a-edp-1.html" target=3D"_blank">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176" target=3D"_bla=
nk">i915#5176</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-c-edp=
-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-tglb6/igt@kms_plane_scaling@plane-upscale-wi=
th-rotation-factor-0-25@pipe-c-edp-1.html" target=3D"_blank">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176" target=3D"_bla=
nk">i915#5176</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-=
edp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-tglb8/igt@kms_plane_scaling@planes-unity-sca=
ling-downscale-factor-0-25@pipe-d-edp-1.html" target=3D"_blank">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5235" target=3D"_=
blank">i915#5235</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12171/shard-iclb3/igt@kms_plane_scaling@planes-upscale-factor-0-25-=
downscale-factor-0-5@pipe-a-edp-1.html" target=3D"_blank">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb2/ig=
t@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-=
edp-1.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/5235" target=3D"_blank">i915#5235</a>) +2 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-apl6/igt@kms_psr2_su@page_flip-p010.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/658" target=3D"_blank">i915#658</a>) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-tglb7/igt@kms_psr@psr2_basic.html" target=3D=
"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/132" target=3D"_blank">i915#132</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3467" target=3D"_blank">i915#3467</a>) +1 similar =
issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12171/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html" target=3D=
"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7828/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html" target=3D"_=
blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109441" target=3D"_blank">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-iclb5/igt@kms_psr@psr2_sprite_render.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109441" target=3D"_blank">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-snb4/igt@kms_rotation_crc@primary-y-tiled-re=
flect-x-180.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +87 =
similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-snb6/igt@kms_setmode@basic@pipe-a-vga-1.html=
" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5465" target=3D"_blank">i915#5465</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-query-forked-hang:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-iclb3/igt@kms_vblank@pipe-d-query-forked-han=
g.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109278" target=3D"_blank">fdo#109278</a>) +10 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-glk6/igt@kms_vblank@pipe-d-wait-idle.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/533" target=3D"_blank">i915#533</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-apl8/igt@kms_writeback@writeback-pixel-forma=
ts.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/2437" target=3D"_blank">i915=
#2437</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-outp-inactive:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7828/shard-iclb8/igt@nouveau_crc@pipe-a-source-outp-inac=
tive.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2530" target=3D"_blank">i915#2530</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7828/shard-tglb6/igt@nouveau_crc@pipe-a-source-outp-inac=
tive.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2530" target=3D"_blank">i915#2530</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice_check_flink_name:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-tglb5/igt@prime_nv_api@i915_nv_import_twice_=
check_flink_name.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D109291" target=3D"_blank">fdo#109291</a>)=
 +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_nv_sharing:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-iclb7/igt@prime_nv_test@i915_nv_sharing.html=
" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109291" target=3D"_blank">fdo#109291</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-10:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7828/shard-iclb8/igt@sysfs_clients@split-10.html" targe=
t=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2994" target=3D"_blank">i915#2994</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12171/shard-tglb2/igt@gem_eio@reset-stress.html" target=3D"_blank">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5784" =
target=3D"_blank">i915#5784</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7828/shard-tglb6/igt@gem_eio@reset-stress.html" targe=
t=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12171/shard-apl7/igt@gem_exec_fair@basic-pace-share@rcs0.html" targe=
t=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2842" target=3D"_blank">i915#2842</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-apl7/igt@gem_exec_fair@basic-=
pace-share@rcs0.html" target=3D"_blank">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12171/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html" targ=
et=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2842" target=3D"_blank">i915#2842</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglb5/igt@gem_exec_fair@basi=
c-pace-share@rcs0.html" target=3D"_blank">PASS</a></p>
</li>
<li>
<p>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12171/shard-tglu-3/igt@gem_exec_fair@basic-pace-share@rcs0.html" tar=
get=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2842" target=3D"_blank">i915#2842</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglu-5/igt@gem_exec_fair@ba=
sic-pace-share@rcs0.html" target=3D"_blank">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12171/shard-glk1/igt@gen9_exec_parse@allowed-all.html" target=3D"_b=
lank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/5566" target=3D"_blank">i915#5566</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/716" target=3D"_blank">i915#716</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-glk7/igt=
@gen9_exec_parse@allowed-all.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12171/shard-iclb7/igt@i915_pm_rpm@system-suspend-execbuf.html" targ=
et=3D"_blank">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7828/shard-iclb3/igt@i915_pm_rpm@system-suspend-execbuf.h=
tml" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@engine-order:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12171/shard-apl7/igt@i915_pm_rps@engine-order.html" target=3D"_blan=
k">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/653=
7" target=3D"_blank">i915#6537</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7828/shard-apl6/igt@i915_pm_rps@engine-order.html"=
 target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12171/shard-tglb1/igt@i915_selftest@live@hangcheck.html" target=3D"=
_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/5591" target=3D"_blank">i915#5591</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-tglb8/igt@i915_selftest@live=
@hangcheck.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12171/shard-glk7/igt@kms_big_fb@linear-16bpp-rotate-180.html" targe=
t=3D"_blank">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/118" target=3D"_blank">i915#118</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/1888" target=3D"_blank">i915#1888</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-g=
lk7/igt@kms_big_fb@linear-16bpp-rotate-180.html" target=3D"_blank">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12171/shard-tglb2/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1=
.html" target=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2411" target=3D"_blank">i915#2411</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2867" target=3D"_blank">i9=
15#2867</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7828/shard-tglb1/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html" =
target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12171/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp=
-xtile-downscaling@pipe-a-default-mode.html" target=3D"_blank">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555" target=3D"_b=
lank">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7828/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bp=
p-xtile-downscaling@pipe-a-default-mode.html" target=3D"_blank">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12171/shard-apl8/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html" t=
arget=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/62" target=3D"_blank">i915#62</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-apl6/igt@kms_hdr@bpc-sw=
itch-suspend@pipe-a-dp-1.html" target=3D"_blank">PASS</a> +1 similar issue<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12171/shard-iclb7/igt@kms_psr2_su@page_flip-xrgb8888.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109642" target=3D"_blank">fdo#109642</a> / <a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D111068" target=3D"_blank">fdo#111068</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" target=3D"_b=
lank">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7828/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html" target=
=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12171/shard-iclb6/igt@kms_psr@psr2_sprite_blt.html" target=3D"_blan=
k">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1094=
41" target=3D"_blank">fdo#109441</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7828/shard-iclb2/igt@kms_psr@psr2_sprite_blt.htm=
l" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12171/shard-apl8/igt@kms_vblank@pipe-b-ts-continuation-suspend.html=
" target=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/180" target=3D"_blank">i915#180</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-apl1/igt@kms_vblan=
k@pipe-b-ts-continuation-suspend.html" target=3D"_blank">PASS</a> +4 simila=
r issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12171/shard-iclb4/igt@i915_pm_dc@dc3co-vpb-simulation.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/658" target=3D"_blank">i915#658</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-s=
imulation.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/588" target=3D"_blank">i915#588</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12171/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exce=
ed-fully-sf.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2920" target=3D"_blank">i915#2920</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-iclb8/=
igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/658" target=3D"_blank">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_12171/shard-apl8/igt@runner@aborted.html" target=3D"_blank">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-=
apl8/igt@runner@aborted.html" target=3D"_blank">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-apl6/igt@runner@abort=
ed.html" target=3D"_blank">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_12171/shard-apl2/igt@runner@aborted.html" target=3D"_b=
lank">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
12171/shard-apl2/igt@runner@aborted.html" target=3D"_blank">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-apl1/igt@=
runner@aborted.html" target=3D"_blank">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/CI_DRM_12171/shard-apl2/igt@runner@aborted.html" =
target=3D"_blank">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/180" target=3D"_blank">i915#180</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002" target=
=3D"_blank">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4312" target=3D"_blank">i915#4312</a>) -&gt; (<a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-apl7/igt@runner@aborted=
.html" target=3D"_blank">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7828/shard-apl1/igt@runner@aborted.html" target=3D"_blank=
">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/=
shard-apl8/igt@runner@aborted.html" target=3D"_blank">FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7828/shard-apl8/igt@runner@a=
borted.html" target=3D"_blank">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7828/shard-apl2/igt@runner@aborted.html" target=3D"=
_blank">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/180" target=3D"_blank">i915#180</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3002" target=3D"_blank">i915#3002</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/4312" target=3D"_blank">i9=
15#4312</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br>
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6662 -&gt; IGTPW_7828</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br>
  CI_DRM_12171: 37f64f22c82d8003c6509dd8e4928ee0348bd27f @ git://<a href=3D=
"http://anongit.freedesktop.org/gfx-ci/linux" target=3D"_blank">anongit.fre=
edesktop.org/gfx-ci/linux</a><br>
  IGTPW_7828: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_782=
8/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7828/index.html</a><br>
  IGT_6662: dcb1d7a8822e62935f4fe3f2e6a04caaee669369 @ <a href=3D"https://g=
itlab.freedesktop.org/drm/igt-gpu-tools.git" target=3D"_blank">https://gitl=
ab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://<a href=3D"=
http://anongit.freedesktop.org/piglit" target=3D"_blank">anongit.freedeskto=
p.org/piglit</a></p>

</div>

</div></blockquote></div>

--00000000000074c3ee05e9963ca0--
