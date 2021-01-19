Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41CB76E061
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Jan 2021 09:22:16 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id a9so15506325wrt.5
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Jan 2021 01:22:16 -0800 (PST)
References: <20210118150024.4912-1-juhapekka.heikkila@gmail.com>
 <161100713987.28164.670992688036766215@emeril.freedesktop.org>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <01c60d2b-8f8c-3d0c-3833-1904d6e863e7@gmail.com>
Date: Tue, 19 Jan 2021 11:22:08 +0200
MIME-Version: 1.0
In-Reply-To: <161100713987.28164.670992688036766215@emeril.freedesktop.org>
Content-Language: en-US
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Frotation=5Fcrc=3A_?=
 =?utf-8?q?different_display_modes_can_have_different_crc?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lakshmi,

here's again failure which is unrelated to my patch, I was only patching 
kms_rotation_crc tests.

/Juha-Pekka

On 18.1.2021 23.58, Patchwork wrote:
> *Patch Details*
> *Series:*	series starting with [i-g-t,1/2] tests/kms_rotation_crc: 
> different display modes can have different crc
> *URL:*	https://patchwork.freedesktop.org/series/86000/
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/index.html
> 
> 
>   CI Bug Log - changes from CI_DRM_9636_full -> IGTPW_5399_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_5399_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_5399_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/index.html
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> IGTPW_5399_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@gem_exec_reloc@basic-many-active@vcs1:
>       o shard-iclb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-iclb4/igt@gem_exec_reloc@basic-many-active@vcs1.html>
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_5399_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@drm_import_export@flink:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-glk3/igt@drm_import_export@flink.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-glk8/igt@drm_import_export@flink.html>
>         (i915#2369 <https://gitlab.freedesktop.org/drm/intel/issues/2369>)
>   *
> 
>     igt@gem_ctx_persistence@engines-mixed:
> 
>       o shard-hsw: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-hsw7/igt@gem_ctx_persistence@engines-mixed.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#1099
>         <https://gitlab.freedesktop.org/drm/intel/issues/1099>) +3
>         similar issues
>   *
> 
>     igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-glk1/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +6
>         similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-iclb6/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html>
>         (i915#768 <https://gitlab.freedesktop.org/drm/intel/issues/768>)
> 
>   *
> 
>     igt@gem_userptr_blits@readonly-pwrite-unsync:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-tglb2/igt@gem_userptr_blits@readonly-pwrite-unsync.html>
>         (fdo#110426
>         <https://bugs.freedesktop.org/show_bug.cgi?id=110426> /
>         i915#1704 <https://gitlab.freedesktop.org/drm/intel/issues/1704>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-iclb1/igt@gem_userptr_blits@readonly-pwrite-unsync.html>
>         (fdo#110426
>         <https://bugs.freedesktop.org/show_bug.cgi?id=110426> /
>         i915#1704 <https://gitlab.freedesktop.org/drm/intel/issues/1704>)
> 
>   *
> 
>     igt@gen9_exec_parse@allowed-all:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-glk2/igt@gen9_exec_parse@allowed-all.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-glk1/igt@gen9_exec_parse@allowed-all.html>
>         (i915#1436
>         <https://gitlab.freedesktop.org/drm/intel/issues/1436> /
>         i915#716 <https://gitlab.freedesktop.org/drm/intel/issues/716>)
>   *
> 
>     igt@i915_module_load@reload-with-fault-injection:
> 
>       o shard-hsw: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-hsw2/igt@i915_module_load@reload-with-fault-injection.html>
>         (i915#2880 <https://gitlab.freedesktop.org/drm/intel/issues/2880>)
>   *
> 
>     igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp:
> 
>       o
> 
>         shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-iclb3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-iclb5/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html>
>         (i915#2768 <https://gitlab.freedesktop.org/drm/intel/issues/2768>)
> 
>       o
> 
>         shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-tglb8/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-tglb7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-edp.html>
>         (i915#2768 <https://gitlab.freedesktop.org/drm/intel/issues/2768>)
> 
>   *
> 
>     igt@i915_pm_rpm@pm-tiling:
> 
>       o
> 
>         shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-kbl1/igt@i915_pm_rpm@pm-tiling.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-kbl4/igt@i915_pm_rpm@pm-tiling.html>
>         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
> 
>       o
> 
>         shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-apl7/igt@i915_pm_rpm@pm-tiling.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-apl8/igt@i915_pm_rpm@pm-tiling.html>
>         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
> 
>       o
> 
>         shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-tglb7/igt@i915_pm_rpm@pm-tiling.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-tglb7/igt@i915_pm_rpm@pm-tiling.html>
>         (i915#579 <https://gitlab.freedesktop.org/drm/intel/issues/579>)
> 
>       o
> 
>         shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-glk7/igt@i915_pm_rpm@pm-tiling.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-glk6/igt@i915_pm_rpm@pm-tiling.html>
>         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
> 
>       o
> 
>         shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-iclb8/igt@i915_pm_rpm@pm-tiling.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-iclb5/igt@i915_pm_rpm@pm-tiling.html>
>         (i915#579 <https://gitlab.freedesktop.org/drm/intel/issues/579>)
> 
>   *
> 
>     igt@kms_ccs@pipe-d-missing-ccs-buffer:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-iclb8/igt@kms_ccs@pipe-d-missing-ccs-buffer.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278>) +2
>         similar issues
>   *
> 
>     igt@kms_chamelium@dp-frame-dump:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-iclb2/igt@kms_chamelium@dp-frame-dump.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +1
>         similar issue
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-glk9/igt@kms_chamelium@dp-frame-dump.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +1
>         similar issue
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-kbl4/igt@kms_chamelium@dp-frame-dump.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +1
>         similar issue
> 
>   *
> 
>     igt@kms_color_chamelium@pipe-b-ctm-limited-range:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-tglb1/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +1
>         similar issue
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-apl4/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +1
>         similar issue
> 
>   *
> 
>     igt@kms_color_chamelium@pipe-d-ctm-max:
> 
>       o shard-hsw: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-hsw5/igt@kms_color_chamelium@pipe-d-ctm-max.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +14
>         similar issues
>   *
> 
>     igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html>
>         (i915#72 <https://gitlab.freedesktop.org/drm/intel/issues/72>)
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-tglb5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html>
>         (fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +4
>         similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-iclb1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>         fdo#109278 <https://bugs.freedesktop.org/show_bug.cgi?id=109278>)
> 
>   *
> 
>     igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-glk9/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html>
>         (i915#2635 <https://gitlab.freedesktop.org/drm/intel/issues/2635>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:
> 
>       o shard-hsw: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-hsw7/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-hsw2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html>
>         (i915#2637
>         <https://gitlab.freedesktop.org/drm/intel/issues/2637>) +2
>         similar issues
>   *
> 
>     igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-glk9/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html>
>         (i915#1602
>         <https://gitlab.freedesktop.org/drm/intel/issues/1602>) +1
>         similar issue
>   *
> 
>     igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a1-hdmi-a2:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-glk5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-glk3/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html>
>         (i915#2122 <https://gitlab.freedesktop.org/drm/intel/issues/2122>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
> 
>       o shard-hsw: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-hsw7/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-hsw4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html>
>         (i915#2055
>         <https://gitlab.freedesktop.org/drm/intel/issues/2055> /
>         i915#2295 <https://gitlab.freedesktop.org/drm/intel/issues/2295>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
> 
>       o
> 
>         shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html>
>         (i915#49 <https://gitlab.freedesktop.org/drm/intel/issues/49>)
> 
>       o
> 
>         shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html>
>         (i915#49 <https://gitlab.freedesktop.org/drm/intel/issues/49>)
> 
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-kbl2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +9
>         similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-iclb7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280>) +3
>         similar issues
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-apl2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +9
>         similar issues
> 
>   *
> 
>     igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-kbl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#533
>         <https://gitlab.freedesktop.org/drm/intel/issues/533>)
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-glk4/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#533
>         <https://gitlab.freedesktop.org/drm/intel/issues/533>)
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-apl8/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#533
>         <https://gitlab.freedesktop.org/drm/intel/issues/533>)
> 
>   *
> 
>     igt@kms_psr@primary_page_flip:
> 
>       o shard-hsw: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-hsw7/igt@kms_psr@primary_page_flip.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +174
>         similar issues
>   *
> 
>     igt@kms_psr@psr2_suspend:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-iclb2/igt@kms_psr@psr2_suspend.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-iclb1/igt@kms_psr@psr2_suspend.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) +2
>         similar issues
>   *
> 
>     igt@kms_vblank@pipe-b-ts-continuation-suspend:
> 
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-tglb7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-tglb6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html>
>         (i915#456 <https://gitlab.freedesktop.org/drm/intel/issues/456>)
>   *
> 
>     igt@runner@aborted:
> 
>       o shard-hsw: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-hsw2/igt@runner@aborted.html>
>         (i915#2295
>         <https://gitlab.freedesktop.org/drm/intel/issues/2295> /
>         i915#2505 <https://gitlab.freedesktop.org/drm/intel/issues/2505>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@gem_ctx_persistence@close-replace-race:
> 
>       o shard-glk: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-glk4/igt@gem_ctx_persistence@close-replace-race.html>
>         (i915#2918
>         <https://gitlab.freedesktop.org/drm/intel/issues/2918>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-glk6/igt@gem_ctx_persistence@close-replace-race.html>
>   *
> 
>     {igt@gem_exec_fair@basic-flow@rcs0}:
> 
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html>
>   *
> 
>     {igt@gem_exec_fair@basic-none@vcs0}:
> 
>       o shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-kbl2/igt@gem_exec_fair@basic-none@vcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-kbl3/igt@gem_exec_fair@basic-none@vcs0.html>
>         +2 similar issues
>   *
> 
>     {igt@gem_exec_fair@basic-none@vecs0}:
> 
>       o shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-apl8/igt@gem_exec_fair@basic-none@vecs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-apl2/igt@gem_exec_fair@basic-none@vecs0.html>
>   *
> 
>     igt@gem_exec_reloc@basic-many-active@rcs0:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-glk3/igt@gem_exec_reloc@basic-many-active@rcs0.html>
>         (i915#2389
>         <https://gitlab.freedesktop.org/drm/intel/issues/2389>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-glk4/igt@gem_exec_reloc@basic-many-active@rcs0.html>
>   *
> 
>     igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
> 
>       o shard-hsw: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-hsw7/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-hsw4/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html>
>   *
> 
>     igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge:
> 
>       o shard-glk: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-glk6/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html>
>         (i915#118 <https://gitlab.freedesktop.org/drm/intel/issues/118>
>         / i915#95 <https://gitlab.freedesktop.org/drm/intel/issues/95>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-glk6/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html>
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@c-dp1:
> 
>       o shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-apl2/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html>
>         (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-apl3/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html>
>   *
> 
>     igt@kms_psr2_su@page_flip:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-iclb8/igt@kms_psr2_su@page_flip.html>
>         (fdo#109642
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109642> /
>         fdo#111068
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111068>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-iclb2/igt@kms_psr2_su@page_flip.html>
>   *
> 
>     igt@kms_psr@psr2_primary_blt:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-iclb3/igt@kms_psr@psr2_primary_blt.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-iclb2/igt@kms_psr@psr2_primary_blt.html>
>         +1 similar issue
> 
> 
>         Warnings
> 
>   *
> 
>     igt@runner@aborted:
> 
>       o
> 
>         shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-kbl6/igt@runner@aborted.html>
>         (i915#2295
>         <https://gitlab.freedesktop.org/drm/intel/issues/2295> /
>         i915#2505
>         <https://gitlab.freedesktop.org/drm/intel/issues/2505>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-kbl3/igt@runner@aborted.html>
>         (i915#2295 <https://gitlab.freedesktop.org/drm/intel/issues/2295>)
> 
>       o
> 
>         shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9636/shard-glk5/igt@runner@aborted.html>
>         (i915#2295
>         <https://gitlab.freedesktop.org/drm/intel/issues/2295> /
>         k.org#202321
>         <https://bugzilla.kernel.org/show_bug.cgi?id=202321>) -> (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-glk1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-glk1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-glk1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/shard-glk8/igt@runner@aborted.html>)
>         (i915#2295
>         <https://gitlab.freedesktop.org/drm/intel/issues/2295> /
>         i915#2722 <https://gitlab.freedesktop.org/drm/intel/issues/2722>
>         / k.org#202321 <https://bugzilla.kernel.org/show_bug.cgi?id=202321>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Participating hosts (10 -> 8)
> 
> Missing (2): pig-skl-6260u pig-glk-j5005
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_5960 -> IGTPW_5399
>   * Piglit: piglit_4509 -> None
> 
> CI-20190529: 20190529
> CI_DRM_9636: f560ac388c527f2f166897c9091f7b9ad652050f @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_5399: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5399/index.html
> IGT_5960: ace82fcd5f3623f8dde7c220a825873dc53dfae4 @ 
> git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
