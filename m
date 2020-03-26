Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791EF6E969
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2020 23:53:00 +0000 (UTC)
Date: Thu, 26 Mar 2020 16:54:16 -0700
From: James Ausmus <james.ausmus@intel.com>
Message-ID: <20200326235416.GD2161@jausmus-gentoo-dev6.jf.intel.com>
References: <20200326222247.7563-1-swathi.dhanavanthri@intel.com>
 <158526626616.23004.5312438998474435349@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158526626616.23004.5312438998474435349@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliOiBz?=
 =?utf-8?q?ync_i915=5Fpciids=2Eh_with_kernel_=28rev5=29?=
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
To: igt-dev@lists.freedesktop.org, swathi.dhanavanthri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Mar 26, 2020 at 11:44:26PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib: sync i915_pciids.h with kernel (rev5)
> URL   : https://patchwork.freedesktop.org/series/50957/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_8197 -> IGTPW_4360
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4360 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4360, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4360/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4360:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_fence@basic-await:
>     - fi-cml-u2:          NOTRUN -> [SKIP][1] +4 similar issues
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4360/fi-cml-u2/igt@gem_exec_fence@basic-await.html
> 
>   * igt@gem_sync@basic-each:
>     - fi-cml-u2:          [PASS][2] -> [SKIP][3] +57 similar issues
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/fi-cml-u2/igt@gem_sync@basic-each.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4360/fi-cml-u2/igt@gem_sync@basic-each.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled:
>     - fi-cml-u2:          [PASS][4] -> [FAIL][5] +1 similar issue
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/fi-cml-u2/igt@kms_addfb_basic@addfb25-y-tiled.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4360/fi-cml-u2/igt@kms_addfb_basic@addfb25-y-tiled.html

Looks like lib/intel_device_info.c needs to be updated with the "U"
version of the IDs

-James

> 
>   
> #### Warnings ####
> 
>   * igt@amdgpu/amd_prime@i915-to-amd:
>     - fi-cml-u2:          [SKIP][6] ([fdo#109315]) -> [SKIP][7] +1 similar issue
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/fi-cml-u2/igt@amdgpu/amd_prime@i915-to-amd.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4360/fi-cml-u2/igt@amdgpu/amd_prime@i915-to-amd.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_4360 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_selftest@live@execlists:
>     - fi-kbl-soraka:      [PASS][8] -> [INCOMPLETE][9] ([fdo#112259] / [i915#656])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/fi-kbl-soraka/igt@i915_selftest@live@execlists.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4360/fi-kbl-soraka/igt@i915_selftest@live@execlists.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@late_gt_pm:
>     - fi-bwr-2160:        [INCOMPLETE][10] -> [PASS][11]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/fi-bwr-2160/igt@i915_selftest@live@late_gt_pm.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4360/fi-bwr-2160/igt@i915_selftest@live@late_gt_pm.html
> 
>   
>   [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
>   [fdo#112259]: https://bugs.freedesktop.org/show_bug.cgi?id=112259
>   [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
> 
> 
> Participating hosts (44 -> 41)
> ------------------------------
> 
>   Additional (2): fi-kbl-r fi-kbl-7500u 
>   Missing    (5): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-kbl-7560u fi-bdw-samus 
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_5539 -> IGTPW_4360
> 
>   CI-20190529: 20190529
>   CI_DRM_8197: 198bab1da198b9d6d5c36d52704dd4abab6e81a8 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_4360: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4360/index.html
>   IGT_5539: e7aae12e37771a8b7796ba252574eb832a5839c3 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4360/index.html
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
