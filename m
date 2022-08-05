Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0479EB3886
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Aug 2022 07:14:28 +0000 (UTC)
Message-ID: <23794b49-c388-9b58-c930-6cf7f979b428@intel.com>
Date: Fri, 5 Aug 2022 09:14:31 +0200
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>
References: <20220804132617.2179474-1-karolina.drobnik@intel.com>
 <165962242963.14888.7271101412241618178@emeril.freedesktop.org>
From: Karolina Drobnik <karolina.drobnik@intel.com>
In-Reply-To: <165962242963.14888.7271101412241618178@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaTkxNS9p?=
 =?utf-8?q?915=5Fpm=5Frps=3A_Don=27t_use_gem=5Fwrite_in_batch=5Fcreate?=
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

On 04.08.2022 16:13, Patchwork wrote:
> *Patch Details*
> *Series:*	i915/i915_pm_rps: Don't use gem_write in batch_create
> *URL:*	https://patchwork.freedesktop.org/series/106977/ 
> <https://patchwork.freedesktop.org/series/106977/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7606/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7606/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_11966 -> IGTPW_7606
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_7606 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7606, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7606/index.html
> 
> 
>     Participating hosts (41 -> 41)
> 
> Additional (3): bat-rpls-1 bat-jsl-3 bat-dg2-8
> Missing (3): fi-kbl-soraka fi-rkl-11600 bat-dg1-5
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_7606:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@gem_render_tiled_blits@basic:
>       o fi-apl-guc: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11966/fi-apl-guc/igt@gem_render_tiled_blits@basic.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7606/fi-apl-guc/igt@gem_render_tiled_blits@basic.html>

Failure not related to the changes in my patch

Many thanks,
Karolina

> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>       o {bat-dg2-8}: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7606/bat-dg2-8/igt@i915_suspend@basic-s3-without-i915.html>
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_7606 that come from known issues:
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
>       o fi-kbl-8809g: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7606/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
>   *
> 
>     igt@gem_lmem_swapping@parallel-random-engines:
> 
>       o fi-kbl-8809g: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7606/fi-kbl-8809g/igt@gem_lmem_swapping@parallel-random-engines.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3
>         similar issues
>   *
> 
>     igt@i915_pm_backlight@basic-brightness:
> 
>       o fi-kbl-8809g: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7606/fi-kbl-8809g/igt@i915_pm_backlight@basic-brightness.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +26
>         similar issues
>   *
> 
>     igt@i915_selftest@live@requests:
> 
>       o fi-blb-e6850: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11966/fi-blb-e6850/igt@i915_selftest@live@requests.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7606/fi-blb-e6850/igt@i915_selftest@live@requests.html>
>         (i915#4528 <https://gitlab.freedesktop.org/drm/intel/issues/4528>)
>   *
> 
>     igt@kms_chamelium@dp-hpd-fast:
> 
>       o fi-kbl-8809g: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7606/fi-kbl-8809g/igt@kms_chamelium@dp-hpd-fast.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +8
>         similar issues
>   *
> 
>     igt@runner@aborted:
> 
>       o fi-bdw-5557u: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7606/fi-bdw-5557u/igt@runner@aborted.html>
>         (i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@fbdev@read:
> 
>       o {bat-rpls-2}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11966/bat-rpls-2/igt@fbdev@read.html>
>         (i915#2582
>         <https://gitlab.freedesktop.org/drm/intel/issues/2582>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7606/bat-rpls-2/igt@fbdev@read.html>
>         +4 similar issues
>   *
> 
>     igt@gem_exec_suspend@basic-s0@smem:
> 
>       o {bat-rplp-1}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11966/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html>
>         (i915#2867
>         <https://gitlab.freedesktop.org/drm/intel/issues/2867>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7606/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@basic:
> 
>       o {bat-rpls-2}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11966/bat-rpls-2/igt@kms_frontbuffer_tracking@basic.html>
>         (i915#1849
>         <https://gitlab.freedesktop.org/drm/intel/issues/1849>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7606/bat-rpls-2/igt@kms_frontbuffer_tracking@basic.html>
>   *
> 
>     igt@prime_vgem@basic-fence-flip:
> 
>       o {bat-rpls-2}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11966/bat-rpls-2/igt@prime_vgem@basic-fence-flip.html>
>         (fdo#109295
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>         i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/intel/issues/3708>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7606/bat-rpls-2/igt@prime_vgem@basic-fence-flip.html>
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6613 -> IGTPW_7606
> 
> CI-20190529: 20190529
> CI_DRM_11966: f3c1d1b53388aaa69e20a1b72f8307ad57116565 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_7606: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7606/index.html
> IGT_6613: 209230467200f2fa63a6f71fe6299996470dd813 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
