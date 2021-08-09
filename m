Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCDBD899B0
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Aug 2021 08:55:27 +0000 (UTC)
Date: Mon, 9 Aug 2021 10:55:22 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210809085522.GA17331@zkempczy-mobl2>
References: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
 <162848657413.2458.2190320059148939877@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <162848657413.2458.2190320059148939877@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQWRkIGFs?=
 =?utf-8?q?locator_support_in_IGT_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Aug 09, 2021 at 05:22:54AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Add allocator support in IGT (rev3)                            
>    URL:     https://patchwork.freedesktop.org/series/93464/                
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6097/index.html 
> 
>               CI Bug Log - changes from CI_DRM_10459 -> IGTPW_6097
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_6097 absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_6097, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6097/index.html
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in IGTPW_6097:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@i915_selftest@live@workarounds:
>           * fi-rkl-guc: PASS -> INCOMPLETE

Series is not related with RKL fail exercised here.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_6097 that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@amdgpu/amd_basic@semaphore:
> 
>           * fi-bsw-nick: NOTRUN -> SKIP (fdo#109271) +17 similar issues
>      * igt@gem_exec_suspend@basic-s3:
> 
>           * fi-tgl-1115g4: PASS -> FAIL (i915#1888)
> 
>     Possible fixes
> 
>      * igt@i915_selftest@live@execlists:
> 
>           * fi-bsw-nick: INCOMPLETE (i915#2940) -> PASS
>      * igt@i915_selftest@live@hangcheck:
> 
>           * {fi-hsw-gt1}: DMESG-WARN (i915#3303) -> PASS
>      * igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a2:
> 
>           * {fi-dg1-1}: FAIL (i915#3717) -> PASS +43 similar issues
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Participating hosts (37 -> 34)
> 
>    Missing (3): fi-bdw-samus fi-bsw-cyan bat-jsl-1
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_6162 -> IGTPW_6097
> 
>    CI-20190529: 20190529
>    CI_DRM_10459: f06b3f8ccf62862d4ca7dd149bba4e654be8e323 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_6097: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6097/index.html
>    IGT_6162: 2f32b9e0da5f1ac9529318dd5b836c8cf4d3c441 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
>    == Testlist changes ==
> 
>    +igt@gem_softpin@allocator-evict
>    +igt@gem_softpin@allocator-evict-all-engines
