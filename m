Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7576E4F1
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Mar 2021 08:05:15 +0000 (UTC)
Date: Wed, 17 Mar 2021 10:05:48 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YFG4XANrh0uLuNm4@platvala-desk.ger.corp.intel.com>
References: <20210316110434.101381-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <161589645945.23909.12262377451070222616@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <161589645945.23909.12262377451070222616@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdC9p?=
 =?utf-8?q?915/gem=5Fexec=5Freloc=3A_check_reloc_support_in_GEM?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Mar 16, 2021 at 12:07:39PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: test/i915/gem_exec_reloc: check reloc support in GEM
> URL   : https://patchwork.freedesktop.org/series/88005/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_9860 -> IGTPW_5607
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_5607 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_5607, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_5607:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_pm_rpm@basic-pci-d3-state:
>     - fi-skl-6600u:       [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/fi-skl-6600u/igt@i915_pm_rpm@basic-pci-d3-state.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/fi-skl-6600u/igt@i915_pm_rpm@basic-pci-d3-state.html
> 

Lakshmi, false positive here.


-- 
Petri Latvala




>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_5607 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@gem_exec_gttfill@basic:
>     - fi-kbl-8809g:       [TIMEOUT][3] ([i915#3145]) -> [PASS][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9860/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#3145]: https://gitlab.freedesktop.org/drm/intel/issues/3145
>   [i915#3180]: https://gitlab.freedesktop.org/drm/intel/issues/3180
> 
> 
> Participating hosts (45 -> 40)
> ------------------------------
> 
>   Missing    (5): fi-ilk-m540 fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus 
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6033 -> IGTPW_5607
> 
>   CI-20190529: 20190529
>   CI_DRM_9860: 2f5c82c9a6a468ec8b20a3bb322c3289fb05e77b @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_5607: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/index.html
>   IGT_6033: ecfe4c613cdbc082e4a561ead120b40349b63f2b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5607/index.html

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
