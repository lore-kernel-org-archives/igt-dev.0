Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5976510E385
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Mar 2023 07:21:04 +0000 (UTC)
Message-ID: <a602d845-1999-d6e6-e2b2-97492716bb79@intel.com>
Date: Thu, 2 Mar 2023 08:21:02 +0100
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>
References: <20230301120905.1019314-1-karolina.stolarek@intel.com>
 <167767879159.6635.4347308063747682758@emeril.freedesktop.org>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <167767879159.6635.4347308063747682758@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fexercise=5Fblt=3A_Don=27t_allow_hangs?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sai Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>,
 Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 1.03.2023 14:53, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/gem_exercise_blt: Don't allow hangs
> *URL:*	https://patchwork.freedesktop.org/series/114513/ 
> <https://patchwork.freedesktop.org/series/114513/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_12796 -> IGTPW_8545
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_8545 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_8545, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/index.html
> 
> 
>     Participating hosts (39 -> 38)
> 
> Missing (1): fi-snb-2520m
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_8545:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@dmabuf@all-tests@dma_fence:
> 
>       o fi-cfl-8109u: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12796/fi-cfl-8109u/igt@dmabuf@all-tests@dma_fence.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/fi-cfl-8109u/igt@dmabuf@all-tests@dma_fence.html>
>   *
> 
>     igt@dmabuf@all-tests@sanitycheck:
> 
>       o fi-cfl-8109u: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12796/fi-cfl-8109u/igt@dmabuf@all-tests@sanitycheck.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/fi-cfl-8109u/igt@dmabuf@all-tests@sanitycheck.html>

My changes didn't touch this test, so these failures are not related to 
the patch.

All the best,
Karolina

> 
>     Known issues
> 
> Here are the changes found in IGTPW_8545 that come from known issues:
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
>       o fi-pnv-d510: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12796/fi-pnv-d510/igt@gem_exec_gttfill@basic.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/fi-pnv-d510/igt@gem_exec_gttfill@basic.html> (i915#7229 <https://gitlab.freedesktop.org/drm/intel/issues/7229>)
>   *
> 
>     igt@i915_selftest@live@gt_heartbeat:
> 
>       o fi-apl-guc: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12796/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html> (i915#5334 <https://gitlab.freedesktop.org/drm/intel/issues/5334>)
> 
> 
>         Warnings
> 
>   * igt@i915_selftest@live@slpc:
>       o bat-rpls-1: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12796/bat-rpls-1/igt@i915_selftest@live@slpc.html> (i915#6367 <https://gitlab.freedesktop.org/drm/intel/issues/6367> / i915#7996 <https://gitlab.freedesktop.org/drm/intel/issues/7996>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/bat-rpls-1/igt@i915_selftest@live@slpc.html> (i915#6367 <https://gitlab.freedesktop.org/drm/intel/issues/6367>)
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7177 -> IGTPW_8545
> 
> CI-20190529: 20190529
> CI_DRM_12796: 56c017efe176b9f3ab1700b80d3d20970c851414 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_8545: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/index.html
> IGT_7177: 0cdc4a676cd9f9e495ad3ae441ed3322f1e14a88 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> 
>     Testlist changes
> 
> -igt@kms_plane_scaling@i915-max-source-size
> 
