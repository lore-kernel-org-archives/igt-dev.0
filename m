Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F68710E5C1
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Jul 2022 03:01:04 +0000 (UTC)
Message-ID: <7a0953bc-5ccd-ff04-91f4-b34fe65dbbcd@intel.com>
Date: Fri, 1 Jul 2022 08:30:30 +0530
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>, Lakshminarayana Vudum
 <lakshminarayana.vudum@intel.com>
References: <20220630085523.291024-1-bhanuprakash.modem@intel.com>
 <165663985707.30282.14168029812224292267@emeril.freedesktop.org>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <165663985707.30282.14168029812224292267@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcolor=3A_IGT_test_cleanup_=28rev11=29?=
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

On Fri-01-07-2022 07:14 am, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/kms_color: IGT test cleanup (rev11)
> *URL:*	https://patchwork.freedesktop.org/series/104972/ 
> <https://patchwork.freedesktop.org/series/104972/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7448/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7448/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_11837 -> IGTPW_7448
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_7448 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7448, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7448/index.html
> 
> 
>     Participating hosts (42 -> 41)
> 
> Missing (1): bat-dg2-9
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_7448:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@i915_selftest@live@vma:
>       o fi-bdw-5557u: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7448/fi-bdw-5557u/igt@i915_selftest@live@vma.html>

This failure is not related to my patch, please help to re-report.

- Bhanu

> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_7448 that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@i915_pm_rpm@module-reload:
> 
>       o fi-cfl-8109u: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11837/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7448/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html>
>         (i915#62 <https://gitlab.freedesktop.org/drm/intel/issues/62>)
>   *
> 
>     igt@i915_selftest@live@hangcheck:
> 
>       o bat-dg1-6: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11837/bat-dg1-6/igt@i915_selftest@live@hangcheck.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7448/bat-dg1-6/igt@i915_selftest@live@hangcheck.html>
>         (i915#4494
>         <https://gitlab.freedesktop.org/drm/intel/issues/4494> /
>         i915#4957 <https://gitlab.freedesktop.org/drm/intel/issues/4957>)
>   *
> 
>     igt@i915_selftest@live@late_gt_pm:
> 
>       o fi-cfl-8109u: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11837/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7448/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html>
>         (i915#5904
>         <https://gitlab.freedesktop.org/drm/intel/issues/5904>) +28
>         similar issues
>   *
> 
>     igt@i915_selftest@live@requests:
> 
>       o
> 
>         fi-pnv-d510: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11837/fi-pnv-d510/igt@i915_selftest@live@requests.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7448/fi-pnv-d510/igt@i915_selftest@live@requests.html>
>         (i915#4528 <https://gitlab.freedesktop.org/drm/intel/issues/4528>)
> 
>       o
> 
>         fi-blb-e6850: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11837/fi-blb-e6850/igt@i915_selftest@live@requests.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7448/fi-blb-e6850/igt@i915_selftest@live@requests.html>
>         (i915#4528 <https://gitlab.freedesktop.org/drm/intel/issues/4528>)
> 
>   *
> 
>     igt@i915_suspend@basic-s2idle-without-i915:
> 
>       o fi-cfl-8109u: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11837/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7448/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html>
>         (i915#5904
>         <https://gitlab.freedesktop.org/drm/intel/issues/5904> / i915#62
>         <https://gitlab.freedesktop.org/drm/intel/issues/62>)
>   *
> 
>     igt@kms_busy@basic@flip:
> 
>       o fi-tgl-u2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11837/fi-tgl-u2/igt@kms_busy@basic@flip.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7448/fi-tgl-u2/igt@kms_busy@basic@flip.html>
>         (i915#402 <https://gitlab.freedesktop.org/drm/intel/issues/402>)
>         +1 similar issue
>   *
> 
>     igt@kms_chamelium@common-hpd-after-suspend:
> 
>       o fi-rkl-guc: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7448/fi-rkl-guc/igt@kms_chamelium@common-hpd-after-suspend.html>
>         (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>   *
> 
>     igt@kms_frontbuffer_tracking@basic:
> 
>       o fi-cfl-8109u: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11837/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7448/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html>
>         (i915#62 <https://gitlab.freedesktop.org/drm/intel/issues/62>)
>         +12 similar issues
>   *
> 
>     igt@runner@aborted:
> 
>       o fi-blb-e6850: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7448/fi-blb-e6850/igt@runner@aborted.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2403 <https://gitlab.freedesktop.org/drm/intel/issues/2403>
>         / i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@i915_selftest@live@gt_lrc:
> 
>       o fi-rkl-guc: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11837/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html>
>         (i915#4983
>         <https://gitlab.freedesktop.org/drm/intel/issues/4983>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7448/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html>
>   *
> 
>     igt@i915_selftest@live@hangcheck:
> 
>       o bat-dg1-5: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11837/bat-dg1-5/igt@i915_selftest@live@hangcheck.html>
>         (i915#4494
>         <https://gitlab.freedesktop.org/drm/intel/issues/4494> /
>         i915#4957
>         <https://gitlab.freedesktop.org/drm/intel/issues/4957>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7448/bat-dg1-5/igt@i915_selftest@live@hangcheck.html>
>   *
> 
>     igt@i915_selftest@live@workarounds:
> 
>       o fi-bdw-5557u: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11837/fi-bdw-5557u/igt@i915_selftest@live@workarounds.html>
>         (i915#6307
>         <https://gitlab.freedesktop.org/drm/intel/issues/6307>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7448/fi-bdw-5557u/igt@i915_selftest@live@workarounds.html>
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
> 
>       o fi-bsw-kefka: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11837/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html>
>         (i915#6298
>         <https://gitlab.freedesktop.org/drm/intel/issues/6298>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7448/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html>
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6553 -> IGTPW_7448
> 
> CI-20190529: 20190529
> CI_DRM_11837: e19040cd831f5ac1c94bb265ebd846c94f6fed80 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_7448: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7448/index.html
> IGT_6553: 3cf110f8dcd1f4f02cf84339664b413abdaebf7d @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> 
>     Testlist changes
> 
> +++ 16 lines
> --- 96 lines
> 
