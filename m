Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC9F10E06B
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Oct 2023 10:07:28 +0000 (UTC)
Message-ID: <f6b7a0b5-144e-821c-54c1-006b2adab04d@intel.com>
Date: Fri, 6 Oct 2023 15:37:09 +0530
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>, <saix.nandan.yedireswarapu@intel.com>
References: <20231006075819.3055887-1-bhanuprakash.modem@intel.com>
 <169658630117.6465.6805255808900931998@emeril.freedesktop.org>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <169658630117.6465.6805255808900931998@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgS01TOiBN?=
 =?utf-8?q?inor_cleanups?=
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

Hi Sai,

Can you please re-report below false positive?

- Bhanu

On Fri-06-10-2023 03:28 pm, Patchwork wrote:
> *Patch Details*
> *Series:*	KMS: Minor cleanups
> *URL:*	https://patchwork.freedesktop.org/series/124702/ 
> <https://patchwork.freedesktop.org/series/124702/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_13722 -> IGTPW_9938
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_9938 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_9938, please notify your bug team 
> (lgci.bug.filing@intel.com) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/index.html
> 
> 
>     Participating hosts (39 -> 39)
> 
> Additional (2): fi-kbl-soraka bat-dg2-9
> Missing (2): fi-hsw-4770 fi-snb-2520m
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_9938:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@i915_pm_rpm@module-reload:
>       o bat-atsm-1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13722/bat-atsm-1/igt@i915_pm_rpm@module-reload.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/bat-atsm-1/igt@i915_pm_rpm@module-reload.html>
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_9938 that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@gem_exec_suspend@basic-s0@smem:
> 
>       o bat-dg2-9: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html> (i915#9275 <https://gitlab.freedesktop.org/drm/intel/issues/9275>)
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
>   *
> 
>     igt@gem_lmem_swapping@basic:
> 
>       o fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3 other tests skip
>   *
> 
>     igt@gem_mmap@basic:
> 
>       o bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/bat-dg2-9/igt@gem_mmap@basic.html> (i915#4083 <https://gitlab.freedesktop.org/drm/intel/issues/4083>)
>   *
> 
>     igt@gem_mmap_gtt@basic:
> 
>       o bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/bat-dg2-9/igt@gem_mmap_gtt@basic.html> (i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +2 other tests skip
>   *
> 
>     igt@gem_render_tiled_blits@basic:
> 
>       o bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/bat-dg2-9/igt@gem_render_tiled_blits@basic.html> (i915#4079 <https://gitlab.freedesktop.org/drm/intel/issues/4079>) +1 other test skip
>   *
> 
>     igt@i915_module_load@reload:
> 
>       o fi-kbl-soraka: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/fi-kbl-soraka/igt@i915_module_load@reload.html> (i915#1982 <https://gitlab.freedesktop.org/drm/intel/issues/1982>)
>   *
> 
>     igt@i915_pm_rps@basic-api:
> 
>       o bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/bat-dg2-9/igt@i915_pm_rps@basic-api.html> (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
>   *
> 
>     igt@i915_selftest@live@gt_heartbeat:
> 
>       o bat-jsl-3: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13722/bat-jsl-3/igt@i915_selftest@live@gt_heartbeat.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/bat-jsl-3/igt@i915_selftest@live@gt_heartbeat.html> (i915#5334 <https://gitlab.freedesktop.org/drm/intel/issues/5334>)
>   *
> 
>     igt@i915_selftest@live@gt_pm:
> 
>       o fi-kbl-soraka: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html> (i915#1886 <https://gitlab.freedesktop.org/drm/intel/issues/1886>)
>   *
> 
>     igt@i915_selftest@live@requests:
> 
>       o bat-mtlp-8: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13722/bat-mtlp-8/igt@i915_selftest@live@requests.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/bat-mtlp-8/igt@i915_selftest@live@requests.html> (i915#9414 <https://gitlab.freedesktop.org/drm/intel/issues/9414>)
>   *
> 
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>       o bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/bat-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>)
>   *
> 
>     igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>       o bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/bat-dg2-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html> (i915#4215 <https://gitlab.freedesktop.org/drm/intel/issues/4215> / i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>)
>   *
> 
>     igt@kms_addfb_basic@framebuffer-vs-set-tiling:
> 
>       o bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/bat-dg2-9/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html> (i915#4212 <https://gitlab.freedesktop.org/drm/intel/issues/4212>) +6 other tests skip
>   *
> 
>     igt@kms_addfb_basic@tile-pitch-mismatch:
> 
>       o bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/bat-dg2-9/igt@kms_addfb_basic@tile-pitch-mismatch.html> (i915#4212 <https://gitlab.freedesktop.org/drm/intel/issues/4212> / i915#5608 <https://gitlab.freedesktop.org/drm/intel/issues/5608>)
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>       o bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/bat-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103> / i915#4213 <https://gitlab.freedesktop.org/drm/intel/issues/4213> / i915#5608 <https://gitlab.freedesktop.org/drm/intel/issues/5608>) +1 other test skip
>   *
> 
>     igt@kms_dsc@dsc-basic:
> 
>       o fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/fi-kbl-soraka/igt@kms_dsc@dsc-basic.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +9 other tests skip
>   *
> 
>     igt@kms_force_connector_basic@force-load-detect:
> 
>       o bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/bat-dg2-9/igt@kms_force_connector_basic@force-load-detect.html> (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285>)
>   *
> 
>     igt@kms_force_connector_basic@prune-stale-modes:
> 
>       o bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/bat-dg2-9/igt@kms_force_connector_basic@prune-stale-modes.html> (i915#5274 <https://gitlab.freedesktop.org/drm/intel/issues/5274>)
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
> 
>       o bat-rplp-1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13722/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html> (i915#8668 <https://gitlab.freedesktop.org/drm/intel/issues/8668>)
>   *
> 
>     igt@kms_psr@sprite_plane_onoff:
> 
>       o bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/bat-dg2-9/igt@kms_psr@sprite_plane_onoff.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +3 other tests skip
>   *
> 
>     igt@kms_setmode@basic-clone-single-crtc:
> 
>       o bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/bat-dg2-9/igt@kms_setmode@basic-clone-single-crtc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>   *
> 
>     igt@prime_vgem@basic-fence-flip:
> 
>       o bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/bat-dg2-9/igt@prime_vgem@basic-fence-flip.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>)
>   *
> 
>     igt@prime_vgem@basic-fence-mmap:
> 
>       o bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/bat-dg2-9/igt@prime_vgem@basic-fence-mmap.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708> / i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +1 other test skip
>   *
> 
>     igt@prime_vgem@basic-write:
> 
>       o bat-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/bat-dg2-9/igt@prime_vgem@basic-write.html> (i915#3291 <https://gitlab.freedesktop.org/drm/intel/issues/3291> / i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>) +2 other tests skip
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7518 -> IGTPW_9938
> 
> CI-20190529: 20190529
> CI_DRM_13722: ead693ec2d2fddb30bff4718845d42f9adabcce6 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_9938: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/index.html
> IGT_7518: 2d4a57e28db0c2ccbf8b2e763074c9aa74a1ae52 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> 
>     Testlist changes
> 
> +++ 720 lines
> --- 721 lines
> 
