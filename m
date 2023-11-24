Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A5E10E06D
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Nov 2023 07:13:04 +0000 (UTC)
Message-ID: <7b3666e8-f4f0-425e-84de-5281ff0e3da4@intel.com>
Date: Fri, 24 Nov 2023 12:42:37 +0530
To: <igt-dev@lists.freedesktop.org>, <lgci.bug.filing@intel.com>,
 <saix.nandan.yedireswarapu@intel.com>, <tejasreex.illipilli@intel.com>
References: <20231124054656.2314283-1-bhanuprakash.modem@intel.com>
 <170080965402.13022.10594470700937754149@emeril.freedesktop.org>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <170080965402.13022.10594470700937754149@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?intel/kms=5Fpm=5Flpsp=3A_Use_lib_helper_to_iterate_connector_mo?=
 =?utf-8?q?des?=
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

Hello,

Can someone please re-report below false positive?

- Bhanu

On 24-11-2023 12:37 pm, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/intel/kms_pm_lpsp: Use lib helper to iterate connector modes
> *URL:*	https://patchwork.freedesktop.org/series/126853/ 
> <https://patchwork.freedesktop.org/series/126853/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10259/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10259/index.html>
> 
> 
>   CI Bug Log - changes from IGT_7601 -> IGTPW_10259
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_10259 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_10259, please notify your bug team 
> (lgci.bug.filing@intel.com) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10259/index.html
> 
> 
>     Participating hosts (38 -> 35)
> 
> Missing (3): bat-kbl-2 fi-snb-2520m fi-bsw-n3050
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_10259:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@i915_selftest@live@gt_heartbeat:
>       o fi-skl-6600u: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7601/fi-skl-6600u/igt@i915_selftest@live@gt_heartbeat.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10259/fi-skl-6600u/igt@i915_selftest@live@gt_heartbeat.html>
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_10259 that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>       o bat-rpls-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10259/bat-rpls-1/igt@kms_pipe_crc_basic@suspend-read-crc.html> (i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@gem_exec_suspend@basic-s0@smem:
> 
>       o bat-dg2-9: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7601/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html> (i915#8797 <https://gitlab.freedesktop.org/drm/intel/issues/8797> / i915#9275 <https://gitlab.freedesktop.org/drm/intel/issues/9275>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10259/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html>
>   *
> 
>     igt@i915_selftest@live@requests:
> 
>       o bat-rpls-1: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7601/bat-rpls-1/igt@i915_selftest@live@requests.html> -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10259/bat-rpls-1/igt@i915_selftest@live@requests.html>
>   *
> 
>     igt@kms_hdmi_inject@inject-audio:
> 
>       o fi-kbl-guc: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7601/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html> (IGT#3 <https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10259/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html>
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7601 -> IGTPW_10259
> 
> CI-20190529: 20190529
> CI_DRM_13919: 94f973d8238e0d8fd1b0234f220783a1e346f60b @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_10259: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10259/index.html
> IGT_7601: 9c6e7f255724e327627be7c8ed30e23742e97386 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
