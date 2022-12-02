Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B474A10E6FE
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Dec 2022 13:35:55 +0000 (UTC)
Date: Fri, 2 Dec 2022 14:35:51 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20221202133551.33gcfdzsk6y6lq55@zkempczy-mobl2>
References: <20221202081025.20273-1-zbigniew.kempczynski@intel.com>
 <166997572604.27864.12164000423396894063@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <166997572604.27864.12164000423396894063@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Flmem=5Fswapping=3A_Use_feature_macro_instead_checking_pla?=
 =?utf-8?q?tform_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Dec 02, 2022 at 10:08:46AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  tests/gem_lmem_swapping: Use feature macro instead checking       
>             platform (rev2)                                                   
>    URL:     https://patchwork.freedesktop.org/series/111573/                  
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8186/index.html    
> 
>               CI Bug Log - changes from CI_DRM_12462 -> IGTPW_8186
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_8186 absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_8186, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8186/index.html
> 
> Participating hosts (42 -> 41)
> 
>    Additional (1): fi-hsw-4770
>    Missing (2): fi-ilk-m540 fi-rkl-11600
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in IGTPW_8186:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@i915_selftest@live@guc_hang:
>           * fi-kbl-soraka: PASS -> INCOMPLETE

Unrelated to the change.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_8186 that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_exec_gttfill@basic:
> 
>           * fi-pnv-d510: PASS -> FAIL (i915#7229)
>      * igt@gem_softpin@allocator-basic-reserve:
> 
>           * fi-hsw-4770: NOTRUN -> SKIP (fdo#109271) +11 similar issues
>      * igt@i915_selftest@live@execlists:
> 
>           * fi-bdw-gvtdvm: PASS -> INCOMPLETE (i915#2940)
>      * igt@kms_chamelium@dp-crc-fast:
> 
>           * fi-hsw-4770: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +8 similar
>             issues
>      * igt@kms_psr@sprite_plane_onoff:
> 
>           * fi-hsw-4770: NOTRUN -> SKIP (fdo#109271 / i915#1072) +3 similar
>             issues
>      * igt@runner@aborted:
> 
>           * fi-bdw-gvtdvm: NOTRUN -> FAIL (i915#4312)
> 
>     Possible fixes
> 
>      * igt@fbdev@read:
> 
>           * {bat-rpls-2}: SKIP (i915#2582) -> PASS +4 similar issues
>      * igt@i915_selftest@live@requests:
> 
>           * {bat-rpls-2}: INCOMPLETE (i915#4983 / i915#6257) -> PASS
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
> 
>           * fi-bsw-kefka: FAIL (i915#6298) -> PASS
>      * igt@kms_psr@primary_page_flip:
> 
>           * fi-kbl-soraka: DMESG-WARN (i915#1982) -> PASS
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7078 -> IGTPW_8186
> 
>    CI-20190529: 20190529
>    CI_DRM_12462: 00b10bdfd8b9edc9b2c681d806fbb6ae2e5f31a3 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_8186: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8186/index.html
>    IGT_7078: 71bce31c26998d5d53cff3138049261fd6c4fbaf @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
