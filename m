Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B08510F250
 for <igt-dev@lists.freedesktop.org>; Thu,  5 May 2022 11:22:09 +0000 (UTC)
Message-ID: <d4849c1d-32c1-1f45-08eb-759c9b6ad469@intel.com>
Date: Thu, 5 May 2022 12:22:04 +0100
MIME-Version: 1.0
Content-Language: en-GB
To: igt-dev@lists.freedesktop.org,
 "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
References: <20220504150845.158789-1-matthew.auld@intel.com>
 <165168367689.677.3154105582073012282@emeril.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <165168367689.677.3154105582073012282@emeril.freedesktop.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/i915/gem=5Fcaching=3A_ha?=
 =?utf-8?q?ndle_discrete?=
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

On 04/05/2022 18:01, Patchwork wrote:
> *Patch Details*
> *Series:*	series starting with [i-g-t,1/2] tests/i915/gem_caching: 
> handle discrete
> *URL:*	https://patchwork.freedesktop.org/series/103553/ 
> <https://patchwork.freedesktop.org/series/103553/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7040/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7040/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_11603 -> IGTPW_7040
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_7040 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7040, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7040/index.html
> 
> 
>     Participating hosts (42 -> 40)
> 
> Additional (1): fi-icl-u2
> Missing (3): bat-rpls-1 fi-bsw-cyan fi-hsw-4770
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_7040:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@i915_selftest@live@gt_lrc:
> 
>       o fi-snb-2600: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11603/fi-snb-2600/igt@i915_selftest@live@gt_lrc.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7040/fi-snb-2600/igt@i915_selftest@live@gt_lrc.html>
>   *
> 
>     igt@i915_selftest@live@memory_region:
> 
>       o fi-cfl-8109u: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11603/fi-cfl-8109u/igt@i915_selftest@live@memory_region.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7040/fi-cfl-8109u/igt@i915_selftest@live@memory_region.html>
>         +28 similar issues


Unrelated fails. Series is not touching these tests.


> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_7040 that come from known issues:
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
>       o fi-icl-u2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7040/fi-icl-u2/igt@gem_huc_copy@huc-copy.html>
>         (i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
>   *
> 
>     igt@gem_lmem_swapping@parallel-random-engines:
> 
>       o fi-icl-u2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7040/fi-icl-u2/igt@gem_lmem_swapping@parallel-random-engines.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3
>         similar issues
>   *
> 
>     igt@i915_pm_rpm@module-reload:
> 
>       o fi-cfl-8109u: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11603/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7040/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html>
>         (i915#62 <https://gitlab.freedesktop.org/drm/intel/issues/62>)
>   *
> 
>     igt@kms_chamelium@hdmi-hpd-fast:
> 
>       o fi-icl-u2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7040/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html>
>         (fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +8
>         similar issues
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>       o fi-icl-u2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7040/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278>) +2
>         similar issues
>   *
> 
>     igt@kms_force_connector_basic@force-load-detect:
> 
>       o fi-icl-u2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7040/fi-icl-u2/igt@kms_force_connector_basic@force-load-detect.html>
>         (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285>)
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b:
> 
>       o fi-cfl-8109u: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11603/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7040/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b.html>
>         (i915#62 <https://gitlab.freedesktop.org/drm/intel/issues/62>)
>         +14 similar issues
>   *
> 
>     igt@kms_setmode@basic-clone-single-crtc:
> 
>       o fi-icl-u2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7040/fi-icl-u2/igt@kms_setmode@basic-clone-single-crtc.html>
>         (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>   *
> 
>     igt@prime_vgem@basic-userptr:
> 
>       o fi-icl-u2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7040/fi-icl-u2/igt@prime_vgem@basic-userptr.html>
>         (i915#3301 <https://gitlab.freedesktop.org/drm/intel/issues/3301>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@gem_exec_suspend@basic-s0@smem:
> 
>       o {fi-ehl-2}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11603/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html>
>         (i915#5122
>         <https://gitlab.freedesktop.org/drm/intel/issues/5122>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7040/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html>
>   *
> 
>     igt@i915_selftest@live@client:
> 
>       o {bat-dg2-9}: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11603/bat-dg2-9/igt@i915_selftest@live@client.html>
>         (i915#5879
>         <https://gitlab.freedesktop.org/drm/intel/issues/5879>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7040/bat-dg2-9/igt@i915_selftest@live@client.html>
>   *
> 
>     igt@i915_selftest@live@gem_contexts:
> 
>       o {bat-dg2-8}: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11603/bat-dg2-8/igt@i915_selftest@live@gem_contexts.html>
>         (i915#5885
>         <https://gitlab.freedesktop.org/drm/intel/issues/5885>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7040/bat-dg2-8/igt@i915_selftest@live@gem_contexts.html>
>   *
> 
>     igt@kms_busy@basic@modeset:
> 
>       o {bat-adlp-6}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11603/bat-adlp-6/igt@kms_busy@basic@modeset.html>
>         (i915#3576
>         <https://gitlab.freedesktop.org/drm/intel/issues/3576>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7040/bat-adlp-6/igt@kms_busy@basic@modeset.html>
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6465 -> IGTPW_7040
> 
> CI-20190529: 20190529
> CI_DRM_11603: 12dccf4f5eef7dd5b2eca2c0f638adfabdb93df2 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_7040: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7040/index.html
> IGT_6465: f6bb4399881a806fbff75ce3df89b60286d55917 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
