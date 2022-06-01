Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8C11133B9
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Jun 2022 06:18:53 +0000 (UTC)
Message-ID: <176c41fa-0b94-2b0e-e78d-30ffab5b9a68@intel.com>
Date: Wed, 1 Jun 2022 08:16:13 +0200
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>, "Vudum, Lakshminarayana"
 <lakshminarayana.vudum@intel.com>
References: <20220531105654.1029576-1-karolina.drobnik@intel.com>
 <165401829550.17348.3579534632368490987@emeril.freedesktop.org>
From: Karolina Drobnik <karolina.drobnik@intel.com>
In-Reply-To: <165401829550.17348.3579534632368490987@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915=3A_Use_correct_type_for_gen_parameter?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lakshmi,

On 31.05.2022 19:31, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/i915: Use correct type for gen parameter
> *URL:*	https://patchwork.freedesktop.org/series/104543/ 
> <https://patchwork.freedesktop.org/series/104543/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_11710_full -> IGTPW_7200_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_7200_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7200_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/index.html
> 
> 
>     Participating hosts (13 -> 10)
> 
> Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> IGTPW_7200_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1:
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-iclb6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1.html>
>         +2 similar issues

I think this regression is not caused by my change, as I haven't modified
any kms tests. Could you take a look and confirm if this this the case?

Many thanks,
Karolina

>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   *
> 
>     igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled:
> 
>       o {shard-dg1}: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-dg1-18/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-dg1-19/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled.html>
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a-edp-1:
> 
>       o {shard-rkl}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a-edp-1.html>
>         +1 similar issue
> 
> 
>     New tests
> 
> New tests have been introduced between CI_DRM_11710_full and 
> IGTPW_7200_full:
> 
> 
>       New IGT tests (1)
> 
>   * igt@kms_atomic_interruptible@legacy-setmode@hdmi-a-3-pipe-a:
>       o Statuses : 1 pass(s)
>       o Exec time: [6.13] s
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_7200_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@gem_ctx_persistence@processes:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-snb4/igt@gem_ctx_persistence@processes.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#1099 <https://gitlab.freedesktop.org/drm/intel/issues/1099>)
>   *
> 
>     igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-iclb5/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-iclb1/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>   *
> 
>     igt@gem_exec_fair@basic-pace@vecs0:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) +1
>         similar issue
>   *
> 
>     igt@gem_exec_flush@basic-wb-rw-default:
> 
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-snb4/igt@gem_exec_flush@basic-wb-rw-default.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-snb6/igt@gem_exec_flush@basic-wb-rw-default.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1
>         similar issue
>   *
> 
>     igt@gem_lmem_swapping@verify-ccs:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-apl2/igt@gem_lmem_swapping@verify-ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>   *
> 
>     igt@gen7_exec_parse@oacontrol-tracking:
> 
>       o
> 
>         shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-snb7/igt@gen7_exec_parse@oacontrol-tracking.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +112
>         similar issues
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-tglb7/igt@gen7_exec_parse@oacontrol-tracking.html>
>         (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-iclb6/igt@gen7_exec_parse@oacontrol-tracking.html>
>         (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
> 
>   *
> 
>     igt@gen9_exec_parse@allowed-single:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-apl7/igt@gen9_exec_parse@allowed-single.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-apl1/igt@gen9_exec_parse@allowed-single.html>
>         (i915#5566
>         <https://gitlab.freedesktop.org/drm/intel/issues/5566> /
>         i915#716 <https://gitlab.freedesktop.org/drm/intel/issues/716>)
>   *
> 
>     igt@i915_pm_dc@dc6-psr:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-iclb1/igt@i915_pm_dc@dc6-psr.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-iclb7/igt@i915_pm_dc@dc6-psr.html>
>         (i915#454 <https://gitlab.freedesktop.org/drm/intel/issues/454>)
>   *
> 
>     igt@i915_pm_dc@dc9-dpms:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-apl3/igt@i915_pm_dc@dc9-dpms.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-apl1/igt@i915_pm_dc@dc9-dpms.html>
>         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>   *
> 
>     igt@i915_suspend@sysfs-reader:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-kbl7/igt@i915_suspend@sysfs-reader.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-kbl3/igt@i915_suspend@sysfs-reader.html>
>         (i915#3614 <https://gitlab.freedesktop.org/drm/intel/issues/3614>)
>   *
> 
>     igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-tglb3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/intel/issues/5286>) +1
>         similar issue
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-iclb8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/intel/issues/5286>) +1
>         similar issue
> 
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-kbl7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +26
>         similar issues
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-tglb7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html>
>         (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>)
> 
>   *
> 
>     igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-kbl4/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-glk4/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-iclb4/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>         i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
> 
>   *
> 
>     igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-apl6/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +4
>         similar issues
>   *
> 
>     igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-tglb1/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689>) +2
>         similar issues
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-glk1/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +20
>         similar issues
> 
>   *
> 
>     igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-iclb5/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278>) +3
>         similar issues
>   *
> 
>     igt@kms_chamelium@hdmi-hpd-storm:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-apl6/igt@kms_chamelium@hdmi-hpd-storm.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +6
>         similar issues
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-tglb6/igt@kms_chamelium@hdmi-hpd-storm.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +2
>         similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-iclb6/igt@kms_chamelium@hdmi-hpd-storm.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +2
>         similar issues
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-kbl3/igt@kms_chamelium@hdmi-hpd-storm.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +2
>         similar issues
> 
>       o
> 
>         shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-snb5/igt@kms_chamelium@hdmi-hpd-storm.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +4
>         similar issues
> 
>   *
> 
>     igt@kms_chamelium@vga-hpd-without-ddc:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-glk2/igt@kms_chamelium@vga-hpd-without-ddc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +1
>         similar issue
>   *
> 
>     igt@kms_cursor_crc@pipe-a-cursor-512x170-random:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html>
>         (fdo#109279
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109279> /
>         i915#3359
>         <https://gitlab.freedesktop.org/drm/intel/issues/3359>) +1
>         similar issue
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>         fdo#109279 <https://bugs.freedesktop.org/show_bug.cgi?id=109279>)
> 
>   *
> 
>     igt@kms_cursor_crc@pipe-b-cursor-512x170-rapid-movement:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-tglb6/igt@kms_cursor_crc@pipe-b-cursor-512x170-rapid-movement.html>
>         (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-tglb3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>         fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +2
>         similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-iclb4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html>
>         (fdo#109274
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>         fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278>) +1
>         similar issue
> 
>   *
> 
>     igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled.html>
>         (i915#5287 <https://gitlab.freedesktop.org/drm/intel/issues/5287>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-iclb6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled.html>
>         (i915#5287 <https://gitlab.freedesktop.org/drm/intel/issues/5287>)
> 
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html>
>         (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>         +1 similar issue
>   *
> 
>     igt@kms_flip@2x-flip-vs-suspend-interruptible:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-iclb3/igt@kms_flip@2x-flip-vs-suspend-interruptible.html>
>         (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend@a-dp1:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-apl4/igt@kms_flip@flip-vs-suspend@a-dp1.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>         +2 similar issues
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-glk4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html>
>         (i915#4911 <https://gitlab.freedesktop.org/drm/intel/issues/4911>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html>
>         (i915#1888
>         <https://gitlab.freedesktop.org/drm/intel/issues/1888> /
>         i915#2546 <https://gitlab.freedesktop.org/drm/intel/issues/2546>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280>) +7
>         similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-apl1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +55
>         similar issues
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-tglb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280> /
>         fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +7
>         similar issues
> 
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-pipe-d:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-apl2/igt@kms_pipe_crc_basic@read-crc-pipe-d.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#533
>         <https://gitlab.freedesktop.org/drm/intel/issues/533>) +1
>         similar issue
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-kbl7/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#533
>         <https://gitlab.freedesktop.org/drm/intel/issues/533>)
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-glk6/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#533
>         <https://gitlab.freedesktop.org/drm/intel/issues/533>)
> 
>   *
> 
>     igt@kms_plane_lowres@pipe-a-tiling-x:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-tglb1/igt@kms_plane_lowres@pipe-a-tiling-x.html>
>         (i915#3536 <https://gitlab.freedesktop.org/drm/intel/issues/3536>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-iclb3/igt@kms_plane_lowres@pipe-a-tiling-x.html>
>         (i915#3536 <https://gitlab.freedesktop.org/drm/intel/issues/3536>)
> 
>   *
> 
>     igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-apl2/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) +1
>         similar issue
>   *
> 
>     igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-tglb6/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html>
>         (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-iclb6/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html>
>         (fdo#111068
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111068> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>)
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-kbl3/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>)
> 
>   *
> 
>     igt@kms_psr@psr2_cursor_plane_move:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-iclb5/igt@kms_psr@psr2_cursor_plane_move.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) +2
>         similar issues
>   *
> 
>     igt@kms_writeback@writeback-invalid-parameters:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-tglb1/igt@kms_writeback@writeback-invalid-parameters.html>
>         (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-glk1/igt@kms_writeback@writeback-invalid-parameters.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-iclb3/igt@kms_writeback@writeback-invalid-parameters.html>
>         (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-kbl7/igt@kms_writeback@writeback-invalid-parameters.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
> 
>   *
> 
>     igt@kms_writeback@writeback-pixel-formats:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-apl3/igt@kms_writeback@writeback-pixel-formats.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2437
>         <https://gitlab.freedesktop.org/drm/intel/issues/2437>) +1
>         similar issue
>   *
> 
>     igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-tglb1/igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name.html>
>         (fdo#109291 <https://bugs.freedesktop.org/show_bug.cgi?id=109291>)
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-iclb6/igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name.html>
>         (fdo#109291 <https://bugs.freedesktop.org/show_bug.cgi?id=109291>)
> 
>   *
> 
>     igt@sysfs_clients@busy:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-apl3/igt@sysfs_clients@busy.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2994
>         <https://gitlab.freedesktop.org/drm/intel/issues/2994>) +1
>         similar issue
>   *
> 
>     igt@sysfs_clients@split-25:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-iclb1/igt@sysfs_clients@split-25.html>
>         (i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
> 
>       o
> 
>         shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-kbl3/igt@sysfs_clients@split-25.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-tglb6/igt@sysfs_clients@split-25.html>
>         (i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-glk7/igt@sysfs_clients@split-25.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@fbdev@nullptr:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-2/igt@fbdev@nullptr.html>
>         (i915#2582
>         <https://gitlab.freedesktop.org/drm/intel/issues/2582>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-rkl-6/igt@fbdev@nullptr.html>
>         +1 similar issue
>   *
> 
>     igt@feature_discovery@psr1:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-1/igt@feature_discovery@psr1.html>
>         (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-rkl-6/igt@feature_discovery@psr1.html>
>   *
> 
>     igt@gem_eio@kms:
> 
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-tglb5/igt@gem_eio@kms.html>
>         (i915#5784
>         <https://gitlab.freedesktop.org/drm/intel/issues/5784>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-tglb7/igt@gem_eio@kms.html>
>   *
> 
>     igt@gem_eio@unwedge-stress:
> 
>       o {shard-rkl}: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-2/igt@gem_eio@unwedge-stress.html>
>         (i915#3063
>         <https://gitlab.freedesktop.org/drm/intel/issues/3063>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-rkl-6/igt@gem_eio@unwedge-stress.html>
>   *
> 
>     igt@gem_exec_balancer@parallel-contexts:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-iclb3/igt@gem_exec_balancer@parallel-contexts.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/intel/issues/4525>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-iclb1/igt@gem_exec_balancer@parallel-contexts.html>
>   *
> 
>     igt@gem_exec_fair@basic-none@rcs0:
> 
>       o shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-kbl4/igt@gem_exec_fair@basic-none@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-kbl1/igt@gem_exec_fair@basic-none@rcs0.html>
>         +1 similar issue
>   *
> 
>     igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>       o
> 
>         {shard-rkl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-2/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-rkl-6/igt@gem_exec_fair@basic-pace-share@rcs0.html>
> 
>       o
> 
>         {shard-tglu}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-tglu-2/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-tglu-3/igt@gem_exec_fair@basic-pace-share@rcs0.html>
> 
>   *
> 
>     igt@gem_exec_fair@basic-pace@rcs0:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-glk2/igt@gem_exec_fair@basic-pace@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-glk2/igt@gem_exec_fair@basic-pace@rcs0.html>
>   *
> 
>     igt@gem_exec_flush@basic-wb-prw-default:
> 
>       o shard-snb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-snb6/igt@gem_exec_flush@basic-wb-prw-default.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-snb7/igt@gem_exec_flush@basic-wb-prw-default.html>
>         +2 similar issues
>   *
> 
>     igt@gem_exec_whisper@basic-queues-all:
> 
>       o shard-glk: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-glk2/igt@gem_exec_whisper@basic-queues-all.html>
>         (i915#118 <https://gitlab.freedesktop.org/drm/intel/issues/118>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-glk4/igt@gem_exec_whisper@basic-queues-all.html>
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o shard-tglb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-tglb6/igt@gem_huc_copy@huc-copy.html>
>         (i915#2190
>         <https://gitlab.freedesktop.org/drm/intel/issues/2190>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-tglb1/igt@gem_huc_copy@huc-copy.html>
>   *
> 
>     igt@i915_pm_dc@dc9-dpms:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html>
>         (i915#4281
>         <https://gitlab.freedesktop.org/drm/intel/issues/4281>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-iclb6/igt@i915_pm_dc@dc9-dpms.html>
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-fence:
> 
>       o {shard-tglu}: WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-fence.html>
>         (i915#2681
>         <https://gitlab.freedesktop.org/drm/intel/issues/2681>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-fence.html>
>   *
> 
>     igt@i915_selftest@live@hangcheck:
> 
>       o shard-snb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-snb5/igt@i915_selftest@live@hangcheck.html>
>         (i915#3921
>         <https://gitlab.freedesktop.org/drm/intel/issues/3921>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-snb4/igt@i915_selftest@live@hangcheck.html>
>   *
> 
>     igt@i915_suspend@sysfs-reader:
> 
>       o {shard-dg1}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-dg1-12/igt@i915_suspend@sysfs-reader.html>
>         (i915#2575
>         <https://gitlab.freedesktop.org/drm/intel/issues/2575>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-dg1-15/igt@i915_suspend@sysfs-reader.html>
>         +13 similar issues
>   *
> 
>     igt@kms_big_fb@linear-32bpp-rotate-0:
> 
>       o shard-glk: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-glk1/igt@kms_big_fb@linear-32bpp-rotate-0.html>
>         (i915#118 <https://gitlab.freedesktop.org/drm/intel/issues/118>
>         / i915#1888
>         <https://gitlab.freedesktop.org/drm/intel/issues/1888>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-glk5/igt@kms_big_fb@linear-32bpp-rotate-0.html>
>   *
> 
>     igt@kms_color@pipe-a-ctm-0-25:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-2/igt@kms_color@pipe-a-ctm-0-25.html>
>         (i915#1149
>         <https://gitlab.freedesktop.org/drm/intel/issues/1149> /
>         i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849>
>         / i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-rkl-6/igt@kms_color@pipe-a-ctm-0-25.html>
>   *
> 
>     igt@kms_color@pipe-b-ctm-green-to-red:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-4/igt@kms_color@pipe-b-ctm-green-to-red.html>
>         (i915#1149
>         <https://gitlab.freedesktop.org/drm/intel/issues/1149> /
>         i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070>
>         / i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-rkl-6/igt@kms_color@pipe-b-ctm-green-to-red.html>
>   *
> 
>     igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-1/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html>
>         (fdo#112022
>         <https://bugs.freedesktop.org/show_bug.cgi?id=112022> /
>         i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-rkl-6/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html>
>         +6 similar issues
>   *
> 
>     igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-2/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html>
>         (fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825> /
>         i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html>
>         +2 similar issues
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html>
>         (i915#2346
>         <https://gitlab.freedesktop.org/drm/intel/issues/2346>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html>
>   *
> 
>     igt@kms_cursor_legacy@pipe-c-torture-bo:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-2/igt@kms_cursor_legacy@pipe-c-torture-bo.html>
>         (i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-rkl-5/igt@kms_cursor_legacy@pipe-c-torture-bo.html>
>         +1 similar issue
>   *
> 
>     igt@kms_dp_aux_dev:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-5/igt@kms_dp_aux_dev.html>
>         (i915#1257
>         <https://gitlab.freedesktop.org/drm/intel/issues/1257>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-rkl-6/igt@kms_dp_aux_dev.html>
>   *
> 
>     igt@kms_draw_crc@draw-method-rgb565-render-untiled:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-4/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html>
>         (i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098> /
>         i915#4369
>         <https://gitlab.freedesktop.org/drm/intel/issues/4369>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-rkl-6/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html>
>   *
> 
>     igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-2/igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled.html>
>         (fdo#111314
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111314> /
>         i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>
>         / i915#4369
>         <https://gitlab.freedesktop.org/drm/intel/issues/4369>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled.html>
>         +2 similar issues
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html>
>         (i915#3701
>         <https://gitlab.freedesktop.org/drm/intel/issues/3701>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html>
>         +18 similar issues
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a.html>
>         (i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-rkl-6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a.html>
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-4/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html>
>         (i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html>
>         +1 similar issue
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-2/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070>
>         / i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html>
>         +2 similar issues
>   *
> 
>     igt@kms_plane_multiple@atomic-pipe-b-tiling-y:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-5/igt@kms_plane_multiple@atomic-pipe-b-tiling-y.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>         i915#3558 <https://gitlab.freedesktop.org/drm/intel/issues/3558>
>         / i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-rkl-6/igt@kms_plane_multiple@atomic-pipe-b-tiling-y.html>
>   *
> 
>     igt@kms_psr@psr2_sprite_plane_move:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html>
>         +2 similar issues
>   *
> 
>     igt@kms_psr@sprite_blt:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-5/igt@kms_psr@sprite_blt.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-rkl-6/igt@kms_psr@sprite_blt.html>
>         +1 similar issue
>   *
> 
>     igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-1/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070>
>         / i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-rkl-6/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html>
>         +1 similar issue
>   *
> 
>     igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
> 
>       o shard-snb: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-snb4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html>
>         (i915#5090
>         <https://gitlab.freedesktop.org/drm/intel/issues/5090>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-snb4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html>
>   *
> 
>     igt@kms_vblank@pipe-b-query-forked:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-4/igt@kms_vblank@pipe-b-query-forked.html>
>         (i915#1845
>         <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>         i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-rkl-6/igt@kms_vblank@pipe-b-query-forked.html>
>         +26 similar issues
>   *
> 
>     igt@perf_pmu@cpu-hotplug:
> 
>       o shard-snb: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-snb4/igt@perf_pmu@cpu-hotplug.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-snb2/igt@perf_pmu@cpu-hotplug.html>
>   *
> 
>     igt@prime_vgem@basic-fence-flip:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-rkl-1/igt@prime_vgem@basic-fence-flip.html>
>         (fdo#109295
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>         i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>
>         / i915#4098
>         <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-rkl-6/igt@prime_vgem@basic-fence-flip.html>
>   *
> 
>     igt@sysfs_heartbeat_interval@precise@rcs0:
> 
>       o {shard-dg1}: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-dg1-18/igt@sysfs_heartbeat_interval@precise@rcs0.html>
>         (i915#1755
>         <https://gitlab.freedesktop.org/drm/intel/issues/1755>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-dg1-17/igt@sysfs_heartbeat_interval@precise@rcs0.html>
>         +1 similar issue
> 
> 
>         Warnings
> 
>   *
> 
>     igt@gem_exec_balancer@parallel-ordering:
> 
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-iclb1/igt@gem_exec_balancer@parallel-ordering.html>
>         (i915#6117
>         <https://gitlab.freedesktop.org/drm/intel/issues/6117>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-iclb3/igt@gem_exec_balancer@parallel-ordering.html>
>         (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>   *
> 
>     igt@kms_fbcon_fbt@fbc-suspend:
> 
>       o shard-apl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>
>         / i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html>
>         (i915#4767 <https://gitlab.freedesktop.org/drm/intel/issues/4767>)
>   *
> 
>     igt@kms_hdr@bpc-switch@pipe-a-hdmi-a-1:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-glk9/igt@kms_hdr@bpc-switch@pipe-a-hdmi-a-1.html>
>         (i915#6079
>         <https://gitlab.freedesktop.org/drm/intel/issues/6079>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-glk8/igt@kms_hdr@bpc-switch@pipe-a-hdmi-a-1.html>
>         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>   *
> 
>     igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html>
>         (i915#2920
>         <https://gitlab.freedesktop.org/drm/intel/issues/2920>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-iclb7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html>
>         (fdo#111068
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111068> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>   *
> 
>     igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-iclb4/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html>
>         (fdo#111068
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111068> / i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html>
>         (i915#2920
>         <https://gitlab.freedesktop.org/drm/intel/issues/2920>) +1
>         similar issue
>   *
> 
>     igt@runner@aborted:
> 
>       o shard-apl: (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-apl3/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-apl6/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-apl6/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/shard-apl1/igt@runner@aborted.html>)
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>
>         / i915#3002
>         <https://gitlab.freedesktop.org/drm/intel/issues/3002> /
>         i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>
>         / i915#5257
>         <https://gitlab.freedesktop.org/drm/intel/issues/5257>) -> (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-apl1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-apl1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-apl2/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-apl2/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-apl2/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/shard-apl6/igt@runner@aborted.html>)
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#180
>         <https://gitlab.freedesktop.org/drm/intel/issues/180> /
>         i915#3002 <https://gitlab.freedesktop.org/drm/intel/issues/3002>
>         / i915#4312
>         <https://gitlab.freedesktop.org/drm/intel/issues/4312> /
>         i915#5257 <https://gitlab.freedesktop.org/drm/intel/issues/5257>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6500 -> IGTPW_7200
>   * Piglit: piglit_4509 -> None
> 
> CI-20190529: 20190529
> CI_DRM_11710: d2798c4b9213f0d14080bdeef58e692a2c01a0bf @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_7200: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7200/index.html
> IGT_6500: de4c6076a0f38ad3522b08931748f59d59a925ce @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
> 
