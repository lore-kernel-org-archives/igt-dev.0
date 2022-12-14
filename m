Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E0110E414
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Dec 2022 15:08:39 +0000 (UTC)
Message-ID: <68fd0cc0-36e9-d0ae-c2d3-202597eec930@intel.com>
Date: Wed, 14 Dec 2022 16:08:28 +0100
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>
References: <20221214105142.249666-1-karolina.stolarek@intel.com>
 <167101963934.8285.2272792500307277143@emeril.freedesktop.org>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <167101963934.8285.2272792500307277143@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fccs=3A_Fix_memory_leak_in_destroy=5Fobject?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Yedireswarapu, SaiX Nandan" <saix.nandan.yedireswarapu@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 14.12.2022 13:07, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/gem_ccs: Fix memory leak in destroy_object
> *URL:*	https://patchwork.freedesktop.org/series/111926/ 
> <https://patchwork.freedesktop.org/series/111926/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_12503 -> IGTPW_8229
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_8229 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_8229, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/index.html
> 
> 
>     Participating hosts (18 -> 39)
> 
> Additional (21): fi-kbl-soraka bat-dg1-6 bat-dg1-5 bat-adlp-6 bat-rpls-1 
> fi-skl-6600u fi-bsw-n3050 bat-dg2-8 bat-adlm-1 bat-dg2-9 fi-hsw-4770 
> bat-adln-1 bat-atsm-1 bat-jsl-3 bat-rplp-1 bat-dg2-11 fi-bsw-nick 
> bat-dg1-7 bat-kbl-2 bat-adlp-9 bat-adlp-4
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_8229:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@i915_pm_rpm@module-reload:
> 
>       o bat-dg1-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-dg1-6/igt@i915_pm_rpm@module-reload.html>
>   *
> 
>     igt@i915_selftest@live@gt_heartbeat:
> 
>       o fi-ivb-3770: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12503/fi-ivb-3770/igt@i915_selftest@live@gt_heartbeat.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/fi-ivb-3770/igt@i915_selftest@live@gt_heartbeat.html>
> 

The function I changed isn't used in these tests, so I think these 
failures are not related to the patch.

Many thanks,
Karolina

>     Known issues
> 
> Here are the changes found in IGTPW_8229 that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@debugfs_test@basic-hwmon:
> 
>       o bat-adlp-4: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-adlp-4/igt@debugfs_test@basic-hwmon.html>
>         (i915#7456 <https://gitlab.freedesktop.org/drm/intel/issues/7456>)
>   *
> 
>     igt@gem_exec_gttfill@basic:
> 
>       o fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/fi-kbl-soraka/igt@gem_exec_gttfill@basic.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +7
>         similar issues
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o
> 
>         fi-skl-6600u: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/fi-skl-6600u/igt@gem_huc_copy@huc-copy.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
> 
>       o
> 
>         fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
> 
>   *
> 
>     igt@gem_lmem_swapping@basic:
> 
>       o fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3
>         similar issues
>   *
> 
>     igt@gem_lmem_swapping@parallel-random-engines:
> 
>       o fi-bsw-nick: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +39
>         similar issues
>   *
> 
>     igt@gem_lmem_swapping@random-engines:
> 
>       o
> 
>         fi-bsw-n3050: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +20
>         similar issues
> 
>       o
> 
>         fi-skl-6600u: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/fi-skl-6600u/igt@gem_lmem_swapping@random-engines.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3
>         similar issues
> 
>   *
> 
>     igt@gem_lmem_swapping@verify-random:
> 
>       o bat-adlp-4: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-adlp-4/igt@gem_lmem_swapping@verify-random.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3
>         similar issues
>   *
> 
>     igt@gem_mmap@basic:
> 
>       o
> 
>         bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-dg1-5/igt@gem_mmap@basic.html>
>         (i915#4083 <https://gitlab.freedesktop.org/drm/intel/issues/4083>)
> 
>       o
> 
>         bat-dg1-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-dg1-6/igt@gem_mmap@basic.html>
>         (i915#4083 <https://gitlab.freedesktop.org/drm/intel/issues/4083>)
> 
>   *
> 
>     igt@gem_render_tiled_blits@basic:
> 
>       o bat-dg1-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-dg1-6/igt@gem_render_tiled_blits@basic.html>
>         (i915#4079
>         <https://gitlab.freedesktop.org/drm/intel/issues/4079>) +1
>         similar issue
>   *
> 
>     igt@gem_tiled_fence_blits@basic:
> 
>       o
> 
>         bat-dg1-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-dg1-6/igt@gem_tiled_fence_blits@basic.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +2
>         similar issues
> 
>       o
> 
>         bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-dg1-5/igt@gem_tiled_fence_blits@basic.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +2
>         similar issues
> 
>   *
> 
>     igt@gem_tiled_pread_basic:
> 
>       o
> 
>         bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-dg1-5/igt@gem_tiled_pread_basic.html>
>         (i915#4079
>         <https://gitlab.freedesktop.org/drm/intel/issues/4079>) +1
>         similar issue
> 
>       o
> 
>         bat-adlp-4: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-adlp-4/igt@gem_tiled_pread_basic.html>
>         (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>)
> 
>   *
> 
>     igt@i915_pm_backlight@basic-brightness:
> 
>       o
> 
>         bat-dg1-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-dg1-6/igt@i915_pm_backlight@basic-brightness.html>
>         (i915#7561 <https://gitlab.freedesktop.org/drm/intel/issues/7561>)
> 
>       o
> 
>         bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-dg1-5/igt@i915_pm_backlight@basic-brightness.html>
>         (i915#7561 <https://gitlab.freedesktop.org/drm/intel/issues/7561>)
> 
>   *
> 
>     igt@i915_pm_rps@basic-api:
> 
>       o
> 
>         bat-dg1-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-dg1-6/igt@i915_pm_rps@basic-api.html>
>         (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
> 
>       o
> 
>         bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-dg1-5/igt@i915_pm_rps@basic-api.html>
>         (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
> 
>       o
> 
>         bat-adlp-4: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-adlp-4/igt@i915_pm_rps@basic-api.html>
>         (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
> 
>   *
> 
>     igt@i915_selftest@live@gt_pm:
> 
>       o fi-kbl-soraka: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html>
>         (i915#1886 <https://gitlab.freedesktop.org/drm/intel/issues/1886>)
>   *
> 
>     igt@i915_selftest@live@hangcheck:
> 
>       o fi-hsw-4770: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html>
>         (i915#4785 <https://gitlab.freedesktop.org/drm/intel/issues/4785>)
>   *
> 
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>       o fi-hsw-4770: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +11
>         similar issues
>   *
> 
>     igt@kms_addfb_basic@basic-x-tiled-legacy:
> 
>       o bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-dg1-5/igt@kms_addfb_basic@basic-x-tiled-legacy.html>
>         (i915#4212
>         <https://gitlab.freedesktop.org/drm/intel/issues/4212>) +7
>         similar issues
>   *
> 
>     igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>       o
> 
>         bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-dg1-5/igt@kms_addfb_basic@basic-y-tiled-legacy.html>
>         (i915#4215 <https://gitlab.freedesktop.org/drm/intel/issues/4215>)
> 
>       o
> 
>         bat-dg1-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-dg1-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html>
>         (i915#4215 <https://gitlab.freedesktop.org/drm/intel/issues/4215>)
> 
>   *
> 
>     igt@kms_addfb_basic@tile-pitch-mismatch:
> 
>       o bat-dg1-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-dg1-6/igt@kms_addfb_basic@tile-pitch-mismatch.html>
>         (i915#4212
>         <https://gitlab.freedesktop.org/drm/intel/issues/4212>) +7
>         similar issues
>   *
> 
>     igt@kms_chamelium@dp-crc-fast:
> 
>       o
> 
>         fi-hsw-4770: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/fi-hsw-4770/igt@kms_chamelium@dp-crc-fast.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +7
>         similar issues
> 
>       o
> 
>         bat-adlp-4: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-adlp-4/igt@kms_chamelium@dp-crc-fast.html>
>         (fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +8
>         similar issues
> 
>   *
> 
>     igt@kms_chamelium@dp-edid-read:
> 
>       o fi-bsw-n3050: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/fi-bsw-n3050/igt@kms_chamelium@dp-edid-read.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +8
>         similar issues
>   *
> 
>     igt@kms_chamelium@hdmi-crc-fast:
> 
>       o
> 
>         fi-skl-6600u: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/fi-skl-6600u/igt@kms_chamelium@hdmi-crc-fast.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +8
>         similar issues
> 
>       o
> 
>         bat-dg1-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-dg1-6/igt@kms_chamelium@hdmi-crc-fast.html>
>         (fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +8
>         similar issues
> 
>   *
> 
>     igt@kms_chamelium@hdmi-hpd-fast:
> 
>       o
> 
>         fi-bsw-nick: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/fi-bsw-nick/igt@kms_chamelium@hdmi-hpd-fast.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +8
>         similar issues
> 
>       o
> 
>         bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-dg1-5/igt@kms_chamelium@hdmi-hpd-fast.html>
>         (fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +8
>         similar issues
> 
>       o
> 
>         fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/fi-kbl-soraka/igt@kms_chamelium@hdmi-hpd-fast.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +7
>         similar issues
> 
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
> 
>       o
> 
>         bat-adlp-4: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html>
>         (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103>)
> 
>       o
> 
>         bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-dg1-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/intel/issues/4103> /
>         i915#4213 <https://gitlab.freedesktop.org/drm/intel/issues/4213>)
> 
>       o
> 
>         bat-dg1-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-dg1-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/intel/issues/4103> /
>         i915#4213 <https://gitlab.freedesktop.org/drm/intel/issues/4213>)
> 
>   *
> 
>     igt@kms_force_connector_basic@force-load-detect:
> 
>       o
> 
>         bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-dg1-5/igt@kms_force_connector_basic@force-load-detect.html>
>         (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285>)
> 
>       o
> 
>         bat-dg1-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-dg1-6/igt@kms_force_connector_basic@force-load-detect.html>
>         (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285>)
> 
>   *
> 
>     igt@kms_force_connector_basic@prune-stale-modes:
> 
>       o bat-adlp-4: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-adlp-4/igt@kms_force_connector_basic@prune-stale-modes.html>
>         (i915#4093
>         <https://gitlab.freedesktop.org/drm/intel/issues/4093>) +3
>         similar issues
>   *
> 
>     igt@kms_psr@sprite_plane_onoff:
> 
>       o
> 
>         bat-dg1-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-dg1-6/igt@kms_psr@sprite_plane_onoff.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072> /
>         i915#4078
>         <https://gitlab.freedesktop.org/drm/intel/issues/4078>) +3
>         similar issues
> 
>       o
> 
>         bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-dg1-5/igt@kms_psr@sprite_plane_onoff.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072> /
>         i915#4078
>         <https://gitlab.freedesktop.org/drm/intel/issues/4078>) +3
>         similar issues
> 
>       o
> 
>         fi-hsw-4770: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +3
>         similar issues
> 
>   *
> 
>     igt@kms_setmode@basic-clone-single-crtc:
> 
>       o
> 
>         bat-dg1-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-dg1-6/igt@kms_setmode@basic-clone-single-crtc.html>
>         (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
> 
>       o
> 
>         bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-dg1-5/igt@kms_setmode@basic-clone-single-crtc.html>
>         (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
> 
>       o
> 
>         bat-adlp-4: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-adlp-4/igt@kms_setmode@basic-clone-single-crtc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>)
> 
>   *
> 
>     igt@prime_vgem@basic-fence-read:
> 
>       o bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-dg1-5/igt@prime_vgem@basic-fence-read.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/intel/issues/3708>) +3
>         similar issues
>   *
> 
>     igt@prime_vgem@basic-gtt:
> 
>       o
> 
>         bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-dg1-5/igt@prime_vgem@basic-gtt.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/intel/issues/3708> /
>         i915#4077
>         <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +1
>         similar issue
> 
>       o
> 
>         bat-dg1-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-dg1-6/igt@prime_vgem@basic-gtt.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/intel/issues/3708> /
>         i915#4077
>         <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +1
>         similar issue
> 
>   *
> 
>     igt@prime_vgem@basic-read:
> 
>       o bat-dg1-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-dg1-6/igt@prime_vgem@basic-read.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/intel/issues/3708>) +3
>         similar issues
>   *
> 
>     igt@prime_vgem@basic-userptr:
> 
>       o
> 
>         bat-adlp-4: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-adlp-4/igt@prime_vgem@basic-userptr.html>
>         (fdo#109295
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>         i915#3301 <https://gitlab.freedesktop.org/drm/intel/issues/3301>
>         / i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>)
> 
>       o
> 
>         fi-skl-6600u: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/fi-skl-6600u/igt@prime_vgem@basic-userptr.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +4
>         similar issues
> 
>       o
> 
>         bat-dg1-5: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-dg1-5/igt@prime_vgem@basic-userptr.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/intel/issues/3708> /
>         i915#4873 <https://gitlab.freedesktop.org/drm/intel/issues/4873>)
> 
>       o
> 
>         bat-dg1-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-dg1-6/igt@prime_vgem@basic-userptr.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/intel/issues/3708> /
>         i915#4873 <https://gitlab.freedesktop.org/drm/intel/issues/4873>)
> 
>   *
> 
>     igt@prime_vgem@basic-write:
> 
>       o bat-adlp-4: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/bat-adlp-4/igt@prime_vgem@basic-write.html>
>         (fdo#109295
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>         i915#3291 <https://gitlab.freedesktop.org/drm/intel/issues/3291>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/intel/issues/3708>) +2
>         similar issues
>   *
> 
>     igt@runner@aborted:
> 
>       o fi-hsw-4770: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/fi-hsw-4770/igt@runner@aborted.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>
>         / i915#5594 <https://gitlab.freedesktop.org/drm/intel/issues/5594>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@gem_exec_gttfill@basic:
> 
>       o fi-pnv-d510: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12503/fi-pnv-d510/igt@gem_exec_gttfill@basic.html>
>         (i915#7229
>         <https://gitlab.freedesktop.org/drm/intel/issues/7229>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/fi-pnv-d510/igt@gem_exec_gttfill@basic.html>
>   *
> 
>     igt@i915_selftest@live@hangcheck:
> 
>       o {fi-ehl-2}: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12503/fi-ehl-2/igt@i915_selftest@live@hangcheck.html>
>         (i915#7654
>         <https://gitlab.freedesktop.org/drm/intel/issues/7654>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/fi-ehl-2/igt@i915_selftest@live@hangcheck.html>
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
> 
>       o fi-bsw-kefka: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12503/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html>
>         (i915#6298
>         <https://gitlab.freedesktop.org/drm/intel/issues/6298>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html>
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7092 -> IGTPW_8229
> 
> CI-20190529: 20190529
> CI_DRM_12503: 472fab449a0dd8e3d60f4daf887fa6157eed5284 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_8229: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8229/index.html
> IGT_7092: 59e3bf83f6bae0918276f880f969a10d279c657a @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
