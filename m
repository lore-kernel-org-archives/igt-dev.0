Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0850E10E413
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 08:19:35 +0000 (UTC)
Date: Thu, 17 Aug 2023 10:19:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230817081930.l6arr7ymxoyutoly@kamilkon-desk1>
References: <20230816182659.47460-1-robdclark@gmail.com>
 <169221506971.10286.2036220320160757000@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <169221506971.10286.2036220320160757000@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogIGZhaWx1cmUgZm9yIHRlc3Rz?=
 =?utf-8?q?/msm=3A_Add_submitoverhead_benchmark_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: SaiX Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>,
 RavitejaX Veesam <ravitejax.veesam@intel.com>,
 SanjuX Marikkar <sanjux.marikkar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

this is msm test so below regressions are unrelated to patch,
no need for respin (non-intel gpu).

Regards,
Kamil

On 2023-08-16 at 19:44:29 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/msm: Add submitoverhead benchmark (rev3)
> URL   : https://patchwork.freedesktop.org/series/121909/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7441 -> IGTPW_9603
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_9603 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_9603, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/index.html
> 
> Participating hosts (41 -> 39)
> ------------------------------
> 
>   Missing    (2): fi-kbl-soraka fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_9603:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_psr@primary_mmap_gtt:
>     - bat-rplp-1:         NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_9603 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_selftest@live@migrate:
>     - bat-dg2-11:         [PASS][2] -> [DMESG-FAIL][3] ([i915#7699] / [i915#7913])
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/bat-dg2-11/igt@i915_selftest@live@migrate.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/bat-dg2-11/igt@i915_selftest@live@migrate.html
> 
>   * igt@i915_selftest@live@requests:
>     - bat-rpls-2:         [PASS][4] -> [ABORT][5] ([i915#4983] / [i915#7913])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/bat-rpls-2/igt@i915_selftest@live@requests.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/bat-rpls-2/igt@i915_selftest@live@requests.html
>     - bat-rpls-1:         [PASS][6] -> [ABORT][7] ([i915#7911] / [i915#7920] / [i915#7982])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/bat-rpls-1/igt@i915_selftest@live@requests.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/bat-rpls-1/igt@i915_selftest@live@requests.html
> 
>   * igt@kms_psr@sprite_plane_onoff:
>     - bat-rplp-1:         NOTRUN -> [SKIP][8] ([i915#1072])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@execlists:
>     - fi-bsw-n3050:       [ABORT][9] ([i915#7913]) -> [PASS][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
> 
>   * igt@i915_selftest@live@gt_mocs:
>     - bat-mtlp-6:         [DMESG-FAIL][11] ([i915#7059]) -> [PASS][12]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html
> 
>   * igt@i915_selftest@live@migrate:
>     - bat-mtlp-6:         [DMESG-FAIL][13] ([i915#7699]) -> [PASS][14]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/bat-mtlp-6/igt@i915_selftest@live@migrate.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/bat-mtlp-6/igt@i915_selftest@live@migrate.html
> 
>   * igt@i915_selftest@live@requests:
>     - bat-mtlp-8:         [DMESG-FAIL][15] ([i915#8497]) -> [PASS][16]
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/bat-mtlp-8/igt@i915_selftest@live@requests.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/bat-mtlp-8/igt@i915_selftest@live@requests.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_psr@cursor_plane_move:
>     - bat-rplp-1:         [ABORT][17] ([i915#8469] / [i915#8668]) -> [SKIP][18] ([i915#1072])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7441/bat-rplp-1/igt@kms_psr@cursor_plane_move.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/bat-rplp-1/igt@kms_psr@cursor_plane_move.html
> 
>   
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
>   [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
>   [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
>   [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
>   [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
>   [i915#7920]: https://gitlab.freedesktop.org/drm/intel/issues/7920
>   [i915#7982]: https://gitlab.freedesktop.org/drm/intel/issues/7982
>   [i915#8469]: https://gitlab.freedesktop.org/drm/intel/issues/8469
>   [i915#8497]: https://gitlab.freedesktop.org/drm/intel/issues/8497
>   [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7441 -> IGTPW_9603
> 
>   CI-20190529: 20190529
>   CI_DRM_13525: 24f9c135e4749ff3e8bc084e34166cde8b68ab73 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_9603: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/index.html
>   IGT_7441: 152bb04fd1297075b5d0b1c4487dac8e9a70d070 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> 
> Testlist changes
> ----------------
> 
> +igt@msm_submitoverhead@submitbench-10-bos
> +igt@msm_submitoverhead@submitbench-10-bos-no-implicit-sync
> +igt@msm_submitoverhead@submitbench-100-bos
> +igt@msm_submitoverhead@submitbench-100-bos-no-implicit-sync
> +igt@msm_submitoverhead@submitbench-250-bos
> +igt@msm_submitoverhead@submitbench-250-bos-no-implicit-sync
> +igt@msm_submitoverhead@submitbench-500-bos
> +igt@msm_submitoverhead@submitbench-500-bos-no-implicit-sync
> +igt@msm_submitoverhead@submitbench-1000-bos
> +igt@msm_submitoverhead@submitbench-1000-bos-no-implicit-sync
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9603/index.html
