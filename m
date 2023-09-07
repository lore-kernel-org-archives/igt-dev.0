Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 670BD10E223
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Sep 2023 09:30:19 +0000 (UTC)
Message-ID: <0ffec080-1065-2152-0018-536c72813bd9@linux.intel.com>
Date: Thu, 7 Sep 2023 11:30:15 +0200
MIME-Version: 1.0
Content-Language: en-US
To: igt-dev@lists.freedesktop.org
References: <20230906155108.2175876-1-marcin.bernatowicz@linux.intel.com>
 <169403410907.17388.3109783226205286920@emeril.freedesktop.org>
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <169403410907.17388.3109783226205286920@emeril.freedesktop.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgYmVuY2ht?=
 =?utf-8?q?arks/gem=5Fwsim=3A_added_basic_xe_support_=28rev2=29?=
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



On 9/6/2023 11:01 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	benchmarks/gem_wsim: added basic xe support (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/122920/ 
> <https://patchwork.freedesktop.org/series/122920/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9733/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9733/index.html>
> 
> 
>   CI Bug Log - changes from IGT_7472 -> IGTPW_9733
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_9733 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_9733, please notify your bug team 
> (lgci.bug.filing@intel.com) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9733/index.html
> 
> 
>     Participating hosts (40 -> 39)
> 
> Additional (1): bat-dg2-8
> Missing (2): fi-kbl-soraka fi-snb-2520m
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_9733:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@gem_exec_suspend@basic-s3@smem:
>       o bat-dg2-8: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9733/bat-dg2-8/igt@gem_exec_suspend@basic-s3@smem.html>
> 

Unrelated to the change.

-- 
Marcin
> 
>     Known issues
> 
> Here are the changes found in IGTPW_9733 that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@gem_mmap@basic:
> 
>       o bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9733/bat-dg2-8/igt@gem_mmap@basic.html> (i915#4083 <https://gitlab.freedesktop.org/drm/intel/issues/4083>)
>   *
> 
>     igt@gem_mmap_gtt@basic:
> 
>       o bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9733/bat-dg2-8/igt@gem_mmap_gtt@basic.html> (i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +2 other tests skip
>   *
> 
>     igt@gem_tiled_pread_basic:
> 
>       o bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9733/bat-dg2-8/igt@gem_tiled_pread_basic.html> (i915#4079 <https://gitlab.freedesktop.org/drm/intel/issues/4079>) +1 other test skip
>   *
> 
>     igt@i915_pm_backlight@basic-brightness:
> 
>       o bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9733/bat-dg2-8/igt@i915_pm_backlight@basic-brightness.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#7561 <https://gitlab.freedesktop.org/drm/intel/issues/7561>)
>   *
> 
>     igt@i915_pm_rps@basic-api:
> 
>       o bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9733/bat-dg2-8/igt@i915_pm_rps@basic-api.html> (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
>   *
> 
>     igt@i915_suspend@basic-s3-without-i915:
> 
>       o bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9733/bat-dg2-8/igt@i915_suspend@basic-s3-without-i915.html> (i915#6645 <https://gitlab.freedesktop.org/drm/intel/issues/6645>)
>   *
> 
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>       o
> 
>         fi-hsw-4770: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9733/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +13 other tests skip
> 
>       o
> 
>         bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9733/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>)
> 
>   *
> 
>     igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>       o bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9733/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html> (i915#4215 <https://gitlab.freedesktop.org/drm/intel/issues/4215> / i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>)
>   *
> 
>     igt@kms_addfb_basic@framebuffer-vs-set-tiling:
> 
>       o bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9733/bat-dg2-8/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html> (i915#4212 <https://gitlab.freedesktop.org/drm/intel/issues/4212>) +7 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>       o bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9733/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103> / i915#4213 <https://gitlab.freedesktop.org/drm/intel/issues/4213>) +1 other test skip
>   *
> 
>     igt@kms_force_connector_basic@force-load-detect:
> 
>       o bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9733/bat-dg2-8/igt@kms_force_connector_basic@force-load-detect.html> (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285>)
>   *
> 
>     igt@kms_force_connector_basic@prune-stale-modes:
> 
>       o bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9733/bat-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html> (i915#5274 <https://gitlab.freedesktop.org/drm/intel/issues/5274>)
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-6:
> 
>       o bat-adlp-11: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7472/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-6.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9733/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-6.html> (i915#8668 <https://gitlab.freedesktop.org/drm/intel/issues/8668>)
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:
> 
>       o fi-hsw-4770: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9733/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html> (i915#8841 <https://gitlab.freedesktop.org/drm/intel/issues/8841>) +6 other tests dmesg-warn
>   *
> 
>     igt@kms_psr@cursor_plane_move:
> 
>       o bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9733/bat-dg2-8/igt@kms_psr@cursor_plane_move.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +3 other tests skip
>   *
> 
>     igt@kms_psr@sprite_plane_onoff:
> 
>       o fi-hsw-4770: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9733/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +3 other tests skip
>   *
> 
>     igt@kms_setmode@basic-clone-single-crtc:
> 
>       o bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9733/bat-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>   *
> 
>     igt@prime_vgem@basic-fence-flip:
> 
>       o bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9733/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>)
>   *
> 
>     igt@prime_vgem@basic-fence-mmap:
> 
>       o bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9733/bat-dg2-8/igt@prime_vgem@basic-fence-mmap.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708> / i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +1 other test skip
>   *
> 
>     igt@prime_vgem@basic-write:
> 
>       o bat-dg2-8: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9733/bat-dg2-8/igt@prime_vgem@basic-write.html> (i915#3291 <https://gitlab.freedesktop.org/drm/intel/issues/3291> / i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>) +2 other tests skip
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
> 
>       o bat-adlp-11: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7472/bat-adlp-11/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html> (i915#4309 <https://gitlab.freedesktop.org/drm/intel/issues/4309>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9733/bat-adlp-11/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html>
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-5:
> 
>       o bat-adlp-11: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7472/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-5.html> (i915#8668 <https://gitlab.freedesktop.org/drm/intel/issues/8668>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9733/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-5.html>
> 
> 
>         Warnings
> 
>   * igt@kms_psr@sprite_plane_onoff:
>       o bat-rplp-1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7472/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>) -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9733/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html> (i915#8442 <https://gitlab.freedesktop.org/drm/intel/issues/8442> / i915#8668 <https://gitlab.freedesktop.org/drm/intel/issues/8668> / i915#8712 <https://gitlab.freedesktop.org/drm/intel/issues/8712>)
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7472 -> IGTPW_9733
> 
> CI-20190529: 20190529
> CI_DRM_13605: 5008076127a9599704e98fb4de3761743d943dd0 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_9733: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9733/index.html
> IGT_7472: b9d6f8dd0f69d0091e349ddc9d9f1425b2f36ec9 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
