Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D16010E2A7
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Jan 2022 17:34:46 +0000 (UTC)
Date: Mon, 31 Jan 2022 18:34:13 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <Yfgdle9BEvBHn3pa@kamilkon-DESK1>
References: <20220128130203.14790-1-kamil.konieczny@linux.intel.com>
 <164364012403.8649.3909813228037981909@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <164364012403.8649.3909813228037981909@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2lu?=
 =?utf-8?q?tel=5Fbatchbuffer=3A_reset_allocator_before_subtest_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

I made changes to intel_butchbuffer that it should not affect

igt@i915_selftest@live@hangcheck
igt@i915_selftest@live@requests

can you add this to false positives and re-run test ?
thanks!

-kamil

Dnia Mon, Jan 31, 2022 at 02:42:04PM -0000, Patchwork napisał(a):
> == Series Details ==
> 
> Series: lib/intel_batchbuffer: reset allocator before subtest (rev2)
> URL   : https://patchwork.freedesktop.org/series/99478/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_11162 -> IGTPW_6587
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_6587 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_6587, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6587/index.html
> 
> Participating hosts (47 -> 42)
> ------------------------------
> 
>   Missing    (5): shard-tglu fi-bsw-n3050 fi-bsw-cyan shard-rkl shard-dg1 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_6587:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@requests:
>     - fi-blb-e6850:       [PASS][1] -> [DMESG-FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11162/fi-blb-e6850/igt@i915_selftest@live@requests.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6587/fi-blb-e6850/igt@i915_selftest@live@requests.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_6587 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@amdgpu/amd_basic@semaphore:
>     - fi-hsw-4770:        NOTRUN -> [SKIP][3] ([fdo#109271] / [fdo#109315]) +17 similar issues
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6587/fi-hsw-4770/igt@amdgpu/amd_basic@semaphore.html
> 
>   * igt@gem_exec_suspend@basic-s3@smem:
>     - fi-skl-6600u:       [PASS][4] -> [INCOMPLETE][5] ([i915#4547])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11162/fi-skl-6600u/igt@gem_exec_suspend@basic-s3@smem.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6587/fi-skl-6600u/igt@gem_exec_suspend@basic-s3@smem.html
>     - fi-bdw-5557u:       [PASS][6] -> [INCOMPLETE][7] ([i915#146])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11162/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6587/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3@smem.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - fi-cml-u2:          [PASS][8] -> [DMESG-WARN][9] ([i915#4269])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11162/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6587/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html
> 
>   * igt@runner@aborted:
>     - fi-blb-e6850:       NOTRUN -> [FAIL][10] ([fdo#109271] / [i915#2403] / [i915#2426] / [i915#4312])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6587/fi-blb-e6850/igt@runner@aborted.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_module_load@reload:
>     - {fi-tgl-dsi}:       [DMESG-WARN][11] ([i915#1982]) -> [PASS][12]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11162/fi-tgl-dsi/igt@i915_module_load@reload.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6587/fi-tgl-dsi/igt@i915_module_load@reload.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - bat-dg1-6:          [DMESG-FAIL][13] ([i915#4494] / [i915#4957]) -> [PASS][14]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11162/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6587/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
>     - bat-dg1-5:          [DMESG-FAIL][15] ([i915#4494] / [i915#4957]) -> [PASS][16]
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11162/bat-dg1-5/igt@i915_selftest@live@hangcheck.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6587/bat-dg1-5/igt@i915_selftest@live@hangcheck.html
>     - fi-hsw-4770:        [INCOMPLETE][17] ([i915#3303]) -> [PASS][18]
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11162/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6587/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@kms_pipe_crc_basic@read-crc-pipe-b:
>     - fi-cfl-8109u:       [DMESG-WARN][19] ([i915#295]) -> [PASS][20] +11 similar issues
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11162/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc-pipe-b.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6587/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc-pipe-b.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
>   [i915#146]: https://gitlab.freedesktop.org/drm/intel/issues/146
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#2403]: https://gitlab.freedesktop.org/drm/intel/issues/2403
>   [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
>   [i915#295]: https://gitlab.freedesktop.org/drm/intel/issues/295
>   [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
>   [i915#4269]: https://gitlab.freedesktop.org/drm/intel/issues/4269
>   [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
>   [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
>   [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547
>   [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6337 -> IGTPW_6587
> 
>   CI-20190529: 20190529
>   CI_DRM_11162: 283ae0e39a86d12ed5351314f1a6abcb2aba5c79 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_6587: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6587/index.html
>   IGT_6337: 7c9c034619ef9dbfbfe041fbf3973a1cf1ac7a22 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6587/index.html
