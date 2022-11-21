Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69C310E0F3
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Nov 2022 10:38:31 +0000 (UTC)
Message-ID: <9bcd839b-eed8-dec2-4c3b-4c8a8f212f61@intel.com>
Date: Mon, 21 Nov 2022 10:38:28 +0000
MIME-Version: 1.0
Content-Language: en-GB
To: igt-dev@lists.freedesktop.org,
 "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
References: <20221118155335.635430-1-matthew.auld@intel.com>
 <166879971492.25644.1376162642386720361@emeril.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <166879971492.25644.1376162642386720361@emeril.freedesktop.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fexec=5Fbalancer=3A_exercise_dmabuf_import?=
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

On 18/11/2022 19:28, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/i915/gem_exec_balancer: exercise dmabuf import
> *URL:*	https://patchwork.freedesktop.org/series/111080/ 
> <https://patchwork.freedesktop.org/series/111080/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8130/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8130/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_12400 -> IGTPW_8130
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_8130 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_8130, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8130/index.html
> 
> 
>     Participating hosts (43 -> 43)
> 
> Additional (3): fi-kbl-soraka bat-atsm-1 fi-tgl-dsi
> Missing (3): fi-ctg-p8600 fi-ilk-m540 fi-bdw-samus
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_8130:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@i915_selftest@live@workarounds:
>       o bat-dg1-5: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12400/bat-dg1-5/igt@i915_selftest@live@workarounds.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8130/bat-dg1-5/igt@i915_selftest@live@workarounds.html>
> 

Unrelated to this patch.

> 
>     Known issues
> 
> Here are the changes found in IGTPW_8130 that come from known issues:
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
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8130/fi-kbl-soraka/igt@gem_exec_gttfill@basic.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +9 similar issues
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8130/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
>   *
> 
>     igt@gem_lmem_swapping@basic:
> 
>       o fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8130/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3 similar issues
>   *
> 
>     igt@i915_selftest@live@gt_heartbeat:
> 
>       o fi-bxt-dsi: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12400/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8130/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html> (i915#5334 <https://gitlab.freedesktop.org/drm/intel/issues/5334>)
>   *
> 
>     igt@i915_selftest@live@gt_pm:
> 
>       o fi-kbl-soraka: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8130/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html> (i915#1886 <https://gitlab.freedesktop.org/drm/intel/issues/1886>)
>   *
> 
>     igt@i915_selftest@live@requests:
> 
>       o fi-kbl-soraka: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8130/fi-kbl-soraka/igt@i915_selftest@live@requests.html> (i915#7352 <https://gitlab.freedesktop.org/drm/intel/issues/7352>)
>   *
> 
>     igt@kms_chamelium@common-hpd-after-suspend:
> 
>       o fi-bsw-nick: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8130/fi-bsw-nick/igt@kms_chamelium@common-hpd-after-suspend.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>   *
> 
>     igt@kms_chamelium@hdmi-hpd-fast:
> 
>       o fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8130/fi-kbl-soraka/igt@kms_chamelium@hdmi-hpd-fast.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +7 similar issues
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc:
> 
>       o fi-bsw-nick: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8130/fi-bsw-nick/igt@kms_pipe_crc_basic@suspend-read-crc.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>   *
> 
>     igt@runner@aborted:
> 
>       o
> 
>         bat-dg1-5: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8130/bat-dg1-5/igt@runner@aborted.html> (i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>)
> 
>       o
> 
>         fi-kbl-soraka: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8130/fi-kbl-soraka/igt@runner@aborted.html> (i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312> / i915#4991 <https://gitlab.freedesktop.org/drm/intel/issues/4991>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@gem_exec_suspend@basic-s0@smem:
> 
>       o {bat-rplp-1}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12400/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html> (i915#2867 <https://gitlab.freedesktop.org/drm/intel/issues/2867>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8130/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html>
>   *
> 
>     igt@i915_selftest@live@execlists:
> 
>       o fi-bsw-nick: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12400/fi-bsw-nick/igt@i915_selftest@live@execlists.html> (i915#2940 <https://gitlab.freedesktop.org/drm/intel/issues/2940>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8130/fi-bsw-nick/igt@i915_selftest@live@execlists.html>
>   *
> 
>     igt@i915_selftest@live@reset:
> 
>       o {bat-jsl-1}: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12400/bat-jsl-1/igt@i915_selftest@live@reset.html> -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8130/bat-jsl-1/igt@i915_selftest@live@reset.html>
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7068 -> IGTPW_8130
> 
> CI-20190529: 20190529
> CI_DRM_12400: 1b8dfc7caa79102d10025181ea0b5d971743e700 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_8130: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8130/index.html
> IGT_7068: 5c0ec905b6bbecfb8df8b8f3315d0470539e6ae3 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> 
>     Testlist changes
> 
> +igt@gem_exec_balancer@parallel-out-fence-import-dmabuf
> 
