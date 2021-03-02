Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C121A6E112
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Mar 2021 11:29:42 +0000 (UTC)
Date: Tue, 2 Mar 2021 12:29:37 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210302112937.GA78297@zkempczy-mobl2>
References: <20210301161403.98278-1-zbigniew.kempczynski@intel.com>
 <161461854071.9387.8230259615677211630@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <161461854071.9387.8230259615677211630@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgSW50cm9k?=
 =?utf-8?q?uce_IGT_allocator_=28rev22=29?=
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

On Mon, Mar 01, 2021 at 05:09:00PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Introduce IGT allocator (rev22)                                
>    URL:     https://patchwork.freedesktop.org/series/82954/                
>    State:   success                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5559/index.html 
> 
>          CI Bug Log - changes from CI_DRM_9818_full -> IGTPW_5559_full
> 
> Summary
> 
>    SUCCESS
> 
>    No regressions found.

Something wrong has happened, series don't report any tests in 
full run. At least I expect a failure for api_intel_bb@last-page

--
Zbigniew

> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5559/index.html
> 
> New tests
> 
>    New tests have been introduced between CI_DRM_9818_full and
>    IGTPW_5559_full:
> 
>   New IGT tests (37)
> 
>      * igt@api_intel_allocator@alloc-simple:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_allocator@execbuf-with-allocator:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_allocator@fork-simple-once:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_allocator@fork-simple-stress:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_allocator@fork-simple-stress-signal:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_allocator@open-vm:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_allocator@print-random:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_allocator@print-simple:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_allocator@random-allocator:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_allocator@reopen:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_allocator@reopen-fork:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_allocator@reserve:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_allocator@reserve-simple:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_allocator@reuse:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_allocator@simple-allocator:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_allocator@two-level-inception:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_allocator@two-level-inception-interruptible:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_bb@add-remove-objects:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_bb@bb-with-allocator:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_bb@bb-with-vm:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_bb@blit-noreloc-keep-cache-random:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_bb@blit-noreloc-purge-cache-random:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_bb@destroy-bb:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_bb@last-page:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_bb@object-noreloc-keep-cache-random:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_bb@object-noreloc-keep-cache-simple:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_bb@object-noreloc-purge-cache-random:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_bb@object-noreloc-purge-cache-simple:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_bb@object-reloc-keep-cache:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_bb@object-reloc-purge-cache:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_bb@purge-bb:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_bb@reset-bb:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@gem_softpin@allocator-basic:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@gem_softpin@allocator-basic-reserve:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@gem_softpin@allocator-fork:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@gem_softpin@allocator-nopin:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@gem_softpin@allocator-nopin-reserve:
> 
>           * Statuses :
>           * Exec time: [None] s
> 
> Changes
> 
>    No changes found
> 
> Participating hosts (10 -> 8)
> 
>    Missing (2): pig-kbl-iris pig-icl-1065g7
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_6016 -> IGTPW_5559
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_9818: fb3b93df7979b1cf6b69ac801d1703c0bf1dde66 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_5559: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5559/index.html
>    IGT_6016: 2107b0a53692fb329175bc16169c3699712187aa @
>    git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
