Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D2F10FF2C
 for <igt-dev@lists.freedesktop.org>; Thu, 12 May 2022 11:46:50 +0000 (UTC)
Message-ID: <47aabbb4-c487-2d44-c96c-b772c3ac33c7@intel.com>
Date: Thu, 12 May 2022 17:16:31 +0530
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>, <lakshminarayana.vudum@intel.com>
References: <20220512061130.3347243-1-bhanuprakash.modem@intel.com>
 <165234750662.6460.2850932158200669831@emeril.freedesktop.org>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <165234750662.6460.2850932158200669831@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fhdr=3A_Fix_dynamic_subtest_name_=28rev2=29?=
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

On Thu-12-05-2022 02:55 pm, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/kms_hdr: Fix dynamic subtest name (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/103914/ 
> <https://patchwork.freedesktop.org/series/103914/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_11639 -> IGTPW_7084
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_7084 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7084, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/index.html
> 
> 
>     Participating hosts (42 -> 44)
> 
> Additional (4): bat-dg2-8 fi-rkl-11600 bat-dg1-6 bat-adlm-1
> Missing (2): fi-bsw-cyan fi-bdw-samus
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_7084:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@i915_selftest@live@gt_mocs:
>       o fi-rkl-guc: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11639/fi-rkl-guc/igt@i915_selftest@live@gt_mocs.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/fi-rkl-guc/igt@i915_selftest@live@gt_mocs.html>

This patch is just dealing the rename of dynamic subtests & not related 
to this failure.

Can you please re-report this false positive?

- Bhanu

> 
> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   * igt@i915_pm_rpm@basic-pci-d3-state:
>       o {bat-dg2-8}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/bat-dg2-8/igt@i915_pm_rpm@basic-pci-d3-state.html>
>         +1 similar issue
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_7084 that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o fi-rkl-11600: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html>
>         (i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
>   *
> 
>     igt@gem_lmem_swapping@basic:
> 
>       o fi-rkl-11600: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/fi-rkl-11600/igt@gem_lmem_swapping@basic.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3
>         similar issues
>   *
> 
>     igt@gem_mmap@basic:
> 
>       o bat-dg1-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/bat-dg1-6/igt@gem_mmap@basic.html>
>         (i915#4083 <https://gitlab.freedesktop.org/drm/intel/issues/4083>)
>   *
> 
>     igt@gem_tiled_blits@basic:
> 
>       o bat-dg1-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/bat-dg1-6/igt@gem_tiled_blits@basic.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +2
>         similar issues
>   *
> 
>     igt@gem_tiled_pread_basic:
> 
>       o
> 
>         fi-rkl-11600: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/fi-rkl-11600/igt@gem_tiled_pread_basic.html>
>         (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>)
> 
>       o
> 
>         bat-dg1-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/bat-dg1-6/igt@gem_tiled_pread_basic.html>
>         (i915#4079
>         <https://gitlab.freedesktop.org/drm/intel/issues/4079>) +1
>         similar issue
> 
>   *
> 
>     igt@i915_pm_backlight@basic-brightness:
> 
>       o
> 
>         fi-rkl-11600: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html>
>         (i915#3012 <https://gitlab.freedesktop.org/drm/intel/issues/3012>)
> 
>       o
> 
>         bat-dg1-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/bat-dg1-6/igt@i915_pm_backlight@basic-brightness.html>
>         (i915#1155 <https://gitlab.freedesktop.org/drm/intel/issues/1155>)
> 
>   *
> 
>     igt@i915_selftest@live@execlists:
> 
>       o fi-bsw-nick: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11639/fi-bsw-nick/igt@i915_selftest@live@execlists.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/fi-bsw-nick/igt@i915_selftest@live@execlists.html>
>         (i915#5801
>         <https://gitlab.freedesktop.org/drm/intel/issues/5801> /
>         i915#5847 <https://gitlab.freedesktop.org/drm/intel/issues/5847>)
>   *
> 
>     igt@i915_selftest@live@gt_engines:
> 
>       o bat-dg1-6: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/bat-dg1-6/igt@i915_selftest@live@gt_engines.html>
>         (i915#4418 <https://gitlab.freedesktop.org/drm/intel/issues/4418>)
>   *
> 
>     igt@i915_selftest@live@hangcheck:
> 
>       o fi-hsw-4770: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11639/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html>
>         (i915#4785 <https://gitlab.freedesktop.org/drm/intel/issues/4785>)
>   *
> 
>     igt@kms_addfb_basic@addfb25-x-tiled-legacy:
> 
>       o bat-dg1-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/bat-dg1-6/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html>
>         (i915#4212
>         <https://gitlab.freedesktop.org/drm/intel/issues/4212>) +7
>         similar issues
>   *
> 
>     igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>       o bat-dg1-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/bat-dg1-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html>
>         (i915#4215 <https://gitlab.freedesktop.org/drm/intel/issues/4215>)
>   *
> 
>     igt@kms_chamelium@common-hpd-after-suspend:
> 
>       o fi-blb-e6850: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/fi-blb-e6850/igt@kms_chamelium@common-hpd-after-suspend.html>
>         (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>   *
> 
>     igt@kms_chamelium@dp-crc-fast:
> 
>       o fi-rkl-11600: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/fi-rkl-11600/igt@kms_chamelium@dp-crc-fast.html>
>         (fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +8
>         similar issues
>   *
> 
>     igt@kms_chamelium@hdmi-edid-read:
> 
>       o bat-dg1-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/bat-dg1-6/igt@kms_chamelium@hdmi-edid-read.html>
>         (fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +7
>         similar issues
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>       o
> 
>         fi-rkl-11600: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         (i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070> /
>         i915#4103
>         <https://gitlab.freedesktop.org/drm/intel/issues/4103>) +1
>         similar issue
> 
>       o
> 
>         bat-dg1-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/bat-dg1-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/intel/issues/4103> /
>         i915#4213
>         <https://gitlab.freedesktop.org/drm/intel/issues/4213>) +1
>         similar issue
> 
>   *
> 
>     igt@kms_flip@basic-flip-vs-modeset@b-edp1:
> 
>       o bat-adlp-4: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11639/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html>
>         (i915#3576
>         <https://gitlab.freedesktop.org/drm/intel/issues/3576>) +1
>         similar issue
>   *
> 
>     igt@kms_force_connector_basic@force-load-detect:
> 
>       o
> 
>         bat-dg1-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/bat-dg1-6/igt@kms_force_connector_basic@force-load-detect.html>
>         (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285>)
> 
>       o
> 
>         fi-rkl-11600: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html>
>         (fdo#109285
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109285> /
>         i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
> 
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
> 
>       o fi-rkl-11600: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html>
>         (i915#4070
>         <https://gitlab.freedesktop.org/drm/intel/issues/4070> /
>         i915#533 <https://gitlab.freedesktop.org/drm/intel/issues/533>)
>   *
> 
>     igt@kms_psr@primary_mmap_gtt:
> 
>       o fi-rkl-11600: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/fi-rkl-11600/igt@kms_psr@primary_mmap_gtt.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +3
>         similar issues
>   *
> 
>     igt@kms_psr@sprite_plane_onoff:
> 
>       o bat-dg1-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/bat-dg1-6/igt@kms_psr@sprite_plane_onoff.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072> /
>         i915#4078
>         <https://gitlab.freedesktop.org/drm/intel/issues/4078>) +3
>         similar issues
>   *
> 
>     igt@kms_setmode@basic-clone-single-crtc:
> 
>       o
> 
>         bat-dg1-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/bat-dg1-6/igt@kms_setmode@basic-clone-single-crtc.html>
>         (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
> 
>       o
> 
>         fi-rkl-11600: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
> 
>   *
> 
>     igt@prime_vgem@basic-gtt:
> 
>       o bat-dg1-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/bat-dg1-6/igt@prime_vgem@basic-gtt.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/intel/issues/3708> /
>         i915#4077
>         <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +1
>         similar issue
>   *
> 
>     igt@prime_vgem@basic-userptr:
> 
>       o
> 
>         fi-rkl-11600: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/fi-rkl-11600/igt@prime_vgem@basic-userptr.html>
>         (i915#3301
>         <https://gitlab.freedesktop.org/drm/intel/issues/3301> /
>         i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>)
> 
>       o
> 
>         bat-dg1-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/bat-dg1-6/igt@prime_vgem@basic-userptr.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/intel/issues/3708> /
>         i915#4873 <https://gitlab.freedesktop.org/drm/intel/issues/4873>)
> 
>   *
> 
>     igt@prime_vgem@basic-write:
> 
>       o
> 
>         fi-rkl-11600: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/fi-rkl-11600/igt@prime_vgem@basic-write.html>
>         (i915#3291
>         <https://gitlab.freedesktop.org/drm/intel/issues/3291> /
>         i915#3708
>         <https://gitlab.freedesktop.org/drm/intel/issues/3708>) +2
>         similar issues
> 
>       o
> 
>         bat-dg1-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/bat-dg1-6/igt@prime_vgem@basic-write.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/intel/issues/3708>) +3
>         similar issues
> 
>   *
> 
>     igt@runner@aborted:
> 
>       o
> 
>         fi-bsw-nick: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/fi-bsw-nick/igt@runner@aborted.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3428 <https://gitlab.freedesktop.org/drm/intel/issues/3428>
>         / i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>)
> 
>       o
> 
>         fi-hsw-4770: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/fi-hsw-4770/igt@runner@aborted.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>
>         / i915#5594 <https://gitlab.freedesktop.org/drm/intel/issues/5594>)
> 
>       o
> 
>         bat-dg1-6: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/bat-dg1-6/igt@runner@aborted.html>
>         (i915#4312
>         <https://gitlab.freedesktop.org/drm/intel/issues/4312> /
>         i915#5257 <https://gitlab.freedesktop.org/drm/intel/issues/5257>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@gem_exec_suspend@basic-s0@smem:
> 
>       o {fi-ehl-2}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11639/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html>
>         (i915#5122
>         <https://gitlab.freedesktop.org/drm/intel/issues/5122>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html>
>   *
> 
>     igt@i915_selftest@live@evict:
> 
>       o {bat-dg2-9}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11639/bat-dg2-9/igt@i915_selftest@live@evict.html>
>         (i915#5763
>         <https://gitlab.freedesktop.org/drm/intel/issues/5763>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/bat-dg2-9/igt@i915_selftest@live@evict.html>
>   *
> 
>     igt@i915_selftest@live@requests:
> 
>       o
> 
>         fi-blb-e6850: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11639/fi-blb-e6850/igt@i915_selftest@live@requests.html>
>         (i915#4528
>         <https://gitlab.freedesktop.org/drm/intel/issues/4528>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/fi-blb-e6850/igt@i915_selftest@live@requests.html>
> 
>       o
> 
>         {bat-rpls-1}: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11639/bat-rpls-1/igt@i915_selftest@live@requests.html>
>         (i915#5087
>         <https://gitlab.freedesktop.org/drm/intel/issues/5087>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/bat-rpls-1/igt@i915_selftest@live@requests.html>
> 
>   *
> 
>     igt@kms_busy@basic@flip:
> 
>       o {bat-adlp-6}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11639/bat-adlp-6/igt@kms_busy@basic@flip.html>
>         (i915#3576
>         <https://gitlab.freedesktop.org/drm/intel/issues/3576>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/bat-adlp-6/igt@kms_busy@basic@flip.html>
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6471 -> IGTPW_7084
> 
> CI-20190529: 20190529
> CI_DRM_11639: e3166e803ac9e1818d73088ce6ebc08e0f3964bf @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_7084: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7084/index.html
> IGT_6471: 1d6816f1200520f936a799b7b0ef2e6f396abb16 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
