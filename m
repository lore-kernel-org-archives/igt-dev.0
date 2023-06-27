Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC41110E2BA
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 08:42:15 +0000 (UTC)
Message-ID: <63cdb4b1-63ef-8fbc-4c0d-558303fd3f1c@intel.com>
Date: Tue, 27 Jun 2023 14:11:29 +0530
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>, <saix.nandan.yedireswarapu@intel.com>
References: <20230626160106.2632928-1-bhanuprakash.modem@intel.com>
 <168785402984.2458.6795077763424947963@emeril.freedesktop.org>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <168785402984.2458.6795077763424947963@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgTmV3IGRp?=
 =?utf-8?q?r_structure_for_intel_specific_tests_=28rev4=29?=
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

On Tue-27-06-2023 01:50 pm, Patchwork wrote:
> *Patch Details*
> *Series:*	New dir structure for intel specific tests (rev4)
> *URL:*	https://patchwork.freedesktop.org/series/117227/ 
> <https://patchwork.freedesktop.org/series/117227/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9262/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9262/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_13324 -> IGTPW_9262
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_9262 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_9262, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9262/index.html
> 
> 
>     Participating hosts (40 -> 41)
> 
> Additional (2): bat-dg1-8 bat-adlp-11
> Missing (1): fi-snb-2520m
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_9262:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@i915_module_load@load:
>       o bat-rplp-1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13324/bat-rplp-1/igt@i915_module_load@load.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9262/bat-rplp-1/igt@i915_module_load@load.html>
> 
> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   * {igt@xe_create@create-massive-size}:
>       o {bat-dg1-8}: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9262/bat-dg1-8/igt@xe_create@create-massive-size.html> +2 similar issues
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_9262 that come from known issues:
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
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9262/bat-adlp-11/igt@debugfs_test@basic-hwmon.html> (i915#7456 <https://gitlab.freedesktop.org/drm/intel/issues/7456>)
>   *
> 
>     igt@gem_tiled_pread_basic:
> 
>       o bat-adlp-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9262/bat-adlp-11/igt@gem_tiled_pread_basic.html> (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>)
>   *
> 
>     igt@i915_pm_backlight@basic-brightness:
> 
>       o bat-adlp-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9262/bat-adlp-11/igt@i915_pm_backlight@basic-brightness.html> (i915#3546 <https://gitlab.freedesktop.org/drm/intel/issues/3546> / i915#7561 <https://gitlab.freedesktop.org/drm/intel/issues/7561>)
>   *
> 
>     igt@i915_pm_rpm@basic-pci-d3-state:
> 
>       o bat-adlp-11: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9262/bat-adlp-11/igt@i915_pm_rpm@basic-pci-d3-state.html> (i915#7977 <https://gitlab.freedesktop.org/drm/intel/issues/7977> / i915#8434 <https://gitlab.freedesktop.org/drm/intel/issues/8434>)
>   *
> 
>     igt@i915_selftest@live@execlists:
> 
>       o fi-bsw-n3050: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13324/fi-bsw-n3050/igt@i915_selftest@live@execlists.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9262/fi-bsw-n3050/igt@i915_selftest@live@execlists.html> (i915#7913 <https://gitlab.freedesktop.org/drm/intel/issues/7913>)
>   *
> 
>     igt@i915_selftest@live@requests:
> 
>       o bat-mtlp-6: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13324/bat-mtlp-6/igt@i915_selftest@live@requests.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9262/bat-mtlp-6/igt@i915_selftest@live@requests.html> (i915#7269 <https://gitlab.freedesktop.org/drm/intel/issues/7269>)
>   *
> 
>     igt@i915_selftest@live@slpc:
> 
>       o bat-mtlp-8: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13324/bat-mtlp-8/igt@i915_selftest@live@slpc.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9262/bat-mtlp-8/igt@i915_selftest@live@slpc.html> (i915#6367 <https://gitlab.freedesktop.org/drm/intel/issues/6367>)
>   *
> 
>     igt@kms_chamelium_frames@hdmi-crc-fast:
> 
>       o bat-adlp-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9262/bat-adlp-11/igt@kms_chamelium_frames@hdmi-crc-fast.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +7 similar issues
>   *
> 
>     igt@kms_chamelium_hpd@common-hpd-after-suspend:
> 
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9262/bat-dg2-11/igt@kms_chamelium_hpd@common-hpd-after-suspend.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>)
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>       o bat-adlp-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9262/bat-adlp-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103>) +1 similar issue
>   *
> 
>     igt@kms_force_connector_basic@prune-stale-modes:
> 
>       o bat-adlp-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9262/bat-adlp-11/igt@kms_force_connector_basic@prune-stale-modes.html> (i915#4093 <https://gitlab.freedesktop.org/drm/intel/issues/4093>) +3 similar issues
>   *
> 
>     igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-5:
> 
>       o bat-adlp-11: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9262/bat-adlp-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-5.html> (i915#6868 <https://gitlab.freedesktop.org/drm/intel/issues/6868>)
>   *
> 
>     igt@kms_pipe_crc_basic@read-crc:
> 
>       o bat-adlp-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9262/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc.html> (i915#3546 <https://gitlab.freedesktop.org/drm/intel/issues/3546>)
>   *
> 
>     igt@kms_psr@primary_page_flip:
> 
>       o bat-adlp-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9262/bat-adlp-11/igt@kms_psr@primary_page_flip.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +3 similar issues
>   *
> 
>     igt@kms_setmode@basic-clone-single-crtc:
> 
>       o bat-adlp-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9262/bat-adlp-11/igt@kms_setmode@basic-clone-single-crtc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#4579 <https://gitlab.freedesktop.org/drm/intel/issues/4579>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@i915_selftest@live@gt_mocs:
> 
>       o bat-mtlp-6: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13324/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html> (i915#7059 <https://gitlab.freedesktop.org/drm/intel/issues/7059>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9262/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html>
>   *
> 
>     igt@i915_selftest@live@requests:
> 
>       o bat-mtlp-8: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13324/bat-mtlp-8/igt@i915_selftest@live@requests.html> (i915#8497 <https://gitlab.freedesktop.org/drm/intel/issues/8497>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9262/bat-mtlp-8/igt@i915_selftest@live@requests.html>
>   *
> 
>     igt@i915_selftest@live@slpc:
> 
>       o bat-rpls-1: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13324/bat-rpls-1/igt@i915_selftest@live@slpc.html> (i915#6367 <https://gitlab.freedesktop.org/drm/intel/issues/6367>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9262/bat-rpls-1/igt@i915_selftest@live@slpc.html>
>   *
> 
>     igt@i915_selftest@live@workarounds:
> 
>       o
> 
>         bat-mtlp-6: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13324/bat-mtlp-6/igt@i915_selftest@live@workarounds.html> (i915#6763 <https://gitlab.freedesktop.org/drm/intel/issues/6763>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9262/bat-mtlp-6/igt@i915_selftest@live@workarounds.html>
> 
>       o
> 
>         bat-dg2-11: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13324/bat-dg2-11/igt@i915_selftest@live@workarounds.html> (i915#7913 <https://gitlab.freedesktop.org/drm/intel/issues/7913>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9262/bat-dg2-11/igt@i915_selftest@live@workarounds.html>
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7351 -> IGTPW_9262
> 
> CI-20190529: 20190529
> CI_DRM_13324: d0f10363d9fd8f1cb22a020a878f76c627389355 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_9262: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9262/index.html
> IGT_7351: d8dc96b95c60e4737fdfa1664ce9b1dcebfdef60 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
