Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D6289FBC
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 10:29:23 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Tue, 10 Aug 2021 12:29:19 +0200
Message-ID: <3122319.aeNJFYEL58@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <162858955462.29684.17917451402216559507@emeril.freedesktop.org>
References: <20210810081440.21803-1-janusz.krzysztofik@linux.intel.com>
 <162858955462.29684.17917451402216559507@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaTkxNS9p?=
 =?utf-8?q?ntel=5Fmemory=5Fregion=3A_Add_missing_forward_declaration?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: "Vudum,
 Lakshminarayana" <lakshminarayana.vudum@intel.com>, tejasreex.illipilli@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On wtorek, 10 sierpnia 2021 11:59:14 CEST Patchwork wrote:
> == Series Details ==
> 
> Series: i915/intel_memory_region: Add missing forward declaration
> URL   : https://patchwork.freedesktop.org/series/93540/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_10463 -> IGTPW_6107
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_6107 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_6107, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_6107:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - fi-rkl-guc:         [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html

Not related to the change, looks similar to https://gitlab.freedesktop.org/drm/intel/-/issues/3925.

Thanks,
Janusz

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_6107 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_exec_suspend@basic-s0:
>     - fi-kbl-soraka:      [PASS][3] -> [INCOMPLETE][4] ([i915#155])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/fi-kbl-soraka/igt@gem_exec_suspend@basic-s0.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/fi-kbl-soraka/igt@gem_exec_suspend@basic-s0.html
> 
>   * igt@i915_selftest@live@execlists:
>     - fi-bsw-kefka:       NOTRUN -> [INCOMPLETE][5] ([i915#2940])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/fi-bsw-kefka/igt@i915_selftest@live@execlists.html
> 
>   * igt@runner@aborted:
>     - fi-rkl-guc:         NOTRUN -> [FAIL][6] ([i915#1602])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/fi-rkl-guc/igt@runner@aborted.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@hangcheck:
>     - fi-bsw-kefka:       [INCOMPLETE][7] -> [PASS][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10463/fi-bsw-kefka/igt@i915_selftest@live@hangcheck.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/fi-bsw-kefka/igt@i915_selftest@live@hangcheck.html
> 
>   
>   [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
>   [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
>   [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
> 
> 
> Participating hosts (37 -> 33)
> ------------------------------
> 
>   Missing    (4): fi-bdw-samus fi-tgl-1115g4 fi-bsw-cyan bat-jsl-1 
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6164 -> IGTPW_6107
> 
>   CI-20190529: 20190529
>   CI_DRM_10463: 48b6a0d12e726a238c0d2dc0c39bda41566f5ff9 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_6107: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/index.html
>   IGT_6164: 7ed112d82c228e755fa773253a25f407bb20965b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6107/index.html
> 



