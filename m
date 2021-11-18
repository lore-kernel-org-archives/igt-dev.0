Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADD86E90F
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Nov 2021 10:20:13 +0000 (UTC)
Received: from platvala by thrakatuluk with local (Exim 4.94)
 (envelope-from <petri.latvala@intel.com>) id 1mneVZ-0000vx-P7
 for igt-dev@lists.freedesktop.org; Thu, 18 Nov 2021 12:19:09 +0200
Date: Thu, 18 Nov 2021 12:19:09 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YZYonfyTPwNWp00J@platvala-desk.ger.corp.intel.com>
References: <20211117104229.18663-1-petri.latvala@intel.com>
 <163723035932.10080.17532844808570733513@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163723035932.10080.17532844808570733513@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaWd0X2Nv?=
 =?utf-8?q?re=3A_Fix_docs_for_SLOW=5FQUICK_=28rev2=29?=
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
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Nov 18, 2021 at 10:12:39AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: igt_core: Fix docs for SLOW_QUICK (rev2)
> URL   : https://patchwork.freedesktop.org/series/97014/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_10898 -> IGTPW_6412
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_6412 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_6412, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6412/index.html
> 
> Participating hosts (38 -> 34)
> ------------------------------
> 
>   Additional (2): fi-kbl-soraka fi-tgl-u2 
>   Missing    (6): bat-dg1-6 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 bat-jsl-2 bat-jsl-1 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_6412:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_suspend@basic-s3:
>     - fi-skl-6600u:       [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10898/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6412/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html

ext4 problems from -rc1, but without logs in the test, no use having
cibuglog filters updated for these logs.


-- 
Petri Latvala



> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_6412 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@amdgpu/amd_basic@semaphore:
>     - fi-bdw-5557u:       NOTRUN -> [SKIP][3] ([fdo#109271]) +31 similar issues
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6412/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html
> 
>   * igt@gem_exec_fence@basic-busy@bcs0:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][4] ([fdo#109271]) +12 similar issues
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6412/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - fi-tgl-u2:          NOTRUN -> [SKIP][5] ([i915#2190])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6412/fi-tgl-u2/igt@gem_huc_copy@huc-copy.html
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#2190])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6412/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@verify-random:
>     - fi-tgl-u2:          NOTRUN -> [SKIP][7] ([i915#4555]) +3 similar issues
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6412/fi-tgl-u2/igt@gem_lmem_swapping@verify-random.html
> 
>   * igt@i915_selftest@live@gt_pm:
>     - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][8] ([i915#1886] / [i915#2291])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6412/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - fi-snb-2600:        [PASS][9] -> [INCOMPLETE][10] ([i915#3921])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10898/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6412/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@kms_chamelium@common-hpd-after-suspend:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][11] ([fdo#109271] / [fdo#111827]) +8 similar issues
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6412/fi-kbl-soraka/igt@kms_chamelium@common-hpd-after-suspend.html
> 
>   * igt@kms_chamelium@dp-crc-fast:
>     - fi-bdw-5557u:       NOTRUN -> [SKIP][12] ([fdo#109271] / [fdo#111827]) +8 similar issues
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6412/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html
> 
>   * igt@kms_chamelium@dp-hpd-fast:
>     - fi-tgl-u2:          NOTRUN -> [SKIP][13] ([fdo#109284] / [fdo#111827]) +8 similar issues
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6412/fi-tgl-u2/igt@kms_chamelium@dp-hpd-fast.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - fi-tgl-u2:          NOTRUN -> [SKIP][14] ([i915#4103]) +1 similar issue
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6412/fi-tgl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - fi-tgl-u2:          NOTRUN -> [SKIP][15] ([fdo#109285])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6412/fi-tgl-u2/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
>     - fi-kbl-soraka:      NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#533])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6412/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
> 
>   * igt@prime_vgem@basic-userptr:
>     - fi-tgl-u2:          NOTRUN -> [SKIP][17] ([i915#3301])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6412/fi-tgl-u2/igt@prime_vgem@basic-userptr.html
> 
>   
> #### Warnings ####
> 
>   * igt@amdgpu/amd_prime@i915-to-amd:
>     - fi-tgl-1115g4:      [SKIP][18] ([fdo#109315] / [i915#1888] / [i915#2575]) -> [SKIP][19] ([fdo#109315] / [i915#2575])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10898/fi-tgl-1115g4/igt@amdgpu/amd_prime@i915-to-amd.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6412/fi-tgl-1115g4/igt@amdgpu/amd_prime@i915-to-amd.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
>   [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
>   [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
>   [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
>   [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#2291]: https://gitlab.freedesktop.org/drm/intel/issues/2291
>   [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
>   [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4555]: https://gitlab.freedesktop.org/drm/intel/issues/4555
>   [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6284 -> IGTPW_6412
> 
>   CI-20190529: 20190529
>   CI_DRM_10898: 9594aae10f1381c1bc927e912c73bd17c6b3b82e @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_6412: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6412/index.html
>   IGT_6284: 2971051d07d02da90c20ccb842e76ee711b02ecb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6412/index.html
