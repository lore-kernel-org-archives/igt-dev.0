Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A1F6E8E1
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2020 17:34:53 +0000 (UTC)
Date: Fri, 20 Nov 2020 18:34:44 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20201120173444.GA2841@zkempczy-mobl2>
References: <20201120113131.67971-1-zbigniew.kempczynski@intel.com>
 <160587890844.16282.12096195185668372071@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160587890844.16282.12096195185668372071@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgSW50cm9k?=
 =?utf-8?q?uce_IGT_allocator_=28rev11=29?=
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

On Fri, Nov 20, 2020 at 01:28:28PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Introduce IGT allocator (rev11)                                
>    URL:     https://patchwork.freedesktop.org/series/82954/                
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5202/index.html 
> 
>               CI Bug Log - changes from CI_DRM_9370 -> IGTPW_5202
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_5202 absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_5202, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5202/index.html
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in IGTPW_5202:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_exec_suspend@basic-s3:
>           * fi-bsw-kefka: PASS -> DMESG-WARN

Unrelated. BTW test succeed.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_5202 that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@i915_module_load@reload:
> 
>           * fi-byt-j1900: PASS -> DMESG-WARN (i915#1982)
> 
>           * fi-kbl-soraka: PASS -> DMESG-WARN (i915#1982)
> 
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>           * fi-icl-u2: PASS -> DMESG-WARN (i915#1982)
> 
>     Possible fixes
> 
>      * igt@i915_pm_rpm@basic-pci-d3-state:
> 
>           * {fi-ehl-1}: DMESG-WARN (i915#1982) -> PASS
>      * igt@kms_chamelium@dp-crc-fast:
> 
>           * fi-kbl-7500u: DMESG-WARN (i915#1982 / i915#262) -> PASS
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * fi-bsw-kefka: DMESG-WARN (i915#1982) -> PASS +1 similar issue
>      * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
> 
>           * fi-icl-u2: DMESG-WARN (i915#1982) -> PASS +1 similar issue
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Participating hosts (45 -> 40)
> 
>    Missing (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600
>    fi-bdw-samus
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_5863 -> IGTPW_5202
> 
>    CI-20190529: 20190529
>    CI_DRM_9370: e74e64a27fb256d20dc574e0eb741ca59630747d @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_5202: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5202/index.html
>    IGT_5863: 849de1780d33c6749e0a26dc3c642eb9b3d6cd42 @
>    git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
> 
>    == Testlist changes ==
> 
>    +igt@api_intel_allocator@alloc-simple
>    +igt@api_intel_allocator@fork-simple-once
>    +igt@api_intel_allocator@fork-simple-stress
>    +igt@api_intel_allocator@fork-simple-stress-signal
>    +igt@api_intel_allocator@print
>    +igt@api_intel_allocator@random-allocator
>    +igt@api_intel_allocator@reopen
>    +igt@api_intel_allocator@reopen-fork
>    +igt@api_intel_allocator@reserve
>    +igt@api_intel_allocator@reserve-simple
>    +igt@api_intel_allocator@reuse
>    +igt@api_intel_allocator@simple-allocator
>    +igt@api_intel_allocator@two-level-inception
>    +igt@api_intel_allocator@two-level-inception-interruptible
>    +igt@api_intel_bb@add-remove-objects
>    +igt@api_intel_bb@blit-noreloc-keep-cache-random
>    +igt@api_intel_bb@blit-noreloc-purge-cache-random
>    +igt@api_intel_bb@destroy-bb
>    +igt@api_intel_bb@object-noreloc-keep-cache-random
>    +igt@api_intel_bb@object-noreloc-keep-cache-simple
>    +igt@api_intel_bb@object-noreloc-purge-cache-random
>    +igt@api_intel_bb@object-noreloc-purge-cache-simple
>    +igt@api_intel_bb@object-reloc-keep-cache
>    +igt@api_intel_bb@object-reloc-purge-cache
>    +igt@api_intel_bb@purge-bb
>    +igt@api_intel_bb@reset-bb
>    -igt@api_intel_bb@check-canonical
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
