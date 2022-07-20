Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885F114BAC1
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Jul 2022 07:00:09 +0000 (UTC)
Date: Wed, 20 Jul 2022 09:00:05 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yten9RdGbm2Sgwyx@zkempczy-mobl2>
References: <20220719115141.35236-1-zbigniew.kempczynski@intel.com>
 <165824030502.16363.12717721274646433607@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <165824030502.16363.12717721274646433607@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQWRkIHBp?=
 =?utf-8?q?nned_to_perf=5Fpmu_and_remove_store_dword_=28rev3=29?=
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

On Tue, Jul 19, 2022 at 02:18:25PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Add pinned to perf_pmu and remove store dword (rev3)           
>    URL:     https://patchwork.freedesktop.org/series/106467/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7541/index.html 
> 
>               CI Bug Log - changes from CI_DRM_11922 -> IGTPW_7541
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_7541 absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_7541, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7541/index.html
> 
> Participating hosts (37 -> 35)
> 
>    Additional (1): bat-jsl-3
>    Missing (3): fi-rkl-11600 fi-icl-u2 bat-adlp-4
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in IGTPW_7541:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_exec_suspend@basic-s0@smem:
>           * fi-skl-6600u: PASS -> DMESG-WARN

Unrelelated to the patch.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_7541 that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@i915_selftest@live@gem:
> 
>           * fi-blb-e6850: NOTRUN -> DMESG-FAIL (i915#4528)
>      * igt@kms_chamelium@common-hpd-after-suspend:
> 
>           * fi-pnv-d510: NOTRUN -> SKIP (fdo#109271)
>      * igt@runner@aborted:
> 
>           * fi-skl-6600u: NOTRUN -> FAIL (i915#4312 / i915#5257)
> 
>     Possible fixes
> 
>      * igt@i915_selftest@live@hugepages:
> 
>           * {bat-rpls-1}: DMESG-WARN (i915#5278) -> PASS
>      * igt@i915_selftest@live@requests:
> 
>           * fi-blb-e6850: DMESG-FAIL (i915#4528) -> PASS
> 
>           * {bat-rpls-1}: DMESG-FAIL (i915#5087 / i915#6257) -> PASS
> 
>           * fi-pnv-d510: DMESG-FAIL (i915#4528) -> PASS
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_6592 -> IGTPW_7541
> 
>    CI-20190529: 20190529
>    CI_DRM_11922: 778142c0a2a41283658704530b41ac65c4844ad3 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_7541: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7541/index.html
>    IGT_6592: d7c0659613199a5dcf535ed3add68ed1991ead7e @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
