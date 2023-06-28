Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FD310E0A8
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jun 2023 14:24:59 +0000 (UTC)
Date: Wed, 28 Jun 2023 16:24:19 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230628142419.kjwvaf4zyjwno64k@kamilkon-desk1>
References: <20230628084528.18779-1-kamil.konieczny@linux.intel.com>
 <168794990813.32035.10965958553105396116@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <168794990813.32035.10965958553105396116@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fmadvise=3A_fix_dontneed-*-mmap_subtests?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>,
 SanjuX Marikkar <sanjux.marikkar@intel.com>,
 RavitejaX Veesam <ravitejax.veesam@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

On 2023-06-28 at 10:58:28 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: i915/gem_madvise: fix dontneed-*-mmap subtests
> URL   : https://patchwork.freedesktop.org/series/119962/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_13329 -> IGTPW_9288
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_9288 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_9288, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/index.html
> 
> Participating hosts (42 -> 41)
> ------------------------------
> 
>   Additional (1): bat-dg1-8 
>   Missing    (2): fi-snb-2520m bat-mtlp-6 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_9288:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_module_load@reload:
>     - fi-cfl-guc:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/fi-cfl-guc/igt@i915_module_load@reload.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/fi-cfl-guc/igt@i915_module_load@reload.html
> 

This is not related to gem_madvise, 
could you supress it and respin tests ?

Regards,
Kamil

>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@xe_create@create-massive-size}:
>     - {bat-dg1-8}:        NOTRUN -> [FAIL][3] +2 similar issues
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/bat-dg1-8/igt@xe_create@create-massive-size.html
> 
>   * igt@xe_guc_pc@rc6_on_idle:
>     - {bat-dg1-8}:        NOTRUN -> [INCOMPLETE][4] +1 similar issue
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/bat-dg1-8/igt@xe_guc_pc@rc6_on_idle.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_9288 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_auth@basic-auth:
>     - bat-adlp-11:        [PASS][5] -> [ABORT][6] ([i915#8011])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/bat-adlp-11/igt@core_auth@basic-auth.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/bat-adlp-11/igt@core_auth@basic-auth.html
> 
>   * igt@i915_module_load@load:
>     - bat-adlp-11:        [PASS][7] -> [DMESG-WARN][8] ([i915#4423])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/bat-adlp-11/igt@i915_module_load@load.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/bat-adlp-11/igt@i915_module_load@load.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
>     - bat-dg2-11:         NOTRUN -> [SKIP][9] ([i915#1845] / [i915#5354]) +2 similar issues
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@dmabuf:
>     - fi-bsw-nick:        [DMESG-FAIL][10] ([i915#7562] / [i915#7913]) -> [PASS][11]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/fi-bsw-nick/igt@i915_selftest@live@dmabuf.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/fi-bsw-nick/igt@i915_selftest@live@dmabuf.html
> 
>   * igt@i915_selftest@live@gt_heartbeat:
>     - fi-kbl-soraka:      [DMESG-FAIL][12] ([i915#5334] / [i915#7872]) -> [PASS][13]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
> 
>   * igt@i915_selftest@live@slpc:
>     - bat-mtlp-8:         [DMESG-WARN][14] ([i915#6367]) -> [PASS][15]
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/bat-mtlp-8/igt@i915_selftest@live@slpc.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/bat-mtlp-8/igt@i915_selftest@live@slpc.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_psr@primary_mmap_gtt:
>     - bat-rplp-1:         [SKIP][16] ([i915#1072]) -> [ABORT][17] ([i915#8442])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13329/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
>   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
>   [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
>   [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
>   [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
>   [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
>   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
>   [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
>   [i915#7562]: https://gitlab.freedesktop.org/drm/intel/issues/7562
>   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
>   [i915#7872]: https://gitlab.freedesktop.org/drm/intel/issues/7872
>   [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
>   [i915#8011]: https://gitlab.freedesktop.org/drm/intel/issues/8011
>   [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
>   [i915#8442]: https://gitlab.freedesktop.org/drm/intel/issues/8442
>   [i915#8513]: https://gitlab.freedesktop.org/drm/intel/issues/8513
>   [i915#8676]: https://gitlab.freedesktop.org/drm/intel/issues/8676
>   [i915#8678]: https://gitlab.freedesktop.org/drm/intel/issues/8678
>   [i915#8679]: https://gitlab.freedesktop.org/drm/intel/issues/8679
>   [i915#8698]: https://gitlab.freedesktop.org/drm/intel/issues/8698
>   [i915#8699]: https://gitlab.freedesktop.org/drm/intel/issues/8699
>   [i915#8700]: https://gitlab.freedesktop.org/drm/intel/issues/8700
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7353 -> IGTPW_9288
> 
>   CI-20190529: 20190529
>   CI_DRM_13329: bd707928a4b45e1044e797ee6515e5a4a5c41ef7 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_9288: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/index.html
>   IGT_7353: cacdae5ad7cb92bdc26a79802fcdd244dadccd42 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9288/index.html
