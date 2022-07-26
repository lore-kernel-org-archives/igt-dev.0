Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD412BB4D
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Jul 2022 11:06:41 +0000 (UTC)
Message-ID: <026f5261-d758-9473-1f12-bb5d00690094@intel.com>
Date: Tue, 26 Jul 2022 13:06:47 +0200
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>
References: <cover.1658826356.git.karolina.drobnik@intel.com>
 <165883284983.21572.2212787377910447144@emeril.freedesktop.org>
From: Karolina Drobnik <karolina.drobnik@intel.com>
In-Reply-To: <165883284983.21572.2212787377910447144@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fexec=5Ffence=3A_Fix_test=5Ffence=5Fawait_for_hanging_work?=
 =?utf-8?q?loads_=28rev2=29?=
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

On 26.07.2022 12:54, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/gem_exec_fence: Fix test_fence_await for hanging 
> workloads (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/106531/ 
> <https://patchwork.freedesktop.org/series/106531/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7563/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7563/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_11943 -> IGTPW_7563
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_7563 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7563, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7563/index.html
> 
> 
>     Participating hosts (33 -> 38)
> 
> Additional (8): fi-kbl-soraka bat-dg2-8 bat-adlm-1 bat-adlp-6 
> fi-snb-2520m bat-rplp-1 bat-rpls-1 bat-rpls-2
> Missing (3): fi-hsw-4770 fi-bdw-samus bat-dg1-5
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_7563:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@i915_selftest@live@slpc:
>       o fi-kbl-soraka: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7563/fi-kbl-soraka/igt@i915_selftest@live@slpc.html>

Not related to the patch

Thanks,
Karolina

> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   * igt@i915_selftest@live@migrate:
>       o {bat-rpls-1}: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7563/bat-rpls-1/igt@i915_selftest@live@migrate.html>
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_7563 that come from known issues:
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
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7563/fi-kbl-soraka/igt@gem_exec_gttfill@basic.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +8
>         similar issues
>   *
> 
>     igt@gem_exec_suspend@basic-s3@smem:
> 
>       o fi-rkl-11600: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7563/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html>
>         (i915#6179 <https://gitlab.freedesktop.org/drm/intel/issues/6179>)
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7563/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
>   *
> 
>     igt@gem_lmem_swapping@basic:
> 
>       o fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7563/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3
>         similar issues
>   *
> 
>     igt@i915_selftest@live@execlists:
> 
>       o fi-bdw-gvtdvm: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11943/fi-bdw-gvtdvm/igt@i915_selftest@live@execlists.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7563/fi-bdw-gvtdvm/igt@i915_selftest@live@execlists.html>
>         (i915#2940 <https://gitlab.freedesktop.org/drm/intel/issues/2940>)
>   *
> 
>     igt@i915_selftest@live@gt_pm:
> 
>       o fi-kbl-soraka: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7563/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html>
>         (i915#1886 <https://gitlab.freedesktop.org/drm/intel/issues/1886>)
>   *
> 
>     igt@kms_chamelium@common-hpd-after-suspend:
> 
>       o fi-bdw-5557u: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7563/fi-bdw-5557u/igt@kms_chamelium@common-hpd-after-suspend.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>   *
> 
>     igt@kms_chamelium@hdmi-crc-fast:
> 
>       o fi-snb-2520m: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7563/fi-snb-2520m/igt@kms_chamelium@hdmi-crc-fast.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +8
>         similar issues
>   *
> 
>     igt@kms_chamelium@hdmi-hpd-fast:
> 
>       o fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7563/fi-kbl-soraka/igt@kms_chamelium@hdmi-hpd-fast.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +7
>         similar issues
>   *
> 
>     igt@prime_vgem@basic-fence-flip:
> 
>       o fi-snb-2520m: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7563/fi-snb-2520m/igt@prime_vgem@basic-fence-flip.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +21
>         similar issues
>   *
> 
>     igt@runner@aborted:
> 
>       o fi-bdw-gvtdvm: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7563/fi-bdw-gvtdvm/igt@runner@aborted.html>
>         (i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@i915_selftest@live@coherency:
> 
>       o {bat-dg2-9}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11943/bat-dg2-9/igt@i915_selftest@live@coherency.html>
>         (i915#5763
>         <https://gitlab.freedesktop.org/drm/intel/issues/5763>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7563/bat-dg2-9/igt@i915_selftest@live@coherency.html>
>         +7 similar issues
>   *
> 
>     igt@i915_selftest@live@hangcheck:
> 
>       o {fi-ehl-2}: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11943/fi-ehl-2/igt@i915_selftest@live@hangcheck.html>
>         (i915#5153
>         <https://gitlab.freedesktop.org/drm/intel/issues/5153> /
>         i915#6106
>         <https://gitlab.freedesktop.org/drm/intel/issues/6106>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7563/fi-ehl-2/igt@i915_selftest@live@hangcheck.html>
> 
> 
>         Warnings
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>       o fi-rkl-11600: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11943/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html>
>         (i915#5982
>         <https://gitlab.freedesktop.org/drm/intel/issues/5982>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7563/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html>
>         (fdo#103375 <https://bugs.freedesktop.org/show_bug.cgi?id=103375>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6598 -> IGTPW_7563
> 
> CI-20190529: 20190529
> CI_DRM_11943: fedf33eeec77c1a0dfb243eacdbce82ca0ffa704 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_7563: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7563/index.html
> IGT_6598: 97e103419021d0863db527e3f2cf39ccdd132db5 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
