Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC7C10E0F1
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jun 2023 04:49:42 +0000 (UTC)
Message-ID: <f4c8f90d-85c1-b259-d77a-b01740b21786@intel.com>
Date: Fri, 30 Jun 2023 10:19:19 +0530
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>, <saix.nandan.yedireswarapu@intel.com>
References: <20230629150324.3079878-1-bhanuprakash.modem@intel.com>
 <168805667038.28964.3095832769030181032@emeril.freedesktop.org>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <168805667038.28964.3095832769030181032@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgRml4IEJp?=
 =?utf-8?q?gjoiner_checks_=28rev8=29?=
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

Hi Sai,

Below regression is not related to this patch, please help to re-report.

- Bhanu

On Thu-29-06-2023 10:07 pm, Patchwork wrote:
> *Patch Details*
> *Series:*	Fix Bigjoiner checks (rev8)
> *URL:*	https://patchwork.freedesktop.org/series/115712/ 
> <https://patchwork.freedesktop.org/series/115712/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9305/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9305/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_13336 -> IGTPW_9305
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_9305 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_9305, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9305/index.html
> 
> 
>     Participating hosts (41 -> 41)
> 
> Additional (1): bat-dg1-8
> Missing (1): fi-snb-2520m
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_9305:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@i915_suspend@basic-s2idle-without-i915:
>       o bat-rpls-1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13336/bat-rpls-1/igt@i915_suspend@basic-s2idle-without-i915.html> -> WARN <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9305/bat-rpls-1/igt@i915_suspend@basic-s2idle-without-i915.html>
> 
> 
>         Warnings
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank:
>       o bat-atsm-1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13336/bat-atsm-1/igt@kms_flip@basic-flip-vs-wf_vblank.html> (i915#6166 <https://gitlab.freedesktop.org/drm/intel/issues/6166>) -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9305/bat-atsm-1/igt@kms_flip@basic-flip-vs-wf_vblank.html> +3 similar issues
> 
> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   *
> 
>     {igt@xe_create@create-massive-size}:
> 
>       o {bat-dg1-8}: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9305/bat-dg1-8/igt@xe_create@create-massive-size.html> +2 similar issues
>   *
> 
>     igt@xe_guc_pc@rc6_on_idle:
> 
>       o {bat-dg1-8}: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9305/bat-dg1-8/igt@xe_guc_pc@rc6_on_idle.html> +1 similar issue
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_9305 that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@gem_lmem_swapping@parallel-random-engines:
> 
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9305/bat-mtlp-8/igt@gem_lmem_swapping@parallel-random-engines.html> (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3 similar issues
>   *
> 
>     igt@i915_pm_rps@basic-api:
> 
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9305/bat-mtlp-8/igt@i915_pm_rps@basic-api.html> (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
>   *
> 
>     igt@i915_selftest@live@gt_mocs:
> 
>       o bat-mtlp-8: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9305/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html> (i915#7059 <https://gitlab.freedesktop.org/drm/intel/issues/7059>)
>   *
> 
>     igt@i915_selftest@live@mman:
> 
>       o bat-rpls-1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13336/bat-rpls-1/igt@i915_selftest@live@mman.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9305/bat-rpls-1/igt@i915_selftest@live@mman.html> (i915#6794 <https://gitlab.freedesktop.org/drm/intel/issues/6794> / i915#7392 <https://gitlab.freedesktop.org/drm/intel/issues/7392>)
>   *
> 
>     igt@i915_suspend@basic-s3-without-i915:
> 
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9305/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html> (i915#6645 <https://gitlab.freedesktop.org/drm/intel/issues/6645>)
>   *
> 
>     igt@kms_chamelium_hpd@common-hpd-after-suspend:
> 
>       o
> 
>         bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9305/bat-mtlp-8/igt@kms_chamelium_hpd@common-hpd-after-suspend.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>)
> 
>       o
> 
>         bat-jsl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9305/bat-jsl-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>)
> 
>       o
> 
>         fi-bsw-n3050: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9305/fi-bsw-n3050/igt@kms_chamelium_hpd@common-hpd-after-suspend.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
> 
>   *
> 
>     igt@kms_psr@primary_page_flip:
> 
>       o bat-rplp-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9305/bat-rplp-1/igt@kms_psr@primary_page_flip.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +3 similar issues
>   *
> 
>     igt@kms_setmode@basic-clone-single-crtc:
> 
>       o bat-rplp-1: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9305/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html> (i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579> / i915#8260 <https://gitlab.freedesktop.org/drm/intel/issues/8260> / i915#8668 <https://gitlab.freedesktop.org/drm/intel/issues/8668>)
>   *
> 
>     igt@prime_vgem@basic-fence-read:
> 
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9305/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>) +2 similar issues
>   *
> 
>     igt@prime_vgem@basic-gtt:
> 
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9305/bat-mtlp-8/igt@prime_vgem@basic-gtt.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708> / i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +1 similar issue
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@i915_pm_rpm@basic-pci-d3-state:
> 
>       o bat-mtlp-8: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13336/bat-mtlp-8/igt@i915_pm_rpm@basic-pci-d3-state.html> (i915#7077 <https://gitlab.freedesktop.org/drm/intel/issues/7077> / i915#7977 <https://gitlab.freedesktop.org/drm/intel/issues/7977>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9305/bat-mtlp-8/igt@i915_pm_rpm@basic-pci-d3-state.html>
>   *
> 
>     igt@i915_selftest@live@execlists:
> 
>       o fi-bsw-n3050: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13336/fi-bsw-n3050/igt@i915_selftest@live@execlists.html> (i915#7911 <https://gitlab.freedesktop.org/drm/intel/issues/7911> / i915#7913 <https://gitlab.freedesktop.org/drm/intel/issues/7913>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9305/fi-bsw-n3050/igt@i915_selftest@live@execlists.html>
>   *
> 
>     igt@i915_selftest@live@gt_heartbeat:
> 
>       o bat-jsl-3: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13336/bat-jsl-3/igt@i915_selftest@live@gt_heartbeat.html> (i915#5334 <https://gitlab.freedesktop.org/drm/intel/issues/5334>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9305/bat-jsl-3/igt@i915_selftest@live@gt_heartbeat.html>
>   *
> 
>     igt@i915_selftest@live@gt_pm:
> 
>       o bat-rpls-2: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13336/bat-rpls-2/igt@i915_selftest@live@gt_pm.html> (i915#4258 <https://gitlab.freedesktop.org/drm/intel/issues/4258> / i915#7913 <https://gitlab.freedesktop.org/drm/intel/issues/7913>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9305/bat-rpls-2/igt@i915_selftest@live@gt_pm.html>
>   *
> 
>     igt@i915_selftest@live@migrate:
> 
>       o bat-jsl-1: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13336/bat-jsl-1/igt@i915_selftest@live@migrate.html> -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9305/bat-jsl-1/igt@i915_selftest@live@migrate.html>
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
> 
>       o bat-rplp-1: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13336/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html> (i915#8442 <https://gitlab.freedesktop.org/drm/intel/issues/8442> / i915#8668 <https://gitlab.freedesktop.org/drm/intel/issues/8668>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9305/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html>
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7356 -> IGTPW_9305
> 
> CI-20190529: 20190529
> CI_DRM_13336: 1423126050a5bb0317e86e61395e4413e0ad013b @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_9305: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9305/index.html
> IGT_7356: 66452bb0118e8d3a78d054cef50a60a9858a00a9 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
