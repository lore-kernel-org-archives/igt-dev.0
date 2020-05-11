Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2903C6E5A2
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2020 21:33:37 +0000 (UTC)
Date: Tue, 12 May 2020 00:32:52 +0300
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20200511213252.GA15298@ideak-desk.fi.intel.com>
References: <20200511182534.14395-1-imre.deak@intel.com>
 <158922884710.13117.585367818136094068@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158922884710.13117.585367818136094068@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fflip=3A_Retry_test_in_case_of_a_DP/HDMI_link_reset_=28rev?=
 =?utf-8?q?2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lakshmi,

On Mon, May 11, 2020 at 08:27:27PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_flip: Retry test in case of a DP/HDMI link reset (rev2)
> URL   : https://patchwork.freedesktop.org/series/77167/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_5647 -> IGTPW_4558
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4558 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4558, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4558:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@hangcheck:
>     - fi-icl-u2:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/fi-icl-u2/igt@i915_selftest@live@hangcheck.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/fi-icl-u2/igt@i915_selftest@live@hangcheck.html


This looks unrelated, and a similar but not filed issue I found is:
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8461/fi-icl-y/igt@i915_selftest@live@hangcheck.html

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_4558 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@execlists:
>     - fi-skl-guc:         [INCOMPLETE][3] -> [PASS][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/fi-skl-guc/igt@i915_selftest@live@execlists.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/fi-skl-guc/igt@i915_selftest@live@execlists.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_pm_rpm@module-reload:
>     - fi-kbl-x1275:       [FAIL][5] ([i915#62]) -> [SKIP][6] ([fdo#109271])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5647/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [i915#1803]: https://gitlab.freedesktop.org/drm/intel/issues/1803
>   [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
> 
> 
> Participating hosts (49 -> 42)
> ------------------------------
> 
>   Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-kbl-7560u fi-byt-clapper fi-bdw-samus 
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_5647 -> IGTPW_4558
> 
>   CI-20190529: 20190529
>   CI_DRM_8467: 1a0f0c378117fc90f421a692698ad85963ecdb3a @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_4558: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/index.html
>   IGT_5647: 726e09870f0b502b60bb1ecd209fc8af209ed378 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4558/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
