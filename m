Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FB810E1D5
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 05:27:11 +0000 (UTC)
Message-ID: <9aac40a1-0b11-bcb8-6951-815a7f1482ca@intel.com>
Date: Wed, 6 Sep 2023 10:56:44 +0530
To: <igt-dev@lists.freedesktop.org>, <saix.nandan.yedireswarapu@intel.com>
References: <20230905164230.1679263-1-bhanuprakash.modem@intel.com>
 <169395574841.19169.17314611249374529298@emeril.freedesktop.org>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <169395574841.19169.17314611249374529298@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgRW5hYmxl?=
 =?utf-8?q?_hang_tests_for_XE_=28rev3=29?=
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

On Wed-06-09-2023 04:45 am, Patchwork wrote:
> *Patch Details*
> *Series:*	Enable hang tests for XE (rev3)
> *URL:*	https://patchwork.freedesktop.org/series/123266/ 
> <https://patchwork.freedesktop.org/series/123266/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/index.html>
> 
> 
>   CI Bug Log - changes from IGT_7469 -> IGTPW_9727
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_9727 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_9727, please notify your bug team 
> (lgci.bug.filing@intel.com) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/index.html
> 
> 
>     Participating hosts (37 -> 37)
> 
> Additional (1): bat-adlp-11
> Missing (1): fi-snb-2520m
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_9727:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@i915_selftest@live@gem_migrate:
>       o fi-kbl-soraka: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7469/fi-kbl-soraka/igt@i915_selftest@live@gem_migrate.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/fi-kbl-soraka/igt@i915_selftest@live@gem_migrate.html>
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_9727 that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@debugfs_test@basic-hwmon:
> 
>       o bat-adlp-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/bat-adlp-11/igt@debugfs_test@basic-hwmon.html> (i915#7456 <https://gitlab.freedesktop.org/drm/intel/issues/7456>)
>   *
> 
>     igt@gem_lmem_swapping@verify-random:
> 
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/bat-mtlp-8/igt@gem_lmem_swapping@verify-random.html> (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3 other tests skip
>   *
> 
>     igt@gem_mmap@basic:
> 
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/bat-mtlp-8/igt@gem_mmap@basic.html> (i915#4083 <https://gitlab.freedesktop.org/drm/intel/issues/4083>)
>   *
> 
>     igt@gem_mmap_gtt@basic:
> 
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/bat-mtlp-8/igt@gem_mmap_gtt@basic.html> (i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +3 other tests skip
>   *
> 
>     igt@gem_render_tiled_blits@basic:
> 
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/bat-mtlp-8/igt@gem_render_tiled_blits@basic.html> (i915#4079 <https://gitlab.freedesktop.org/drm/intel/issues/4079>) +1 other test skip
>   *
> 
>     igt@gem_tiled_pread_basic:
> 
>       o bat-adlp-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/bat-adlp-11/igt@gem_tiled_pread_basic.html> (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>)
>   *
> 
>     igt@i915_module_load@load:
> 
>       o bat-adlp-6: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7469/bat-adlp-6/igt@i915_module_load@load.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/bat-adlp-6/igt@i915_module_load@load.html> (i915#1982 <https://gitlab.freedesktop.org/drm/intel/issues/1982>)
>   *
> 
>     igt@i915_pm_rps@basic-api:
> 
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/bat-mtlp-8/igt@i915_pm_rps@basic-api.html> (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
>   *
> 
>     igt@i915_selftest@live@gt_engines:
> 
>       o bat-mtlp-8: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/bat-mtlp-8/igt@i915_selftest@live@gt_engines.html> (i915#6268 <https://gitlab.freedesktop.org/drm/intel/issues/6268>)
>   *
> 
>     igt@i915_selftest@live@gt_pm:
> 
>       o bat-mtlp-8: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/bat-mtlp-8/igt@i915_selftest@live@gt_pm.html> (i915#9270 <https://gitlab.freedesktop.org/drm/intel/issues/9270>)
>   *
> 
>     igt@i915_suspend@basic-s3-without-i915:
> 
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html> (i915#6645 <https://gitlab.freedesktop.org/drm/intel/issues/6645>)
>   *
> 
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>       o
> 
>         fi-hsw-4770: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +12 other tests skip
> 
>       o
> 
>         bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>)
> 
>   *
> 
>     igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/bat-mtlp-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html> (i915#4212 <https://gitlab.freedesktop.org/drm/intel/issues/4212>) +8 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>       o
> 
>         bat-adlp-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/bat-adlp-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103>) +1 other test skip
> 
>       o
> 
>         bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (i915#4213 <https://gitlab.freedesktop.org/drm/intel/issues/4213>) +1 other test skip
> 
>   *
> 
>     igt@kms_force_connector_basic@force-load-detect:
> 
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/bat-mtlp-8/igt@kms_force_connector_basic@force-load-detect.html> (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285>)
>   *
> 
>     igt@kms_force_connector_basic@prune-stale-modes:
> 
>       o
> 
>         bat-adlp-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/bat-adlp-11/igt@kms_force_connector_basic@prune-stale-modes.html> (i915#4093 <https://gitlab.freedesktop.org/drm/intel/issues/4093>) +3 other tests skip
> 
>       o
> 
>         bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/bat-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html> (i915#5274 <https://gitlab.freedesktop.org/drm/intel/issues/5274>)
> 
>   *
> 
>     igt@kms_hdmi_inject@inject-audio:
> 
>       o bat-adlp-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/bat-adlp-11/igt@kms_hdmi_inject@inject-audio.html> (i915#4369 <https://gitlab.freedesktop.org/drm/intel/issues/4369>)
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc:
> 
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc.html> (i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845>) +1 other test skip
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5:
> 
>       o bat-adlp-11: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html> (i915#8668 <https://gitlab.freedesktop.org/drm/intel/issues/8668>)
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:
> 
>       o fi-hsw-4770: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html> (i915#8841 <https://gitlab.freedesktop.org/drm/intel/issues/8841>) +6 other tests dmesg-warn
>   *
> 
>     igt@kms_psr@primary_mmap_gtt:
> 
>       o bat-rplp-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>)
>   *
> 
>     igt@kms_psr@sprite_plane_onoff:
> 
>       o fi-hsw-4770: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +3 other tests skip
>   *
> 
>     igt@kms_setmode@basic-clone-single-crtc:
> 
>       o
> 
>         bat-rplp-1: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html> (i915#8260 <https://gitlab.freedesktop.org/drm/intel/issues/8260> / i915#8668 <https://gitlab.freedesktop.org/drm/intel/issues/8668>)
> 
>       o
> 
>         bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/bat-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#8809 <https://gitlab.freedesktop.org/drm/intel/issues/8809>)
> 
>   *
> 
>     igt@prime_vgem@basic-fence-mmap:
> 
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/bat-mtlp-8/igt@prime_vgem@basic-fence-mmap.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708> / i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +1 other test skip
>   *
> 
>     igt@prime_vgem@basic-fence-read:
> 
>       o bat-mtlp-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>) +2 other tests skip
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@gem_busy@busy@all-engines:
> 
>       o bat-mtlp-8: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7469/bat-mtlp-8/igt@gem_busy@busy@all-engines.html> (i915#9262 <https://gitlab.freedesktop.org/drm/intel/issues/9262>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/bat-mtlp-8/igt@gem_busy@busy@all-engines.html>
>   *
> 
>     igt@i915_selftest@live@gt_heartbeat:
> 
>       o fi-rkl-11600: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7469/fi-rkl-11600/igt@i915_selftest@live@gt_heartbeat.html> (i915#5334 <https://gitlab.freedesktop.org/drm/intel/issues/5334> / i915#7872 <https://gitlab.freedesktop.org/drm/intel/issues/7872>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/fi-rkl-11600/igt@i915_selftest@live@gt_heartbeat.html>
> 
> 
>         Warnings
> 
>   * igt@kms_psr@sprite_plane_onoff:
>       o bat-rplp-1: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7469/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html> (i915#8712 <https://gitlab.freedesktop.org/drm/intel/issues/8712>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>)
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7469 -> IGTPW_9727
> 
> CI-20190529: 20190529
> CI_DRM_13599: 58fe10f34e80d0eeb5609128faa135260623a715 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_9727: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9727/index.html
> IGT_7469: b367c5a34e6198074dfe220437b234441d3b3c5d @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
