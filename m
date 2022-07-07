Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1637B11BFC8
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Jul 2022 13:36:25 +0000 (UTC)
Message-ID: <564edf79-a034-b2d3-4fed-64dc7e295bf7@intel.com>
Date: Thu, 7 Jul 2022 15:36:24 +0200
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>
References: <20220707094906.4010020-1-karolina.drobnik@intel.com>
 <165719932240.2213.11826234284639828965@emeril.freedesktop.org>
From: Karolina Drobnik <karolina.drobnik@intel.com>
In-Reply-To: <165719932240.2213.11826234284639828965@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaTkxNS9p?=
 =?utf-8?q?915=5Fpm=5Frps=3A_Check_impact_of_fence_ordering_on_waitboostin?=
 =?utf-8?q?g_=28rev3=29?=
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

On 07.07.2022 15:08, Patchwork wrote:
> *Patch Details*
> *Series:*	i915/i915_pm_rps: Check impact of fence ordering on 
> waitboosting (rev3)
> *URL:*	https://patchwork.freedesktop.org/series/105922/ 
> <https://patchwork.freedesktop.org/series/105922/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_11857 -> IGTPW_7478
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_7478 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7478, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/index.html
> 
> 
>     Participating hosts (45 -> 42)
> 
> Additional (1): bat-dg2-8
> Missing (4): fi-ctg-p8600 bat-rpls-1 fi-bdw-samus bat-jsl-3
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_7478:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@i915_selftest@live@execlists:
>       o fi-glk-j4005: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/fi-glk-j4005/igt@i915_selftest@live@execlists.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/fi-glk-j4005/igt@i915_selftest@live@execlists.html>

The patch introduces tests that are not connected to this selftest

> 
>     Known issues
> 
> Here are the changes found in IGTPW_7478 that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@i915_suspend@basic-s3-without-i915:
> 
>       o fi-skl-6700k2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/fi-skl-6700k2/igt@i915_suspend@basic-s3-without-i915.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/fi-skl-6700k2/igt@i915_suspend@basic-s3-without-i915.html>
>         (i915#4817 <https://gitlab.freedesktop.org/drm/intel/issues/4817>)
>   *
> 
>     igt@kms_busy@basic@flip:
> 
>       o bat-adlp-4: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/bat-adlp-4/igt@kms_busy@basic@flip.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/bat-adlp-4/igt@kms_busy@basic@flip.html>
>         (i915#3576 <https://gitlab.freedesktop.org/drm/intel/issues/3576>)
>   *
> 
>     igt@kms_chamelium@common-hpd-after-suspend:
> 
>       o
> 
>         fi-ivb-3770: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/fi-ivb-3770/igt@kms_chamelium@common-hpd-after-suspend.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
> 
>       o
> 
>         fi-snb-2600: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/fi-snb-2600/igt@kms_chamelium@common-hpd-after-suspend.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
> 
>   *
> 
>     igt@runner@aborted:
> 
>       o fi-glk-j4005: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/fi-glk-j4005/igt@runner@aborted.html>
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
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/bat-dg2-9/igt@i915_selftest@live@coherency.html>
>         (i915#5763
>         <https://gitlab.freedesktop.org/drm/intel/issues/5763>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/bat-dg2-9/igt@i915_selftest@live@coherency.html>
>         +8 similar issues
>   *
> 
>     igt@i915_selftest@live@hangcheck:
> 
>       o
> 
>         fi-ivb-3770: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html>
>         (i915#3303
>         <https://gitlab.freedesktop.org/drm/intel/issues/3303> /
>         i915#5370
>         <https://gitlab.freedesktop.org/drm/intel/issues/5370>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html>
> 
>       o
> 
>         fi-snb-2600: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/fi-snb-2600/igt@i915_selftest@live@hangcheck.html>
>         (i915#3921
>         <https://gitlab.freedesktop.org/drm/intel/issues/3921>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/fi-snb-2600/igt@i915_selftest@live@hangcheck.html>
> 
>       o
> 
>         bat-dg1-6: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/bat-dg1-6/igt@i915_selftest@live@hangcheck.html>
>         (i915#4494
>         <https://gitlab.freedesktop.org/drm/intel/issues/4494> /
>         i915#4957
>         <https://gitlab.freedesktop.org/drm/intel/issues/4957>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/bat-dg1-6/igt@i915_selftest@live@hangcheck.html>
> 
>   *
> 
>     igt@kms_busy@basic@modeset:
> 
>       o {bat-adln-1}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/bat-adln-1/igt@kms_busy@basic@modeset.html>
>         (i915#3576
>         <https://gitlab.freedesktop.org/drm/intel/issues/3576>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/bat-adln-1/igt@kms_busy@basic@modeset.html>
>   *
> 
>     igt@kms_flip@basic-flip-vs-modeset@b-edp1:
> 
>       o
> 
>         {bat-adlp-6}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html>
>         (i915#3576
>         <https://gitlab.freedesktop.org/drm/intel/issues/3576>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html>
> 
>       o
> 
>         bat-adlp-4: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11857/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html>
>         (i915#3576
>         <https://gitlab.freedesktop.org/drm/intel/issues/3576>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html>
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6561 -> IGTPW_7478
> 
> CI-20190529: 20190529
> CI_DRM_11857: de2555fd1402a79eb3c89db3f62944fec2026c8f @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_7478: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7478/index.html
> IGT_6561: 4b673211d1645eaafa9da32eece4c274d8cd6c41 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> 
>     Testlist changes
> 
> +igt@i915_pm_rps@engine-order
> +igt@i915_pm_rps@fence-order
> 
