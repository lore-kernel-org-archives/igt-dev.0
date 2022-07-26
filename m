Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDB611306D
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Jul 2022 06:28:59 +0000 (UTC)
Date: Tue, 26 Jul 2022 08:28:55 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yt+Jpzd9DX+txmFZ@zkempczy-mobl2>
References: <20220726041325.12948-1-zbigniew.kempczynski@intel.com>
 <165881229232.21572.12809668273114176779@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <165881229232.21572.12809668273114176779@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQWRkIHBp?=
 =?utf-8?q?nned_to_perf=5Fpmu_and_remove_store_dword_=28rev5=29?=
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

On Tue, Jul 26, 2022 at 05:11:32AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Add pinned to perf_pmu and remove store dword (rev5)           
>    URL:     https://patchwork.freedesktop.org/series/106467/               
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7558/index.html 
> 
>                 CI Bug Log - changes from IGT_6598 -> IGTPW_7558
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_7558 absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_7558, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7558/index.html
> 
> Participating hosts (30 -> 33)
> 
>    Additional (5): fi-kbl-soraka bat-dg1-5 fi-skl-guc bat-dg2-9 bat-adlp-4
>    Missing (2): fi-hsw-4770 fi-bdw-samus
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in IGTPW_7558:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@i915_selftest@live@guc_multi_lrc:
>           * fi-kbl-soraka: NOTRUN -> INCOMPLETE

Unrelated to the change, may I ask for resume run? 

--
Zbigniew

> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * igt@i915_pm_rpm@module-reload:
>           * {bat-dg2-9}: NOTRUN -> WARN
> 
> Known issues
> 
>    Here are the changes found in IGTPW_7558 that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@fbdev@read:
> 
>           * bat-dg1-5: NOTRUN -> SKIP (i915#2582) +4 similar issues
>      * igt@gem_exec_gttfill@basic:
> 
>           * fi-kbl-soraka: NOTRUN -> SKIP (fdo#109271) +8 similar issues
>      * igt@gem_huc_copy@huc-copy:
> 
>           * fi-kbl-soraka: NOTRUN -> SKIP (fdo#109271 / i915#2190)
>      * igt@gem_lmem_swapping@basic:
> 
>           * fi-skl-guc: NOTRUN -> SKIP (fdo#109271 / i915#4613) +3 similar
>             issues
> 
>           * fi-kbl-soraka: NOTRUN -> SKIP (fdo#109271 / i915#4613) +3 similar
>             issues
> 
>      * igt@gem_lmem_swapping@verify-random:
> 
>           * bat-adlp-4: NOTRUN -> SKIP (i915#4613) +3 similar issues
>      * igt@gem_mmap@basic:
> 
>           * bat-dg1-5: NOTRUN -> SKIP (i915#4083)
>      * igt@gem_tiled_fence_blits@basic:
> 
>           * bat-dg1-5: NOTRUN -> SKIP (i915#4077) +2 similar issues
>      * igt@gem_tiled_pread_basic:
> 
>           * bat-dg1-5: NOTRUN -> SKIP (i915#4079) +1 similar issue
> 
>           * bat-adlp-4: NOTRUN -> SKIP (i915#3282)
> 
>      * igt@i915_pm_backlight@basic-brightness:
> 
>           * bat-dg1-5: NOTRUN -> SKIP (i915#1155)
>      * igt@i915_pm_rpm@basic-rte:
> 
>           * fi-cfl-8109u: PASS -> DMESG-WARN (i915#1888 / i915#62)
>      * igt@i915_pm_rpm@module-reload:
> 
>           * fi-cfl-8109u: PASS -> DMESG-FAIL (i915#62)
>      * igt@i915_selftest@live@gt_pm:
> 
>           * fi-kbl-soraka: NOTRUN -> DMESG-FAIL (i915#1886)
>      * igt@i915_selftest@live@hangcheck:
> 
>           * bat-dg1-5: NOTRUN -> DMESG-FAIL (i915#4494 / i915#4957)
>      * igt@i915_selftest@live@ring_submission:
> 
>           * fi-cfl-8109u: PASS -> DMESG-WARN (i915#5904) +29 similar issues
>      * igt@i915_suspend@basic-s2idle-without-i915:
> 
>           * fi-cfl-8109u: PASS -> DMESG-WARN (i915#5904 / i915#62)
> 
>           * bat-dg1-5: NOTRUN -> INCOMPLETE (i915#6011)
> 
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * bat-adlp-4: NOTRUN -> SKIP (i915#5903)
>      * igt@kms_addfb_basic@basic-x-tiled-legacy:
> 
>           * bat-dg1-5: NOTRUN -> SKIP (i915#4212) +7 similar issues
>      * igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>           * bat-dg1-5: NOTRUN -> SKIP (i915#4215)
>      * igt@kms_busy@basic:
> 
>           * bat-dg1-5: NOTRUN -> SKIP (i915#1845 / i915#4303)
>      * igt@kms_chamelium@common-hpd-after-suspend:
> 
>           * fi-pnv-d510: NOTRUN -> SKIP (fdo#109271)
>      * igt@kms_chamelium@dp-crc-fast:
> 
>           * bat-adlp-4: NOTRUN -> SKIP (fdo#111827) +8 similar issues
>      * igt@kms_chamelium@hdmi-crc-fast:
> 
>           * fi-skl-guc: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +8 similar
>             issues
>      * igt@kms_chamelium@hdmi-hpd-fast:
> 
>           * bat-dg1-5: NOTRUN -> SKIP (fdo#111827) +7 similar issues
> 
>           * fi-kbl-soraka: NOTRUN -> SKIP (fdo#109271 / fdo#111827) +7
>             similar issues
> 
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
> 
>           * bat-adlp-4: NOTRUN -> SKIP (i915#4103)
>      * igt@kms_force_connector_basic@force-load-detect:
> 
>           * bat-dg1-5: NOTRUN -> SKIP (fdo#109285)
>      * igt@kms_force_connector_basic@prune-stale-modes:
> 
>           * bat-adlp-4: NOTRUN -> SKIP (i915#4093) +3 similar issues
>      * igt@kms_frontbuffer_tracking@basic:
> 
>           * fi-cfl-8109u: PASS -> DMESG-WARN (i915#62) +11 similar issues
>      * igt@kms_pipe_crc_basic@nonblocking-crc:
> 
>           * bat-dg1-5: NOTRUN -> SKIP (i915#4078) +13 similar issues
>      * igt@kms_psr@sprite_plane_onoff:
> 
>           * bat-dg1-5: NOTRUN -> SKIP (i915#1072 / i915#4078) +3 similar
>             issues
>      * igt@kms_setmode@basic-clone-single-crtc:
> 
>           * fi-skl-guc: NOTRUN -> SKIP (fdo#109271) +10 similar issues
> 
>           * bat-dg1-5: NOTRUN -> SKIP (i915#3555)
> 
>           * bat-adlp-4: NOTRUN -> SKIP (i915#3555 / i915#4579)
> 
>      * igt@prime_vgem@basic-fence-flip:
> 
>           * bat-dg1-5: NOTRUN -> SKIP (i915#1845 / i915#3708)
>      * igt@prime_vgem@basic-fence-read:
> 
>           * bat-dg1-5: NOTRUN -> SKIP (i915#3708) +2 similar issues
>      * igt@prime_vgem@basic-gtt:
> 
>           * bat-dg1-5: NOTRUN -> SKIP (i915#3708 / i915#4077) +1 similar
>             issue
>      * igt@prime_vgem@basic-userptr:
> 
>           * bat-adlp-4: NOTRUN -> SKIP (fdo#109295 / i915#3301 / i915#3708)
> 
>           * bat-dg1-5: NOTRUN -> SKIP (i915#3708 / i915#4873)
> 
>      * igt@prime_vgem@basic-write:
> 
>           * bat-adlp-4: NOTRUN -> SKIP (fdo#109295 / i915#3291 / i915#3708)
>             +2 similar issues
>      * igt@runner@aborted:
> 
>           * bat-dg1-5: NOTRUN -> FAIL (i915#4312 / i915#5257)
> 
>           * fi-bdw-5557u: NOTRUN -> FAIL (i915#4312)
> 
>     Possible fixes
> 
>      * igt@i915_selftest@live@requests:
>           * fi-pnv-d510: DMESG-FAIL (i915#4528) -> PASS
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_6598 -> IGTPW_7558
> 
>    CI-20190529: 20190529
>    CI_DRM_11935: 2df3752997eeeba0843b7b1b9a27204a4e831355 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_7558: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7558/index.html
>    IGT_6598: 97e103419021d0863db527e3f2cf39ccdd132db5 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
