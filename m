Return-path: <SRS0=ONlT=TE=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DF010E22A
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Feb 2022 17:25:00 +0000 (UTC)
Date: Mon, 21 Feb 2022 22:54:50 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: lakshminarayana.vudum@intel.com, tejasreex.illipilli@intel.com
Message-ID: <20220221172449.GA7234@intel.com>
References: <20220221102423.8089-1-anshuman.gupta@intel.com>
 <164545315772.21415.2683460721487313599@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <164545315772.21415.2683460721487313599@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQXZvaWQg?=
 =?utf-8?q?process_exit_return_values_in_igt=5Fkmod_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2022-02-21 at 14:19:17 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Avoid process exit return values in igt_kmod (rev2)
> URL   : https://patchwork.freedesktop.org/series/100341/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_11263 -> IGTPW_6663
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_6663 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_6663, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6663/index.html
> 
> Participating hosts (45 -> 40)
> ------------------------------
> 
>   Additional (1): fi-apl-guc 
>   Missing    (6): shard-tglu shard-rkl fi-bsw-cyan bat-rpls-2 shard-dg1 fi-snb-2600 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_6663:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@requests:
>     - fi-kbl-soraka:      [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/fi-kbl-soraka/igt@i915_selftest@live@requests.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6663/fi-kbl-soraka/igt@i915_selftest@live@requests.html
Hi Lakshmi / Tejasree ,
Above BAT failures are not related to my IGT series.
Could you please check if above failures is exisitng issue and re-report the CI result.
Thanks,
Anshuman Gupta.
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_6663 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@amdgpu/amd_basic@semaphore:
>     - fi-hsw-4770:        NOTRUN -> [SKIP][3] ([fdo#109271] / [fdo#109315]) +17 similar issues
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6663/fi-hsw-4770/igt@amdgpu/amd_basic@semaphore.html
> 
>   * igt@debugfs_test@read_all_entries:
>     - fi-apl-guc:         NOTRUN -> [DMESG-WARN][4] ([i915#1610])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6663/fi-apl-guc/igt@debugfs_test@read_all_entries.html
> 
>   * igt@gem_exec_suspend@basic-s3:
>     - fi-skl-6600u:       NOTRUN -> [INCOMPLETE][5] ([i915#4547])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6663/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html
> 
>   * igt@runner@aborted:
>     - fi-kbl-soraka:      NOTRUN -> [FAIL][6] ([i915#1436] / [i915#4312])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6663/fi-kbl-soraka/igt@runner@aborted.html
>     - fi-apl-guc:         NOTRUN -> [FAIL][7] ([i915#2426] / [i915#4312])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6663/fi-apl-guc/igt@runner@aborted.html
>     - fi-bdw-5557u:       NOTRUN -> [FAIL][8] ([i915#2426] / [i915#4312])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6663/fi-bdw-5557u/igt@runner@aborted.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_exec_suspend@basic-s3@smem:
>     - fi-bdw-5557u:       [INCOMPLETE][9] ([i915#146]) -> [PASS][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6663/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - fi-hsw-4770:        [INCOMPLETE][11] ([i915#4785]) -> [PASS][12]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6663/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - fi-cml-u2:          [DMESG-WARN][13] ([i915#4269]) -> [PASS][14]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6663/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_selftest@live@hangcheck:
>     - bat-dg1-6:          [DMESG-FAIL][15] ([i915#4957]) -> [DMESG-FAIL][16] ([i915#4494] / [i915#4957])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11263/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6663/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
> 
>   
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
>   [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
>   [i915#146]: https://gitlab.freedesktop.org/drm/intel/issues/146
>   [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
>   [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
>   [i915#4269]: https://gitlab.freedesktop.org/drm/intel/issues/4269
>   [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
>   [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
>   [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547
>   [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
>   [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6349 -> IGTPW_6663
> 
>   CI-20190529: 20190529
>   CI_DRM_11263: 4f574e4e0184dfccce23b438846b95bbb4d14e39 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_6663: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6663/index.html
>   IGT_6349: 0513032006f385f34fcd094c810b93f31cbed09d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6663/index.html
