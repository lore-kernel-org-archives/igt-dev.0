Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C0710E076
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Nov 2023 13:23:26 +0000 (UTC)
Message-ID: <6cb35ae7-8545-4585-7a0b-e8213851185b@collabora.com>
Date: Mon, 20 Nov 2023 18:53:20 +0530
MIME-Version: 1.0
Content-Language: en-US
To: igt-dev@lists.freedesktop.org, lgci.bug.filing@intel.com,
 "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
References: <20231113100419.1111165-1-vignesh.raman@collabora.com>
 <170047030163.29477.13471965237275132661@emeril.freedesktop.org>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <170047030163.29477.13471965237275132661@emeril.freedesktop.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/3=2Cv6=5D_lib/igt=5Fkms=3A_Fix_memo?=
 =?utf-8?q?ry_corruption_=28rev3=29?=
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

Hi,


On 20/11/23 14:21, Patchwork wrote:
> *Patch Details*
> *Series:*	series starting with [i-g-t,1/3,v6] lib/igt_kms: Fix memory 
> corruption (rev3)
> *URL:*	https://patchwork.freedesktop.org/series/126327/ 
> <https://patchwork.freedesktop.org/series/126327/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10214/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10214/index.html>
> 
> 
>   CI Bug Log - changes from IGT_7595 -> IGTPW_10214
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_10214 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_10214, please notify your bug team 
> (lgci.bug.filing@intel.com) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10214/index.html
> 
> 
>     Participating hosts (33 -> 34)
> 
> Additional (2): fi-kbl-soraka fi-hsw-4770
> Missing (1): fi-snb-2520m
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_10214:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@i915_selftest@live@perf:
>       o fi-kbl-soraka: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10214/fi-kbl-soraka/igt@i915_selftest@live@perf.html>
> 
> 

Above regressions are not related to the series.

Starting dynamic subtest: perf
runner: Exiting gracefully, overriding this test's result to be notrun

This test caused an abort condition: Kernel badly tainted (0x240, 0x200) 
(check dmesg for details):
	TAINT_WARN: WARN_ON has happened.

lgci bug filing team, please could you document this. Thanks.

>     Known issues
> 
> Here are the changes found in IGTPW_10214 that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10214/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
>   *
> 
>     igt@gem_lmem_swapping@basic:
> 
>       o fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10214/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3 other tests skip
>   *
> 
>     igt@i915_selftest@live@gt_pm:
> 
>       o fi-kbl-soraka: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10214/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html> (i915#1886 <https://gitlab.freedesktop.org/drm/intel/issues/1886>)
>   *
> 
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>       o fi-hsw-4770: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10214/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>)
>   *
> 
>     igt@kms_dsc@dsc-basic:
> 
>       o fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10214/fi-kbl-soraka/igt@kms_dsc@dsc-basic.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +9 other tests skip
>   *
> 
>     igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1:
> 
>       o fi-hsw-4770: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10214/fi-hsw-4770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +12 other tests skip
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
> 
>       o bat-rplp-1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7595/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10214/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html> (i915#8668 <https://gitlab.freedesktop.org/drm/intel/issues/8668>)
> 
> 
>         Possible fixes
> 
>   * igt@i915_selftest@live@gt_heartbeat:
>       o fi-kbl-guc: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7595/fi-kbl-guc/igt@i915_selftest@live@gt_heartbeat.html> (i915#5334 <https://gitlab.freedesktop.org/drm/intel/issues/5334> / i915#7872 <https://gitlab.freedesktop.org/drm/intel/issues/7872>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10214/fi-kbl-guc/igt@i915_selftest@live@gt_heartbeat.html>
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7595 -> IGTPW_10214
> 
> CI-20190529: 20190529
> CI_DRM_13894: 1eb9843190c09870855313072d11803085bea25d @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_10214: 10214
> IGT_7595: cfa00d99b1dfa0621ea552d1ed54907798da1a1a @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> 
>     Testlist changes
> 
> +++ 744 lines
> --- 0 lines
> 

Regards,
Vignesh
