Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E9E10E512
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Nov 2022 19:15:49 +0000 (UTC)
Date: Wed, 16 Nov 2022 20:15:45 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20221116191545.hbjb5mplbpfykawt@zkempczy-mobl2>
References: <20221114170721.32148-1-zbigniew.kempczynski@intel.com>
 <166845193325.32747.13478065630749841043@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <166845193325.32747.13478065630749841043@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2k5?=
 =?utf-8?q?15=5Fblt=3A_Narrow_setting_same_pitch_and_aux-ccs_to_Tile64_onl?=
 =?utf-8?q?y?=
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

On Mon, Nov 14, 2022 at 06:52:13PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/i915_blt: Narrow setting same pitch and aux-ccs to Tile64     
>             only                                                              
>    URL:     https://patchwork.freedesktop.org/series/110874/                  
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8098/index.html    
> 
>                 CI Bug Log - changes from IGT_7055 -> IGTPW_8098
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_8098 absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_8098, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8098/index.html
> 
> Participating hosts (39 -> 38)
> 
>    Additional (2): fi-kbl-soraka fi-kbl-8809g
>    Missing (3): fi-pnv-d510 fi-bdw-samus bat-dg1-5
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in IGTPW_8098:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@i915_selftest@live@reset:
>           * fi-kbl-soraka: NOTRUN -> INCOMPLETE

Unrelated to the change.

--
Zbigniew
> 
> Known issues
> 
>    Here are the changes found in IGTPW_8098 that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_exec_gttfill@basic:
> 
>           * fi-kbl-soraka: NOTRUN -> SKIP (fdo#109271) +8 similar issues
>      * igt@gem_huc_copy@huc-copy:
> 
>           * fi-kbl-8809g: NOTRUN -> SKIP (fdo#109271 / i915#2190)
> 
>           * fi-kbl-soraka: NOTRUN -> SKIP (fdo#109271 / i915#2190)
> 
>      * igt@gem_lmem_swapping@basic:
> 
>           * fi-kbl-soraka: NOTRUN -> SKIP (fdo#109271 / i915#4613) +3 similar
>             issues
>      * igt@i915_module_load@reload:
> 
>           * fi-kbl-8809g: NOTRUN -> DMESG-WARN (i915#6899)
>      * igt@i915_selftest@live@gt_pm:
> 
>           * fi-kbl-soraka: NOTRUN -> DMESG-FAIL (i915#1886)
>      * igt@i915_selftest@live@hangcheck:
> 
>           * fi-hsw-4770: PASS -> INCOMPLETE (i915#4785)
>      * igt@kms_chamelium@hdmi-hpd-fast:
> 
>           * fi-kbl-soraka: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +7
>             similar issues
>      * igt@kms_chamelium@vga-edid-read:
> 
>           * fi-kbl-8809g: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +7 similar
>             issues
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
> 
>           * fi-kbl-8809g: NOTRUN -> SKIP (fdo#109271) +25 similar issues
>      * igt@runner@aborted:
> 
>           * fi-hsw-4770: NOTRUN -> FAIL (fdo#109271 / i915#4312 / i915#5594)
> 
>           * fi-kbl-8809g: NOTRUN -> FAIL (i915#4312)
> 
>     Possible fixes
> 
>      * igt@i915_pm_rpm@module-reload:
> 
>           * {bat-rpls-2}: WARN (i915#7346) -> PASS
>      * igt@i915_selftest@live@hugepages:
> 
>           * {bat-rpls-2}: DMESG-WARN (i915#5278) -> PASS
>      * igt@i915_selftest@live@migrate:
> 
>           * {bat-adlp-6}: INCOMPLETE (i915#7348) -> PASS
>      * igt@i915_selftest@live@reset:
> 
>           * {bat-rpls-2}: DMESG-FAIL (i915#4983) -> PASS
> 
>           * {bat-rpls-1}: DMESG-FAIL (i915#4983) -> PASS
> 
>      * igt@kms_cursor_legacy@basic-flip-before-cursor@varying-size:
> 
>           * fi-blb-e6850: FAIL (i915#2346) -> PASS
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7055 -> IGTPW_8098
> 
>    CI-20190529: 20190529
>    CI_DRM_12376: ceb77a7b0d107112b1b4197917d8fdec9a3d0ca8 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_8098: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8098/index.html
>    IGT_7055: f37bbbbce4d34c3220a2bd5492a2e9c2a7390288 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
