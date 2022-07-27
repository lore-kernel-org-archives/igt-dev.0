Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC1314BA58
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Jul 2022 02:52:03 +0000 (UTC)
Message-ID: <5e70d556-99e0-5c59-e8f0-06cc1c08196e@intel.com>
Date: Wed, 27 Jul 2022 08:21:45 +0530
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>, Lakshminarayana Vudum
 <lakshminarayana.vudum@intel.com>
References: <20220726031116.974261-1-bhanuprakash.modem@intel.com>
 <165889003445.21594.18035338491453731875@emeril.freedesktop.org>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <165889003445.21594.18035338491453731875@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Fcrc=3A_Drop_max-size_test_=28rev4=29?=
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

On Wed-27-07-2022 08:17 am, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/kms_cursor_crc: Drop max-size test (rev4)
> *URL:*	https://patchwork.freedesktop.org/series/106697/ 
> <https://patchwork.freedesktop.org/series/106697/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_11946 -> IGTPW_7567
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_7567 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7567, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/index.html
> 
> 
>     Participating hosts (38 -> 38)
> 
> Additional (3): fi-kbl-soraka fi-hsw-4770 bat-adlp-4
> Missing (3): fi-rkl-11600 fi-bdw-samus bat-jsl-3
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_7567:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@i915_selftest@live@objects:
>       o fi-kbl-soraka: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/fi-kbl-soraka/igt@i915_selftest@live@objects.html>

After re-reporting it is coming again in re-run.

- Bhanu

> 
> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   * igt@i915_selftest@live@mman:
>       o {bat-rpls-1}: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/bat-rpls-1/igt@i915_selftest@live@mman.html>
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_7567 that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@gem_exec_gttfill@basic:
> 
>       o fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/fi-kbl-soraka/igt@gem_exec_gttfill@basic.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +8
>         similar issues
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
>   *
> 
>     igt@gem_lmem_swapping@basic:
> 
>       o fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3
>         similar issues
>   *
> 
>     igt@gem_lmem_swapping@verify-random:
> 
>       o bat-adlp-4: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/bat-adlp-4/igt@gem_lmem_swapping@verify-random.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3
>         similar issues
>   *
> 
>     igt@gem_tiled_pread_basic:
> 
>       o bat-adlp-4: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/bat-adlp-4/igt@gem_tiled_pread_basic.html>
>         (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>)
>   *
> 
>     igt@i915_pm_backlight@basic-brightness:
> 
>       o fi-hsw-4770: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/fi-hsw-4770/igt@i915_pm_backlight@basic-brightness.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3012 <https://gitlab.freedesktop.org/drm/intel/issues/3012>)
>   *
> 
>     igt@i915_selftest@live@gem:
> 
>       o fi-pnv-d510: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/fi-pnv-d510/igt@i915_selftest@live@gem.html>
>         (i915#4528 <https://gitlab.freedesktop.org/drm/intel/issues/4528>)
>   *
> 
>     igt@i915_selftest@live@gt_engines:
> 
>       o fi-rkl-guc: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11946/fi-rkl-guc/igt@i915_selftest@live@gt_engines.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/fi-rkl-guc/igt@i915_selftest@live@gt_engines.html>
>         (i915#4418 <https://gitlab.freedesktop.org/drm/intel/issues/4418>)
>   *
> 
>     igt@i915_selftest@live@gt_pm:
> 
>       o fi-kbl-soraka: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html>
>         (i915#1886 <https://gitlab.freedesktop.org/drm/intel/issues/1886>)
>   *
> 
>     igt@i915_selftest@live@requests:
> 
>       o fi-blb-e6850: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11946/fi-blb-e6850/igt@i915_selftest@live@requests.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/fi-blb-e6850/igt@i915_selftest@live@requests.html>
>         (i915#4528 <https://gitlab.freedesktop.org/drm/intel/issues/4528>)
>   *
> 
>     igt@i915_suspend@basic-s3-without-i915:
> 
>       o bat-adlp-4: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/bat-adlp-4/igt@i915_suspend@basic-s3-without-i915.html>
>         (i915#5903 <https://gitlab.freedesktop.org/drm/intel/issues/5903>)
>   *
> 
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>       o fi-hsw-4770: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +9
>         similar issues
>   *
> 
>     igt@kms_chamelium@dp-crc-fast:
> 
>       o
> 
>         fi-hsw-4770: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/fi-hsw-4770/igt@kms_chamelium@dp-crc-fast.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +8
>         similar issues
> 
>       o
> 
>         bat-adlp-4: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/bat-adlp-4/igt@kms_chamelium@dp-crc-fast.html>
>         (fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +8
>         similar issues
> 
>   *
> 
>     igt@kms_chamelium@hdmi-hpd-fast:
> 
>       o fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/fi-kbl-soraka/igt@kms_chamelium@hdmi-hpd-fast.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +7
>         similar issues
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
> 
>       o bat-adlp-4: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/bat-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html>
>         (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103>)
>   *
> 
>     igt@kms_force_connector_basic@prune-stale-modes:
> 
>       o bat-adlp-4: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/bat-adlp-4/igt@kms_force_connector_basic@prune-stale-modes.html>
>         (i915#4093
>         <https://gitlab.freedesktop.org/drm/intel/issues/4093>) +3
>         similar issues
>   *
> 
>     igt@kms_psr@sprite_plane_onoff:
> 
>       o fi-hsw-4770: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#1072
>         <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +3
>         similar issues
>   *
> 
>     igt@kms_setmode@basic-clone-single-crtc:
> 
>       o bat-adlp-4: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/bat-adlp-4/igt@kms_setmode@basic-clone-single-crtc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>         i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>)
>   *
> 
>     igt@prime_vgem@basic-userptr:
> 
>       o bat-adlp-4: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/bat-adlp-4/igt@prime_vgem@basic-userptr.html>
>         (fdo#109295
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>         i915#3301 <https://gitlab.freedesktop.org/drm/intel/issues/3301>
>         / i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>)
>   *
> 
>     igt@prime_vgem@basic-write:
> 
>       o bat-adlp-4: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/bat-adlp-4/igt@prime_vgem@basic-write.html>
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
>       o
> 
>         fi-blb-e6850: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/fi-blb-e6850/igt@runner@aborted.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2403 <https://gitlab.freedesktop.org/drm/intel/issues/2403>
>         / i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>)
> 
>       o
> 
>         fi-rkl-guc: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/fi-rkl-guc/igt@runner@aborted.html>
>         (i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>)
> 
>       o
> 
>         fi-kbl-soraka: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/fi-kbl-soraka/igt@runner@aborted.html>
>         (i915#4312
>         <https://gitlab.freedesktop.org/drm/intel/issues/4312> /
>         i915#5257 <https://gitlab.freedesktop.org/drm/intel/issues/5257>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@debugfs_test@read_all_entries:
> 
>       o fi-kbl-guc: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11946/fi-kbl-guc/igt@debugfs_test@read_all_entries.html>
>         (i915#6253
>         <https://gitlab.freedesktop.org/drm/intel/issues/6253>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/fi-kbl-guc/igt@debugfs_test@read_all_entries.html>
>   *
> 
>     igt@fbdev@read:
> 
>       o {bat-rpls-2}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11946/bat-rpls-2/igt@fbdev@read.html>
>         (i915#2582
>         <https://gitlab.freedesktop.org/drm/intel/issues/2582>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/bat-rpls-2/igt@fbdev@read.html>
>         +4 similar issues
>   *
> 
>     igt@gem_exec_suspend@basic-s3@smem:
> 
>       o {bat-adlm-1}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11946/bat-adlm-1/igt@gem_exec_suspend@basic-s3@smem.html>
>         (i915#2867
>         <https://gitlab.freedesktop.org/drm/intel/issues/2867>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/bat-adlm-1/igt@gem_exec_suspend@basic-s3@smem.html>
>   *
> 
>     igt@i915_selftest@live@guc:
> 
>       o {bat-dg2-9}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11946/bat-dg2-9/igt@i915_selftest@live@guc.html>
>         (i915#5763
>         <https://gitlab.freedesktop.org/drm/intel/issues/5763>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/bat-dg2-9/igt@i915_selftest@live@guc.html>
>         +5 similar issues
>   *
> 
>     igt@i915_selftest@live@requests:
> 
>       o
> 
>         {bat-rpls-1}: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11946/bat-rpls-1/igt@i915_selftest@live@requests.html>
>         (i915#6380
>         <https://gitlab.freedesktop.org/drm/intel/issues/6380>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/bat-rpls-1/igt@i915_selftest@live@requests.html>
> 
>       o
> 
>         fi-pnv-d510: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11946/fi-pnv-d510/igt@i915_selftest@live@requests.html>
>         (i915#4528
>         <https://gitlab.freedesktop.org/drm/intel/issues/4528>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/fi-pnv-d510/igt@i915_selftest@live@requests.html>
> 
>   *
> 
>     igt@kms_frontbuffer_tracking@basic:
> 
>       o {bat-rpls-2}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11946/bat-rpls-2/igt@kms_frontbuffer_tracking@basic.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/bat-rpls-2/igt@kms_frontbuffer_tracking@basic.html>
>   *
> 
>     igt@prime_vgem@basic-fence-flip:
> 
>       o {bat-rpls-2}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11946/bat-rpls-2/igt@prime_vgem@basic-fence-flip.html>
>         (fdo#109295
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>         i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/intel/issues/3708>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/bat-rpls-2/igt@prime_vgem@basic-fence-flip.html>
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6598 -> IGTPW_7567
> 
> CI-20190529: 20190529
> CI_DRM_11946: 0e9c43d76a145712da46e935d429ce2a3eea80e8 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_7567: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7567/index.html
> IGT_6598: 97e103419021d0863db527e3f2cf39ccdd132db5 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
