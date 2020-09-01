Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C6EA89CD3
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2020 07:16:27 +0000 (UTC)
Date: Tue, 1 Sep 2020 09:43:39 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200901064339.GP7444@platvala-desk.ger.corp.intel.com>
References: <20200831133049.37017-1-zbigniew.kempczynski@intel.com>
 <159889183684.7425.3670644245393193920@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159889183684.7425.3670644245393193920@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgUmVtb3Zl?=
 =?utf-8?q?_libdrm_in_rendercopy_=28rev32=29?=
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Aug 31, 2020 at 04:37:16PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Remove libdrm in rendercopy (rev32)
> URL   : https://patchwork.freedesktop.org/series/79823/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_8945_full -> IGTPW_4925_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4925_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4925_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4925/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4925_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_sync@basic-store-all:
>     - shard-tglb:         [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8945/shard-tglb7/igt@gem_sync@basic-store-all.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4925/shard-tglb2/igt@gem_sync@basic-store-all.html
>     - shard-iclb:         [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8945/shard-iclb5/igt@gem_sync@basic-store-all.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4925/shard-iclb1/igt@gem_sync@basic-store-all.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_8945_full and IGTPW_4925_full:
> 
> ### New IGT tests (17) ###
> 
>   * igt@api_intel_bb@check-canonical:
>     - Statuses : 5 pass(s) 2 skip(s)
>     - Exec time: [0.0, 0.01] s
> 
>   * igt@api_intel_bb@lot-of-buffers:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.69, 4.54] s
> 
>   * igt@api_intel_bb@render:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@api_intel_bb@render-ccs:
>     - Statuses : 1 incomplete(s) 4 pass(s) 1 skip(s)
>     - Exec time: [0.0, 0.47] s

https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4925/shard-apl8/igt@api_intel_bb@render-ccs.html

SIGSEGV on that test. And you also revealed an igt_runner bug, that
should have been reported as CRASH, not INCOMPLETE.



-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
