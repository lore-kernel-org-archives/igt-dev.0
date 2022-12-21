Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1752010E12E
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Dec 2022 17:36:33 +0000 (UTC)
Date: Wed, 21 Dec 2022 18:36:30 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20221221173630.f27ond6yjhtyth7b@zkempczy-mobl2>
References: <20221220155754.63808-1-zbigniew.kempczynski@intel.com>
 <167162121403.32312.8676229871764312587@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <167162121403.32312.8676229871764312587@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fctx=5Fshared=3A_Release_offset_after_use?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Dec 21, 2022 at 11:13:34AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  tests/gem_ctx_shared: Release offset after use                 
>    URL:     https://patchwork.freedesktop.org/series/112110/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8254/index.html 
> 
>               CI Bug Log - changes from CI_DRM_12517 -> IGTPW_8254
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_8254 absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_8254, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8254/index.html
> 
> Participating hosts (41 -> 42)
> 
>    Additional (1): bat-atsm-1
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in IGTPW_8254:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@i915_selftest@live@late_gt_pm:
>           * fi-apl-guc: PASS -> FAIL +8 similar issues

Unrelated to the change.

--
Zbigniew

> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * igt@i915_selftest@live@hangcheck:
> 
>           * {bat-atsm-1}: NOTRUN -> FAIL +37 similar issues
>      * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
> 
>           * {bat-atsm-1}: NOTRUN -> SKIP +7 similar issues
> 
> Known issues
> 
>    Here are the changes found in IGTPW_8254 that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_exec_suspend@basic-s0:
> 
>           * fi-apl-guc: NOTRUN -> SKIP (fdo#109271) +2 similar issues
>      * igt@i915_pm_rpm@basic-pci-d3-state:
> 
>           * fi-ilk-650: NOTRUN -> SKIP (fdo#109271) +20 similar issues
>      * igt@i915_selftest@live@late_gt_pm:
> 
>           * fi-kbl-soraka: PASS -> INCOMPLETE (i915#7640)
>      * igt@kms_chamelium@common-hpd-after-suspend:
> 
>           * bat-dg1-5: NOTRUN -> SKIP (fdo#111827)
>      * igt@kms_chamelium@dp-hpd-fast:
> 
>           * fi-ilk-650: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +8 similar
>             issues
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:
> 
>           * fi-bsw-kefka: PASS -> FAIL (i915#6298)
> 
>     Possible fixes
> 
>      * igt@i915_selftest@live@migrate:
> 
>           * {bat-adlp-6}: DMESG-FAIL (i915#7699) -> PASS
>      * igt@i915_selftest@live@mman:
> 
>           * fi-rkl-guc: TIMEOUT (i915#6794) -> PASS
>      * igt@i915_selftest@live@workarounds:
> 
>           * bat-dg1-5: INCOMPLETE (i915#4983) -> PASS
> 
>     Warnings
> 
>      * igt@kms_chamelium@common-hpd-after-suspend:
>           * fi-apl-guc: SKIP (fdo#109271 / fdo#111827) -> SKIP (fdo#109271)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7100 -> IGTPW_8254
> 
>    CI-20190529: 20190529
>    CI_DRM_12517: 0ccc7ebce461c057c63b5879b8ace1a34ea8423a @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_8254: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8254/index.html
>    IGT_7100: 04466b02a9b5356d266a899daa5183c1f6b0e20f @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> Testlist changes
> 
>    -igt@i915_pm_dc@dc5-dpms-negative
