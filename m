Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04FC10E312
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Oct 2023 06:22:14 +0000 (UTC)
Message-ID: <204d9c5e-86e6-4faf-becd-5e5cbac15fb5@intel.com>
Date: Tue, 10 Oct 2023 11:52:08 +0530
MIME-Version: 1.0
Content-Language: en-US
To: igt-dev@lists.freedesktop.org,
 Patchwork <patchwork@emeril.freedesktop.org>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
References: <20231009182507.390403-1-juhapekka.heikkila@gmail.com>
 <169688131397.24833.6731791529433237239@emeril.freedesktop.org>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <169688131397.24833.6731791529433237239@emeril.freedesktop.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev]
 =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=3A_test_odd_size_planar_yuv?=
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

Hi JP

Overall patch looks good. One review comment we had from Lucas before,
"It's also odd from a testing perspective since we are testing a
*negative*, in test_*invalid*_settings(), and then expecting it to be
valid.  Should we need to improve the test, maybe being more specific on
its name? Example: odd-width-nv12 / odd-height-nv12"

Should we rename test? With current name, it seems its a negative test.

On 10-Oct-23 1:25 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/kms_plane: test odd size planar yuv
> *URL:*	https://patchwork.freedesktop.org/series/124848/ 
> <https://patchwork.freedesktop.org/series/124848/>
> *State:*	success
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9954/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9954/index.html>
> 
> 
>   CI Bug Log - changes from IGT_7523 -> IGTPW_9954
> 
> 
>     Summary
> 
> *SUCCESS*
> 
> No regressions found.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9954/index.html
> 
> 
>     Participating hosts (37 -> 36)
> 
> Additional (1): fi-kbl-soraka
> Missing (2): fi-hsw-4770 fi-snb-2520m
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_9954 that come from known issues:
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
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9954/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
>   *
> 
>     igt@gem_lmem_swapping@basic:
> 
>       o fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9954/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3 other tests skip
>   *
> 
>     igt@gem_lmem_swapping@random-engines:
> 
>       o fi-bsw-n3050: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9954/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +18 other tests skip
>   *
> 
>     igt@i915_selftest@live@gt_pm:
> 
>       o fi-kbl-soraka: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9954/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html> (i915#1886 <https://gitlab.freedesktop.org/drm/intel/issues/1886>)
>   *
> 
>     igt@kms_dsc@dsc-basic:
> 
>       o fi-kbl-soraka: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9954/fi-kbl-soraka/igt@kms_dsc@dsc-basic.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +9 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@basic:
> 
>       o fi-bsw-nick: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7523/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9954/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html> (i915#9276 <https://gitlab.freedesktop.org/drm/intel/issues/9276>)
>   *
> 
>     igt@kms_hdmi_inject@inject-audio:
> 
>       o
> 
>         fi-kbl-guc: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7523/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9954/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html> (IGT#3 <https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3>)
> 
>       o
> 
>         fi-bsw-n3050: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9954/fi-bsw-n3050/igt@kms_hdmi_inject@inject-audio.html> (IGT#3 <https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3>)
> 
> 
>         Possible fixes
> 
>   * igt@i915_selftest@live@gt_heartbeat:
>       o fi-apl-guc: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7523/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html> (i915#5334 <https://gitlab.freedesktop.org/drm/intel/issues/5334>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9954/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html>
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7523 -> IGTPW_9954
> 
> CI-20190529: 20190529
> CI_DRM_13730: 1c99af947eb335283794db0644648dc4b40f44cd @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_9954: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9954/index.html
> IGT_7523: 361c2f92f1fe5641090f2fc59951fcaba15387f5 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
