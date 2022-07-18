Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2EFAD4B7
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Jul 2022 08:41:37 +0000 (UTC)
Date: Mon, 18 Jul 2022 10:41:34 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YtUcvlySLTQq87kt@zkempczy-mobl2>
References: <20220718071140.20058-1-zbigniew.kempczynski@intel.com>
 <165813134754.9321.1055410482974557139@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <165813134754.9321.1055410482974557139@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQWRkIGNv?=
 =?utf-8?q?dename_in_device_selection_=28rev4=29?=
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

On Mon, Jul 18, 2022 at 08:02:27AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Add codename in device selection (rev4)                        
>    URL:     https://patchwork.freedesktop.org/series/106012/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7532/index.html 
> 
>                 CI Bug Log - changes from IGT_6587 -> IGTPW_7532
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_7532 absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_7532, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7532/index.html
> 
> Participating hosts (38 -> 42)
> 
>    Additional (5): fi-bxt-dsi fi-rkl-11600 bat-dg2-9 bat-adln-1 bat-jsl-3
>    Missing (1): bat-adlm-1
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in IGTPW_7532:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp2:
>           * fi-icl-u2: PASS -> INCOMPLETE

Unrelated to change in series.

--
Zbigniew


> 
> Known issues
> 
>    Here are the changes found in IGTPW_7532 that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_huc_copy@huc-copy:
> 
>           * fi-bxt-dsi: NOTRUN -> SKIP (fdo#109271 / i915#2190)
> 
>           * fi-rkl-11600: NOTRUN -> SKIP (i915#2190)
> 
>      * igt@gem_lmem_swapping@basic:
> 
>           * fi-rkl-11600: NOTRUN -> SKIP (i915#4613) +3 similar issues
>      * igt@gem_lmem_swapping@parallel-random-engines:
> 
>           * fi-bxt-dsi: NOTRUN -> SKIP (fdo#109271 / i915#4613) +3 similar
>             issues
>      * igt@gem_tiled_blits@basic:
> 
>           * fi-bxt-dsi: NOTRUN -> SKIP (fdo#109271) +12 similar issues
>      * igt@gem_tiled_pread_basic:
> 
>           * fi-rkl-11600: NOTRUN -> SKIP (i915#3282)
>      * igt@i915_pm_backlight@basic-brightness:
> 
>           * fi-rkl-11600: NOTRUN -> SKIP (i915#3012)
>      * igt@i915_selftest@live@execlists:
> 
>           * fi-bsw-nick: PASS -> INCOMPLETE (i915#2940)
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * fi-rkl-11600: NOTRUN -> INCOMPLETE (i915#5982)
>      * igt@kms_chamelium@common-hpd-after-suspend:
> 
>           * fi-hsw-4770: NOTRUN -> SKIP (fdo#109271 / fdo#111827)
> 
>           * fi-bdw-5557u: NOTRUN -> SKIP (fdo#109271 / fdo#111827)
> 
>      * igt@kms_chamelium@hdmi-edid-read:
> 
>           * fi-bxt-dsi: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +8 similar
>             issues
> 
>           * fi-rkl-11600: NOTRUN -> SKIP (fdo#111827) +7 similar issues
> 
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
> 
>           * fi-rkl-11600: NOTRUN -> SKIP (i915#4103)
>      * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
> 
>           * fi-icl-u2: PASS -> DMESG-WARN (i915#4890)
>      * igt@kms_force_connector_basic@force-load-detect:
> 
>           * fi-rkl-11600: NOTRUN -> SKIP (fdo#109285 / i915#4098)
>      * igt@kms_psr@primary_page_flip:
> 
>           * fi-rkl-11600: NOTRUN -> SKIP (i915#1072) +3 similar issues
>      * igt@kms_setmode@basic-clone-single-crtc:
> 
>           * fi-rkl-11600: NOTRUN -> SKIP (i915#3555 / i915#4098)
>      * igt@prime_vgem@basic-read:
> 
>           * fi-rkl-11600: NOTRUN -> SKIP (fdo#109295 / i915#3291 / i915#3708)
>             +2 similar issues
>      * igt@prime_vgem@basic-userptr:
> 
>           * fi-rkl-11600: NOTRUN -> SKIP (fdo#109295 / i915#3301 / i915#3708)
>      * igt@runner@aborted:
> 
>           * fi-icl-u2: NOTRUN -> FAIL (i915#4312)
> 
>           * fi-bsw-nick: NOTRUN -> FAIL (fdo#109271 / i915#4312)
> 
>     Possible fixes
> 
>      * igt@i915_selftest@live@hangcheck:
>           * fi-hsw-4770: INCOMPLETE (i915#4785) -> PASS
> 
>     Warnings
> 
>      * igt@i915_selftest@live@hangcheck:
>           * bat-dg1-5: DMESG-FAIL (i915#4494 / i915#4957) -> DMESG-FAIL
>             (i915#4957)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_6587 -> IGTPW_7532
> 
>    CI-20190529: 20190529
>    CI_DRM_11907: b6ce6eb7d8d6fea0e38563dbc7a4881a7e36992f @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_7532: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7532/index.html
>    IGT_6587: a37df4b538ae7b5bb1bb47be4804b4787410325d @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
