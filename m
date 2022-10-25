Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6044610E296
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Oct 2022 08:31:40 +0000 (UTC)
Message-ID: <0251f735-c9b5-4e44-bc3f-dd5729ed9779@intel.com>
Date: Tue, 25 Oct 2022 10:31:36 +0200
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>
References: <cover.1666680959.git.karolina.drobnik@intel.com>
 <166668574913.15483.10303294265790133525@emeril.freedesktop.org>
From: Karolina Drobnik <karolina.drobnik@intel.com>
In-Reply-To: <166668574913.15483.10303294265790133525@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQWRkIHN1?=
 =?utf-8?q?pport_for_intel=5Fctx=5Ft_in_intel=5Fbb_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 25.10.2022 10:15, Patchwork wrote:
> *Patch Details*
> *Series:*	Add support for intel_ctx_t in intel_bb (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/109993/ 
> <https://patchwork.freedesktop.org/series/109993/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_12289 -> IGTPW_8000
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_8000 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_8000, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/index.html
> 
> 
>     Participating hosts (39 -> 40)
> 
> Additional (4): fi-kbl-soraka fi-hsw-4770 fi-rkl-11600 bat-adlp-6
> Missing (3): fi-ctg-p8600 fi-bdw-samus fi-tgl-dsi
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_8000:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@i915_selftest@live@hugepages:
>       o fi-kbl-soraka: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-kbl-soraka/igt@i915_selftest@live@hugepages.html>

This failure is not related to my changes.

Thanks,
Karolina

> 
>     Known issues
> 
> Here are the changes found in IGTPW_8000 that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@fbdev@read:
> 
>       o fi-bsw-nick: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-bsw-nick/igt@fbdev@read.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +5
>         similar issues
>   *
> 
>     igt@gem_exec_gttfill@basic:
> 
>       o fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-kbl-soraka/igt@gem_exec_gttfill@basic.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +9
>         similar issues
>   *
> 
>     igt@gem_exec_parallel@engines@contexts:
> 
>       o fi-bsw-nick: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-bsw-nick/igt@gem_exec_parallel@engines@contexts.html>
>         (i915#7311 <https://gitlab.freedesktop.org/drm/intel/issues/7311>)
>   *
> 
>     igt@gem_exec_suspend@basic-s3@smem:
> 
>       o fi-bdw-5557u: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html>
>         (i915#146 <https://gitlab.freedesktop.org/drm/intel/issues/146>)
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o
> 
>         fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
> 
>       o
> 
>         fi-rkl-11600: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html>
>         (i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
> 
>   *
> 
>     igt@gem_lmem_swapping@basic:
> 
>       o
> 
>         fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3
>         similar issues
> 
>       o
> 
>         fi-rkl-11600: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-rkl-11600/igt@gem_lmem_swapping@basic.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3
>         similar issues
> 
>   *
> 
>     igt@gem_softpin@allocator-basic-reserve:
> 
>       o fi-hsw-4770: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-hsw-4770/igt@gem_softpin@allocator-basic-reserve.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +9
>         similar issues
>   *
> 
>     igt@gem_tiled_pread_basic:
> 
>       o fi-rkl-11600: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-rkl-11600/igt@gem_tiled_pread_basic.html>
>         (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>)
>   *
> 
>     igt@i915_pm_backlight@basic-brightness:
> 
>       o
> 
>         fi-hsw-4770: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-hsw-4770/igt@i915_pm_backlight@basic-brightness.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3012 <https://gitlab.freedesktop.org/drm/intel/issues/3012>)
> 
>       o
> 
>         fi-rkl-11600: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html>
>         (i915#3012 <https://gitlab.freedesktop.org/drm/intel/issues/3012>)
> 
>   *
> 
>     igt@i915_pm_rpm@module-reload:
> 
>       o fi-cfl-8109u: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html>
>         (i915#62 <https://gitlab.freedesktop.org/drm/intel/issues/62>)
>   *
> 
>     igt@i915_selftest@live@gt_pm:
> 
>       o fi-kbl-soraka: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html>
>         (i915#1886 <https://gitlab.freedesktop.org/drm/intel/issues/1886>)
>   *
> 
>     igt@i915_selftest@live@guc_multi_lrc:
> 
>       o fi-cfl-8109u: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/fi-cfl-8109u/igt@i915_selftest@live@guc_multi_lrc.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-cfl-8109u/igt@i915_selftest@live@guc_multi_lrc.html>
>         (i915#5904
>         <https://gitlab.freedesktop.org/drm/intel/issues/5904> /
>         i915#7174
>         <https://gitlab.freedesktop.org/drm/intel/issues/7174>) +2
>         similar issues
>   *
> 
>     igt@i915_selftest@live@hangcheck:
> 
>       o fi-rkl-guc: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-rkl-guc/igt@i915_selftest@live@hangcheck.html>
>         (i915#4983 <https://gitlab.freedesktop.org/drm/intel/issues/4983>)
>   *
> 
>     igt@i915_selftest@live@hugepages:
> 
>       o
> 
>         fi-rkl-11600: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-rkl-11600/igt@i915_selftest@live@hugepages.html>
>         (i915#7311 <https://gitlab.freedesktop.org/drm/intel/issues/7311>)
> 
>       o
> 
>         fi-skl-guc: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/fi-skl-guc/igt@i915_selftest@live@hugepages.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-skl-guc/igt@i915_selftest@live@hugepages.html>
>         (i915#7311 <https://gitlab.freedesktop.org/drm/intel/issues/7311>)
> 
>   *
> 
>     igt@i915_selftest@live@late_gt_pm:
> 
>       o fi-cfl-8109u: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html>
>         (i915#5904
>         <https://gitlab.freedesktop.org/drm/intel/issues/5904>) +26
>         similar issues
>   *
> 
>     igt@i915_suspend@basic-s2idle-without-i915:
> 
>       o fi-cfl-8109u: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html>
>         (i915#5904
>         <https://gitlab.freedesktop.org/drm/intel/issues/5904> / i915#62
>         <https://gitlab.freedesktop.org/drm/intel/issues/62>)
>   *
> 
>     igt@i915_suspend@basic-s3-without-i915:
> 
>       o fi-kbl-x1275: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-kbl-x1275/igt@i915_suspend@basic-s3-without-i915.html>
>         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>   *
> 
>     igt@kms_chamelium@common-hpd-after-suspend:
> 
>       o
> 
>         fi-bsw-kefka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-bsw-kefka/igt@kms_chamelium@common-hpd-after-suspend.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
> 
>       o
> 
>         fi-kbl-x1275: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-kbl-x1275/igt@kms_chamelium@common-hpd-after-suspend.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
> 
>   *
> 
>     igt@kms_chamelium@dp-crc-fast:
> 
>       o fi-hsw-4770: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-hsw-4770/igt@kms_chamelium@dp-crc-fast.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +8
>         similar issues
>   *
> 
>     igt@kms_chamelium@hdmi-edid-read:
> 
>       o fi-rkl-11600: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-rkl-11600/igt@kms_chamelium@hdmi-edid-read.html>
>         (fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +7
>         similar issues
>   *
> 
>     igt@kms_chamelium@hdmi-hpd-fast:
> 
>       o fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-kbl-soraka/igt@kms_chamelium@hdmi-hpd-fast.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +7
>         similar issues
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
> 
>       o fi-rkl-11600: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html>
>         (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103>)
>   *
> 
>     igt@kms_force_connector_basic@force-load-detect:
> 
>       o fi-rkl-11600: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html>
>         (fdo#109285
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109285> /
>         i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>   *
> 
>     igt@kms_frontbuffer_tracking@basic:
> 
>       o fi-cfl-8109u: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html>
>         (i915#62 <https://gitlab.freedesktop.org/drm/intel/issues/62>)
>         +14 similar issues
>   *
> 
>     igt@kms_psr@primary_page_flip:
> 
>       o fi-rkl-11600: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-rkl-11600/igt@kms_psr@primary_page_flip.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +3
>         similar issues
>   *
> 
>     igt@kms_psr@sprite_plane_onoff:
> 
>       o fi-hsw-4770: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +3
>         similar issues
>   *
> 
>     igt@kms_setmode@basic-clone-single-crtc:
> 
>       o fi-rkl-11600: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>   *
> 
>     igt@prime_vgem@basic-read:
> 
>       o fi-rkl-11600: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-rkl-11600/igt@prime_vgem@basic-read.html>
>         (fdo#109295
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>         i915#3291 <https://gitlab.freedesktop.org/drm/intel/issues/3291>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/intel/issues/3708>) +2
>         similar issues
>   *
> 
>     igt@prime_vgem@basic-userptr:
> 
>       o fi-rkl-11600: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-rkl-11600/igt@prime_vgem@basic-userptr.html>
>         (fdo#109295
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>         i915#3301 <https://gitlab.freedesktop.org/drm/intel/issues/3301>
>         / i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>)
>   *
> 
>     igt@runner@aborted:
> 
>       o
> 
>         fi-rkl-11600: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-rkl-11600/igt@runner@aborted.html>
>         (i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>)
> 
>       o
> 
>         fi-skl-guc: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-skl-guc/igt@runner@aborted.html>
>         (i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>)
> 
>       o
> 
>         fi-kbl-soraka: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-kbl-soraka/igt@runner@aborted.html>
>         (i915#4312
>         <https://gitlab.freedesktop.org/drm/intel/issues/4312> /
>         i915#4991 <https://gitlab.freedesktop.org/drm/intel/issues/4991>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@gem_exec_suspend@basic-s0@smem:
> 
>       o {bat-adlm-1}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html>
>         (i915#2867
>         <https://gitlab.freedesktop.org/drm/intel/issues/2867>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/bat-adlm-1/igt@gem_exec_suspend@basic-s0@smem.html>
>   *
> 
>     igt@i915_selftest@live@execlists:
> 
>       o fi-bsw-kefka: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/fi-bsw-kefka/igt@i915_selftest@live@execlists.html>
>         (i915#2940
>         <https://gitlab.freedesktop.org/drm/intel/issues/2940>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-bsw-kefka/igt@i915_selftest@live@execlists.html>
>   *
> 
>     igt@i915_selftest@live@hugepages:
> 
>       o
> 
>         fi-kbl-x1275: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/fi-kbl-x1275/igt@i915_selftest@live@hugepages.html>
>         (i915#7311
>         <https://gitlab.freedesktop.org/drm/intel/issues/7311>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-kbl-x1275/igt@i915_selftest@live@hugepages.html>
> 
>       o
> 
>         fi-rkl-guc: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/fi-rkl-guc/igt@i915_selftest@live@hugepages.html>
>         (i915#7311
>         <https://gitlab.freedesktop.org/drm/intel/issues/7311>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-rkl-guc/igt@i915_selftest@live@hugepages.html>
> 
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
> 
>       o fi-bsw-kefka: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12289/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html>
>         (i915#6298
>         <https://gitlab.freedesktop.org/drm/intel/issues/6298>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html>
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7026 -> IGTPW_8000
> 
> CI-20190529: 20190529
> CI_DRM_12289: 0bcfcba620c5d57661249e762a04254ed9274ab3 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_8000: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8000/index.html
> IGT_7026: ce0f97e7e0aa54c40049a8365b3d61773c92e588 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> 
>     Testlist changes
> 
> +igt@api_intel_bb@misplaced-blitter
> -igt@gem_exec3_balancer@parallel-ordering
> -igt@gem_exec3_basic@basic
> -igt@gem_lmem_swapping@vm_bind
> -igt@i915_vm_bind_sanity@basic
> 
