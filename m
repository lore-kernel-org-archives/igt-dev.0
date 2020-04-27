Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E21B6E071
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2020 07:35:28 +0000 (UTC)
Date: Mon, 27 Apr 2020 06:07:44 +0530
From: Kunal Joshi <kunal1.joshi@intel.com>
Message-ID: <20200427003744.GA20741@intel.com>
References: <20200422230151.29558-1-kunal1.joshi@intel.com>
 <158762508005.26749.5138189701145635274@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158762508005.26749.5138189701145635274@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fchamelium=3A_Capture_on_type-c_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arkadiusz.hiler@intel.com, imre.deak@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-04-23 at 06:58:00 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_chamelium: Capture on type-c (rev3)
> URL   : https://patchwork.freedesktop.org/series/76004/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_8350 -> IGTPW_4501
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4501 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4501, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4501/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4501:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_chamelium@dp-hpd-after-hibernate:
>     - fi-icl-u2:          NOTRUN -> [FAIL][1] +1 similar issue
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4501/fi-icl-u2/igt@kms_chamelium@dp-hpd-after-hibernate.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_4501 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_selftest@live@execlists:
>     - fi-tgl-y:           [PASS][2] -> [INCOMPLETE][3] ([i915#1662])
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8350/fi-tgl-y/igt@i915_selftest@live@execlists.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4501/fi-tgl-y/igt@i915_selftest@live@execlists.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_pm_rpm@module-reload:
>     - fi-kbl-x1275:       [FAIL][4] ([i915#62]) -> [SKIP][5] ([fdo#109271])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8350/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4501/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
> 
>   
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [i915#1662]: https://gitlab.freedesktop.org/drm/intel/issues/1662
>   [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
> 
> 
> Participating hosts (48 -> 42)
> ------------------------------
> 
>   Additional (1): fi-icl-dsi 
>   Missing    (7): fi-cml-u2 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-kbl-7500u fi-byt-clapper fi-bdw-samus 
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_5606 -> IGTPW_4501
> 
>   CI-20190529: 20190529
>   CI_DRM_8350: 018bab6d1c4ac37bff9306384383fab59750e140 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_4501: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4501/index.html
>   IGT_5606: 678afb3954bec6227c8762756a0ad6d9946d49b2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4501/index.html

Tests unrelated to kms_chamelium can be considered as noise.
Other than that failing of dp-hpd-after-hibernate is not
related to change.
dp-crc-single which is failing is part of the change but still
we do better as previously all tests which do chamelium_capture()
were failing.
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
