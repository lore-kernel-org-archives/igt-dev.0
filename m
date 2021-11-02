Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD3B72E91
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Nov 2021 09:51:50 +0000 (UTC)
Date: Tue, 2 Nov 2021 10:51:39 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211102095139.GA10324@zkempczy-mobl2>
References: <20211102083941.9644-1-zbigniew.kempczynski@intel.com>
 <163584497686.15503.6931786716877071732@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163584497686.15503.6931786716877071732@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQWRkIG5v?=
 =?utf-8?q?-reloc_path_in_gem=5Fsync?=
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
Cc: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Nov 02, 2021 at 09:22:56AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Add no-reloc path in gem_sync                                  
>    URL:     https://patchwork.freedesktop.org/series/96486/                
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6368/index.html 
> 
>               CI Bug Log - changes from CI_DRM_10826 -> IGTPW_6368
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_6368 absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_6368, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6368/index.html
> 
> Participating hosts (40 -> 32)
> 
>    Additional (1): fi-pnv-d510
>    Missing (9): fi-kbl-soraka fi-cml-u2 bat-dg1-6 fi-bsw-n3050 fi-hsw-4200u
>    fi-bsw-cyan bat-adlp-4 fi-elk-e7500 fi-bsw-kefka
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in IGTPW_6368:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@core_auth@basic-auth:
>           * fi-kbl-8809g: PASS -> FAIL

Not related, I've changed gem_sync only.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_6368 that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_exec_suspend@basic-s3:
> 
>           * fi-tgl-1115g4: PASS -> FAIL (i915#1888)
>      * igt@prime_vgem@basic-userptr:
> 
>           * fi-pnv-d510: NOTRUN -> SKIP (fdo#109271) +53 similar issues
>      * igt@runner@aborted:
> 
>           * fi-kbl-8809g: NOTRUN -> FAIL (i915#3363 / i915#4312)
> 
>           * fi-bdw-5557u: NOTRUN -> FAIL (i915#1602 / i915#2426 / i915#4312)
> 
>     Possible fixes
> 
>      * igt@gem_exec_suspend@basic-s3:
> 
>           * fi-bdw-5557u: INCOMPLETE (i915#146) -> PASS
>      * igt@i915_selftest@live@gem_contexts:
> 
>           * fi-icl-u2: DMESG-WARN -> PASS +1 similar issue
>      * igt@i915_selftest@live@objects:
> 
>           * fi-icl-u2: DMESG-WARN (i915#2867) -> PASS +2 similar issues
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_6266 -> IGTPW_6368
> 
>    CI-20190529: 20190529
>    CI_DRM_10826: 8b8fbc1dc64274b9eed192df4bfaeced03bdf0ae @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_6368: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6368/index.html
>    IGT_6266: fa0291675a7a3ade6c219cc52fceac9a0a4a63d8 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
